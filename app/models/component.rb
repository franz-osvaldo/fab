class Component < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true

  belongs_to :system
end
