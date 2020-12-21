function memoize(fn)
  local cache = {}

  return function(...)
    local args = {...}
    local key = args[1]

    if not cache[key] then
      cache[key] = fn(key)
    end

    return cache[key]
  end
end

return memoize
