class Category < ApplicationRecord
  has_many :todos

  validates :title, {presence: true, length: {maximum: 50} }

  accepts_nested_attributes_for :todos, reject_if: :all_blank

  scope :active, -> {
    where(done_date: nil)
  }
end
