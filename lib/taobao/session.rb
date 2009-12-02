require 'digest/md5'

module Taobao
  class Session
    attr_accessor :session_key

    def initialize(params)
      str = params['top_appkey'] + params["top_parameters"] + params["top_session"] + ENV['TAOBAO_APP_SECRET']
      md5 = Digest::MD5.digest(str)
      sign = Base64.encode64(md5).strip

      puts "### #{sign} ### --- ### #{params['top_sign']} ###"

      if sign == params['top_sign']
        self.session_key = params['top_session']
      else
        throw InvalidSignature.new
      end
    end

    class InvalidSignature < Exception
    end
  end
end