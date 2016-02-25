require "file"
require "./presistent_configuration.cr"

module Configuration
	class FileConfiguration : PresistentConfiguration
	
		def initialize( @path )
			
		end
		
		def load
			data = File.read( @path )
			@config = @formater.getConfig( data )
		end
		
		def save
			data = @formater.getFormat( @config )
			File.write(@path, data)
		end
	end
end