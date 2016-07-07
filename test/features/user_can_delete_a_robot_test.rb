require_relative "../test_helper"

class UserCanDeleteARobotTest < FeatureTest

  def test_user_can_delete_a_robot
    robot1 =robot_directory.create({name:       'Garrett',
                                    city:       'Chicago',
                                    state:      'Illinois',
                                    birthdate:  '9/21/87',
                                    date_hired: '1/2/10',
                                    department: 'Loader'})
    visit "/"
    click_link "Robot Index"

    assert_equal "/robots", current_path

    assert page.has_content?("Garrett")

    page.find_button("DELETE").click

    assert_equal "/robots", current_path

    assert page.has_content?("All Robots")
    refute page.has_content?("Garrett")
  end
end
