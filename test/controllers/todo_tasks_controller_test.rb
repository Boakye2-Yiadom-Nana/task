require "test_helper"

class TodoTasksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get todo_tasks_index_url
    assert_response :success
  end

  test "should get show" do
    get todo_tasks_show_url
    assert_response :success
  end

  test "should get new" do
    get todo_tasks_new_url
    assert_response :success
  end

  test "should get edit" do
    get todo_tasks_edit_url
    assert_response :success
  end
end
