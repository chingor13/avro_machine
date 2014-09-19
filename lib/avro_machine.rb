require "eventmachine"
require "avro"

module AvroMachine
  autoload :Connection, 'avro_machine/connection'
  autoload :Responder, 'avro_machine/responder'
end
