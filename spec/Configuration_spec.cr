require "./spec_helper"

describe Configuration do
	describe "setget[key]" do
		it "Set and get a value in the configuration" do
			config = Configuration.new()
			config[test] = 1
			config[test].should eq 1
		end
	end
	
	describe "init_test" do
		it "configuration can be initlaized" do
			conf = Configuration.new([1,"2",3]);
			conf.config.should eq [1,"2",3]
		end
	end
	
	describe "dot_seperated_test" do
		it "nested configuration can be initlaized and accesed by  dot seperated keys" do
			conf = Configuration.new({1 => 1,"test_key" => {"nested" => [1,2]}})
			conf.config["test_key.nested.1"].should eq 2
		end
	end

  it "works" do
    false.should eq(true)
  end
end
