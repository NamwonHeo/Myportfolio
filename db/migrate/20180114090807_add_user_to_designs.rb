class AddUserToDesigns < ActiveRecord::Migration[5.0]
  def change
    add_reference :designs, :user, foreign_key: true
  end
end
