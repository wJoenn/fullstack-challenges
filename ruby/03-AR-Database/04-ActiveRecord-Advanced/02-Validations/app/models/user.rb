class User < ActiveRecord::Base
  has_many :posts

  # TODO: Add some validation
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, format: { with: /\A.*@.*\.com\z/ }
  # TODO: Add some callbacks
  before_validation :strip_email
  after_create :send_mail

  private

  def strip_email
    self.email = email.strip unless email.nil?
  end

  def send_mail
    FakeMailer.instance.mail(email, "Welcome #{username}")
  end
end
