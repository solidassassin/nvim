local M = {}

function M.contains_value(table, element)
    for _, value in pairs(table) do
        if value == element then
            return true
        end
    end
    return false
end

function M.contains_key(table, element)
    for key, _ in pairs(table) do
        if key == element then
            return true
        end
    end
    return false
end

function M.merge(base, override)
    if override == nil then
        return base
    elseif base == nil then
        return override
    end
    for key, value in pairs(override) do
        base[key] = value
    end
    return base
end

function M.recursive_merge(base, override)
    for key, value in pairs(override) do
        local base_value = base[key]
        if type(value) ~= type(base_value) then
            print("Type mismatch. Skipping...")
            goto continue
        end
        if (type(key) == "string") and (type(base_value) == "table") then
            M.recursive_merge(base_value, value)
        else
            base[key] = value
        end
        ::continue::
    end

    return base
end

return M
