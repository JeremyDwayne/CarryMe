module CarriesHelper

  def owned?(carry)
    current_user.id == carry.user_id
  end
end
