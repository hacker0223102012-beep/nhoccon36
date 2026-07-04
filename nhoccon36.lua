-- ==========================================
-- 💀 SCRIPT: DUMP GAME (GIẢI PHẪU CĂN CỨ)
-- ==========================================
local success, result = pcall(function()
    local dump = saveinstance() -- Lệnh dump toàn bộ game
    return dump
end)

if success then
    print("✅ Đã dump thành công! Kiểm tra thư mục workspace của Executor.")
else
    warn("❌ Executor của bạn không hỗ trợ saveinstance. Lỗi: " .. tostring(result))
end
