# huffman

An implementation of Huffman algorithm in Crystal for learning purposes (using 0 and 1 in a String array).

To compress real files a new implementation using [BitArray](https://crystal-lang.org/api/latest/BitArray.html) should be required.

A real usecase of Huffman coding is [Zstandard](https://github.com/facebook/zstd) and [Huff0](https://github.com/Cyan4973/FiniteStateEntropy) used in kernel compresion

Huffman code is a particular type of optimal prefix code that is commonly used for lossless data compression.

## Installation

1. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     huffman:
       github: faustinoaq/huffman
   ```

2. Run `shards install`

## Usage

```crystal
require "huffman"

h = Huffman.new # Using ASCII table

p h.encode("Hello World") # => 1111100111011011001001100100110001000111001010010110001011010001100100111010

h = Huffman.new("Hello World") # Using "Hello World"

p h.encode("Hello World") # => 01000101000001111011101110000101

p h.decode("01000101000001111011101110000101") # => Hello World

```

## Development

See [Crystal Official Site](https://crystal-lang.org/install/)

```
$ crystal spec
......

Finished in 3.1 milliseconds
6 examples, 0 failures, 0 errors, 0 pending
```

## Contributing

1. Fork it (<https://github.com/faustinoaq/huffman/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Faustino Aguilar](https://github.com/faustinoaq) - creator and maintainer
