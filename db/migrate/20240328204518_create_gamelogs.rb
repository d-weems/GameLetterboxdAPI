class CreateGamelogs < ActiveRecord::Migration[7.1]
  def change
    create_table :gamelogs do |t|
      t.references :game, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.float :review_score
      t.text :review_content
      t.date :log_date

      t.timestamps
    end
  end
end
