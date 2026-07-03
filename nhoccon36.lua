-- ==========================================
-- 🔑 SCRIPT: "CƯỚP" QUYỀN ADMIN (MẠNH NHẤT)
-- ==========================================

local LocalPlayer = game.Players.LocalPlayer
local myUserId = LocalPlayer.UserId

-- Nếu game dùng Cmdr, nó sẽ có một bảng các ID được phép gọi lệnh
-- Chúng ta sẽ tìm cách thêm ID của bạn vào bất kỳ cái bảng nào liên quan đến Admin
for _, v in pairs(game:GetDescendants()) do
    -- Tìm các module hoặc table có tên "Roles", "Admins", "Permissions"
    if v:IsA("ModuleScript") then
        local name = v.Name:lower()
        if name:match("admin") or name:match("permission") or name:match("roles") then
            local success, module = pcall(require, v)
            if success and type(module) == "table" then
                -- Thêm ID của bạn vào mọi bảng có thể là bảng Admin
                table.insert(module, myUserId) 
                print("✅ Đã tiêm ID vào Module: " .. v.Name)
            end
        end
    end
end

-- Sau đó, thử bắn một lệnh Admin xem có được không
local Cmdr = game.ReplicatedStorage:FindFirstChild("CmdrEvent")
if Cmdr then
    Cmdr:FireServer("addmoney", 999999) 
    print("🚀 Đã bắn lệnh Admin!")
end
