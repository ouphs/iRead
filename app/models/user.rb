class User < ActiveRecord::Base
	has_many :posts
	has_many :active_relationships, class_name: "Relationship",
	                          foreign_key: :follower_id, 
	                          dependent: :destroy
  	has_many :passive_relationships, class_name: "Relationship",
	                           foreign_key: :followed_id, 
	                           dependent: :destroy
  	has_many :following, through: :active_relationships,  source: :followed # User.first.following
  	has_many :followers, through: :passive_relationships, source: :follower # User.first.followers
	has_many :comments
	validates_uniqueness_of :email
	validates :email, confirmation: true
	validates_presence_of :fname, :lname, :email, :email_confirmation, :password
end
