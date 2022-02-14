require_relative 'page'
require_relative 'blank_page'
require 'qat/web/page_manager'

module GMapsTests::Web
  class PageManager < QAT::Web::PageManager
    manages GMapsTests::Web::Page
    initial_page GMapsTests::Web::BlankPage
  end
end
