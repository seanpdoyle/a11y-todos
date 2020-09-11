require "test_helper"

class TaskTest < ActiveSupport::TestCase
  test ".completed excludes Task records with a nil completed_at" do
    read_the_book, do_the_homework = tasks(:read_the_book, :do_the_homework)

    completed = Task.completed

    assert_includes completed, read_the_book
    assert_not_includes completed, do_the_homework
  end

  test ".todo excludes Task records with a completed_at" do
    read_the_book, do_the_homework = tasks(:read_the_book, :do_the_homework)

    todo = Task.todo

    assert_not_includes todo, read_the_book
    assert_includes todo, do_the_homework
  end

  test "#complete! marks a Task's completed_at to now" do
    freeze_time do
      pass_the_test = tasks(:pass_the_test)

      assert_changes -> { pass_the_test.completed_at }, from: nil, to: Time.current do
        pass_the_test.complete!
      end
    end
  end
end
