module Dingtalk
  module Api
    module ProcessInstance
      def process_instance_create(user_id:, dept_id:, form_component_values:)
        body = {
          agent_id: Dingtalk.config.agentid,
          process_code: Dingtalk.config.process_code,
          originator_user_id: user_id,
          dept_id: dept_id,
          form_component_values: form_component_values
        }
        response = self.class.post('/topapi/processinstance/create', body: body.to_json, headers: { "Content-Type": "application/json" })
        response.parsed_response
      end
    end
  end
end
