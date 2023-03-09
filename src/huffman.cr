# Huffman Tree generator
# @faustinoaq

class Huffman

  VERSION = "0.1.0"

  # Use default ASCII table
  def initialize
    calculate((' '..'z').to_a.join)
  end

  # Use phrase or letter to calculate hash map
  def initialize(text : String)
    calculate(text)
  end

  class Element
    property ch = [] of Element
    getter sym : Char, fr : Float64

    def initialize(@sym, @fr)
    end

    def +(e : Element)
      fr = @fr + e.@fr
      Element.new('*', fr)
    end
  end

  def huffman(elements)
    while elements.size > 2
      elements.sort_by! { |e| e.@fr }
      first = elements[0]
      second = elements[1]
      aux = first + second
      child = aux.ch
      child.push(first)
      child.push(second)
      2.times { elements.shift }
      elements.unshift(aux)
    end
    elements
  end

  @bin  = [] of Int32
  @code = {} of Char => String

  private def parse(tree : Array(Element))
    tree.each_with_index do |e, i|
      @bin << i
      if e.ch.empty?
        @code[e.sym] = @bin.join
        @bin.pop
      else
        parse(e.ch)
      end
    end
    @bin.pop unless @bin.empty?
  end

  # text = %(Premature optimization is the root of all evil.)
  # chars = {} of Char => Float64

  def count_chars(text, chars)
    text.each_char do |c|
      if chars[c]?
        chars[c] += 1_f64
      else
        chars[c] = 1_f64
      end
    end
    chars
  end

  # chars = count_chars(text, chars)
  # total = chars.values.sum
  # chars.each do |k, v|
  #  chars[k] = v/total
  # end

  record Par, k : Char, v : Float64

  def print_frequency(chars)
    chars.map do |k, v|
      Par.new(k, v)
    end.sort_by do |e|
      e.v
    end.each do |e|
      p [e.k, e.v]
    end
  end

  # print_frequency(chars)

  # elements = [] of Element
  # chars.each do |k, v|
  #  elements << Element.new(k, v)
  # end
  # tree = huffman(elements)
  # parse(tree)
  # pp @code#

  # Uses Huffman methods to encode Tree
  def calculate(text)
    chars = {} of Char => Float64
    chars = count_chars(text, chars)
    total = chars.values.sum
    chars.each do |k, v|
      chars[k] = v/total
    end

    elements = [] of Element
    chars.each do |k, v|
      elements << Element.new(k, v)
    end
    tree = huffman(elements)
    parse(tree)
  end

  def encode(text)
    encoded = ""
    text.each_char do |c|
      encoded += @code[c]
    end
    # pp encoded
    encoded
  end

  def decode(encoded)
    bincode = @code.invert
    limit = bincode.keys.map(&.size).max
    part = decoded = ""
    encoded.each_char do |c|
      part += c
      if bincode[part]?
        decoded += bincode[part]
        part = ""
      elsif part.size > limit
        raise "Invalid part of @code"
      end
    end
    # #pp decoded
    decoded
  end
end
