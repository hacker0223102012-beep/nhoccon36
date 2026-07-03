-- ==========================================
-- 📡 SCRIPT: LẮNG NGHE TÍN HIỆU NGẦM
-- ==========================================
print("🚀 Đang khởi tạo bộ máy nghe lén...")

-- Tìm tất cả các sự kiện trong ReplicatedStorage
for _, v in pairs(game.ReplicatedStorage:GetDescendants()) do
    -- Chúng ta tìm các sự kiện có chữ "Signal" hoặc "Event"
    if v:IsA("RemoteEvent") or v:IsA("BindableEvent") then
        local name = v.Name:lower()
        if name:match("signal") or name:match("event") then
            
            -- Lắng nghe xem nó gửi cái gì mỗi khi game update
            v.OnClientEvent:Connect(function(...)
                local args = {...}
                print("⚡ Phát hiện tín hiệu từ: " .. v.Name)
                for i, arg in pairs(args) do
                    print("   -> Dữ liệu gửi tới: ", arg)
                end
            end)
        end
    end
end
print("✅ Đã bắt đầu nghe lén!")
