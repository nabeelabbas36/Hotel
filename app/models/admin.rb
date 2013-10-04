class Admin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # :registerable is removed so we can not add any new admin
  devise :database_authenticatable, :recoverable,:rememberable, :trackable, :validatable

end
