require "../configuration.cr"

module Configuration
	abstract class ConfigurationFormat	
		#Return format from configuration
		abstract def getFormat( config : ConfigHash )
		end
		
		#Return configuration from format
		abstract def getConfig( format )
		end
	end
	
end