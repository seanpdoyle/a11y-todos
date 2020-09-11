require "test_helper"

class PromotionsControllerTest < ActionDispatch::IntegrationTest
  test "#create marks a Task's delayed_at to nil" do
    do_the_homework = tasks(:do_the_homework)
    do_the_homework.delay!

    post task_promotions_path(do_the_homework)

    assert_nil do_the_homework.reload.delayed_at
  end
end
