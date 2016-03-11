
require "./configuration_format.cr"

module Configuration
	class IniConfiguration : ConfigurationFormat

		public def getFormat( config )
			
		end

		public def getConfig(iniConfig : String)
			return this.prase( iniConfig )
		end
		
		# =============== Protected =================
		
		protected def parse( config, iniString )
			section = Nil;
			iniString.each_line do |line|
				if(line~=/^\[\w+\]$/) {
					section =  line.replace(/[\[\]]//g)
				}
				if(section?) {
					config[section].merge( self.parseLine( line.gsub(/[#;].*$/,"") ) )
				} else {
					config.merge( self.parseLine( line.gsub(/[#;].*$/,"") ) )
				}
			end

			return config
		end
		
		protected def praseLine( line )
			Array splitted =  line.split(".",2);
			if(splitted[1]?) {
				return Hash( splitted[0], self.parseLine( splitted[1] ));
			}
			return line.gsub(/"/,"")
		def

		protected def generate( config )
			if(!config.is_array?) {
				return "=" + config + "\n";
			}
			
			retString : String
			#TODO add section support
			config.each do iter
				retString += self.generate(iter[1]).replace(/^/gm,iter[0]+".")
			end
			
			return retString
		end
		
	end
end