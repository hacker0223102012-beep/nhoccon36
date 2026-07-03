for _, v in pairs(game.ReplicatedStorage:GetDescendants()) do
    if v:IsA("RemoteEvent") then
        print("Tên Remote: " .. v.Name)
    end
end
