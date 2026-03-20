local ScreenGui = Instance.new("ScreenGui", game.CoreGui)

-- Bảng Loading phủ kín màn hình cực "nguy hiểm"
local FullFrame = Instance.new("Frame", ScreenGui)
FullFrame.Size = UDim2.new(1, 0, 1, 0)
FullFrame.BackgroundColor3 = Color3.fromRGB(5, 5, 5) -- Đen huyền bí
FullFrame.Active = true

local Center = Instance.new("Frame", FullFrame)
Center.Size = UDim2.new(0, 380, 0, 180)
Center.Position = UDim2.new(0.5, -190, 0.4, 0)
Center.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Instance.new("UICorner", Center).CornerRadius = UDim.new(0, 15)

local Title = Instance.new("TextLabel", Center)
Title.Size = UDim2.new(1, 0, 0.3, 0)
Title.Text = "QUANDZ HUB - SERVER BYPASS V11"
Title.TextColor3 = Color3.fromRGB(0, 255, 150)
Title.TextSize = 18
Title.Font = Enum.Font.Code
Title.BackgroundTransparency = 1

local Status = Instance.new("TextLabel", Center)
Status.Position = UDim2.new(0, 0, 0.35, 0)
Status.Size = UDim2.new(1, 0, 0.2, 0)
Status.Text = "Đang khởi tạo môi trường Exploit..."
Status.TextColor3 = Color3.fromRGB(200, 200, 200)
Status.TextSize = 13
Status.BackgroundTransparency = 1

local Progress = Instance.new("TextLabel", Center)
Progress.Position = UDim2.new(0, 0, 0.65, 0)
Progress.Size = UDim2.new(1, 0, 0.3, 0)
Progress.Text = "0.0%"
Progress.TextColor3 = Color3.fromRGB(0, 255, 150)
Progress.TextSize = 28
Progress.Font = Enum.Font.Code
Progress.BackgroundTransparency = 1

-- LOGIC CHẠY SIÊU CHẬM (LÊN ĐẾN 1 TIẾNG)
task.spawn(function()
    for i = 1, 1000 do
        local percent = i / 10
        Progress.Text = string.format("%.1f%%", percent)
        
        if percent < 50 then
            -- Từ 0% đến 50%: Chạy nhanh để lấy lòng tin (mất ~10 giây)
            Status.Text = "Đang kết nối Database..."
            task.wait(0.2)
        elseif percent < 99.8 then
            -- TỪ 50% TRỞ ĐI: CHẠY SIÊU CHẬM (Mỗi 0.1% mất khoảng 7-10 giây hoặc hơn)
            Status.Text = "ĐANG GIẢI MÃ GÓI TIN SERVER (Đợi hệ thống)..."
            -- Tính toán để chạy hết chỗ này mất khoảng 1 tiếng (3600 giây / 500 bước)
            task.wait(7.2) 
        else
            -- Dừng lại ở 99.8% để hiện lỗi
            task.wait(5)
            Progress.Text = "99.8% - FAILED!"
            Progress.TextColor3 = Color3.fromRGB(255, 50, 50)
            Status.Text = "LỖI: TÀI KHOẢN PHẢI TRÊN 1000 NGÀY ĐỂ KÍCH HOẠT BẢN NÀY!"
            Status.TextColor3 = Color3.fromRGB(255, 50, 50)
            
            -- Thông báo cuối cùng
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "SECURITY ERROR",
                Text = "Tài khoản của bạn không đủ điều kiện (Yêu cầu >1000 ngày).",
                Duration = 10
            })
            break
        end
    end
end)
