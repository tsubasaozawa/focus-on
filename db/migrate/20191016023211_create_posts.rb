class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :content,      null: false
      t.string :image,        null: false
      t.references :group,    foreign_key: true
      t.references :user,     foreign_key: true
      t.timestamps
    end
  end
end
