describe 'Forms' do
    it 'login com sucesso' do
        visit 'login'
        
        fill_in 'userId', with: 'stark'
        fill_in 'passId', with: 'jarvis!'
        
        click_button 'Login'

        expect(find('#flash').visible?).to be true

        puts find('#flash').text 
        puts 'Olá, Tony Stark. Você acessou a área logada!'

        expect(find('#flash')).to have_content 'Olá, Tony Stark. Você acessou a área logada!'
    end

    it 'senha incorreta' do
        visit 'login'

        fill_in 'userId', with: 'stark'
        fill_in 'passId', with: 'jarvis'
        
        click_button 'Login'

        expect(find('#flash')).to have_content 'Senha é invalida!'
    end

    it 'usuario nao cadastrado' do
        visit 'login'

        fill_in 'userId', with: 'teste'
        fill_in 'passId', with: 'jarvis!'
        
        click_button 'Login'

        expect(find('#flash')).to have_content 'O usuário informado não está cadastrado!'
    end
end