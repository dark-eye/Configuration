require "./spec_helper"

describe Configuration do
	describe "setget[key]" do
		it "Set and get a value in an empty configuration" do
			config = Configuration::Configuration.new()
			config["test"] = 1
			config["test"].should eq 1
		end
	end
	
	describe "init test" do
		it "configuration can be initlaized" do
			conf = Configuration::Configuration.new({"test" => 1});
			conf["test"].should eq 1
		end
	end
	
	describe "dot seperated get test" do
		it "nested configuration can be initlaized and accesed by  dot seperated keys" do
			conf = Configuration::Configuration.new({1 => 1,"test_key" => {"nested" => 1}})
			conf["test_key.nested"].should eq 1
		end
	end
	
	describe "dot seperated set test" do
		it "nested configuration can be set by  dot seperated keys" do
			conf = Configuration::Configuration.new({1 => 1,"test_key" => {"nested" => 1}})
			conf["test_key.nested2"] = 2
			conf["test_key.nested2"].should eq 2
		end
	end
	
	
	describe "json load test" do
		it "can load json file as configuration" do
			conf = Configuration::FileConfiguration.new("./spec/data/json_test.json", Configuration::JsonConfiguration.new);
			conf.load()
		
			conf["test.nested"].should eq 1
		end
	end

#   it "works" do
#    config = Configuration::Configuration.new()
#    config.should neq Nil
#   end
end
