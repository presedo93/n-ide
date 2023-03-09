M = {}

M.load = function(lsp)

	 if lsp == 'jsonls' then
	 	return require('lsp.servers.jsonls')
    elseif lsp == 'pyright' then
	 	return require('lsp.servers.pyright')
    elseif lsp == 'solargraph' then
        return require('lsp.servers.solargraph')
    elseif lsp == 'tsserver' then
        return require('lsp.servers.tsserver')
	 end

end

return M
