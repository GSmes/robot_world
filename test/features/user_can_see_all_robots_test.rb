require_relative "../test_helper"

class UserCanSeeAllRobotsTest < FeatureTest

  def test_user_can_see_all_created_robots
    robot1 =robot_directory.create({name:       'Garrett',
                                    city:       'Chicago',
                                    state:      'Illinois',
                                    birthdate:  '9/21/87',
                                    date_hired: '1/2/10',
                                    department: 'Loader'})

    robot1 =robot_directory.create({name:       'Bobby',
                                    city:       'Houston',
                                    state:      'Texas',
                                    birthdate:  '7/1/88',
                                    date_hired: '1/30/12',
                                    department: 'Loader'})
    visit "/"
    click_link "Robot Index"

    assert_equal "/robots", current_path

    assert page.has_content?("All Robots")

    within("#robot_list") do
      assert page.has_content?("Garrett")
      assert page.has_link?("Garrett")
      assert page.has_content?("Bobby")
      assert page.has_link?("Bobby")
      assert page.has_link?("Edit")
      assert page.has_button?("DELETE")
    end
  end
end
