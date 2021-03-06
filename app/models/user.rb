class User < ApplicationRecord
    enum role: [:landlord, :tenant]
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :trackable, :validatable
   devise :omniauthable, :omniauth_providers => [:facebook]
    def self.from_omniauth(auth)
        where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.email = auth.info.email
        user.password = Devise.friendly_token[0,20]
        end      
    end

    def landlord_role
        self.role = :landlord
        self.save
    end

    def tenant_role
        self.role = :tenant
        self.save
    end
end
