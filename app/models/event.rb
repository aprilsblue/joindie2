class Event < ApplicationRecord
  # Team 1:N Event
  belongs_to :holder, class_name: :Team, foreign_key: :team_id

  # Team M:N Event
  has_many :joins
  has_many :teams, through: :joins
end
