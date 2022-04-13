namespace :dev do
  desc "Configuração do ambiente de desenvolvimento"
  task setup: :environment do
    
    puts "Cadastrando os tipos de contato..."
    # %w atalho para não utilizar as aspar
      kinds = %w(Amigos Conhecido Comercial)
      kinds.each do |kind|
        # ! força o erro printar na tela
        Kind.create!(
          description: kind
        )
      end
    puts "Tipos de Contato cadastrado com sucesso!"
    
    puts "Cadastrando contatos..."
    100.times do |i|
      Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        birthdate: Faker::Date.between(from: 65.years.ago, to: 18.years.ago),
        kind: Kind.all.sample
      )
    end
    puts "Contatos cadastrado com sucesso!"

  end

end
