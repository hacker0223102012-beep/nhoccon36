-- ==========================================
-- 🧨 SCRIPT: MEMORY WATCHER (SIÊU CẤP)
-- ==========================================
local target_address = "0x435867262651b6e9" -- THAY BẰNG ĐỊA CHỈ BẠN THẤY LÚC NÃY

-- Chúng ta sẽ theo dõi mọi Table được tạo ra
local old_table_create = table.create 

-- Hàm giám sát
local function watchTable(t, ...)
    local addr = tostring(t)
    if addr:match(target_address) then
        warn("🎯 BẮT ĐƯỢC TABLE MỤC TIÊU! Đang ép dữ liệu...")
        t["Result"] = "Win" -- Ép giá trị
        t["Status"] = "Win" 
    end
    return t
end

-- Hook vào luồng dữ liệu (Sử dụng metatable để giám sát)
setmetatable(_G, {
    __newindex = function(t, k, v)
        if type(v) == "table" and tostring(v):match(target_address) then
            v["Result"] = "Win"
        end
        rawset(t, k, v)
    end
})

print("✅ Đã kích hoạt cơ chế theo dõi RAM. Hãy cược tiếp đi!")
