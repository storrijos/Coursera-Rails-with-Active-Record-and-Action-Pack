require 'test_helper'

class TodoitemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @todoitem = todoitems(:one)
  end

  test "should get index" do
    get todoitems_url
    assert_response :success
  end

  test "should get new" do
    get new_todoitem_url
    assert_response :success
  end

  test "should create todoitem" do
    assert_difference('Todoitem.count') do
      post todoitems_url, params: { todoitem: { completed: @todoitem.completed, description: @todoitem.description, due_date: @todoitem.due_date, title: @todoitem.title } }
    end

    assert_redirected_to todoitem_url(Todoitem.last)
  end

  test "should show todoitem" do
    get todoitem_url(@todoitem)
    assert_response :success
  end

  test "should get edit" do
    get edit_todoitem_url(@todoitem)
    assert_response :success
  end

  test "should update todoitem" do
    patch todoitem_url(@todoitem), params: { todoitem: { completed: @todoitem.completed, description: @todoitem.description, due_date: @todoitem.due_date, title: @todoitem.title } }
    assert_redirected_to todoitem_url(@todoitem)
  end

  test "should destroy todoitem" do
    assert_difference('Todoitem.count', -1) do
      delete todoitem_url(@todoitem)
    end

    assert_redirected_to todoitems_url
  end
end
