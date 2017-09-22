class CreateJoinItemTopics < ActiveRecord::Migration[5.1]
  def change
    create_table :join_item_topics do |t|
      t.integer :order_num
      t.references :item, foreign_key: true
      t.references :topic, foreign_key: true
      t.index [:item_id, :topic_id]
      t.index [:topic_id, :item_id]

      t.timestamps
    end
  end
end
