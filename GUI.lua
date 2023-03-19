local ScreenGui = Instance.new("ScreenGui")
local CommandBar = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local Input = Instance.new("TextBox")
local List = Instance.new("Frame")
local ListExample = Instance.new("Frame")
local UICorner_2 = Instance.new("UICorner")
local Search = Instance.new("TextBox")
local ScrollingFrame = Instance.new("ScrollingFrame")
local Label = Instance.new("TextLabel")
local ScrollLayout = Instance.new("UIListLayout")
local Button = Instance.new("TextButton")
local ListLayout = Instance.new("UIListLayout")

function MakeStroke(Parent)
	local UIStroke = Instance.new("UIStroke", Parent)
	UIStroke.Thickness = 3
	UIStroke.Color = Color3.fromRGB(97,97,97)
end

ScreenGui.Parent = game.CoreGui
ScreenGui.Name = "nuckfiggers"
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

CommandBar.Name = "CommandBar"
CommandBar.Parent = ScreenGui
CommandBar.Active = true
CommandBar.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
CommandBar.Draggable = true
CommandBar.Position = UDim2.new(0.5, -279, 1, -120)
CommandBar.Selectable = true
CommandBar.Size = UDim2.new(0, 559, 0, 49)
MakeStroke(CommandBar)

UICorner.Parent = CommandBar

Input.Name = "Input"
Input.Parent = CommandBar
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

List.Name = "List"
List.Parent = ScreenGui
List.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
List.BackgroundTransparency = 1.000
List.Position = UDim2.new(0.5, -596, 1, -450)
List.Size = UDim2.new(0, 1192, 0, 308)

ListExample.Name = "ListExample"
ListExample.Parent = nil
ListExample.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
ListExample.Position = UDim2.new(0.419547081, 0, 0.470951796, 0)
ListExample.Size = UDim2.new(0, 270, 0, 276)
MakeStroke(ListExample)

UICorner_2.Parent = ListExample

Search.Name = "Search"
Search.Parent = ListExample
Search.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Search.BackgroundTransparency = 1.000
Search.Size = UDim2.new(0, 270, 0, 24)
Search.Font = Enum.Font.Gotham
Search.PlaceholderText = "Search here"
Search.Text = ""
Search.TextColor3 = Color3.fromRGB(255, 255, 255)
Search.TextSize = 14.000
Search.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
Search.TextWrapped = true

ScrollingFrame.Parent = ListExample
ScrollingFrame.Active = true
ScrollingFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ScrollingFrame.BackgroundTransparency = 1.000
ScrollingFrame.Position = UDim2.new(0, 0, 0.0905797109, 0)
ScrollingFrame.Size = UDim2.new(0, 270, 0, 251)

Label.Name = "Label"
Label.Parent = nil
Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Label.BackgroundTransparency = 1.000
Label.Size = UDim2.new(1, 0, -0.0517928302, 50)
Label.Font = Enum.Font.Gotham
Label.Text = ";cmds | lol, lol | Rank"
Label.TextColor3 = Color3.fromRGB(255, 255, 255)
Label.TextSize = 14.000

ScrollLayout.Name = "ScrollLayout"
ScrollLayout.Parent = ScrollingFrame
ScrollLayout.SortOrder = Enum.SortOrder.LayoutOrder

Button.Name = "Button"
Button.Parent = nil
Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Button.BackgroundTransparency = 1.000
Button.Size = UDim2.new(1, 0, -0.0483824126, 50)
Button.Font = Enum.Font.Gotham
Button.Text = "OnlyTwentyCharacters"
Button.TextColor3 = Color3.fromRGB(255, 255, 255)
Button.TextSize = 14.000

ListLayout.Name = "ListLayout"
ListLayout.Parent = List
ListLayout.FillDirection = Enum.FillDirection.Horizontal
ListLayout.SortOrder = Enum.SortOrder.LayoutOrder
ListLayout.Padding = UDim.new(0, 30)

return {Input=Input, MakeList=function(Name, Visible)
	local ListL = ListExample:Clone()
	ListL.Parent = List
	ListL.Name = Name
	ListL.Visible = Visible
	ListL.Search.Changed:Connect(function(Prop)
		if Prop == "Text" then
			local T = string.lower(ListL.Search.Text)
			if T == "" then
				for i, v in pairs(ListL.ScrollingFrame:GetChildren()) do
					if v.Name ~= "ScrollLayout" then
						v.Visible = true
					end
				end
			else
				for i, v in pairs(ListL.ScrollingFrame:GetChildren()) do
					if v.Name ~= "ScrollLayout" then
						if string.match(string.lower(v.Text), T) then
							v.Visible = true
							break
						else
							v.Visible = false
						end
					end
				end
			end
		end
	end)
   --looks dogshit but works 🤪🤪🤪
	return {MakeButton=function(Text, Func)
		local B = Button:Clone()
		B.Text = Text
		B.MouseButton1Click:Connect(Func)
		B.Parent = ListL.ScrollingFrame
	end,MakeLabel=function(Text)
		local L = Label:Clone()
		L.Text = Text
		L.Parent = ListL.ScrollingFrame
	end, DestroyList=function()
		ListL:Destroy()
	end,}
end,}
