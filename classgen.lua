function ask(q)
  io.write(q..": ")
  return io.read()
end

function explode(div,str) -- credit: http://richard.warburton.it
  if (div=='') then return false end
  local pos,arr = 0,{}
  -- for each divider found
  for st,sp in function() return string.find(str,div,pos,true) end do
    table.insert(arr,string.sub(str,pos,st-1)) -- Attach chars left of current divider
    pos = sp + 1 -- Jump past current divider
  end
  table.insert(arr,string.sub(str,pos)) -- Attach chars right of last divider
  return arr
end

function firstToUpper(str)
  return (str:gsub("^%l", string.upper))
end

s=""
function p(str)
  s = s..str
end

io.write("Lua Class Generator\n")
class_name_raw = ask("Class Name")
class_name = class_name_raw == "" and "anon" or class_name_raw
fast = ask("Fast? (y/N)") == "y"
if fast then
  dead_pool_max = ask("Dead pool max (int)")
end
function_names_raw = ask("functions (csv)")
function_names = function_names_raw == "" and {} or explode(",",function_names_raw)
variable_names_raw = ask("variables (csv)")
variable_names = variable_names_raw == "" and {} or explode(",",variable_names_raw)

-- CLASS OBJECT
p("local "..class_name.. " = {}\n\n")

-- POOLS
if fast then
  p(class_name..".__dead_pool = {}\n")
  p(class_name..".__dead_pool_max = "..dead_pool_max.."\n")
  p(class_name..".__live_pool = {}\n\n")
end

-- NEW FUNCTION
p("function "..class_name..".new()\n")
if fast then
  p("  local self\n")
  p("  if #"..class_name..".__dead_pool > 0 then\n")
  p("    self = table.remove("..class_name..".__dead_pool)\n")
  p("  else\n")
  p("    self = {}\n")
  for i,v in pairs(function_names) do
    p("    self."..v.."="..class_name.."."..v.."\n")
  end
  for i,v in pairs(variable_names) do
    p("    self.get"..firstToUpper(v).."="..class_name..".get"..firstToUpper(v).."\n")
    p("    self.set"..firstToUpper(v).."="..class_name..".set"..firstToUpper(v).."\n")
  end
  p("    table.insert("..class_name..".__live_pool,self)\n")
  p("  end\n")
  p("  "..class_name..":reset()\n")
else
  p("  local self={}\n")
  for i,v in pairs(function_names) do
    p("  self."..v.."="..class_name.."."..v.."\n")
  end
  for i,v in pairs(variable_names) do
    p("  self._"..v.."=nil --init\n")
    p("  self.get"..firstToUpper(v).."="..class_name..".get"..firstToUpper(v).."\n")
    p("  self.set"..firstToUpper(v).."="..class_name..".set"..firstToUpper(v).."\n")
  end
end
p("  return self\n")
p("end\n\n")

-- RESET
if fast then
  p("function "..class_name..":reset()\n")
  for i,v in pairs(variable_names) do
    p("  self._"..v.."=nil --init\n")
  end
  p("end\n\n")
end

-- DESTROY
if fast then
  p("function "..class_name..":destroy()\n")
  p("  for index,obj in pairs("..class_name..".__live_pool) do\n")
  p("    if obj == self then\n")
  p("      if #"..class_name..".__dead_pool < "..class_name..".__dead_pool_max then\n")
  p("        table.insert("..class_name..".__dead_pool,\n")
  p("          table.remove("..class_name..".__live_pool,index))\n")
  p("      else\n")
  p("        table.remove("..class_name..".__live_pool,index)\n")
  p("      end\n")
  p("      return true -- object has been marked as dead\n")
  p("    end\n")
  p("  end\n")
  p("  return false -- object was not in live_pool\n")
  p("end\n\n")
end

-- DEFINED FUNCTIONS
for i,v in pairs(function_names) do
  p("function "..class_name..":"..v.."()\n")
  p("end\n\n")
end

-- VARIABLE GETTERS/SETTERS
for i,v in pairs(variable_names) do
  p("function "..class_name..":get"..firstToUpper(v).."()\n")
  p("  return self._"..v.."\n")
  p("end\n\n")

  p("function "..class_name..":set"..firstToUpper(v).."(val)\n")
  p("  self._"..v.."=val\n")
  p("end\n\n")
end

-- RETURN CLASS OBJECT
p("return "..class_name.."\n")

file_name = class_name.."class.lua"
file = io.open(file_name,"w")
file:write(s)
file:close()

io.write("File written to `"..file_name.."`\n")
