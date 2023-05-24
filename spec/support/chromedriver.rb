require 'selenium/webdriver'

Capybara.app_host = 'http://localhost:3010' # wybieramy port na którym capybara będzie uruchamiała przeglądarkę
Capybara.server_host = 'localhost'
Capybara.server_port = '3010' # wybieramy port

Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end

Capybara.register_driver :headless_chrome do |app|
  opts = Selenium::WebDriver::Chrome::Options.new

  chrome_args = %w[--headless --window-size=1920,1080 --no-sandbox --disable-dev-shm-usage]
  chrome_args.each { |arg| opts.add_argument(arg) }
  Capybara::Selenium::Driver.new(app, browser: :chrome, options: opts)
end

Capybara.configure do |config|
  driver = ENV['HEADLESS_CHROME'] ? :headless_chrome : :chrome

  config.javascript_driver = driver
  config.default_driver = driver
end
