class Team < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         #m:n
        has_many :joins
        has_many :events, through: :joins
         #1:n
        has_many :concerts, class_name: :Event
end
