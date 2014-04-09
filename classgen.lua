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
function_names_raw = ask("functions (csv)")
function_names = function_names_raw == "" and {} or explode(",",function_names_raw)
variable_names_raw = ask("variables (csv)")
variable_names = variable_names_raw == "" and {} or explode(",",variable_names_raw)

-- CLASS OBJECT
p("local "..class_name.. " = {}\n\n")

-- NEW FUNCTION
p("function "..class_name..".new()\n")
p("  local c={}\n")
for i,v in pairs(function_names) do
  p("  o."..v.."="..class_name.."."..v.."\n")
end
for i,v in pairs(variable_names) do
  p("  o._"..v.."=nil --init\n")
  p("  o.get"..firstToUpper(v).."="..class_name..".get"..firstToUpper(v).."\n")
  p("  o.set"..firstToUpper(v).."="..class_name..".set"..firstToUpper(v).."\n")
end
p("  return o\n")
p("end\n\n")

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

file_name = class_name..".class.lua"
file = io.open(file_name,"w")
file:write(s)
file:close()

io.write("File written to `"..file_name.."`\n")
