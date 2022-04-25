local M = {}
-- run shell command and get output lines as lua table
-- from: https://github.com/ibhagwan/fzf-lua/blob/main/lua/fzf-lua/utils.lua
M.lua_systemlist = function(cmd)
    local stdout, rc = {}, 0
    local handle = io.popen(cmd .. ' 2>&1 ; echo $?', 'r')

    if handle then
        for line in handle:lines() do stdout[#stdout + 1] = line end
        rc = tonumber(stdout[#stdout])
        stdout[#stdout] = nil
    end

    handle:close()
    return stdout, rc
end

-- run shell command and get str output
M.lua_system = function(cmd)
    local stdout, rc = M.lua_systemlist(cmd)
    if next(stdout) == nil then return nil, rc end
    return table.concat(stdout, '\n'), rc
end

return M
