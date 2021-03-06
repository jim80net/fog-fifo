module Fog
  module Compute
    class Fifo

      class Mock
        def stop_vm(uuid)
          if vm = self.data[:vms][uuid]
            res = Excon::Response.new
            res.status = 200
            res.body = vm
            res
          else
            raise Excon::Errors::NotFound, "Not Found"
          end
        end
      end

      class Real
        def stop_vm(id)
          request(
                  :method => "PUT",
                  :path => "vms/#{id}",
                  :expects => [200],
                  :body => {"action" => "stop"},
                  )
        end
      end
    end
  end
end
