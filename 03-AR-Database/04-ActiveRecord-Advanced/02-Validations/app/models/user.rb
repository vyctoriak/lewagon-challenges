class User < ActiveRecord::Base
  has_many :posts

  before_validation :strip_whitespace_from_email
  after_create :welcome_email

  private

  def strip_whitespace_from_email
    self.email = email.strip unless email.nil?
  end

  def welcome_email
    FakeMailer.instance.mail(email, "Welcome to the HN!")
  end

  # TODO: Add some validation
  # TODO: Add some callbacks
  validates :username, presence: true
  validates_uniqueness_of :username
  validates :email, format: { with: /\A.*@.*\.com\z/ }, presence: true, uniqueness: true
end
