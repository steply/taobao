require 'digest/md5'
require 'net/http'
require 'open-uri'

module Taobao
  class Service
    DEBUG = false

    def initialize(method, options={})
      options = options.clone

      @params = {
        'app_key'   => Taobao.app_key,
        'method'    => method,
        'format'    =>'xml',
        'v'         =>'2.0',
        'timestamp' => Time.now.strftime("%Y-%m-%d %H:%M:%S")
      }

      @params.merge!(options)
      str = Taobao.app_secret + (@params.sort.collect { |c| "#{c[0]}#{c[1]}" }).join("")
      @params["sign"] = Digest::MD5.hexdigest(str).upcase!
    end

    def invoke
      res = Net::HTTP.post_form(URI.parse(Taobao.rest_endpoint), @params)
    end
  end
end
