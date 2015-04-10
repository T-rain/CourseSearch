class ChangeDbName < ActiveRecord::Migration
  def change
  	rename_table :cshes, :course
  end
end
