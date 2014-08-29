# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :credito, :class => 'Creditos' do
    cedula "MyString"
    valorCredito "MyString"
    plazo 1
    lineaCredito 1
    estado "MyString"
    nivelRiesgo "MyString"
  end
end
