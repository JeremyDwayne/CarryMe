require "application_system_test_case"

class CarriesTest < ApplicationSystemTestCase
  setup do
    @carry = carries(:one)
  end

  test "visiting the index" do
    visit carries_url
    assert_selector "h1", text: "Carries"
  end

  test "creating a Carry" do
    visit carries_url
    click_on "New Carry"

    fill_in "Description", with: @carry.description
    fill_in "Price", with: @carry.price
    fill_in "Title", with: @carry.title
    fill_in "Type", with: @carry.type
    fill_in "User", with: @carry.user_id
    click_on "Create Carry"

    assert_text "Carry was successfully created"
    click_on "Back"
  end

  test "updating a Carry" do
    visit carries_url
    click_on "Edit", match: :first

    fill_in "Description", with: @carry.description
    fill_in "Price", with: @carry.price
    fill_in "Title", with: @carry.title
    fill_in "Type", with: @carry.type
    fill_in "User", with: @carry.user_id
    click_on "Update Carry"

    assert_text "Carry was successfully updated"
    click_on "Back"
  end

  test "destroying a Carry" do
    visit carries_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Carry was successfully destroyed"
  end
end
