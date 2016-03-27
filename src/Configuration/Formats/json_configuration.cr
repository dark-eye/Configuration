
require "json"

require "./configuration_format.cr"

module Configuration
	class JsonConfiguration < ConfigurationFormat

		def getFormat( config )
			return config.to_yaml
		end

		def getConfig(json : String)
			return JSON.parse( json )
		end
	end
end