-- Touch Fling GUI by ChescoV2

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")
local LocalPlayer = Players.LocalPlayer

print("sub to ChescoV2 on youtube and check out my discord server or just come to my dms: arch.huzz  .gg/bdy3tzpZ7M")

local gui = Instance.new("ScreenGui")
gui.Name = "Gui_" .. math.random(1000, 9999)
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
gui.ResetOnSpawn = false
gui.Parent = CoreGui

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 158, 0, 110)
frame.Position = UDim2.new(0.3885, 0, 0.4278, 0)
frame.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true

local header = Instance.new("Frame", frame)
header.Size = UDim2.new(0, 158, 0, 25)
header.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
header.BorderSizePixel = 0

local title = Instance.new("TextLabel", header)
title.Position = UDim2.new(0.112, 0, -0.015, 0)
title.Size = UDim2.new(0, 121, 0, 26)
title.BackgroundTransparency = 1
title.Font = Enum.Font.Sarpanch
title.Text = "Touch Fling"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextSize = 25

local button = Instance.new("TextButton", frame)
button.Position = UDim2.new(0.1139, 0, 0.34, 0)
button.Size = UDim2.new(0, 121, 0, 37)
button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
button.BorderSizePixel = 0
button.Font = Enum.Font.SourceSansItalic
button.Text = "OFF"
button.TextColor3 = Color3.fromRGB(0, 0, 0)
button.TextSize = 20

local credit = Instance.new("TextLabel", frame)
credit.AnchorPoint = Vector2.new(0.5, 1)
credit.Position = UDim2.new(0.5, 0, 1, -8)
credit.Size = UDim2.new(0, 150, 0, 23)
credit.BackgroundTransparency = 1
credit.Text = "Created by ChescoV2"
credit.Font = Enum.Font.Sarpanch
credit.TextSize = 17
credit.TextColor3 = Color3.fromRGB(255, 255, 255)
credit.TextXAlignment = Enum.TextXAlignment.Center
credit.TextYAlignment = Enum.TextYAlignment.Center

local isActive = false
local thread

local function startFling()
	local movel = 0.1
	while isActive do
		RunService.Heartbeat:Wait()
		local char = LocalPlayer.Character
		local hrp = char and char:FindFirstChild("HumanoidRootPart")
		if hrp then
			local vel = hrp.Velocity
			hrp.Velocity = vel * 10000 + Vector3.new(0, 10000, 0)
			RunService.RenderStepped:Wait()
			hrp.Velocity = vel
			RunService.Stepped:Wait()
			hrp.Velocity = vel + Vector3.new(0, movel, 0)
			movel = -movel
		end
	end
end

button.MouseButton1Click:Connect(function()
	isActive = not isActive
	button.Text = isActive and "ON" or "OFF"
	if isActive then
		thread = coroutine.create(startFling)
		coroutine.resume(thread)
	end
end)
