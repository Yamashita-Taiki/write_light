class Review < ApplicationRecord
  validates :summary, presence: true
  validates :impression, presence: true

  belongs_to :user
  belongs_to :book
end
