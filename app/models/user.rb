class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :confirmable, :lockable, :timeoutable
  
  has_many :statements
  
end
