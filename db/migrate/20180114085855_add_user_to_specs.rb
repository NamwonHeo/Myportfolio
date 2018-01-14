class AddUserToSpecs < ActiveRecord::Migration[5.0]
  def change
    add_reference :specs, :user, foreign_key: true
  end
end
