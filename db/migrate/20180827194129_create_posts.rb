class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.string :author
      
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.references :user, index: true, foreign_key: true
    end
  end
end
