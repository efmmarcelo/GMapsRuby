require 'capybara'
require 'qat/configuration'
require 'selenium-webdriver'
require 'active_support/core_ext/hash/compact'
require 'retriable'
require 'qat/logger'

log            = Log4r::Logger.new "Capybara.register_driver"
log.outputters = Log4r::Outputter[QAT::Logger::DEFAULT_OUTPUTTER_NAME]

Capybara.register_driver :custom_chrome do |app|
  loaded_driver = Capybara::Selenium::Driver.new(app, browser: :chrome)

  get_screen_factory 'screen_1080p'

  loaded_driver.browser
  loaded_driver.maximize_window(loaded_driver.current_window_handle)
  loaded_driver
end


def get_screen_factory(size)
  screen = QAT::Web::Screen::Factory.for size
  if screen.xvfb
    if ENV['QAT_WEB_VIDEO_MODE'] and ['always', 'success', 'failure'].include? ENV['QAT_WEB_VIDEO_MODE']
      screen.start_video_capture
    end
  end
end
