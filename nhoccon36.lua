-- ==========================================
-- 🧨 SCRIPT: GHI ĐÈ BỘ NHỚ REPLICACLIENT
-- ==========================================
local ReplicaClient = require(game.ReplicatedStorage:FindFirstChild("ReplicaClient", true))

-- Hàm này sẽ theo dõi mọi thay đổi dữ liệu từ Replica
local function hookReplica()
    -- Hook vào hàm lắng nghe thay đổi của Replica
    local oldListen = ReplicaClient.ListenToChange
    
    ReplicaClient.ListenToChange = function(self, path, callback)
        -- Kiểm tra nếu path liên quan đến kết quả cược
        local pathStr = table.concat(path, "/")
        
        if pathStr:match("Result") or pathStr:match("Status") then
            -- Thay vì chạy callback gốc, ta chạy một callback giả
            return oldListen(self, path, function(newVal)
                print("⚠️ Đã chặn kết quả: " .. tostring(newVal))
                callback("Win") -- Ép thành "Win" bất kể Server nói gì
            end)
        end
        
        return oldListen(self, path, callback)
    end
end

hookReplica()
print("✅ Hệ thống Replica đã bị kiểm soát!")
