-- Creates a function that memoizes the result of a giving function
-- @param fn {function}
-- @param resolver_cache {function}
-- @return {function}

function memo(fn, resolver_cache)
  local cache = {}

  return function(...)
    local args = {...}
    local key = args[1]

    if resolver_cache then
      key = resolver_cache(...)
    end

    if not cache[key] then
      cache[key] = fn(...)
    end

    return cache[key]
  end
end

return memo
