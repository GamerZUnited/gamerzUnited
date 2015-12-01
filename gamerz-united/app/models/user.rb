class User < ActiveRecord::Base
	has_secure_password
	has_attached_file :avatar, styles: { thumb: "150x150>"}

	has_many :posts

	before_validation :ensure_access_token!

	validates_presence_of :first_name, :last_name
    validates_uniqueness_of :email, :gamertag
    validates_format_of :email, with: /.+@.+\..+/
    validates :access_token, presence: true, uniqueness: true
    validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  def ensure_access_token!
    if self.access_token.blank?
      self.access_token = User.generate_token
    end
  end

  def self.generate_token
    token = SecureRandom.hex
    while User.exists?(access_token: token)
      token = SecureRandom.hex
    end
    token
  end
end
