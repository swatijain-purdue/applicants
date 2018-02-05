class DropApplicants < ActiveRecord::Migration[5.1]
  def change
    drop_table :applicants
  end
end
