module Configuration
	abstract class PresistentConfiguration
		@formater : ConfigurationFormat
		
		def setFormater(@formater)
		end
		
		abstract def open
		end
		
		abstract def save
		end
	end
end