class Task < ApplicationRecord
  belongs_to :user, optional: false

  validates :name, presence: true
  validates :description, presence: true, length: { minimum: 10 }
  validates :date, presence: true

  scope :recent, -> { order(created_at: desc) }
end
