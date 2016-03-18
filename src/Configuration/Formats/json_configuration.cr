
require "json"

require "./configuration_format.cr"

module Configuration
	class JsonConfiguration < ConfigurationFormat

		public def getFormat( config )
			return config.to_yaml
		end

		public def getConfig(json : String)
			return JSON.parse( json )
		end
	end
end