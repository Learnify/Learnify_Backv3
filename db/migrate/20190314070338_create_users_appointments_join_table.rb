class CreateUsersAppointmentsJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments_users  , id: false do |t|
      t.integer :appointment_id
      t.integer :user_id
    end

    add_column :appointments_users, :available, :boolean, null: false, default: true
    add_index :appointments_users, [ :appointment_id, :user_id ], :unique => true, :name => 'by_appointment_and_user'
  end
end
