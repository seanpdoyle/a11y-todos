require "test_helper"

class TasksControllerTest < ActionDispatch::IntegrationTest
  include ActionView::Helpers::TranslationHelper

  test "#index omits the Todo list when there are no ready Task records" do
    Task.todo.update_all(completed_at: nil)

    get root_path

    assert_no_section :todo
  end

  test "#index omits the Completed list when there are no delayed Task records" do
    Task.completed.update_all(completed_at: nil)

    get root_path

    assert_no_section :completed
  end

  test "#index omits the Delayed list when there are no delayed Task records" do
    get root_path

    assert_no_section :delayed
  end

  def assert_no_section(i18n_key)
    title = translate(i18n_key, scope: [:tasks, :index])

    assert_select "section", count: 0, text: title
  end
end
