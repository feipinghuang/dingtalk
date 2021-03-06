require 'dingtalk/api/users'
require 'dingtalk/api/process_instance'
require 'dingtalk/api/call_back'
require 'dingtalk/api/message'

module Dingtalk
  class Client
    include HTTParty
    include Dingtalk::Api::Users
    include Dingtalk::Api::ProcessInstance
    include Dingtalk::Api::CallBack
    include Dingtalk::Api::Message

    format :json

    def initialize
      self.class.base_uri(Dingtalk.config.uri)
      self.class.default_options.merge!(default_params: { access_token: AccessToken.new.token })
    end
  end
end
