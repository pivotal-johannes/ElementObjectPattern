class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation
  devise :database_authenticatable, :registerable

end
