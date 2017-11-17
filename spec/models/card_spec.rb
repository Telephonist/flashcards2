require 'rails_helper'

RSpec.describe Card, type: :model do
  it "check translation - false" do
    card = Card.new(original_text: "Dom")
    expect(card.correctly_translated("house")).to be false
  end
  it "check_translation - true" do
    card = Card.new(original_text: "Dom", translated_text: "home")
    expect(card.correctly_translated("home")).to be true
  end
  it "update_review_date" do
    card = Card.create
    card.update_review_date
    expect(card.review_date.to_date).to eq(3.days.from_now.to_date)
  end
end
