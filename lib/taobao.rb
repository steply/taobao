# -*- encoding : utf-8 -*-
$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

require "taobao/service"
require "taobao/parse"
require "taobao/models/error"
require "taobao/models/error_rsp"
require "taobao/models/simple_user_info"
require "taobao/models/app_subsc_control"
require "taobao/models/user"
require "taobao/models/location"
require "taobao/models/user_credit"
require "taobao/models/item_cat"
require "taobao/models/item_category"
require "taobao/models/item_prop"
require "taobao/models/item_search"
require "taobao/models/seller_cat"
require "taobao/models/prop_value"
require "taobao/models/item"
require "taobao/models/trade"
require "taobao/models/product"
require "taobao/models/product_prop_img"
require "taobao/models/product_img"
require "taobao/models/shop"
require "taobao/models/taobaoke_item"
require "taobao/rails/controller"

module Taobao
  mattr_accessor :app_key
  @@app_key = nil

  mattr_accessor :app_secret
  @@app_secret = nil

  mattr_accessor :rest_endpoint
  @@rest_endpoint = nil

  mattr_accessor :auth_url
  @@auth_url = nil

  def self.setup
    yield self
  end
end

ActionController::Base.send :include, Taobao::Rails::Controller
ActionController::Base.helper Taobao::Rails::Controller
