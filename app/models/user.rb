class User < ActiveRecord::Base
  has_secure_password
  paginates_per 50

  # before_validation :on => :create, :gen_api_token

  validates :api_token,
            :uniqueness => true

  validates :email,
            :presence => true,
            :uniqueness => true

  validates :email_confirmation,
           :presence => true

  def self.confirm(params)
    @user = User.find_by({email: params[:email]})
    @user.try(:auhenticate, params[:password])
  end

  def gen_api_token
    token = SecureRandom.uuid

    # run simple validation
    until User.find_by(api_token: token).nil?
      token = SecureRandom.uuid
    end

    self.api_token = token
  end

  def full_name
    "#{first_name} #{last_name}"
  end

end
