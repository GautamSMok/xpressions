local x = {}

function x.union(firstList,secondList)
    local result = {}
    for i=1,#firstList do
        local val = firstList[i]
        if(not(x.contains(result,val))) then
            result[#result+1] = val
        end
    end
    for i=1,#secondList do
        local val = secondList[i]
        if(not(x.contains(result,val))) then
            result[#result+1] = val
        end
    end
    return result
end

function x.replicate(el,times)
    local result = {}
    for i = 1, times do
        result[#result + 1] = el
    end
    return result
end

function x.print(item) 
    if(type(item)=="table") then
        for i,v in ipairs(item) do
            if (i~=#item) then
                io.write(tostring(v).." ")
            else
                io.write(tostring(v))
            end
            i = i + 1
        end
        io.write("\n")
    else
        io.write(tostring(item).."\n")
    end
end

function x.iprint(item) 
    if(type(item)=="table") then
        local i = 1
        for k,v in pairs(item) do
            if(k) then
                io.write(k.."=")
            end
            if (i~=#item) then
                io.write(tostring(v).." ")
            else
                io.write(tostring(v))
            end
            i = i + 1
        end
        io.write("\n")
    else
        io.write(tostring(item).."\n")
    end
end

function x.intersperse(list,el)
    local result={}
    for i,v in ipairs(list) do
        table.insert(result,v)
        if(i~=#list) then
            table.insert(result,el)
        end
    end
    return result
end

function x.reverse(lst)
    local result = {}
    for i = #lst,1,-1 do
        result[#result + 1] = lst[i]
    end
    return result
end


function x.sortr(tbl,key,d)
	local rowTables = {}
	for _,row in ipairs(tbl) do
		table.insert(rowTables,row)
	end
	table.sort(rowTables,function(t1,t2)
            if(d and d == true) then
                return t1[key] > t2[key]
            else
                return t1[key] < t2[key]
            end
            end
              )
	return rowTables
end

function x.splitAt(lst,n)
    local first = {}
    local second = {}
    
    for i = 1, #lst - n, 1 do
        table.insert(first,lst[i])
    end
    
    for i = n,#lst,1 do
        table.insert(second,lst[i])
    end
    
    return first,second
end

function x.length(lst)
    return #lst
end

function x.first(lst)
    return x.head(lst)
end

function x.init(lst)
    local result = {}
    for i = 1,(#lst)-1,1 do
        table.insert(result,lst[i])
    end
    return result
end

function x.last(lst)
    local result = {}
    table.insert(result,lst[#lst])
    return result
end

function x.head(lst)
    local result = {}
    table.insert(result,lst[1])
    return result
end

function x.tail(lst)
    local result = {}
    for i= 2,#lst do
        result[#result+1]=lst[i]
    end
    return result
end

function x.mean(lst)
    return x.average(lst)
end

function x.except(list,excpList)
	result = {}
	for _, v in ipairs(list) do
		if(not(x.contains(excpList,v))) then
			result[#result+1] = v
		end
	end
	return result
end

function x.slice(list,sp,ep)
	result = {}
	for i = sp,ep do
		result[#result + 1] = list[i]
	end
	return result
end


function x.distinct(lst)
	local result = {}
	for _,v in ipairs(lst) do
		if (not(x.find(result,v))) then
			result[#result+1]=v
		end
	end
	return result
end

function x.find(t,el)
	for i = 1, #t do
		if(t[i]==el) then
			return el
		end
	end
end

function x.findIndex(t,el)
	for i = 1, #t do
		if(t[i]==el) then
			return i
		end
	end
end


function x.contains(lst,el)
    local found = false
    for _,value in pairs(lst) do
        if(value==el) then
            found = true
            break
        end
    end
    return found
end

function makeCopy(lst)
	local result = {}
	for i=1,#lst do
		result[i]=lst[i]
	end
	return result
end

function x.add(lst,item)
	local copy = makeCopy(lst)
	table.insert(copy,item)
	return copy
end

function addRange(lst,items)
	local copy = makeCopy(lst)
	for _,item in ipairs(items) do
		table.insert(copy,item)
	end
	return copy
end

function x.sort(lst,cmp)
	local copy = makeCopy(lst)
    if(not(cmp)) then
	 table.sort(copy,cmp)
    else
     table.sort(copy)
    end
	return copy
end


function x.max(lst)
    return math.max(table.unpack(lst))
end

function x.min(lst)
    return math.min(table.unpack(lst))
end

function x.count(lst)
    return #lst
end

function x.average(lst)
	local total  = 0.0
	for i = 1, #lst,1.0 do
		total = total + lst[i]
	end
	return total/#lst
end


function x.odds(lst)
    local result = x.filter(lst,function(e) return e % 2 == 1 end)
    return result
end

function x.evens(lst)
    local result = x.filter(lst,function(e) return e % 2 == 0 end)
    return result
end

function x.sum(lst)
    local total = 0
    for i=1,#lst do
        total = total + lst[i]
    end
    return total
end

function x.product(lst)
    local prod = 1
    for i = 1, #lst do
        prod = prod * lst[i]
    end
    return prod
end

function x.sample(list,len)
    local result = {}
    math.randomseed(os.time())
    for i = 1,len do
        local rn = math.random(1,#list)
        result[i] = list[rn]
    end
    return result
end

function x.all(lst,f)
	local result = false
	for _,v in ipairs(lst) do
     if(f(v)) then
         result = true
     else
         result = false
         break
     end
   end
   return result
end

function x.skip(len,lst)
    local result = {}
    local startIndex = len+1
    local index = 1
    for i = startIndex,#lst do
        result[index] = lst[i]
        index = index + 1
    end
    return result
end

function x.skipWhile(lst,skipCondition)
    local result = {}
    local skipPointFound = false
    local index = 1
    for i = 1,#lst do
        local t = lst[i]
        if(not(skipPointFound) and not(skipCondition(t))) then
            skipPointFound = true
        end
        
        if(skipPointFound==true) then
         result[index]=t
         index = index + 1
        end
    end
    return result
end

function x.takeWhile(lst,whileCondition)
    local result = {}
    for i = 1,#lst do
        local t = lst[i]
        if(not(whileCondition(t))) then
            break
        end
        result[i]=t
    end
    return result
end


function x.take(len,lst)
    local result = {}
    for i = 1,len do
        result[i]=lst[i]
    end
    return result
end

function x.range(start,ending,incr)
    if(not(incr)) then
        incr=1
    end
	local result = {}
	for i = start,ending,incr do
		result[#result+1]=i
	end
	return result
end

function x.any(lst,f)
	local result = false
	for _,v in ipairs(lst) do
     if(f(v)) then
         result = true
         break
     else
         result = false
     end
   end
   return result
end

function x.filter(lst,f)
	local selected = {}
	for _,v in ipairs(lst) do
		if(f(v)) then
			selected[#selected+1]=v
		end
	end
	return selected
end

function x.foreach(lst,f)
	for _,r in ipairs(lst) do
		f(r)
	end
end


function x.zip (lst,lst2,f)
	local result = {}
	local n = 0
    if(#lst < #lst2) then
    	n = #lst
    else
       n = #lst2
	end
   for i = 1 , n do
		local r = f(lst[i],lst2[i])
        result[#result+1] = r
   end
   return result
   
end

function x.reduce(lst,init,rf)
 local result = init
 local a,b
 a = 0
 b = 0
    for i,v in ipairs(lst) do
        if i == 1 then
            a = result
        end
        b = v
        result = rf(a,b) 
        a = result
    end
 return result
end

function x.map(lst,f)
    local selected = {}
	for _,v in ipairs(lst) do
	  selected[#selected+1]=f(v)
	end
	return selected
end

-- dictionary
x.dictionary = {}
function x.dictionary:new()
    local obj = {}
    self.__index = self
    setmetatable(obj,self)
    return obj
end

function x.dictionary:add(k,v)
    if(not(self[k])) then
        self[k]=v
    end
end







return x
