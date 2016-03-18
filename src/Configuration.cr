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
			return self.getByDotSeperated( key, @config )
		end
		
		public def [](key, default)
			return self.getWithDefault( key , default )
		end
		
		public def []=(index,value)
			#TODO  add support  for  dot seperated access
			@config[index] = value
		end

		public def searchInConfig( key )
			#TODO  implement
		end

		# ================ Protected =================
		
		protected def getWithDefault( key , defVal )
		
			if( self.getByDotSeperated(key, @config) )
				return self.getByDotSeperated( key ,@config )
			end
			return defVal
		end
		
		protected def getByXPAth( xpath )
			#TODO : implement
		end
		
		protected def getByDotSeperated( dotSeperatedKey , conf )
			splited = dotSeperatedKey.split('.',2)
			return conf[splited[0]].is_a?(ConfigHash) ? self.getByDotSeperated(splited[1],conf[splited[0]]) : conf[splited[0]]?;
		end
	end
end
