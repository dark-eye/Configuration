require "./Configuration/**"

module Configuration
	alias Types = Nil | Bool | Int32 | Int64 | Float64 | String
	alias ConfigHash =  Hash(String, Types) | Hash(String, ConfigHash) | Types
	
	class Configuration
		
		def initialize()
			@config = Hash(String, ConfigHash).new
		end
		
		def initialize(@config )
		end
		
		def initialize(config : Configuration)
			@config = config.config
		end
		
		def config=
		end
		
		def config
			return @config
		end
		
		def [](key)
			return self.getByDotSeperated( key, @config )
		end
		
		# Get with default value
		def [](key, default)
			if( self.getByDotSeperated(key, @config) )
				return self.getByDotSeperated( key ,@config )
			end
			return defVal
		end
		
		def []=(key ,value)
			#TODO  add support for dot seperated access/setting
			@config[key] = value
		end

		def searchInConfig( key )
			#TODO  implement
		end

		# ================ Protected =================
		
		protected def getByXPAth( xpath )
			#TODO : implement
		end
		
		protected def getByDotSeperated( dotSeperatedKey , conf )
			if( conf.responds_to?(:[]) && dotSeperatedKey )
				splited = dotSeperatedKey.split('.',2)
				key = splited.size() > 1 ? splited[1] : ""
				if(!conf.is_a?(Array) || splited[0].is_a?(Int32 | Int64) )
					return self.getByDotSeperated(key, conf[splited[0]])
				else
					return Nil
				end
			else
				return conf
			end
			
		end
	end
end
