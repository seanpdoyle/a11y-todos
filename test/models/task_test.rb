require "test_helper"

class TaskTest < ActiveSupport::TestCase
  test ".completed excludes Task records with a nil completed_at" do
    read_the_book, do_the_homework = tasks(:read_the_book, :do_the_homework)

    completed = Task.completed

    assert_includes completed, read_the_book
    assert_not_includes completed, do_the_homework
  end

  test ".delayed excludes Task records with a nil delayed_at" do
    read_the_book, do_the_homework = tasks(:read_the_book, :do_the_homework)
    do_the_homework.delay!

    delayed = Task.delayed

    assert_not_includes delayed, read_the_book
    assert_includes delayed, do_the_homework
  end

  test ".todo excludes Task records with a completed_at" do
    read_the_book, do_the_homework = tasks(:read_the_book, :do_the_homework)

    todo = Task.todo

    assert_not_includes todo, read_the_book
    assert_includes todo, do_the_homework
  end

  test ".todo excludes Task records with a delayed_at" do
    do_the_homework, pass_the_test = tasks(:do_the_homework, :pass_the_test)
    do_the_homework.delay!

    todo = Task.todo

    assert_not_includes todo, do_the_homework
    assert_includes todo, pass_the_test
  end

  test "#complete! marks a Task's completed_at to now" do
    freeze_time do
      pass_the_test = tasks(:pass_the_test)

      assert_changes -> { pass_the_test.completed_at }, from: nil, to: Time.current do
        pass_the_test.complete!
      end
    end
  end

  test "#delay! marks a Task's delayed_at to now" do
    freeze_time do
      pass_the_test = tasks(:pass_the_test)

      assert_changes -> { pass_the_test.delayed_at }, from: nil, to: Time.current do
        pass_the_test.delay!
      end
    end
  end

  test "#promote! marks a Task's delayed_at to nil" do
    freeze_time do
      do_the_homework = tasks(:do_the_homework)
      do_the_homework.delay!

      assert_changes -> { do_the_homework.delayed_at }, from: Time.current, to: nil do
        do_the_homework.promote!
      end
    end
  end
end
