module Dingtalk
  module Api
    module CallBack
      def register_call_back(url, call_back_tag)
        body = {
          call_back_tag: call_back_tag,
          aes_key: Dingtalk.config.encoding_aes_key,
          token: Dingtalk.config.token,
          url: url
        }
        response = self.class.post("/call_back/register_call_back", body: body.to_json, headers: { "Content-Type": "application/json" })
        response.parsed_response
      end

      def delete_call_back
        response = self.class.get("/call_back/delete_call_back")
        response.parsed_response
      end

      def get_call_back
        response = self.class.get("/call_back/get_call_back")
        response.parsed_response
      end

      def get_call_back_failed_result
        response = self.class.get("/call_back/get_call_back_failed_result")
        response.parsed_response
      end
    end
  end
end
