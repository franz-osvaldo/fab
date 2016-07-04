class Aircraft < ApplicationRecord
  validates :name, presence: true
  validates :aircraft_registration, presence: true
  validates :model_id, presence: true
  belongs_to :model
end
