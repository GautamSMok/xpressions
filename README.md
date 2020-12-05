# xpressions
## examples:
```
 local x = require("x") -- this includes xpressions

  local v = {2,4,6,18,18,10,12,24,10,48,456}
  local w = {1,2,2,10,12,4,34}

  local result = x.union(v,w)
  x.print(result) -- prints result horizontally

  local r = x.range(1,10) -- generates 10 integers , another version x.range(1,10,2) this generated list of integers incremental of 2
  x.print(x.map(r,function(p) return p*2 end))

  local result = x.replicate(21,30)
  x.print(result)

  local l =x.sample(x.range(1,100),10)

  local r = x.intersperse(l,0)
  x.print(l)
  local r = x.reverse(l)
  x.print(r)
  x.print(x.reverse(x.sort(r)))
  x.print("mean:"..x.mean({1,22,34,53}))

  local r = x.sample(x.range(1,100),10)
  x.foreach(r,x.print)
  print("head:")
  local h = x.head(r)
  x.foreach(h,print)
  print("tail:")
  local t = x.tail(r)
  x.foreach(t,print)
  x.foreach(x.last(r),print)
```
