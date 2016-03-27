require "yaml"

require "./configuration_format.cr"

module Configuration
	class JsonConfiguration < ConfigurationFormat

		def getFormat( config : ConfigHash )
			return config.to_ymal
		end

		def getConfig(yaml : String)
			return YAML.parse( yaml )
		end
	end
end