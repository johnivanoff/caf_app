class PasswordsController < Devise::PasswordsController

skip_before_filter :check_authorization, :check_authentication,
  protected

    # The path used after sending reset password instructions
    def after_sending_reset_password_instructions_path_for(resource_name)
#      new_session_path(resource_name)
      password_reset_path
    end

end