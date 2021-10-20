class CreateAdvertisements < ActiveRecord::Migration[6.1]
  def change
    create_table :advertisements do |t|
      t.text :content
      t.datetime :expire_at
      t.boolean :new
      t.boolean :approved
      t.boolean :archived
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :advertisements, %i[user_id created_at]
  end
end
