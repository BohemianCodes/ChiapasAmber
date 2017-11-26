class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :product

# the belongs_to automatically sets the validation so
# it is not needed to specify it here, but rather if
# it is optional, we can set it to optional
  validates :body, presence: true
  validates :rating, numericality: { only_integer: true }

  after_create_commit { CommentUpdateJob.perform_later(self, self.user) }

  scope :rating_desc, -> { order(rating: :desc) }
  scope :rating_asc, -> { order(rating: :asc)}
end
