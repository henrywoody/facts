require 'test_helper'

class FactsPagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @facts_page = facts_pages(:one)
  end

  test "should get index" do
    get facts_pages_url
    assert_response :success
  end

  test "should get new" do
    get new_facts_page_url
    assert_response :success
  end

  test "should create facts_page" do
    assert_difference('factsPage.count') do
      post facts_pages_url, params: { facts_page: { title: @facts_page.title } }
    end

    assert_redirected_to facts_page_url(FactsPage.last)
  end

  test "should show facts_page" do
    get facts_page_url(@facts_page)
    assert_response :success
  end

  test "should get edit" do
    get edit_facts_page_url(@facts_page)
    assert_response :success
  end

  test "should update facts_page" do
    patch facts_page_url(@facts_page), params: { facts_page: { title: @facts_page.title } }
    assert_redirected_to facts_page_url(@facts_page)
  end

  test "should destroy facts_page" do
    assert_difference('factsPage.count', -1) do
      delete facts_page_url(@facts_page)
    end

    assert_redirected_to facts_pages_url
  end
end
