local test = require('simple_test')
local memoize = require('memoize')

test('memoize with one parameter', function(a)
  local count = 0
  local memoized_fn = memoize(function(value)
    count = count + 1
    return value + 1
  end)

  memoized_fn(1)
  memoized_fn(1)
  memoized_fn(1)

  a.equal(count, 1)
end)
