class Category < ApplicationRecord
  has_many :todos

  accepts_nested_attributes_for :todos, reject_if: :all_blank

  scope :active, -> {
    where(done_date: nil)
  }
end
