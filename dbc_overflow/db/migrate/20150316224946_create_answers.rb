class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :title
      t.text :body
      t.integer :votes, :default => 0
      t.references :question, index: true


      t.timestamps null: false
    end
  end
end
