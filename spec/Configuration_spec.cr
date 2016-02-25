require "./spec_helper"

describe Configuration do
	describe "setget[key]" do
		it "Set and get a value in the configuration" do
			config = Configuration.new()
			config[test] = 1
			config[test]  should eq 1
		end
	end
	
	describe "init_test" do
		it "configuration can be initlaized" do
			conf = Configuration.new([1,"2",3]);
			conf.config  should eq [1,"2",3]
		end
	end

  it "works" do
    false.should eq(true)
  end
end
