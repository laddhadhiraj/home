class CreateAppointments < ActiveRecord::Migration[5.0]
  def change
    create_table :appointments do |t|
      t.references :user, foreign_key: true
      t.string :appointment_start_time
      t.string :appointment_end_time
      t.string :patient_full_name
      t.string :patient_mobile_phone
      t.string :patient_home_phone
      t.string :patient_email
      t.string :patient_full_address

      t.timestamps
    end
  end
end
