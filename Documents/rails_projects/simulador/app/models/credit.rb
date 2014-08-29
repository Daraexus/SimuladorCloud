class Credit < ActiveRecord::Base
	belongs_to :user
	validates :cedula, presence: true
	validates :valorCredito, presence: true
	validates :plazo, presence: true
	validates :user_id, presence: true
	validates :lineaCredito, presence: true




end

