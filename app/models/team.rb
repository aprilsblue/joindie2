class Team < ApplicationRecord
  # Team 1:N Event
  has_many :holding_events, class_name: :Event

  # Team M:N Event
  has_many :joins
  has_many :events, through: :joins

  # Devise Relation
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
