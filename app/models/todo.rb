class Todo < ApplicationRecord
  belongs_to :category

  scope :active, -> {
    where(done_date: nil)
  }
end
