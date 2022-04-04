local function cfg_run(data)
	local loader, compile_error = load('local _ENV;return'..data)
	if compile_error then error('Config has not compiled') else
		local ok, result_or_error = pcall(loader)
		if ok then return result_or_error end
		error('Config tries to get inaccessible value/function, maybe it\'s malicious code (MAYBE VIRUS)!')
	end
end

-- Miniature version
local function cfg_run(b)local c,d=load('local _ENV;return'..b)if d then error('Config has not compiled')else local e,f=pcall(c)if e then return f end;error('Config tries to get inaccessible value/function, maybe it\'s malicious code (MAYBE VIRUS)!')end end
