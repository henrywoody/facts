class CreateJoinTopicFactsPages < ActiveRecord::Migration[5.1]
  def change
    create_table :join_topic_facts_pages do |t|
      t.integer :order_num
      t.references :topic, foreign_key: true
      t.references :facts_page, foreign_key: true
      t.index [:topic_id, :facts_page_id]
      t.index [:facts_page_id, :topic_id]

      t.timestamps
    end
  end
end
