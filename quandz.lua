-- QUANDZ HUB: MEGA HITBOX 100 (NO LAG)
local Size_Mega = 100
local Transparency_Value = 1 -- 1 là ẩn hoàn toàn, để 0.8 nếu muốn thấy mờ mờ

print("Mega Hitbox 100 dang kich hoat... chuan bi quet sach map!")

game:GetService("RunService").RenderStepped:Connect(function()
    for _, player in pairs(game:GetService("Players"):GetPlayers()) do
        if player ~= game:GetService("Players").LocalPlayer and player.Character then
            local root = player.Character:FindFirstChild("HumanoidRootPart")
            if root then
                -- Kích thước siêu to
                root.Size = Vector3.new(Size_Mega, Size_Mega, Size_Mega)
                
                -- Tối ưu ẩn để tăng FPS
                root.Transparency = Transparency_Value
                
                -- Quan trọng: Tắt va chạm để không bị văng khi chạm vào đối thủ
                root.CanCollide = false
                root.Massless = true
            end
        end
    end
end)
