# Ease64 (alpha). Base64 for humans

Ease64 is a [Base64](https://en.wikipedia.org/wiki/Base64 "Base64 in the English Wikipedia") alternative that can be encoded/decoded by hand. This means: no error-prone math operations like addition (uuencode) and no arbitrary look-up tables. All that's needed is a regular ASCII-octal table for both encoding and decoding.

Look at the code or wait until I finish writing this README.

## Encoding by hand

Let's encode the word "`Man`". First, get yourself an *ASCII table* with octals in it. [It's not that difficult](http://lmgtfy.com/?t=i&q=ASCII+table+with+octal "Let me google it for you").

Then, look up every character and write down their octal values:

  + `M` → 115<sub>(8)</sub>
  + `a` → 141<sub>(8)</sub>
  + `n` → 156<sub>(8)</sub>

Put every digit ([octet](https://en.wikipedia.org/wiki/Octet_(computing), actually) together:

`115141156`


Now separate the octets in groups of two, add one zero at the end if needed:

`11  51  41  15  60`

Then, go back to the same ASCII table and look up your two octets between the characters. As you see, most values are three octets long. The key here is to ignore the third octect from the right. With some values, you will have more than one character to choose. That's fine.


| Octal  | Character              | Other option         |
|:------:|:-----------------------|:---------------------|
| 11     | → `I` 111<sub>(8)</sub>  |
| 51     | → `i` 151<sub>(8)</sub>  | → `)` 051<sub>(8)</sub>|
| 41     | → `a` 141<sub>(8)</sub>  | → `!` 041<sub>(8)</sub>|
| 15     | → `M` 115<sub>(8)</sub>  |
| 60     | → `p` 160<sub>(8)</sub>  | → `0` 060<sub>(8)</sub> |


Finally, put every character together into a string. Every one of the next eight results are 100% **ease64** valid and decode back to "`Man`". Use whichever you prefer:

| `IiaMp`  | `IiaM0`  |
|:--------:|:--------:|
| `I)aMp`  | `I)aM0`  |
| `Ii!Mp`  | `Ii!M0`  |
| `I)!Mp`  | `I)!M0`  |

## Example

`Hello World!` may be encoded into any of the following:

  a. ``IAeMalMx`JyoNQlL`a`` (backtick)  
  b. `IAeMalMx JyoNQlL a` (space)  
  c. `IAeMalMxàJyoNQlLàa` (*agrave*)  

All three examples decode back to `Hello World!`. Why?

Unlike Base64, for any value that you want to encode, you can choose between different characters as long as they follow this rule: its octal value must share the two last digits.

## Usage

Download `ease64.rb` in the same directory of your project.

```ruby
require_relative 'ease64'

enc = Ease64.encode64 'Hello World!'
# => "IAeMalMx`JyoNQlL`a"
plain = Ease64.decode64 enc
# => "Hello World!"

```

To play in the console with interactive Ruby:
```shell
$ irb -r './ease.rb'
2.3.0 :001 > Ease64.encode64 'Hello World!'
# => "IAeMalMx`JyoNQlL`a"
```


<!-- ## Motivation -->


## Current Version
v0.0.1 alpha

## TODO:
- Add  *Usage* to this Readme.
- Explain *motivation* in this Readme.
- Explain how to encode/decode Ease64 by hand.
- Write down some ideas where Ease64 can be used.
