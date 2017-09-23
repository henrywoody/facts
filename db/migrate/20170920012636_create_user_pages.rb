class CreateUserPages < ActiveRecord::Migration[5.1]
  def change
    create_table :user_pages do |t|
      t.string :title
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
