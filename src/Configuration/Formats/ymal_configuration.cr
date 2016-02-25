require "yaml"

require "./configuration_format.cr"

module Configuration
	class JsonConfiguration : ConfigurationFormat

		def getFormat( config : ConfigHash )
			return config.to_ymal
		end

		def getConfig(ymal : String)
			return YMAL.from_yaml( yaml )
		end
	end
end