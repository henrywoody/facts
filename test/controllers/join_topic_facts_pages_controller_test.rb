require 'test_helper'

class JoinTopicFactsPagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @join_topic_facts_page = join_topic_facts_pages(:one)
  end

  test "should get index" do
    get join_topic_facts_pages_url
    assert_response :success
  end

  test "should get new" do
    get new_join_topic_facts_page_url
    assert_response :success
  end

  test "should create join_topic_facts_page" do
    assert_difference('JoinTopicfactsPage.count') do
      post join_topic_facts_pages_url, params: { join_topic_facts_page: { order_num: @join_topic_facts_page.order_num, topic_id: @join_topic_facts_page.topic_id, facts_page_id: @join_topic_facts_page.facts_page_id } }
    end

    assert_redirected_to join_topic_facts_page_url(JoinTopicFactsPage.last)
  end

  test "should show join_topic_facts_page" do
    get join_topic_facts_page_url(@join_topic_facts_page)
    assert_response :success
  end

  test "should get edit" do
    get edit_join_topic_facts_page_url(@join_topic_facts_page)
    assert_response :success
  end

  test "should update join_topic_facts_page" do
    patch join_topic_facts_page_url(@join_topic_facts_page), params: { join_topic_facts_page: { order_num: @join_topic_facts_page.order_num, topic_id: @join_topic_facts_page.topic_id, facts_page_id: @join_topic_facts_page.facts_page_id } }
    assert_redirected_to join_topic_facts_page_url(@join_topic_facts_page)
  end

  test "should destroy join_topic_facts_page" do
    assert_difference('JoinTopicfactsPage.count', -1) do
      delete join_topic_facts_page_url(@join_topic_facts_page)
    end

    assert_redirected_to join_topic_facts_pages_url
  end
end
