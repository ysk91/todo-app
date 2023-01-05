class Category < ApplicationRecord
  has_many :todos

  scope :active, -> {
    where(done_date: nil)
  }
end
