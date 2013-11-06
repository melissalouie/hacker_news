class User < ActiveRecord::Base
  # Remember to create a migration!
  has_many :comments
  has_many :authored_posts, class_name: "Post", foreign_key: :author_id
  # User.first.authored_posts
  # melissa.authored_posts
  validates :email, uniqueness: true
  
  include BCrypt
  def password
    @password ||= Password.new(password_digest)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end
