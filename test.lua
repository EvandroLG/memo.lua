local test = require('simple_test')
local memoize = require('memoize')

--test('memoize with one parameter', function(a)
  --local count = 0
  --local memoized_fn = memoize(function(value)
    --count = count + 1
    --return value + 1
  --end)

  --memoized_fn(1)
  --memoized_fn(1)
  --memoized_fn(1)

  --a.equal(count, 1)
  --a.equal(memoized_fn(1), 2)
--end)

test('memoize with multiple parameters', function(a)
  local count = 0

  local resolver = function(value_a, value_b)
    return value_a .. value_b
  end

  local memoized_fn = memoize(function(value_a, value_b)
    count = count + 1
    return value_a + value_b
  end, resolver)

  memoized_fn(1, 10)
  memoized_fn(1, 10)
  memoized_fn(1, 10)

  a.equal(count, 1)
  a.equal(memoized_fn(1, 10), 11)
end)
