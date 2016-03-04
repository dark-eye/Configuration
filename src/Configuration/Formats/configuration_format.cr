require "../configuration.cr"

module Configuration
	abstract class ConfigurationFormat	
		#Return format from configuration
		abstract public def getFormat( config : ConfigHash )
		end
		
		#Return configuration from format
		abstract public def getConfig( format )
		end
	end
	
end