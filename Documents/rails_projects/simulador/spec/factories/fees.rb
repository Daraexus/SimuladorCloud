# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :fee do
    credit_id ""
    numero_cuota ""
    pago_intereses "MyString"
    amortizacion "MyString"
    valor_cuota "MyString"
    saldo_pendiente "MyString"
  end
end
