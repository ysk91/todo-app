class Todo < ApplicationRecord
  extend Enumerize
  enumerize :status, in: %i(waiting working done)

  belongs_to :category

  validates :content, {presence: true, length: {maximum: 100} }

  scope :active, -> {
    where(done_date: nil)
  }
end
