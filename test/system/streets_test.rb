require "application_system_test_case"

class StreetsTest < ApplicationSystemTestCase
  setup do
    @street = streets(:one)
  end

  test "visiting the index" do
    visit streets_url
    assert_selector "h1", text: "Streets"
  end

  test "should create street" do
    visit streets_url
    click_on "New street"

    fill_in "City", with: @street.city
    fill_in "Name", with: @street.name
    fill_in "State", with: @street.state
    fill_in "Zip", with: @street.zip
    click_on "Create Street"

    assert_text "Street was successfully created"
    click_on "Back"
  end

  test "should update Street" do
    visit street_url(@street)
    click_on "Edit this street", match: :first

    fill_in "City", with: @street.city
    fill_in "Name", with: @street.name
    fill_in "State", with: @street.state
    fill_in "Zip", with: @street.zip
    click_on "Update Street"

    assert_text "Street was successfully updated"
    click_on "Back"
  end

  test "should destroy Street" do
    visit street_url(@street)
    click_on "Destroy this street", match: :first

    assert_text "Street was successfully destroyed"
  end
end
