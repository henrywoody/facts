require 'test_helper'

class JoinItemTopicsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @join_item_topic = join_item_topics(:one)
  end

  test "should get index" do
    get join_item_topics_url
    assert_response :success
  end

  test "should get new" do
    get new_join_item_topic_url
    assert_response :success
  end

  test "should create join_item_topic" do
    assert_difference('JoinItemTopic.count') do
      post join_item_topics_url, params: { join_item_topic: { item_id: @join_item_topic.item_id, order_num: @join_item_topic.order_num, topic_id: @join_item_topic.topic_id } }
    end

    assert_redirected_to join_item_topic_url(JoinItemTopic.last)
  end

  test "should show join_item_topic" do
    get join_item_topic_url(@join_item_topic)
    assert_response :success
  end

  test "should get edit" do
    get edit_join_item_topic_url(@join_item_topic)
    assert_response :success
  end

  test "should update join_item_topic" do
    patch join_item_topic_url(@join_item_topic), params: { join_item_topic: { item_id: @join_item_topic.item_id, order_num: @join_item_topic.order_num, topic_id: @join_item_topic.topic_id } }
    assert_redirected_to join_item_topic_url(@join_item_topic)
  end

  test "should destroy join_item_topic" do
    assert_difference('JoinItemTopic.count', -1) do
      delete join_item_topic_url(@join_item_topic)
    end

    assert_redirected_to join_item_topics_url
  end
end
