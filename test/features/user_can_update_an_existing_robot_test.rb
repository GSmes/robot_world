require_relative "../test_helper"

class UserCanUpdateAnExistingRobotTest < FeatureTest

  def test_user_can_update_an_existing_robot
    robot1 =robot_directory.create({name:       'Garrett',
                                    city:       'Chicago',
                                    state:      'Illinois',
                                    birthdate:  '9/21/87',
                                    date_hired: '1/2/10',
                                    department: 'Loader'})
    visit "/"
    click_link "Robot Index"

    assert_equal "/robots", current_path
    click_link("Edit")

    fill_in "robot[name]", with: "Lloyd"
    fill_in "robot[city]", with: "Denver"
    fill_in "robot[state]", with: "Colorado"
    fill_in "robot[birthdate]", with: "10/22/88"
    fill_in "robot[date_hired]", with: "2/3/11"
    fill_in "robot[department]", with: "Student"

    page.find("#submit").click
    assert page.has_content?("Lloyd")
    assert page.has_content?("All Robots")
  end
end
