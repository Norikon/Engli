class AddAgeToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :age, :integer
    add_column :users, :identity, :boolean
    add_column :users, :city, :string
  end
end
