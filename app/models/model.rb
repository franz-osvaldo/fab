class Model < ApplicationRecord
  validates :manufacturer, presence: true
  validates :model, presence: true
  validates :capacity, presence: true
  validates :capacity, numericality: { only_integer: true }
  validates :capacity, numericality: { greater_than: 0 }
  validates :maximum_takeoff_weight, presence: true
  validates :maximum_takeoff_weight, numericality: { greater_than: 0 }
  validates :maximum_takeoff_weight, numericality: true
  has_many :systems
end
