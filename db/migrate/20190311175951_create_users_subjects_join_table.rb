class CreateUsersSubjectsJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_table :subjects_users  , id: false do |t|
      t.integer :subject_id
      t.integer :user_id
    end

    add_index :subjects_users, [ :subject_id, :user_id ], :unique => true, :name => 'by_subject_and_user'
  end
end
