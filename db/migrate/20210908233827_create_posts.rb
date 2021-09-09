class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|

      t.timestamps
      t.references :user, foreign_key: true
      t.text :body, null: false
      t.string :image_id
      t.datetime :deleted_at
      
      
      
      
      
    end
  end
end
