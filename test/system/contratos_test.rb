require "application_system_test_case"

class ContratosTest < ApplicationSystemTestCase
  setup do
    @contrato = contratos(:one)
  end

  test "visiting the index" do
    visit contratos_url
    assert_selector "h1", text: "Contratos"
  end

  test "should create contrato" do
    visit contratos_url
    click_on "New contrato"

    click_on "Create Contrato"

    assert_text "Contrato was successfully created"
    click_on "Back"
  end

  test "should update Contrato" do
    visit contrato_url(@contrato)
    click_on "Edit this contrato", match: :first

    click_on "Update Contrato"

    assert_text "Contrato was successfully updated"
    click_on "Back"
  end

  test "should destroy Contrato" do
    visit contrato_url(@contrato)
    click_on "Destroy this contrato", match: :first

    assert_text "Contrato was successfully destroyed"
  end
end
