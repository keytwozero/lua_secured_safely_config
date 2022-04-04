-- Work with file: TEST.cfg
-- https://github.com/keytwozero/lua_secured_safely_config/blob/main/TEST.CFG

local function fread(name)
	local f = assert(io.open(name,'r'))
	return f:read('*a')
end

local function cfg_run(data)
	local loader, compile_error = load('local _ENV;return'..data)
	if compile_error then error('Config has not compiled') else
		local ok, result_or_error = pcall(loader)
		if ok then return result_or_error end
		error('Config tries to get inaccessible value/function, maybe it\'s malicious code (MAYBE VIRUS)!')
	end
end

local data = fread('TEST.cfg')
local test = cfg_run(data)

print('---------------')
print(test.one)
print(test.two+6)
print(test.str)
if test.bol then print('Yes') end
print('ZAZ-'..test.msv.zaz)
print('VAZ-'..test.msv.vaz)
print('---------------')
for i,j in pairs(test) do print(i,j) end
print('---------------')
