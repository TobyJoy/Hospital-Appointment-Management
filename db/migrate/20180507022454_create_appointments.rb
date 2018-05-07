class CreateAppointments < ActiveRecord::Migration[5.1]
  def change
    create_table :appointments do |t|
      t.integer :doctor_id, index: true
      t.integer :patient_id, index: true
      t.string :disease

      t.timestamps
    end
  end
end
