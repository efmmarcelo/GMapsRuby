require 'capybara/dsl'
require 'qat/logger'
require 'qat/configuration'
require 'qat/web/page'
require 'qat/web/finders'
require 'active_support/core_ext/hash/indifferent_access'

module GMapsTests
  module Web
    class Page < QAT::Web::Page
      include Capybara::DSL
      include QAT::Logger
      include QAT::Web::Finders

      action :navigate_gmaps!, returns: [GMapsTests::Web::Page] do
        visit URI::Generic.build(QAT.configuration[:hosts][:google_maps].symbolize_keys).to_s
        GMapsTests::Home.new
      end
    end
  end
end
