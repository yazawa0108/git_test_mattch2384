# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  #ログイン後のリダイレクト先
  def after_sign_in_path_for(resource)
    root_path
  end
  
  #ログアウトのリダイレクト先
  def after_sign_out_path_for(resource)
    root_path
  end
end
