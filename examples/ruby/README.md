# Ruby Example: NAMM Standards Protocols

$ bundle install
$ protoc -I../../protos --ruby_out ./lib ../../protos/*.proto
$ ruby src/namm_po.rb
