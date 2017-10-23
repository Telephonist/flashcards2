# :nodoc:
class Card < ApplicationRecord
  validates :original_text, :translated_text, presence: true
  validates :original_text, uniqueness: true
  validate :check_the_same_text
  def check_the_same_text
    errors.add(:translated_text, "Текст не может совпадать") if original_text == translated_text
  end
  before_create do
    self.review_date = 3.days.from_now
  end
end
