
require "./configuration_format.cr"

module Configuration
	class JsonConfiguration : ConfigurationFormat

		def getFormat( config )
			#TODO implement
		end

		def getConfig(json : String)
			#TODO implement
			return Nil
		end
	end
end