class OmniauthCallbacksController < ApplicationController
    def twitter
        @info = Info.from_omniauth(request.env["omniauth.auth"].except("extra"))

        if @info.persisted?
            flash.notice = "ログインしました！"
            sign_in_and_redirect @info
        else
            session["devise.info_attributes"] = @info.attributes
            redirect_to new_info_registration_url
        end
    end
end
