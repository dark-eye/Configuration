require "./configuration_format"

module ConfigIt
	class IniConfiguration < ConfigurationFormat

		def getFormat( config )
			
		end

		def getConfig(iniConfig : String)
			return self.parse( Configuration.new, iniConfig )
		end
		
		# =============== Protected =================
		
		#
		#
		#
		protected def parse( config, iniString )
			section = Nil;
			iniString.each_line do |line|
				if( line =~ /^\[\w+\]$/ )
					section =  line.gsub(/[\[\]]/,"")
				end
				if(section && config.responds_to?(:merge))
					config[section].merge( self.parseLine( line.gsub(/[#;].*$/,"") ) )
				 elsif(config.responds_to?(:merge))
					config.merge( self.parseLine( line.gsub(/[#;].*$/,"") ) )
				end
			end

			return config
		end
		
		#
		#
		#
		protected def parseLine( line )
			splitted =  line.split(".",2);
			if(splitted[1]?)
				return { splitted[0] as String, self.parseLine( splitted[1] ) as ConfigHash };
			end
			return line.gsub(/"/,"")
		end

		#
		#
		#
		protected def generate( configValues )
			if(configValues.is_a?(String))
				return "=" + configValues + "\n";
			end
			
			retString = ""
			#TODO add section support
			configValues.each do |key, value|
				retString += self.generate(value).gsun(/^(?!\=)/m,".").gsub(/^/m,key)
			end
			
			return retString
		end
		
	end
end
