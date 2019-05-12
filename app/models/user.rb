class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  devise :omniauthable, omniauth_providers: %i[bnet]
  has_many :carries
  has_many :characters

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.battletag = auth.info.battletag
      user.password = Devise.friendly_token[0,20]
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.bnet_data"] && session["devise.bnet_data"]["extra"]["raw_info"]
        user.battletag = data["battletag"] if user.battletag.blank?
      end
    end
  end

  def sync_characters(response)
    if response.present?
      characters = response.reject {|c| c["level"] < 120 }
      characters.each do |c|
        self.characters.where(name: c["name"]).first_or_create do |character|
          character.name = c["name"]
          character.realm = c["realm"]
          character.thumbnail = c["thumbnail"]
          character.main = false
        end
      end
      main = self.characters.where(main: true).first
      if !main.present?
        self.characters.first.update(main: true)
      end
    end
  end

  def whisper
    main = self.characters.where(main: true).first
    if main.present?
      "#{main.name.downcase}-#{main.realm.downcase}"
    else
      "User has not set a main"
    end
  end
end
