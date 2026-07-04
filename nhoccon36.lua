-- ==========================================
-- 📡 LIỆT KÊ TẤT CẢ CÁC REMOTEEVENT
-- ==========================================
print("--- ĐANG QUÉT CÁC ĐƯỜNG TRUYỀN (REMOTE) ---")
local replicatedStorage = game:GetService("ReplicatedStorage")

for _, v in pairs(replicatedStorage:GetDescendants()) do
    if v:IsA("RemoteEvent") or v:IsA("RemoteFunction") then
        print("🔍 Tìm thấy cổng: " .. v.Name .. " (Đường dẫn: " .. v:GetFullName() .. ")")
    end
end
print("--- QUÉT XONG! Kéo lên xem log ---")
