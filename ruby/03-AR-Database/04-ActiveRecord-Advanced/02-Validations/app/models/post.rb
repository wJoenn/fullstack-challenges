class Post < ActiveRecord::Base
  belongs_to :user

  # TODO: Add some validation
  validates :title, presence: true, length: { minimum: 5 }, uniqueness: { case_sensitive: false }
  validates :url, presence: true, format: { with: /\Ahttp/ }
  validates :user, presence: true
end
