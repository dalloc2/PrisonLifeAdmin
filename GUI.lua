
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local Input = Instance.new("TextBox")
ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = ScreenGui
Frame.Active = true
Frame.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
Frame.Position = UDim2.new(0.5, -279, 1, -120)
Frame.Selectable = true
Frame.Size = UDim2.new(0, 559, 0, 49)
Frame.Draggable = true

UICorner.Parent = Frame

Input.Name = "Input"
Input.Parent = Frame
Input.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Input.BackgroundTransparency = 1.000
Input.Position = UDim2.new(0.5, -257, 0.5, -13)
Input.Size = UDim2.new(0, 515, 0, 26)
Input.Font = Enum.Font.GothamBold
Input.PlaceholderText = "Press ; to focus."
Input.Text = ""
Input.TextColor3 = Color3.fromRGB(255, 255, 255)
Input.TextSize = 16.000
Input.TextXAlignment = Enum.TextXAlignment.Left

local T = {}
for i, v in pairs(ScreenGui:GetDescendants()) do
  T[v.Name] = v
end
return T
