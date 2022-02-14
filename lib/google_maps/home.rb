require_relative '../web/page'

module GMapsTests
  class Home < GMapsTests::Web::Page
    include QAT::Logger

    elements_config QAT.configuration.dig(:web, :google_maps, :home)

    web_elements :accept_cookies_btn, :search_location_input, :search_location_btn, :directions_btn, :search_result_title, :destinationField1

    def initialize
      accept_cookies
      log.info "Loaded page URL: #{current_url}"
      raise PageNotLoaded.new 'GMaps home page did not load' unless has_selector? *selector_search_location_input
      log.debug 'Opened GMaps'
    end

    def accept_cookies
      accept_cookies_btn.click if has_selector? *selector_accept_cookies_btn
    end

    def search_location(location)
      search_location_input.set(location)
      search_location_btn.click

      elem_search_result_title = find(*extract_selector(config_search_result_title, location))

      [elem_search_result_title.visible?, elem_search_result_title[:class]]
    end

    def location_visible?(location)
      directions_btn.click

      elem_search_result_title = find(*extract_selector(config_destinationField1, location))
      elem_search_result_title.visible?
    end

    private

    class HomePageNotLoaded < QAT::Web::Error
    end
  end
end
