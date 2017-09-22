class CreateJoinTopicUserPages < ActiveRecord::Migration[5.1]
  def change
    create_table :join_topic_user_pages do |t|
      t.integer :order_num
      t.references :topic, foreign_key: true
      t.references :user_page, foreign_key: true
      t.index [:topic_id, :user_page_id]
      t.index [:user_page_id, :topic_id]

      t.timestamps
    end
  end
end
