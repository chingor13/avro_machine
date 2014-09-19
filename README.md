# AvroMachine

Easily create a server that accepts Avro messages

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'avro_machine'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install avro_machine

## Usage

Create a responder class that inherits from `Avro::IPC::Responder`:

```
class MyResponder < AvroMachine::Responder
  def self.protocol
    # return an Avro::Protocol
  end

  # assume this protocol defines a message1 that returns a string
  def message1(request)
    "foo"
  end
  
  # assume this protocols defines a message2 that returns an array<int>
  def message2(request)
  	[1,2,3]
  end
end
```

Extend the `AvroMachine::Connection` class and define a `responder` class:

```
class MyConnection < AvroMachine::Connection
  def self.responder
  	MyResponder
  end
end
```

See the example in the example folder.

## Contributing

1. Fork it ( https://github.com/[my-github-username]/avro_machine/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
