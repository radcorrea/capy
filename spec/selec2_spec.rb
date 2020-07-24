describe "Select2", :select2 do
    
    describe('single', :single) do
        before(:each) do
            visit "apps/select2/single.html"
        end
        
        it "seleciona ator por nome" do
            find('.select2-selection--single').click
            sleep 1
            find('.select2-results__option', text: 'Adam Sandler').click
            sleep 5
        end

        it 'busca e clica no ator' do
            find('.select2-selection--single').click
            sleep 1
            find('.select2-search__field').set 'Chris Rock'
            sleep 5
            find('.select2-results__option').click
            sleep 5
        end
    end
    
    describe('multiple', :multiple) do
        before(:each) do
            visit "apps/select2/multi.html"
        end

        def selecione(ator)
            find('.select2-selection--multiple').click
            find('.select2-search__field').set ator
            find('.select2-results__option').click
        end

        it 'seleciona atores' do

            atores = ['Jim Carrey', 'Adam Sandler', 'Owen Wilson']
            
            atores.each do |a|
                selecione(a)
            end
            sleep 5
        end
    end
end
