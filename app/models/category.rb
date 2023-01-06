class Category < ApplicationRecord
  has_many :todos

  accepts_nested_attributes_for :todos

  scope :active, -> {
    where(done_date: nil)
  }
  scope :done, -> {
    where(done_date: true)
  }
end
