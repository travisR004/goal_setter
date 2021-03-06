class User < ActiveRecord::Base
  attr_reader :password
  validates :username, :session_token, presence: true
  validates :password, presence: true, on: :create
  validates :password, length: {minimum: 6, allow_nil: true}
  before_validation :ensure_session_token

  include Commentable
  has_many :made_comments, foreign_key: :author_id, class_name: "Comment"


  has_many :goals

  def password=(pt)
    @password = pt
    self.password_digest = BCrypt::Password.create(pt)
  end

  def is_password?(pt)
    BCrypt::Password.new(self.password_digest).is_password?(pt)
  end

  def self.find_by_credentials(params)
    user = User.find_by(username: params[:username])
    user.try(:is_password?, params[:password]) ? user :nil
  end

  def self.generate_session_token
    SecureRandom::urlsafe_base64
  end

  def reset_session_token!
    self.session_token = self.class.generate_session_token
    self.save!
    self.session_token
  end

  private
  def ensure_session_token
    self.session_token ||= self.class.generate_session_token
  end
end
