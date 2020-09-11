require "application_system_test_case"

class TasksTest < ApplicationSystemTestCase
  include ActionView::Helpers::TranslationHelper

  test "marks multiple Tasks as complete" do
    do_the_homework, pass_the_test = tasks(:do_the_homework, :pass_the_test)

    visit root_path
    click_on do_the_homework.name
    check pass_the_test.name
    click_on submit(:event, :complete)

    assert_no_section :todo
    within_section :completed do
      assert_text do_the_homework.name
      assert_text pass_the_test.name
    end
  end

  test "marks multiple Tasks as delayed" do
    do_the_homework, pass_the_test = tasks(:do_the_homework, :pass_the_test)

    visit root_path
    click_on do_the_homework.name
    check pass_the_test.name
    click_on submit(:event, :delay)

    assert_no_section :todo
    within_section :delayed do
      assert_text do_the_homework.name
      assert_text pass_the_test.name
    end
  end

  test "promotes delayed Task back to Todo" do
    do_the_homework = tasks(:do_the_homework)
    do_the_homework.delay!

    visit root_path
    within_task(do_the_homework.name) { click_on submit(:event, :promote) }

    assert_no_section :delayed
    within_section :todo do
      assert_text do_the_homework.name
    end
  end

  test "reopens a completed Task back to Todo" do
    read_the_book = tasks(:read_the_book)

    visit root_path
    within_task(read_the_book.name) { click_on submit(:event, :reopen) }

    assert_no_section :completed
    within_section :todo do
      assert_text read_the_book.name
    end
  end

  test "resets the form when closing the modal" do
    do_the_homework, pass_the_test = tasks(:do_the_homework, :pass_the_test)

    visit root_path
    click_on do_the_homework.name
    click_on submit(:event, :close)
    click_on pass_the_test.name

    assert_no_checked_field do_the_homework.name
    assert_checked_field pass_the_test.name
  end

  test "switches back to reading mode when there are no checked Tasks" do
    do_the_homework = tasks(:do_the_homework)

    visit root_path
    click_on do_the_homework.name
    uncheck do_the_homework.name

    assert_no_button submit(:event, :complete)
    within_section :todo do
      assert_text do_the_homework.name
    end
  end

  def assert_no_section(i18n_key)
    assert_no_text translate(i18n_key, scope: [:tasks, :index])
  end

  def within_section(i18n_key, &block)
    title = translate(i18n_key, scope: [:tasks, :index])

    within("section", text: title, &block)
  end

  def within_task(text, &block)
    within("tr", text: text, &block)
  end

  def submit(i18n_key, action)
    translate(action, scope: [:helpers, :submit, i18n_key])
  end
end
