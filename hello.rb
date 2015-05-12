#!/usr/bin/env ruby

require 'rubygems'
require 'betabrite'
require 'serialport'

bb=BetaBrite::Serial.new('/dev/ttyUSB0') do |sign|

  bb = BetaBrite::Serial.new('/dev/ttyUSB0') do |sign|
    sign.allocate do |memory|
      memory.text('A', 4096)
      memory.string('0', 64)
      memory.dots('1', 7, 7)
    end
  end
  bb.write_memory!

  puts "memmory allocated"

  BetaBrite::Serial.new('/dev/ttyUSB0').clear_memory!

  puts "sign reset"

bb = BetaBrite::Serial.new('/dev/ttyUSB0') do |sign|
    sign.textfile do
      print left_arrow + string("Hello ").green
      print string(" world.").green + sail_boat
    end
  end
  bb.write!

  puts "written"
end

bb.write!