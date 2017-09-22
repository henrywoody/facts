require 'test_helper'

class JoinTopicUserPagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @join_topic_user_page = join_topic_user_pages(:one)
  end

  test "should get index" do
    get join_topic_user_pages_url
    assert_response :success
  end

  test "should get new" do
    get new_join_topic_user_page_url
    assert_response :success
  end

  test "should create join_topic_user_page" do
    assert_difference('JoinTopicUserPage.count') do
      post join_topic_user_pages_url, params: { join_topic_user_page: { order_num: @join_topic_user_page.order_num, topic_id: @join_topic_user_page.topic_id, user_page_id: @join_topic_user_page.user_page_id } }
    end

    assert_redirected_to join_topic_user_page_url(JoinTopicUserPage.last)
  end

  test "should show join_topic_user_page" do
    get join_topic_user_page_url(@join_topic_user_page)
    assert_response :success
  end

  test "should get edit" do
    get edit_join_topic_user_page_url(@join_topic_user_page)
    assert_response :success
  end

  test "should update join_topic_user_page" do
    patch join_topic_user_page_url(@join_topic_user_page), params: { join_topic_user_page: { order_num: @join_topic_user_page.order_num, topic_id: @join_topic_user_page.topic_id, user_page_id: @join_topic_user_page.user_page_id } }
    assert_redirected_to join_topic_user_page_url(@join_topic_user_page)
  end

  test "should destroy join_topic_user_page" do
    assert_difference('JoinTopicUserPage.count', -1) do
      delete join_topic_user_page_url(@join_topic_user_page)
    end

    assert_redirected_to join_topic_user_pages_url
  end
end
