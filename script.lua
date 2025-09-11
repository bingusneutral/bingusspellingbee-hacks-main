local Player = game:GetService("Players").LocalPlayer

if Player.Name ~= "Sirmungus" then script:Destroy() game:GetService("StarterPlayer").StarterCharacterScripts:WaitForChild("hacks"):Destroy() return end

local PlayerGui = Player:WaitForChild("PlayerGui")

local TextBox = PlayerGui:WaitForChild("TypingHUD"):WaitForChild("TextBox")

local Running = false

local Gui = Instance.new("ScreenGui")
Gui.Name = "Bingus's Spelling Bee Script"
Gui.Parent = PlayerGui
Gui.IgnoreGuiInset = true

local Frame = Instance.new("Frame")
Frame.Parent = Gui
Frame.Position = UDim2.new(0, Gui.AbsoluteSize.X / 2, 0, Gui.AbsoluteSize.Y / 2)
Frame.BackgroundColor3 = Color3.fromRGB(100, 0, 0)
Frame.Size = UDim2.new(0.2, 0, 0.2, 0)
Frame.BorderSizePixel = 0

local Button = Instance.new("TextButton")
Button.TextScaled = true
Button.Text = "OFF"
Button.Parent = Frame
Button.Size = UDim2.new(.5, 0, .5, 0)
Button.AnchorPoint = Vector2.new(0.5, 0.8)
Button.BorderSizePixel = 0
Button.BackgroundColor3 = Color3.fromRGB(150, 0 , 0)

local Text = Instance.new("TextLabel")
Text.TextScaled = true
Text.Text = "Speed"
Text.Parent = Frame
Text.Size = UDim2.new(.2, 0, .2, 0)
Text.BorderSizePixel = 0
Text.BackgroundColor3 = Color3.fromRGB(150, 0 , 0)

local NewTextBox = Instance.new("TextBox")
NewTextBox.TextScaled = true
NewTextBox.Text = 0.5
NewTextBox.Parent = Frame
NewTextBox.Size = UDim2.new(.2, 0, .2, 0)
NewTextBox.AnchorPoint = Vector2.new(1, 0)
NewTextBox.BorderSizePixel = 0
NewTextBox.BackgroundColor3 = Color3.fromRGB(150, 0 , 0)

local Corner = Instance.new("UICorner")
Corner.CornerRadius = UDim.new(0, 13)
Corner.Parent = Frame

local ButtonCorner = Instance.new("UICorner")
ButtonCorner.CornerRadius = UDim.new(0, 9)
ButtonCorner.Parent = Button

local NewTextBoxCorner = Instance.new("UICorner")
NewTextBoxCorner.CornerRadius = UDim.new(0, 9)
NewTextBoxCorner.Parent = NewTextBox

local TextCorner = Instance.new("UICorner")
TextCorner.CornerRadius = UDim.new(0, 9)
TextCorner.Parent = Text

local UiDrag = Instance.new("UIDragDetector")
UiDrag.Parent = Frame

local UiStroke = Instance.new("UIStroke")
UiStroke.Parent = Frame
UiStroke.Thickness = 3
UiStroke.Color = Color3.fromRGB(50, 0, 0)
UiStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

local ButtonUiStroke = Instance.new("UIStroke")
ButtonUiStroke.Parent = Button
ButtonUiStroke.Thickness = 2
ButtonUiStroke.Color = Color3.fromRGB(50, 0, 0)
ButtonUiStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

local TextUiStroke = Instance.new("UIStroke")
TextUiStroke.Parent = Text
TextUiStroke.Thickness = 2
TextUiStroke.Color = Color3.fromRGB(50, 0, 0)
TextUiStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

local NewTextBoxUiStroke = Instance.new("UIStroke")
NewTextBoxUiStroke.Parent = NewTextBox
NewTextBoxUiStroke.Thickness = 2
NewTextBoxUiStroke.Color = Color3.fromRGB(50, 0, 0)
NewTextBoxUiStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

Button.Activated:Connect(function()
	Running = not Running
	
	wait()
	
	if Running then
		Button.Text = "ON"
		
		if workspace:WaitForChild("Sign"):WaitForChild("Board"):WaitForChild("Typer").Value == Player.Name and workspace:WaitForChild("Sign"):WaitForChild("Board"):WaitForChild("WordID").Value ~= "" then
			wait(0.01)
			TextBox:CaptureFocus()
			for Letter in workspace:WaitForChild("Sign"):WaitForChild("Board"):WaitForChild("Word").Value:gmatch(".") do
				TextBox.Text = TextBox.Text .. Letter

				local num = tonumber(NewTextBox.Text)

				if not num then
					wait() 
				elseif num < 0 then

				elseif num == 0 then
					wait()
				else
					wait(num)
				end

			end

			if TextBox.Text == workspace.Sign.Board.Word.Value then
				TextBox:CaptureFocus()
				TextBox.Text = workspace.Sign.Board.Word.Value
				wait()
				TextBox:ReleaseFocus(true)
			else
				TextBox.Text = workspace.Sign.Board.Word.Value
				wait()

				if TextBox.Text == workspace.Sign.Board.Word.Value then
					TextBox:ReleaseFocus(true)
				else
					TextBox.Text = workspace.Sign.Board.Word.Value
					wait()
					TextBox:ReleaseFocus(true)
				end
			end
		end
	else
		Button.Text = "OFF"
	end
end)

workspace:WaitForChild("Sign"):WaitForChild("Board"):WaitForChild("WordID").Changed:Connect(function()
	if Running and workspace:WaitForChild("Sign"):WaitForChild("Board"):WaitForChild("Typer").Value == Player.Name then
		wait(0.1)

		for Letter in workspace:WaitForChild("Sign"):WaitForChild("Board"):WaitForChild("Word").Value:gmatch(".") do
			TextBox.Text = TextBox.Text .. Letter

			local num = tonumber(NewTextBox.Text)

			if not num then
				wait() 
			elseif num < 0 then

			elseif num == 0 then
				wait()
			else
				wait(num)
			end

		end

		if TextBox.Text == workspace.Sign.Board.Word.Value then
			TextBox:ReleaseFocus(true)
		else
			TextBox.Text = workspace.Sign.Board.Word.Value

			if TextBox.Text == workspace.Sign.Board.Word.Value then
				TextBox:ReleaseFocus(true)
			else
				TextBox.Text = workspace.Sign.Board.Word.Value
				wait()
				TextBox:ReleaseFocus(true)
			end
		end
	end
end)

while task.wait(0.01) do
	Button.Position = UDim2.new(0, Frame.AbsoluteSize.X / 2, 0, Frame.AbsoluteSize.Y / 2)
	Text.Position = UDim2.new(0, Frame.AbsoluteSize.X / 2 - Frame.AbsoluteSize.X / 4, 0, (Frame.AbsoluteSize.Y / 2) + 30)
	NewTextBox.Position = UDim2.new(0, Frame.AbsoluteSize.X / 2 + Frame.AbsoluteSize.X / 4, 0, (Frame.AbsoluteSize.Y / 2) + 30)
end
