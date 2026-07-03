-- ==========================================
-- 🤫 TROLL ADMIN TOOL: TÀNG HÌNH & ÉP WIN
-- ==========================================

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local LocalPlayer = game.Players.LocalPlayer

-- 1. HỆ THỐNG ÉP WIN (HOOKING)
-- Tự động tìm Remote liên quan đến cược và ép trả về "Win"
for _, v in pairs(ReplicatedStorage:GetDescendants()) do
    if v:IsA("RemoteEvent") or v:IsA("RemoteFunction") then
        local name = v.Name:lower()
        if name:match("bet") or name:match("double") or name:match("gamble") or name:match("win") then
            local oldCall
            if v:IsA("RemoteEvent") then
                oldCall = v.FireServer
                v.FireServer = function(self, ...)
                    return oldCall(self, "Win")
                end
            else
                oldCall = v.InvokeServer
                v.InvokeServer = function(self, ...)
                    return oldCall(self, "Win")
                end
            end
        end
    end
end

-- 2. HỆ THỐNG ESP TÀNG HÌNH
-- Chỉ hiển thị cây khi cần, không in lỗi, không spam log
RunService.RenderStepped:Connect(function()
    local plants = workspace:FindFirstChild("Plants")
    if plants then
        for _, obj in pairs(plants:GetChildren()) do
            if obj:IsA("Model") and not obj:FindFirstChild("TrollESP") then
                local b = Instance.new("BillboardGui", obj)
                b.Name = "TrollESP"; b.AlwaysOnTop = true; b.Size = UDim2.new(0, 100, 0, 50)
                local t = Instance.new("TextLabel", b)
                t.Size = UDim2.new(1,0,1,0); t.BackgroundTransparency = 1; t.Text = "Cây"
                t.TextColor3 = Color3.fromRGB(0, 255, 0); t.TextScaled = true
            end
        end
    end
end)

-- 3. AUTO FARM "ÊM ĐỀM"
-- Thu hoạch ngẫu nhiên 2-4 giây một lần để giống người chơi thật, tránh bị soi tốc độ
task.spawn(function()
    while task.wait(math.random(2, 4)) do
        local plants = workspace:FindFirstChild("Plants")
        if plants then
            for _, obj in pairs(plants:GetChildren()) do
                if obj:GetAttribute("ReadyToHarvest") then
                    local event = ReplicatedStorage:FindFirstChild("CollectFruit")
                    if event then event:FireServer(obj.Name) end
                    break -- Thu hoạch từng cây một cho tự nhiên
                end
            end
        end
    end
end)
