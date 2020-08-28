# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController

  #アカウント登録後のリダイレクト先
  def after_sign_up_path_for(resource)
    root_path
  end

  #アカウント編集後のリダイレクト先
  def after_update_path_for(resource)
    user_path(resource)
  end

  def destroy
    resource.betray_flg = 1
    resource.email.insert(0,SecureRandom.alphanumeric(3))
    resource.save
    reset_session
    redirect_to root_path
  end
end
