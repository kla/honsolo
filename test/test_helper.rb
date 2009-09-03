require 'active_support'
require 'active_support/test_case'
require 'shoulda'
require File.dirname(__FILE__) + '/../lib/honsolo'

class ActiveSupport::TestCase
end

class Net::HTTP
  class << self
    alias_method :post_form_without_cache, :post_form

    def post_form(url, params)
      @cache ||= {}
      key = {:url => url, :params => params}
      return @cache[key] if @cache.has_key?(key)

      @cache[key] = post_form_without_cache(url,params)
    end
  end
end
