module AvroMachine
  class Responder < Avro::IPC::Responder
    def self.protocol
      raise NotImplemented, "need to implement a protocol method"
    end

    def initialize
      super(self.class.protocol)
    end

    def call(message, request)
      send(message.name, request)
    end
  end
end