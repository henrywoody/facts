class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :title
      t.string :link
      t.text :info
      t.string :image_url

      t.timestamps
    end
  end
end
