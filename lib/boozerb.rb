require 'httparty'

module Booze
  class Backend
    include HTTParty
    attr_accessor :backend
    format :json

    def initialize(backend)
      @backend = backend
      self.class.base_uri backend
    end

    def to_s
      'booze-backend:' + @backend
    end

    def indexes
      puts self.class.get('/indexes')
    end
  end

  class Document
    attr_accessor :path
  end

  class FileDocument < Document
  end

  class HtmlDocument < Document
  end
end


if __FILE__ == $0
  b = Booze::Backend.new "http://tigerstyle.singhsays.com"
  b.indexes
end
