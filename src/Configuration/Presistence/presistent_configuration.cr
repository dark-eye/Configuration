require "../../Configuration"

module ConfigIt
	abstract class PresistentConfiguration < ConfigIt::Configuration

		@formater : ConfigurationFormat
		
		def initialize(@formater)
		end
		
		def setFormater(@formater)
		end
		
		abstract def load
		
		abstract def save
	end
end