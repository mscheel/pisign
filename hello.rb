#!/usr/bin/env ruby

require 'rubygems'
require 'betabrite'
require 'usb'

bb=BetaBrite::USB.new do |sign|

 sign.stringfile('0') do
   print string("Hello").green
 end

 sign.textfile do
   flash
   print stringfile('0')
   print string(" Blue").rgb('0000FF')
 end
end

bb.write!