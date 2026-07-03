for _, v in pairs(game.ReplicatedStorage:GetDescendants()) do
    if v:IsA("ModuleScript") and v.Name:match("Replica") then
        print("💡 Tìm thấy bộ não của hệ thống: " .. v.Name)
    end
end
