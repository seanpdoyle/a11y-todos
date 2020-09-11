require "application_system_test_case"

class TasksTest < ApplicationSystemTestCase
  include ActionView::Helpers::TranslationHelper

  test "marks multiple Tasks as complete" do
    do_the_homework, pass_the_test = tasks(:do_the_homework, :pass_the_test)

    visit root_path
    check do_the_homework.name
    check pass_the_test.name
    click_on submit(:event)

    within_section :todo do
      assert_no_text do_the_homework.name
      assert_no_text pass_the_test.name
    end
    within_section :completed do
      assert_text do_the_homework.name
      assert_text pass_the_test.name
    end
  end

  def within_section(i18n_key, &block)
    title = translate(i18n_key, scope: [:tasks, :index])

    within("section", text: title, &block)
  end

  def submit(i18n_key)
    translate(:submit, scope: [:helpers, :submit, i18n_key])
  end
end