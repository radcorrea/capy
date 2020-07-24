describe "Teclado", :key do
    
    before(:each) do
        visit "key_presses"
    end

    it "enviando teclas" do

        teclas = %i[tab escape space enter shift alt]
        
        teclas.each do |t|
            find('#campo-id').send_keys t
            expect(page).to have_content 'You entered: ' + t.to_s.upcase
            sleep 1
        end
    end

    it 'enviando letras' do
        letras = %w[a b c d e f g h l o p]

        letras.each do |l|
            find('#campo-id').send_keys l
            expect(page).to have_content 'You entered: ' + l.to_s.upcase
            sleep 1
        end
    end
end
