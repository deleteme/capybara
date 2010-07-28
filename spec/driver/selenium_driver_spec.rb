require File.expand_path('../spec_helper', File.dirname(__FILE__))

describe Capybara::Driver::Selenium do
  context "driver specs" do
    before do
      @driver = Capybara::Driver::Selenium.new(TestApp)
    end

    it_should_behave_like "driver"
    it_should_behave_like "driver with javascript support"
    it_should_behave_like "driver with frame support"
    it_should_behave_like "driver without status code support"
    it_should_behave_like "driver with cookies support"
  end

  context "switching browser" do
    before(:each) do
      selenium.driver.quit
    end

    let(:selenium) { Capybara::Driver::Selenium }

    it "defaults to :firefox" do
      selenium.driver.bridge.capabilities.browser_name.should == 'firefox'
    end

    context "when we specify chrome" do
      before do
        selenium.instance_variable_set(:@driver, nil)
        Capybara.selenium_browser = :chrome
      end

      it "the browser is chrome" do
        selenium.driver.bridge.capabilities.browser_name.should == 'chrome'
      end
    end
  end
end
