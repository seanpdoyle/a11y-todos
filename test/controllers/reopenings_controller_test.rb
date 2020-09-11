require "test_helper"

class ReopeningsControllerTest < ActionDispatch::IntegrationTest
  test "#create marks a Task's completed_at to nil" do
    read_the_book = tasks(:read_the_book)

    post task_reopenings_path(read_the_book)

    assert_nil read_the_book.reload.completed_at
  end
end
