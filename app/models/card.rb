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

  scope :for_review, -> { where("review_date <= ?", 0.days.from_now).order("RANDOM()") }

  def correctly_translated(user_input)
    translated_text == user_input
  end

  def update_review_date
    update(review_date: 3.days.from_now)
  end
end
