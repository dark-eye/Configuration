module Configuration
	abstract class PresistentConfiguration
		@formater : ConfigurationFormat
		
		def setFormater(@formater)
		end
		
		abstract def open
		
		abstract def save
	end
end