class Character < ApplicationRecord
  belongs_to :user

  def whisper_name
    "#{self.name.downcase}-#{self.realm.downcase}"
  end
end
