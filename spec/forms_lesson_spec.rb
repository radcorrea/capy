describe 'Testes de erros' do

it 'senha incorreta' do
    visit 'login'

    fill_in 'userId', with: 'stark'
    fill_in 'passId', with: 'jarvis'

    click_button 'Login'

    expect(find('#flash').visible?).to be true
    expect(find('#flash')).to have_content 'Senha é invalida!'
end

it 'usuário não encontrado' do
    visit 'login'

    fill_in 'userId', with: 'stark1'
    fill_in 'passId', with: 'jarvis'

    click_button 'Login'

    expect(find('#flash').visible?).to be true
    expect(find('#flash')).to have_content 'O usuário informado não está cadastrado!'
end

end