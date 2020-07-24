describe "Upload", :upload do

    before(:each) do
        visit "upload"
        @arquivo = Dir.pwd + '/spec/fixtures/arquivo.txt'
        @imagem = Dir.pwd + '/spec/fixtures/imagem.jpg'
    end

    it 'upload com arquivo texto' do
        attach_file('file-upload', @arquivo)
        click_button 'Upload'
        
        div_arquivo = find('#uploaded-file')
        expect(div_arquivo.text).to eql 'arquivo.txt'
    end

    it 'upload com imagem', :upload_image do
        attach_file('file-upload', @imagem)
        click_button 'Upload'

        div_imagem = find('#uploaded-file')
        expect(div_imagem.text).to eql 'imagem.jpg'

        puts Capybara.default_max_wait_time
        
        img = find('#new-image')
        expect(img[:src]).to include '/uploads/imagem.jpg'
    end

    after(:each) do
        sleep 3
    end
end
