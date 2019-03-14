class AddAcceptedToTutorials < ActiveRecord::Migration[5.2]
  def change
    add_column :tutorials, :accepted, :boolean, null: false, default: false
  end
end
