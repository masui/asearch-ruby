# -*- coding: utf-8 -*-
#
# Created by Toshiyuki Masui on 11/04/16.
# Copyright 2011 Pitecan Systems. All rights reserved.
#
#   a = Asearch.new('abcde')
#   a.match('abcde') => true
#   a.match('abXcde',1) => true
#
#   a = Asearch.new('abcde')
#   initstate = a.initstate
#   laststate = a.state(initstate,'abcde')
#   laststate[0] & a.acceptpat => non-zero value
#

$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

class Asearch
  VERSION = '0.0.1'

  INITPAT = 0x80000000
  MAXCHAR = 0x100

  def isupper(c)
    c >= 0x41 && c <= 0x5a
  end

  def islower(c)
    c >= 0x61 && c <= 0x7a
  end

  def tolower(c)
    isupper(c) ? c + 0x20 : c
  end

  def toupper(c)
    islower(c) ? c - 0x20 : c
  end

  def initialize(pat)
    @shiftpat = []
    @epsilon = 0
    @acceptpat = 0
    mask = INITPAT
    (0...MAXCHAR).each { |c|
      @shiftpat[c] = 0
    }
    chars = pat.unpack("C*")
    chars.each { |c|
      if c == 0x20 then
        @epsilon |= mask
      else
        @shiftpat[c] |= mask
        @shiftpat[toupper(c)] |= mask
        @shiftpat[tolower(c)] |= mask
        mask >>= 1
      end
    }
    @acceptpat = mask
  end

  attr_reader :acceptpat

#  def bin(val)
#    s = "0"*40 + sprintf("%b",val)
#    s[-32,100]
#  end

  #
  # 状態stateからテキストstrを認識したときの状態変化
  #
  def state(state=nil,str='')
    if state.nil? then
      state = initstate
    end
    i0 = state[0]
    i1 = state[1]
    i2 = state[2]
    i3 = state[3]
    chars = str.unpack("C*")
    chars.each { |c|
      mask = @shiftpat[c]
      i3 = (i3 & @epsilon) | ((i3 & mask) >> 1) | (i2 >> 1) | i2
      i2 = (i2 & @epsilon) | ((i2 & mask) >> 1) | (i1 >> 1) | i1
      i1 = (i1 & @epsilon) | ((i1 & mask) >> 1) | (i0 >> 1) | i0
      i0 = (i0 & @epsilon) | ((i0 & mask) >> 1)
      i1 |= (i0 >> 1)
      i2 |= (i1 >> 1)
      i3 |= (i2 >> 1)
    }
    [i0, i1, i2, i3]
  end

  def initstate
    [INITPAT, 0, 0, 0]
  end

  def match(str, ambig=0)
    s = state(initstate,str)
    s[ambig] & acceptpat != 0
  end
end


