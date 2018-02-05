class CreateApplicants < ActiveRecord::Migration[5.1]
  def change
    create_table :applicants do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :email, null: false
      t.string :phone , null: false
      t.string :zipcode , null: false
      t.string :referral_code, null: true
      t.timestamps null: false
    end
  end
end
