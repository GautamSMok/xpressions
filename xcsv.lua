
local xcsv = {}

function xcsv.get_words(str)
	words = {}
	for word in string.gmatch(str, '([^,]+)') do
        local val = tonumber(word)
        if(val) then
           table.insert(words,val)
        elseif(checkfordate(word)) then
            local dt = checkfordate(word) 
            table.insert(words,dt)
        else
           table.insert(words,word)   
        end
	end
	return words;	
end
    
function checkfordate(s)
	local frmt = "(%d+)/(%d+)/(%d+)"
	local dy,mn,yr = s:match(frmt)
	if(dy and mn and yr) then
		return os.time({year=yr,month=mn,day=dy})
	end
	return nil
end

function xcsv.lines_from(file)
  if not xcsv.file_exists(file) then return {} end
  lines = {}
  for line in io.lines(file) do 
    lines[#lines + 1] = line
  end
  return lines
end

function xcsv.file_exists(file)
  local f = io.open(file, "rb")
  if f then f:close() end
  return f ~= nil
end

function xcsv.read_csv(file)
	records = {}
	local lines = xcsv.lines_from(file)
	header_columns = xcsv.get_words(lines[1])
    
    for i=2,#lines,1 do
			words = xcsv.get_words(lines[i])
			local col_index = 1
			local record={}
			for _,v in ipairs(words) do
				if(v) then
                    local str = header_columns[col_index]
                    local header_name = str:gsub("%s","")
					record[header_name]=v
					col_index = col_index + 1
				end
			end
			records[#records + 1]=record		
	end

	return records
end

return xcsv
