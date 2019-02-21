class AddUserRefToTutorial < ActiveRecord::Migration[5.2]
  def change
      add_reference :tutorials, :user, foreign_key: true
      add_reference :tutorials, :professor, references: :users
      add_reference :tutorials, :subject, foreign_key: true
  end
end
