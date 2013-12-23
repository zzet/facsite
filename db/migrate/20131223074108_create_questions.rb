class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title
      t.text :description
      t.string :first_name
      t.string :last_name
      t.string :email

      t.timestamps
    end
  end
end
