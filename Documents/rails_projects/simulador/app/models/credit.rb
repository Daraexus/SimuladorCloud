class Credit < ActiveRecord::Base
	belongs_to :user
	has_many :fees, dependent: :destroy
	validates :cedula, presence: true
	validates :valorCredito, presence: true
	validates :plazo, presence: true
	validates :user_id, presence: true
	validates :lineaCredito, presence: true


	def generarPlanes
		
		#credits = Credit.where(estado: "En proceso")
#
#		t1 = Time.now
#		threads = []
#
#		
#		credits.each do 
#			threads << Thread.new do
#				calcularRiesgo
#			end
#		end
#
#		threads.each do |t|
#			t.join
#		end
#
#
#			
#		credits.each do |credit| 		
#				procesarCredito(credit)
#				credit.estado = ("Generado")
#				credit.nivelRiesgo = rand(10) + 1
#				credit.save
#		
#
##		puts "Cron executed in #{Time.now - t1}"

		
		calcularRiesgo
		procesarCredito
		self.estado = ("Generado")
				self.nivelRiesgo = rand(10) + 1
				self.save
	
	end	

			
		
		

	def calcularRiesgo()
		timeStart = Time.now
		timeEnd = timeStart

		num = 1
		while timeEnd - timeStart <= 25 do
			timeEnd = Time.now
			
			i = 2
			while i <= num do
				if num % i == 0
					break
				end
				i += 1
			end

			num =+ 1

		end

	
	end


	def procesarCredito()

		i = 0
			fee = nil

			monthRate = self.user.credit_lines.find(self.lineaCredito).annualRate / 1200
			feeNumber = (self.plazo).to_d
			creditValue = (self.valorCredito).to_d
			saldoPendiente = creditValue
			
			feeAmount = (creditValue * monthRate * (1 + monthRate ) ** feeNumber) / 
													(((1 + monthRate ) ** feeNumber)  - 1)
	

				until i >= self.plazo do
			

					fee = self.fees.build

							
					fee.valor_cuota =	(feeAmount.round(2)).to_s		
					fee.numero_cuota = i + 1
					fee.amortizacion = ((feeAmount - creditValue*monthRate)*(1 + monthRate)**i).round(2).to_s
					fee.pago_intereses = (feeAmount - fee.amortizacion.to_d).round(2).to_s
					
					saldoPendiente = saldoPendiente - fee.amortizacion.to_d
					fee.saldo_pendiente = saldoPendiente.to_s
					#fee.saldo_pendiente = (creditValue - feeAmount.to_i*(i+1)).to_s		

					fee.save
									#fee.update_attribute( :valor_couta, feeAmount.to_s)

					i += 1
				end

	
	end


	def self.clean
		Credit.all.each do |credit|
			credit.estado = "En proceso"
			credit.nivelRiesgo = "En proceso"
			credit.save
			credit.fees.all.each do |n|
				n.delete
			end
		end

	end

	
	

end



