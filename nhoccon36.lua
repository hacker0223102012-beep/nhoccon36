-- ==========================================
-- ⚡ FPS BOOSTER "SUPER" (BẬT/TẮT)
-- ==========================================
local CoreGui = game:GetService("CoreGui")
local Lighting = game:GetService("Lighting")
local Terrain = game:GetService("Workspace"):FindFirstChildOfClass("Terrain")

-- [TẠO UI NÚT GẠT]
local ScreenGui = Instance.new("ScreenGui", CoreGui)
local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Size = UDim2.new(0, 100, 0, 50); MainFrame.Position = UDim2.new(0.8, 0, 0.8, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50); MainFrame.Draggable = true

local ToggleBtn = Instance.new("TextButton", MainFrame)
ToggleBtn.Size = UDim2.new(1, 0, 1, 0); ToggleBtn.Text = "FPS: OFF"

local BoostActive = false

-- [HÀM TĂNG FPS]
local function SetFPS(active)
    if active then
        -- Ép đồ họa xuống tối đa
        Lighting.GlobalShadows = false
        Lighting.FogEnd = 9e9
        Terrain.WaterWaveSize = 0
        for _, obj in pairs(game:GetService("Workspace"):GetDescendants()) do
            if obj:IsA("Decal") or obj:IsA("ParticleEmitter") or obj:IsA("Explosion") then
                obj.Enabled = false
            end
        end
        ToggleBtn.Text = "FPS: ON"
    else
        -- Khôi phục (Load lại game hoặc reset cài đặt)
        Lighting.GlobalShadows = true
        for _, obj in pairs(game:GetService("Workspace"):GetDescendants()) do
            if obj:IsA("Decal") or obj:IsA("ParticleEmitter") then
                obj.Enabled = true
            end
        end
        ToggleBtn.Text = "FPS: OFF"
    end
end

ToggleBtn.MouseButton1Click:Connect(function()
    BoostActive = not BoostActive
    SetFPS(BoostActive)
end)
