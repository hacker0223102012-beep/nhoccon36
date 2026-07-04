-- ==========================================================
-- 💀 PROTOCOL: MEMORY HIJACKING (TARGETING: REPLICA DATA)
-- ==========================================================
local function injectProtocol()
    -- Chúng ta chiếm quyền điều khiển của bảng Global
    local env = getfenv()
    local mt = getrawmetatable(game)
    setreadonly(mt, false)

    -- Hook vào mọi yêu cầu truy vấn bảng dữ liệu
    local oldIndex = mt.__index
    mt.__index = function(self, k)
        local val = oldIndex(self, k)
        
        -- Nếu hệ thống của ổng đang kiểm tra kết quả
        if type(val) == "table" then
            if val.Result ~= nil then -- Kiểm tra xem đây có phải bảng kết quả
                val.Result = "Win"    -- Ép kết quả thành Win
                val.Status = "Win"
            end
        end
        return val
    end
end

-- Khởi chạy trong im lặng tuyệt đối
xpcall(injectProtocol, function(err) warn("Protocol failed: ", err) end)
print("✅ Protocol established. Awaiting trigger...")
