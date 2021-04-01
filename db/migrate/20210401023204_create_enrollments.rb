class CreateEnrollments < ActiveRecord::Migration[6.0]
  def change
    create_table :enrollments do |t|
      t.references :job, null: false, foreign_key: true
      t.references :to_user, null: false, foreign_key: { to_table: :users }
      t.references :from_user, null: false, foreign_key: { to_table: :users }
      t.timestamps
    end
  end
end
