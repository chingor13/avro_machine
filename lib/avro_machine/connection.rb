require 'eventmachine'
require 'em-synchrony'

module AvroMachine
  class Connection < EventMachine::Connection

    def self.responder
      raise NotImplemented, "need to implement a reponder class"
    end

    def initialize(*args)
      @input = ""
      super
    end

    # buffer data - we can receive incomplete request over the tcp port
    def receive_data(data)
      puts "receiving data"
      @input << data

      # an avro request is terminated by a 0 byte
      return unless @input[-4..-1].unpack('N')[0] == 0

      handle_avro(@input)
    end

    def handle_avro(input)
      reader = Avro::IPC::FramedReader.new(StringIO.new(input))
      str = reader.read_framed_message

      # handle the request
      EM.synchrony do
        responder = self.class.responder.new
        resp = responder.respond(str)

        # format the response
        writer = Avro::IPC::FramedWriter.new(StringIO.new(""))
        writer.write_framed_message(resp)
        send_data(writer.to_s)
      end
    end
  end
end