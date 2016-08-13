class Event < ApplicationRecord
    #1:n
    belongs_to :owner, class_name: :Team, foreign_key: :team_id
    #m:n
    has_many :joins
    has_many :teams, through: :joins
    
end
