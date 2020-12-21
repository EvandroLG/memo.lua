# memoize.lua &middot; [![Build Status](https://travis-ci.org/EvandroLG/memoize.lua.svg?branch=master)](https://travis-ci.org/EvandroLG/memoize.lua) [![license](https://badgen.now.sh/badge/license/MIT)](./LICENSE)
An implementation of the `memoize` technique in Lua.

> In computing, memoization is an optimization technique used primarily to speed up computer programs by storing the results of expensive function calls and returning the cached result when the same inputs occur again. -- Wikipedia

## Installation
To install `memoize`, run:

```sh
$ luarocks install memoize
```

## Usage
```lua
local memoize = require('memoize')

local sum_by_one = memoize(function(value)
  return value + 1
end))

sum_by_one(10)
sum_by_one(10) -- Cache hit!

sum_by_one(20)
sum_by_one(20) -- Cache hit!
```

### Custom cache
By default, it only uses the first parameter as the cache key, but it's possible to pass a custom cache be used such as the example bellow.

```lua
local memoize = require('memoize')
local sum = memoize(function(a, b)
  return a + b
end, function(a, b)
  return a .. '-' .. b
end)

sum(10, 10)
sum(10, 20)
sum(10, 20) -- Cache hit!
```

## License
[MIT](./LICENSE)
