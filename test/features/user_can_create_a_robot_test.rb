require_relative "../test_helper"

class UserCanCreateATaskTest < FeatureTest

  def test_user_can_create_a_robot
    visit "/"
    click_link "Create Robot"

    assert_equal "/robots/new", current_path

    fill_in "robot[name]", with: "Garrett"
    fill_in "robot[city]", with: "Chicago"
    fill_in "robot[state]", with: "Illinois"
    fill_in "robot[birthdate]", with: "9/21/87"
    fill_in "robot[date_hired]", with: "1/2/14"
    fill_in "robot[department]", with: "Student"

    page.find("#submit").click

    assert_equal "/robots", current_path

    assert page.has_content?("All Robots")
    assert page.find('h3 a').has_content?("Garrett")
  end
end
