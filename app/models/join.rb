class Join < ApplicationRecord
  # Team 1:N Join
  belongs_to :team

  # Event 1:N Join
  belongs_to :event
end
