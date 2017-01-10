class Info < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable, :timeoutable, :omniauthable, omniauth_providers: [:twitter]

def self.from_omniauth(auth)
        where(provider: auth["provider"], uid: auth["uid"]).first_or_create do |info|
            info.provider = auth["provider"]
            info.uid = auth["uid"]
            info.username = auth["info"]["nickname"]
        end
    end

    def self.new_with_session(params, session)
        if session["devise.info_attributes"]
            new(session["devise.info_attributes"], without_protection: true) do |info|
                info.attributes = params
                info.valid?
            end
        else
            super
        end
    end
end
