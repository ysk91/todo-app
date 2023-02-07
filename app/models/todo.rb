class Todo < ApplicationRecord
  belongs_to :category

  validates :content, {presence: true, length: {maximum: 100} }

  scope :active, -> {
    where(done_date: nil)
  }
end
