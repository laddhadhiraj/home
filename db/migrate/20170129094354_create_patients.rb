class CreatePatients < ActiveRecord::Migration[5.0]
  def change
    create_table :patients do |t|
      t.references :user, foreign_key: true
      t.string :patient_full_name
      t.string :patient_first_name
      t.string :patient_last_name
      t.string :patient_dob
      t.string :patient_mobile_phone
      t.string :patient_home_phone
      t.string :patient_work_phone

      t.timestamps
    end
  end
end
