class Post < ActiveRecord::Base
  belongs_to :user

  # TODO: Copy-paste your code from previous exercise
  belongs_to :user

  before_validation :lower_title

  private

  def lower_title
    self.title = title.downcase unless title.nil?
  end


  # TODO: Add some validation
  validates :user, presence: true
  validates :title, presence: true, length: { minimum: 5 },
                    uniqueness: { scope: :user_id }
  validates :url, presence: true, format: { with: URI::DEFAULT_PARSER.make_regexp }
end
