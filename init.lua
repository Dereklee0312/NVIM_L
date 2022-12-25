local core_modules = {
	"core/opts",
	"core/autocmd",
	"lua/lazy",
}

-- Using pcall we can handle better any loading issues
for _, module in ipairs(core_modules) do
	local ok, err = pcall(require, module)
	if not ok then
		return
	end
end
