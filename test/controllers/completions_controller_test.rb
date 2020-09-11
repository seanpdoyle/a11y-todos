require "test_helper"

class CompletionsControllerTest < ActionDispatch::IntegrationTest
  test "#create marks a group of Tasks' completed_at to now" do
    freeze_time do
      do_the_homework, pass_the_test = tasks(:do_the_homework, :pass_the_test)

      post completions_path, params: {
        event: {
          task_ids: [do_the_homework, pass_the_test].map(&:to_param)
        }
      }

      assert_equal Time.now, do_the_homework.reload.completed_at
      assert_equal Time.now, pass_the_test.reload.completed_at
    end
  end
end
