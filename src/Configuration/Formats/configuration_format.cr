

module Configuration
	abstract class ConfigurationFormat
		#Return format from configuration
		abstract def getFormat( config : ConfigHash )
		
		#Return configuration from format
		abstract def getConfig( format )
	end
end
