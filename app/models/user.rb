class User < ActiveRecord::Base

  has_secure_password

  validates :email, presence: true, uniqueness: { case_sensitive: false }
  # validates :email, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, presence: true, length: { minimum: 6 }

  def authenticate_with_credentials(email, password)
    if self.email == email.strip.downcase && self.authenticate(password)
      self
    else
      nil
    end
  end

end
