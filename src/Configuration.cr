require "./Configuration/*"

module Configuration
	alias ConfigHash = Hash(String,(Array(ConfigHash)|String|Int32|Float64|Float32|ConfigHash|Nil))
	
	class Configuration
		
		@config = new ConfigHash
		
		def initialize(@config : ConfigHash)
		end
		
		def initialize(config : Configuration)
			@config = config.config
		end
		
		public def config=
		end
		
		public def config
			return @config
		end
		
		public def [](key)
			return @config[key]
		end
		
		public def []=(index,value)
			@config[index] = value
		end
		
		public def getWithDefault( key , defVal )
			if(@config[key]) {
				return @config[key]
			}

			return defVal
		end

		public def searchInConfig( key )
		 #TODO : implment
		end
		
		# ================ Protected =================

	end
end