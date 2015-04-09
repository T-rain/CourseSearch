class CreateCshes < ActiveRecord::Migration
  def change
    create_table :cshes do |t|
      t.string :course
      t.string :time
      t.string :teacher

      t.timestamps null: false
    end
  end
end
