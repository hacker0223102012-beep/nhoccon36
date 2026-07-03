-- Thử gửi lệnh "troll" xem hệ thống có nhận không
local Cmdr = game.ReplicatedStorage:FindFirstChild("CmdrEvent")
if Cmdr then
    -- Thử chạy lệnh cộng tiền (Nếu nó dùng Cmdr chuẩn)
    Cmdr:FireServer("addmoney", 999999) 
    print("✅ Đã bắn lệnh qua Cmdr!")
end
