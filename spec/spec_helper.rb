require "capybara"
require "capybara/rspec"
require "selenium-webdriver"

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
  config.include Capybara::DSL

  config.before(:example) do
    page.current_window.resize_to(1280, 800)
  end

  config.after(:example) do |e|
    nome = e.description.gsub(/[^A-Za-z0-9 ]/, '').tr(' ', '_')
    page.save_screenshot('log/' + nome + '.png') if e.exception
end
end

Capybara.register_driver :selenium_chrome do |app|
  chrome_options = Selenium::WebDriver::Chrome::Options.new.tap do |opts|
    opts.add_argument "--disable-gpu"
    opts.add_argument "--no-sandbox"
    opts.add_argument "--disable-site-isolation-trials"
    opts.add_argument "--disable-dev-shm-usage"
  end
  Capybara::Selenium::Driver.new(app, browser: :chrome, options: chrome_options)
end

Capybara.configure do |config|
  config.default_driver = :selenium_chrome
  config.default_max_wait_time = 5
  config.app_host = 'https://training-wheels-protocol.herokuapp.com/'
end