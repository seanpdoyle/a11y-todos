require "test_helper"

class DelaysControllerTest < ActionDispatch::IntegrationTest
  test "#create marks a group of Tasks' delayed_at to now" do
    freeze_time do
      do_the_homework, pass_the_test = tasks(:do_the_homework, :pass_the_test)

      post delays_path, params: {
        event: {
          task_ids: [do_the_homework, pass_the_test].map(&:to_param)
        }
      }

      assert_equal Time.now, do_the_homework.reload.delayed_at
      assert_equal Time.now, pass_the_test.reload.delayed_at
    end
  end
end
