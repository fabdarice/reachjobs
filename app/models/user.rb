class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable :validatable
  has_one :profile

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :lastname, :firstname
  validates :lastname, :firstname,:password, :email, :password_confirmation, :presence => { :message => "Field cannot be empty." }

  validates :email, uniqueness: true
  validates :password, :length => {:minimum => 6, :too_short => "6 characters minimum."}
  validates :password, :confirmation => true
  # attr_accessible :title, :body
end
