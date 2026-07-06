-- ==================================================
-- 🚀 FULL AUTO "LƯỜI" DASHBOARD (TỰ QUÉT & TỰ CHẠY)
-- ==================================================
local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
local Frame = Instance.new("Frame", ScreenGui)
Frame.Size = UDim2.new(0, 220, 0, 180); Frame.Position = UDim2.new(0.8, 0, 0.2, 0)
Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30); Frame.Draggable = true

-- Hàm tìm kiếm thông minh
local function FindObject(namePart)
    for _, obj in pairs(game:GetDescendants()) do
        if string.find(string.lower(obj.Name), string.lower(namePart)) then return obj end
    end
end

-- Tự tìm biến tiền
local Money = FindObject("money") or FindObject("cash") or FindObject("coins")
local SellBtn = FindObject("sell")
local RollBtn = FindObject("roll") or FindObject("bet")

local status = Instance.new("TextLabel", Frame); status.Size = UDim2.new(1, 0, 0, 30)
status.Text = "Đang quét: "..(Money and "Tìm thấy tiền" or "Lỗi tìm tiền")

-- Nút điều khiển
local ToggleBtn = Instance.new("TextButton", Frame); ToggleBtn.Size = UDim2.new(0, 200, 0, 50); ToggleBtn.Position = UDim2.new(0, 10, 0, 40)
ToggleBtn.Text = "BẬT CHẾ ĐỘ CÀY THUÊ"

local Active = false
ToggleBtn.MouseButton1Click:Connect(function()
    Active = not Active
    ToggleBtn.Text = Active and "ĐANG CÀY..." or "BẬT CHẾ ĐỘ CÀY THUÊ"
    
    if Active then
        task.spawn(function()
            while Active do
                local currentMoney = (Money and Money.Value) or 0
                
                if currentMoney >= 200000 and SellBtn then
                    -- Teleport đi bán
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = SellBtn.CFrame
                    task.wait(1)
                elseif RollBtn then
                    -- Tự Roll
                    if RollBtn:IsA("TextButton") then RollBtn.MouseButton1Click:Invoke()
                    elseif RollBtn:IsA("RemoteEvent") then RollBtn:FireServer() end
                end
                task.wait(1)
            end
        end)
    end
end)
