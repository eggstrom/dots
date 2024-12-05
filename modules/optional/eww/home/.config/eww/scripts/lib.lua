-- Enable line buffering
io.stdout:setvbuf("line")

---Open and return a pipe or read it's output.
---If the pipe couldn't be opened, the host program will terminate.
---@param prog string Program to run
---@param lines? number Number of lines to read
local function pipe(prog, lines)
    local file = io.popen(prog, "r")
    if file == nil then
        os.exit(1)
    end

    -- Return pipe if line count isn't specified
    if lines == nil then
        return file
    end

    -- Return string if line count is 1
    if lines == 1 then
        local output = file:read("*l")
        file:close()
        return output
    end

    -- Return table of strings otherwise
    local output = {}
    for _ = 1, lines do
        local line = file:read("*l")
        if line == nil then
            break
        end
        table.insert(output, line)
    end
    file:close()
    return output
end

return { pipe = pipe }
