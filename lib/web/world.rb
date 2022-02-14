require_relative 'page_manager'
require_relative '../google_maps'
require 'qat/web'
require 'selenium-webdriver'

require_relative 'remote_driver'

QAT::Web::Browser::AutoLoad.load_browsers!
QAT::Web::Screen::AutoLoad.load_screens!

module GMapsTests
  module Web
    module World
      def browser
        unless @browser
        QAT::Web::Browser::Factory.for :custom_chrome
          @browser = GMapsTests::Web::PageManager.new
        end
        @browser
      end
    end
  end
end
