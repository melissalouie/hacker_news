class Post < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :author, class_name: "User", foreign_key: :author_id
  #Post.first.author 
  #post_about_cats.author

  has_many :comments
  has_many :users, through: :comments
  #Get a list of commentors
  #Post.first.users

end
