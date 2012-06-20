# -*- encoding : utf-8 -*-
module Taobao
  module Rails
    module Controller

      def self.included(base)
        base.extend(ClassMethods)
      end

      def taobao_session
        session[:taobao_session]
      end

      def set_taobao_session
        if params[:top_session]
          session[:taobao_session] = Taobao::Session.new params
        end
      end

      def taobao_auth_url
        Taobao.auth_url + Taobao.app_key
      end

      def taobao_auth_link(name)
        link_to name, taobao_auth_url
      end

      module ClassMethods
        def acts_as_taobao_controller(options = {})
          before_filter :set_taobao_session, options
        end
      end
    end
  end
end

