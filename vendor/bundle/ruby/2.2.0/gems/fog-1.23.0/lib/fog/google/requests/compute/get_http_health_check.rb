module Fog
  module Compute
    class Google
      class Mock
        def get_http_health_check(name)
          Fog::Mock.not_implemented
        end
      end

      class Real
        def get_http_health_check(name)
          api_method = @compute.http_health_checks.get
          parameters = {
            'project' => @project,
            'httpHealthCheck' => name
          }

          result = self.build_result(api_method, parameters)
          response = self.build_response(result)
        end
      end
    end
  end
end
