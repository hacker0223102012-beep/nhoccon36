-- Quét các hàm để tìm Upvalue (Dữ liệu ngầm)
for _, v in pairs(getgc(true)) do
    if type(v) == "function" and islclosure(v) then
        local name = debug.getinfo(v).name
        if name and (name:lower():match("double") or name:lower():match("roll")) then
            print("🔍 Tìm thấy hàm tiềm năng: " .. name)
            -- Liệt kê các biến ngầm (Upvalues) của hàm này
            for i = 1, 100 do
                local name, val = debug.getupvalue(v, i)
                if val and type(val) == "table" then
                    print("   - Upvalue số " .. i .. " (Table): " .. tostring(val))
                end
            end
        end
    end
end
