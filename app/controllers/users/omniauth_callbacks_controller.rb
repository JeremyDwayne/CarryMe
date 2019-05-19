class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def bnet
    if user_signed_in?
      puts "signed in"
      if current_user.link_account_from_omniauth(request.env["omniauth.auth"])
        puts "linked"
        redirect_to current_user and return
        set_flash_message(:notice, :success, kind: "Battle.net") if is_navigational_format?
      end
    end
    @user = User.from_omniauth(request.env["omniauth.auth"])
    session[:bnet_access_token] = request.env["omniauth.auth"].credentials.token

    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication
      set_flash_message(:notice, :success, kind: "Battle.net") if is_navigational_format?
    else
      session["devise.bnet_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end

  def failure
    redirect_to root_path
  end
end
