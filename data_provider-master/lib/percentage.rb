class Percentage < BigDecimal
	def self.new(initial)
		super(initial.to_s).round(2)
	end
end

class BigDecimal
	def to_percent
		"#{self.round(2)} %"
	end
end
