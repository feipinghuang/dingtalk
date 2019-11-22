require 'anyway'

module Dingtalk
  class Config < Anyway::Config
    attr_config :corpid,
                :agentid,
                :appkey,
                :appsecret,
                :uri,
                :encoding_aes_key,
                :token,
                :process_code,
                :callback_url,
                :call_back_tag
  end
end
