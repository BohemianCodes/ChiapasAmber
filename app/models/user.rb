class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :orders
  has_many :comments

  validates :email, presence: true

  after_create do
    # Now we just passed the user to the mailer
    # the welcome gets called
    UserMailer.welcome(self.email).deliver_now
  end
end
