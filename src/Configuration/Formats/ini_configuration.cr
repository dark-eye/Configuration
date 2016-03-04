
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
			iniString.each_line do |line|
				config.merge( self.parseLine( line.gsub(/[#;].*$/,"") ) )
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
		end
		
	end
end