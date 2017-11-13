class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :product

# the belongs_to automatically sets the validation so
# it is not needed to specify it here, but rather if
# it is optional, we can set it to optional
  validates :body, presence: true
  validates :rating, numericality: { only_integer: true }

  scope :rating_desc, -> { order(rating: :desc) }
  scope :rating_asc, -> { order(rating: :asc)}
end
