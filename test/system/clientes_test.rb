require "application_system_test_case"

class ClientesTest < ApplicationSystemTestCase
  setup do
    @cliente = clientes(:one)
  end

  test "visiting the index" do
    visit clientes_url
    assert_selector "h1", text: "Clientes"
  end

  test "should create cliente" do
    visit clientes_url
    click_on "New cliente"

    fill_in "Cpf", with: @cliente.cpf
    fill_in "Data nascimento", with: @cliente.data_nascimento
    fill_in "Email", with: @cliente.email
    fill_in "Nome completo", with: @cliente.nome_completo
    fill_in "Senha", with: @cliente.senha
    fill_in "Telefone", with: @cliente.telefone
    click_on "Create Cliente"

    assert_text "Cliente was successfully created"
    click_on "Back"
  end

  test "should update Cliente" do
    visit cliente_url(@cliente)
    click_on "Edit this cliente", match: :first

    fill_in "Cpf", with: @cliente.cpf
    fill_in "Data nascimento", with: @cliente.data_nascimento
    fill_in "Email", with: @cliente.email
    fill_in "Nome completo", with: @cliente.nome_completo
    fill_in "Senha", with: @cliente.senha
    fill_in "Telefone", with: @cliente.telefone
    click_on "Update Cliente"

    assert_text "Cliente was successfully updated"
    click_on "Back"
  end

  test "should destroy Cliente" do
    visit cliente_url(@cliente)
    click_on "Destroy this cliente", match: :first

    assert_text "Cliente was successfully destroyed"
  end
end
