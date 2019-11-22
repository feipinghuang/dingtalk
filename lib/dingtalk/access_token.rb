module Dingtalk
  class AccessToken
    include HTTParty

    def initialize
      self.class.base_uri(Dingtalk.config.uri)
      @options = {
        query: {
          appkey: Dingtalk.config.appkey,
          appsecret: Dingtalk.config.appsecret
        }
      }
    end

    def token
      Redis.current.get(:dingtalk_access_token) || refresh
    end

    # 【注意】正常情况下access_token有效期为7200秒，有效期内重复获取返回相同结果，并自动续期。
    def refresh
      response = self.class.get('/gettoken', @options)
      Redis.current.setex(:dingtalk_access_token, 7200 - 5, response['access_token'])
      response['access_token']
    end
  end
end
