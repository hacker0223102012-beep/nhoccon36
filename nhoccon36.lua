-- ==========================================
-- 🛡️ SCRIPT TROLL AN TOÀN (BẢN FIX)
-- ==========================================

local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Hàm này sẽ chặn không cho lệnh "Thua" được gửi đi
local function safeDoubleOrNothing()
    for _, v in pairs(ReplicatedStorage:GetDescendants()) do
        if v:IsA("RemoteEvent") then
            -- Chỉ can thiệp vào Remote có tên liên quan đến Bet/Double/Gamble
            local name = v.Name:lower()
            if name:match("bet") or name:match("double") or name:match("gamble") then
                
                local oldFire = v.FireServer
                v.FireServer = function(self, ...)
                    local args = {...}
                    
                    -- KIỂM TRA: Nếu lệnh gửi lên có chứa tham số "Lose", "Nothing" hoặc "2" (kết quả thua)
                    -- Thì ta chặn đứng và thay thế bằng kết quả "Win"
                    for i, arg in pairs(args) do
                        if arg == "Nothing" or arg == "Lose" or arg == 2 or arg == false then
                            print("⛔ Đã chặn lệnh Thua!")
                            return oldFire(self, "Win") -- Hoặc đổi thành 1, true tùy game
                        end
                    end
                    
                    return oldFire(self, ...)
                end
            end
        end
    end
end

-- Khởi chạy chế độ bảo vệ
safeDoubleOrNothing()
