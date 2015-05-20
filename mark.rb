require 'rubygems'
require 'serialport'
require 'betabrite'

bb = BetaBrite::Serial.new('/dev/ttyUSB0') do |sign|
  sign.allocate do |memory|
    memory.text('A', 4096)
    memory.string('0', 64) 
    memory.dots('1', 7, 7)
  end
end
bb.write_memory!

BetaBrite::Serial.new('/dev/ttyUSB0').clear_memory!

bb = BetaBrite::Serial.new('/dev/ttyUSB0') do |sign|
  sign.textfile do
    print left_arrow + string("Hellow ").green
  end
end
bb.write!


