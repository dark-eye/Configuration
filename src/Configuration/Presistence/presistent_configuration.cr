module Configuration
	abstract class PresistentConfiguration
		@formater : ConfigurationFormat
		
		def initialize(@formater)
		end
		
		def setFormater(@formater)
		end
		
		abstract def load
		
		abstract def save
	end
end