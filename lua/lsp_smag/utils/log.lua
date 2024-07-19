local debug = require("debug")
local io = require("io")

local M = {}

function M.log2file(msg)
	local info = debug.getinfo(2, "Sl")
	local lineinfo = info.short_src .. ":" .. info.currentline
	local fp = assert(io.open(vim.fn.stdpath "log" .. "/smag.log", "a"))
	local str = string.format("[%s] %s: %s\n", os.date(), lineinfo, msg)
	fp:write(str)
	fp:close()
end

return M
