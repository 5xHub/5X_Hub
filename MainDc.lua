local player = game:GetService("Players").LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "DiscordOverlay"
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
gui.DisplayOrder = 999 
gui.Parent = player:WaitForChild("PlayerGui")

local background = Instance.new("Frame")
background.Size = UDim2.new(1, 0, 1, 0)
background.BackgroundColor3 = Color3.new(0, 0, 0)
background.BorderSizePixel = 0
background.ZIndex = 10
background.Parent = gui

local timerLabel = Instance.new("TextLabel")
timerLabel.Size = UDim2.new(1, 0, 0, 50)
timerLabel.Position = UDim2.new(0, 0, 0, 100)
timerLabel.BackgroundTransparency = 1
timerLabel.Text = "10"
timerLabel.TextColor3 = Color3.new(1, 1, 1)
timerLabel.Font = Enum.Font.GothamBold
timerLabel.TextSize = 40
timerLabel.TextScaled = true
timerLabel.ZIndex = 11
timerLabel.Parent = background

local messageLabel = Instance.new("TextLabel")
messageLabel.Size = UDim2.new(1, 0, 0, 80)
messageLabel.Position = UDim2.new(0, 0, 0.5, -80)
messageLabel.BackgroundTransparency = 1
messageLabel.Text = "JOIN THE DISCORD FOR THE SCRIPT"
messageLabel.TextColor3 = Color3.new(1, 1, 1)
messageLabel.Font = Enum.Font.GothamBlack
messageLabel.TextSize = 36
messageLabel.TextScaled = true
messageLabel.ZIndex = 11
messageLabel.Parent = background

local copyButton = Instance.new("TextButton")
copyButton.Size = UDim2.new(0.6, 0, 0, 60)
copyButton.Position = UDim2.new(0.2, 0, 0.6, 0)
copyButton.BackgroundColor3 = Color3.fromRGB(88, 101, 242) -- Discord blurple
copyButton.Text = "Copy Discord Link"
copyButton.TextColor3 = Color3.new(1, 1, 1)
copyButton.Font = Enum.Font.GothamBold
copyButton.TextSize = 24
copyButton.ZIndex = 11
copyButton.Parent = background

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 12)
corner.Parent = copyButton

copyButton.MouseButton1Click:Connect(function()
    local success = pcall(function()
        setclipboard("https://discord.gg/zFB93PBWX4")
    end)
    if success then
        copyButton.Text = "Link Copied!"
    else
        copyButton.Text = "Copy Failed (click to retry)"
    end
end)

local remaining = 10
while remaining > 0 do
    timerLabel.Text = "Closing in: " .. remaining .. "s"
    task.wait(1)
    remaining = remaining - 1
end
gui:Destroy()