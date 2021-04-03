class AddNameAndCompanyToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string, null: false
    add_column :users, :company, :string
  end
end
