require 'httparty'
require 'redis'
require 'dingtalk/version'
require 'dingtalk/pkcs7_encoder'
require 'dingtalk/prpcrypt'

module Dingtalk
  class Error < StandardError; end

  module_function

  def config
    @config ||= begin
      require 'dingtalk/config'
      Config.new
    end
  end

  def decrypt(echo_str)
    content = Prpcrypt.decrypt(aes_key, echo_str, config.corpid)
    JSON.parse(content)
  end

  def response_json(return_str)
    the_timestamp = timestamp
    the_nonce = nonce
    encrypted = encrypt(return_str)
    {
      msg_signature: signature(encrypted, the_timestamp, the_nonce),
      encrypt: encrypted,
      timeStamp: the_timestamp,
      nonce: the_nonce
    }
  end

  def encrypt(return_str)
    Prpcrypt.encrypt(aes_key, return_str, config.corpid)
  end

  def signature(encrypted, the_timestamp, the_nonce)
    sort_params = [config.token, the_timestamp, the_nonce, encrypted].sort.join
    Digest::SHA1.hexdigest(sort_params)
  end

  def aes_key
    Base64.decode64(config.encoding_aes_key + '=')
  end

  def timestamp
    Time.now.to_i.to_s
  end

  def nonce
    SecureRandom.hex(4)
  end
end

require 'dingtalk/client'
require 'dingtalk/access_token'
