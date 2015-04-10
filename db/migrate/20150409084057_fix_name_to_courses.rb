class FixNameToCourses < ActiveRecord::Migration
  def change
  	rename_table :course, :courses
  end
end
