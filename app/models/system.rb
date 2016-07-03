class System < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true

  belongs_to :model
  has_many :components
end
