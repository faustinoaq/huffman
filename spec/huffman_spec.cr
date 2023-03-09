require "./spec_helper"

describe Huffman do
  # TODO: Write tests

  it "Using text to generate Huffman map" do
    text = %(Premature optimization is the root of all evil.)
    h = Huffman.new(text)
    h.decode(h.encode(text)).should eq(text)
  end

  it "Encode letter A using default map based on ASCII table" do
    h = Huffman.new
    h.encode("A").should eq("100111")
  end

  it "Encode Hello World using default map based on ASCII table" do
    h = Huffman.new("Hello World")
    h.encode("Hello World").should eq("01000101000001111011101110000101")
  end

  it "Decode Hello World using default map based on ASCII table" do
    h = Huffman.new
    h.decode(h.encode("Hello World")).should eq("Hello World")
  end

  it "Decode A using vowels to calculate Huffman map" do
    h = Huffman.new("AEIOU")
    h.decode("100").should eq("A")
  end

  it "Decode Hello World" do
    hello = %(Hello World)
    h = Huffman.new(hello)
    h.decode(h.encode(hello)).should eq(hello)
  end

end
