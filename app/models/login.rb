class Login < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :lockable, :timeoutable, :omniauthable, omniauth_providers: [:twitter]
      # providerがある場合（Twitter経由で認証した）は、
  # passwordは要求しないようにする。
  def password_required?
    super && provider.blank?
  end
      def self.from_omniauth(auth)
        where(provider: auth["provider"], uid: auth["uid"]).first_or_create do |login|
            login.provider = auth["provider"]
            login.uid = auth["uid"]
            login.username = auth["info"]["nickname"]
        end
    end

    def self.new_with_session(params, session)
        if session["devise.login_attributes"]
            new(session["devise.login_attributes"], without_protection: true) do |login|
                login.attributes = params
                login.valid?
            end
        else
            super
        end
    end
end
