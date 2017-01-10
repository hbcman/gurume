class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    def twitter
        @login = Login.from_omniauth(request.env["omniauth.auth"].except("extra"))

        if @login.persisted?
            flash.notice = "ログインしました！"
            sign_in_and_redirect @login
        else
            session["devise.login_attributes"] = @login.attributes
            redirect_to new_login_registration_url
        end
    end
end