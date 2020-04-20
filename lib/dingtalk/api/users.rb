module Dingtalk
  module Api
    module Users
      def get_user_info(code)
        response = self.class.get('/user/getuserinfo', query: { code: code })
        response.parsed_response
      end

      def get_user_profile(userid)
        response = self.class.get('/user/get', query: { userid: userid })
        response.parsed_response
      end

      def get_by_mobile(mobile)
        response = self.class.get('/user/get_by_mobile', query: { mobile: mobile })
        response.parsed_response
      end
    end
  end
end
