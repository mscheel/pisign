#!/usr/bin/ruby

require 'rubygems'
require 'betabrite'
require 'usb'

# BetaBrite Examples

## Allocate Memory

  bb = BetaBrite::Usb.new('/dev/ttyUSB0') do |sign|
    sign.allocate do |memory|
      memory.text('A', 4096)
      memory.string('0', 64)
      memory.dots('1', 7, 7)
    end
  end
  bb.write_memory!

## Reset the sign

  BetaBrite::Usb.new('/dev/ttyUSB0').clear_memory!
  
## Write a text file

  bb = BetaBrite::Usb.new('/dev/ttyUSB0') do |sign|
    sign.textfile do
      print left_arrow + string("Hello ").green
      print string(" world.").green + sail_boat
    end
  end
  bb.write!