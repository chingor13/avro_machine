Bundler.require

class Client
  PROTOCOL = Avro::Protocol.parse(File.read(File.expand_path("../example.avpr", __FILE__)))

  attr_reader :server, :port

  def initialize(server, port)
    @server = server
    @port = port
  end

  def message1
    requestor.request('message1', {})
  end

  def hello_world(name)
    requestor.request('hello_world', {
      "name" => name
    })
  end

  def requestor
    sock = TCPSocket.new(server, port)
    client = Avro::IPC::SocketTransport.new(sock)
    @requestor = Avro::IPC::Requestor.new(PROTOCOL, client)
  end

end

require 'pp'
client = Client.new('localhost', 9090)
pp client.message1
pp client.hello_world('Jeff')
