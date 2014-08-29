class Credit < ActiveRecord::Base
	belongs_to :user
	has_many :fees, dependent: :destroy
	validates :cedula, presence: true
	validates :valorCredito, presence: true
	validates :plazo, presence: true
	validates :user_id, presence: true
	validates :lineaCredito, presence: true


def count
	p "Total of credits" + Credit.count
end

end

