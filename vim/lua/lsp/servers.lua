M = {}

M.load = function(lsp)

	 if lsp == 'jsonls' then
	 	return require('lsp.servers.jsonls')
    elseif lsp == 'sumneko_lua' then
		return require('lsp.servers.sumneko_lua')
    elseif lsp == 'pyright' then
	 	return require('lsp.servers.pyright')
	 end

end

return M
