class AddFieldsToJobs < ActiveRecord::Migration[6.0]
  def change
    add_column :jobs, :address, :string
    add_column :jobs, :language, :string 
    add_column :jobs, :japanese, :string ,default: "N5", null: false
    add_column :jobs, :status, :string, default: "Full Time",null: false
    add_column :jobs, :position, :string
    add_column :jobs, :salary, :integer, default: 0, null: false
  end
end
