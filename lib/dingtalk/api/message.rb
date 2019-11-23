module Dingtalk
  module Api
    module Message
      def async_send_message(user_id, msg)
        body = {
          agent_id: Dingtalk.config.agentid,
          userid_list: user_id,
          msg: msg
        }
        response = self.class.post("/topapi/message/corpconversation/asyncsend_v2", body: body.to_json, headers: { "Content-Type": "application/json" })
        response.parsed_response
      end
    end
  end
end
