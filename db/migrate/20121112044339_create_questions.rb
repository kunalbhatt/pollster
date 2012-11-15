class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :description
      t.string :format
      t.references :poll

      t.timestamps
    end
  end
end
