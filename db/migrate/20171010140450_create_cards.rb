# :nodoc:
class CreateCards < ActiveRecord::Migration[5.1]
  def up
    create_table :cards do |t|
      t.string :original_text
      t.string :translated_text
      t.date :review_date
    end
  end

  def down
    drop_table :cards
  end
end
