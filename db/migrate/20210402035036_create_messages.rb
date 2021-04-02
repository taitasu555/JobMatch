class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.references :enrollment, null: false, foreign_key: true
      t.boolean :is_user
      t.text :content

      t.timestamps
    end
  end
end
