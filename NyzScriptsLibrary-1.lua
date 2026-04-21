local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UIS = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")
local RunService = game:GetService("RunService")

local NyzScriptsLibrary = {}
NyzScriptsLibrary.__index = NyzScriptsLibrary

local YELLOW = Color3.fromRGB(255, 210, 0)
local DARK = Color3.fromRGB(14, 10, 10)
local DARK2 = Color3.fromRGB(20, 15, 15)
local WHITE = Color3.fromRGB(255, 255, 255)
local GRAY = Color3.fromRGB(160, 160, 160)

function NyzScriptsLibrary:CreateWindow(config)
	config = config or {}
	local title = config.Title or "NyzScripts"
	local bgImageId = config.BackgroundImage or "rbxassetid://98801320804629"

	if CoreGui:FindFirstChild("NyzUI_" .. title) then
		CoreGui:FindFirstChild("NyzUI_" .. title):Destroy()
	end

	local ScreenGui = Instance.new("ScreenGui")
	ScreenGui.Name = "NyzUI_" .. title
	ScreenGui.Parent = CoreGui
	ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

	local W, H = 520, 370
	local TAB_W = 38

	local Main = Instance.new("Frame")
	Main.Name = "Main"
	Main.Parent = ScreenGui
	Main.BackgroundColor3 = DARK
	Main.BackgroundTransparency = 0.12
	Main.Position = UDim2.new(0.5, -(W/2), 0.5, -(H/2))
	Main.Size = UDim2.new(0, W, 0, H)
	Main.ClipsDescendants = true

	local fullSize = Main.Size
	local collapsedSize = UDim2.new(0, W, 0, 40)

	Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 10)

	local MainStroke = Instance.new("UIStroke", Main)
	MainStroke.Color = YELLOW
	MainStroke.Thickness = 2

	local BgImage = Instance.new("ImageLabel", Main)
	BgImage.Size = UDim2.new(1, 0, 1, 0)
	BgImage.BackgroundTransparency = 1
	BgImage.Image = bgImageId
	BgImage.ImageTransparency = 0.45
	BgImage.ScaleType = Enum.ScaleType.Crop
	BgImage.ZIndex = 0
	Instance.new("UICorner", BgImage).CornerRadius = UDim.new(0, 10)

	local LightningCanvas = Instance.new("Frame", Main)
	LightningCanvas.Size = UDim2.new(1, 0, 1, 0)
	LightningCanvas.BackgroundTransparency = 1
	LightningCanvas.ZIndex = 1
	LightningCanvas.ClipsDescendants = true

	local function drawSegment(parent, x1, y1, x2, y2, thickness, alpha)
		local dx = x2 - x1
		local dy = y2 - y1
		local length = math.sqrt(dx*dx + dy*dy)
		if length < 1 then return end
		local angle = math.atan2(dy, dx)
		local seg = Instance.new("Frame", parent)
		seg.AnchorPoint = Vector2.new(0, 0.5)
		seg.Position = UDim2.new(0, x1, 0, y1)
		seg.Size = UDim2.new(0, length, 0, thickness)
		seg.BackgroundColor3 = Color3.fromRGB(255, 220, 0)
		seg.BackgroundTransparency = alpha or 0.1
		seg.BorderSizePixel = 0
		seg.Rotation = math.deg(angle)
		seg.ZIndex = 2
		local glow = Instance.new("UIGradient", seg)
		glow.Color = ColorSequence.new({
			ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 100)),
			ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 200, 0)),
			ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 100)),
		})
		glow.Rotation = 90
	end

	local function generateLightning(parent, x1, y1, x2, y2, depth)
		if depth <= 0 then
			drawSegment(parent, x1, y1, x2, y2, math.random(1, 2), 0.05)
			return
		end
		local mx = (x1 + x2) / 2 + math.random(-30, 30)
		local my = (y1 + y2) / 2 + math.random(-30, 30)
		drawSegment(parent, x1, y1, mx, my, math.random(1, 3), 0.0)
		drawSegment(parent, mx, my, x2, y2, math.random(1, 3), 0.0)
		if math.random() > 0.55 then
			local bx = mx + math.random(-60, 60)
			local by = my + math.random(-60, 60)
			generateLightning(parent, mx, my, bx, by, depth - 2)
		end
		generateLightning(parent, x1, y1, mx, my, depth - 1)
		generateLightning(parent, mx, my, x2, y2, depth - 1)
	end

	local FRAME_COUNT = 6
	local lightningFrames = {}
	local frameIndex = 0
	for i = 1, FRAME_COUNT do
		local holder = Instance.new("Frame", LightningCanvas)
		holder.Size = UDim2.new(1, 0, 1, 0)
		holder.BackgroundTransparency = 1
		holder.ZIndex = 2
		holder.Visible = false
		local bolts = math.random(2, 4)
		for _ = 1, bolts do
			local edge = math.random(1, 4)
			local x1, y1, x2, y2
			if edge == 1 then x1, y1 = math.random(0, W), 0
			elseif edge == 2 then x1, y1 = math.random(0, W), H
			elseif edge == 3 then x1, y1 = 0, math.random(0, H)
			else x1, y1 = W, math.random(0, H) end
			x2 = math.random(W * 0.2, W * 0.8)
			y2 = math.random(H * 0.2, H * 0.8)
			generateLightning(holder, x1, y1, x2, y2, 3)
		end
		lightningFrames[i] = holder
	end

	local elapsed = 0
	local interval = 0.07
	local lconn
	lconn = RunService.Heartbeat:Connect(function(dt)
		if not Main or not Main.Parent then lconn:Disconnect() return end
		elapsed = elapsed + dt
		if elapsed >= interval then
			elapsed = 0
			if lightningFrames[frameIndex] then lightningFrames[frameIndex].Visible = false end
			frameIndex = (frameIndex % FRAME_COUNT) + 1
			if lightningFrames[frameIndex] then lightningFrames[frameIndex].Visible = true end
			interval = math.random(5, 12) / 100
		end
	end)

	local TabSidebar = Instance.new("Frame", Main)
	TabSidebar.Name = "TabSidebar"
	TabSidebar.Size = UDim2.new(0, TAB_W, 1, -40)
	TabSidebar.Position = UDim2.new(0, 0, 0, 40)
	TabSidebar.BackgroundColor3 = Color3.fromRGB(10, 7, 7)
	TabSidebar.BackgroundTransparency = 0.2
	TabSidebar.BorderSizePixel = 0
	TabSidebar.ZIndex = 8
	TabSidebar.Visible = false

	local SideStroke = Instance.new("UIStroke", TabSidebar)
	SideStroke.Color = YELLOW
	SideStroke.Thickness = 1
	SideStroke.Transparency = 0.5

	local SideList = Instance.new("UIListLayout", TabSidebar)
	SideList.SortOrder = Enum.SortOrder.LayoutOrder
	SideList.Padding = UDim.new(0, 5)
	SideList.HorizontalAlignment = Enum.HorizontalAlignment.Center

	local SidePad = Instance.new("UIPadding", TabSidebar)
	SidePad.PaddingTop = UDim.new(0, 6)

	local TopBar = Instance.new("Frame", Main)
	TopBar.Size = UDim2.new(1, 0, 0, 40)
	TopBar.BackgroundTransparency = 1
	TopBar.ZIndex = 9

	local TabToggleBtn = Instance.new("TextButton", TopBar)
	TabToggleBtn.Size = UDim2.new(0, 34, 0, 30)
	TabToggleBtn.Position = UDim2.new(0, 6, 0, 5)
	TabToggleBtn.BackgroundTransparency = 1
	TabToggleBtn.Text = "∆"
	TabToggleBtn.TextColor3 = YELLOW
	TabToggleBtn.Font = Enum.Font.GothamBold
	TabToggleBtn.TextSize = 18
	TabToggleBtn.ZIndex = 20

	local Title = Instance.new("TextLabel", TopBar)
	Title.Size = UDim2.new(1, -80, 1, 0)
	Title.Position = UDim2.new(0, 46, 0, 0)
	Title.BackgroundTransparency = 1
	Title.Text = title
	Title.TextColor3 = YELLOW
	Title.Font = Enum.Font.GothamBold
	Title.TextSize = 18
	Title.TextXAlignment = Enum.TextXAlignment.Left
	Title.ZIndex = 10

	local CloseBtn = Instance.new("TextButton", TopBar)
	CloseBtn.Size = UDim2.new(0, 30, 0, 30)
	CloseBtn.Position = UDim2.new(1, -35, 0, 5)
	CloseBtn.BackgroundTransparency = 1
	CloseBtn.Text = "−"
	CloseBtn.TextColor3 = YELLOW
	CloseBtn.Font = Enum.Font.GothamBold
	CloseBtn.TextSize = 22
	CloseBtn.ZIndex = 20

	local ContentArea = Instance.new("Frame", Main)
	ContentArea.Name = "ContentArea"
	ContentArea.Size = UDim2.new(1, 0, 1, -40)
	ContentArea.Position = UDim2.new(0, 0, 0, 40)
	ContentArea.BackgroundTransparency = 1
	ContentArea.ZIndex = 5

	local dragging, dragStart, startPos
	Main.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = Main.Position
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then dragging = false end
			end)
		end
	end)
	UIS.InputChanged:Connect(function(input)
		if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
			local delta = input.Position - dragStart
			Main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
		end
	end)

	local isOpen = true
	CloseBtn.MouseButton1Click:Connect(function()
		isOpen = not isOpen
		if isOpen then
			CloseBtn.Text = "−"
			TweenService:Create(Main, TweenInfo.new(0.5, Enum.EasingStyle.Quart), {Size = fullSize}):Play()
			task.delay(0.15, function()
				ContentArea.Visible = true
				TabSidebar.Visible = TabSidebar:GetAttribute("WasOpen") or false
			end)
		else
			CloseBtn.Text = "+"
			ContentArea.Visible = false
			TabSidebar.Visible = false
			TweenService:Create(Main, TweenInfo.new(0.5, Enum.EasingStyle.Quart), {Size = collapsedSize}):Play()
		end
	end)

	local sidebarOpen = false
	TabToggleBtn.MouseButton1Click:Connect(function()
		sidebarOpen = not sidebarOpen
		TabSidebar.Visible = sidebarOpen
		TabSidebar:SetAttribute("WasOpen", sidebarOpen)
		if sidebarOpen then
			ContentArea.Size = UDim2.new(1, -TAB_W, 1, 0)
			ContentArea.Position = UDim2.new(0, TAB_W, 0, 40)
		else
			ContentArea.Size = UDim2.new(1, 0, 1, 0)
			ContentArea.Position = UDim2.new(0, 0, 0, 40)
		end
	end)

	local tabs = {}
	local activeTab = nil
	local tabOrder = 0

	local Window = {}

	function Window:AddTab(tabConfig)
		tabConfig = tabConfig or {}
		local tabName = tabConfig.Name or "Tab"
		tabOrder = tabOrder + 1

		local TabIcon = Instance.new("TextButton", TabSidebar)
		TabIcon.Size = UDim2.new(0, 28, 0, 28)
		TabIcon.BackgroundColor3 = DARK2
		TabIcon.BackgroundTransparency = 0.3
		TabIcon.Text = tabConfig.Icon or tabName:sub(1, 2)
		TabIcon.TextColor3 = GRAY
		TabIcon.Font = Enum.Font.GothamBold
		TabIcon.TextSize = 11
		TabIcon.ZIndex = 9
		TabIcon.LayoutOrder = tabOrder
		Instance.new("UICorner", TabIcon).CornerRadius = UDim.new(0, 8)

		local TabStroke = Instance.new("UIStroke", TabIcon)
		TabStroke.Color = YELLOW
		TabStroke.Thickness = 1.2
		TabStroke.Transparency = 0.8

		local ScrollContainer = Instance.new("ScrollingFrame", ContentArea)
		ScrollContainer.Name = "Tab_" .. tabName
		ScrollContainer.Size = UDim2.new(1, 0, 1, 0)
		ScrollContainer.BackgroundTransparency = 1
		ScrollContainer.BorderSizePixel = 0
		ScrollContainer.ScrollBarThickness = 3
		ScrollContainer.ScrollBarImageColor3 = YELLOW
		ScrollContainer.AutomaticCanvasSize = Enum.AutomaticSize.Y
		ScrollContainer.ZIndex = 6
		ScrollContainer.Visible = false

		local Pad = Instance.new("UIPadding", ScrollContainer)
		Pad.PaddingLeft = UDim.new(0, 10)
		Pad.PaddingRight = UDim.new(0, 10)
		Pad.PaddingTop = UDim.new(0, 8)
		Pad.PaddingBottom = UDim.new(0, 10)

		local List = Instance.new("UIListLayout", ScrollContainer)
		List.SortOrder = Enum.SortOrder.LayoutOrder
		List.Padding = UDim.new(0, 7)

		local function activateTab()
			if activeTab then
				activeTab.Container.Visible = false
				TweenService:Create(activeTab.Stroke, TweenInfo.new(0.2), {Transparency = 0.8}):Play()
				TweenService:Create(activeTab.Icon, TweenInfo.new(0.2), {TextColor3 = GRAY}):Play()
			end
			activeTab = {Container = ScrollContainer, Stroke = TabStroke, Icon = TabIcon}
			ScrollContainer.Visible = true
			TweenService:Create(TabStroke, TweenInfo.new(0.2), {Transparency = 0}):Play()
			TweenService:Create(TabIcon, TweenInfo.new(0.2), {TextColor3 = YELLOW}):Play()
		end

		TabIcon.MouseButton1Click:Connect(activateTab)
		if #tabs == 0 then activateTab() end
		table.insert(tabs, {Container = ScrollContainer, Stroke = TabStroke, Icon = TabIcon})

		local itemOrder = 0
		local Tab = {}

		local function makeRow(h)
			itemOrder = itemOrder + 1
			local row = Instance.new("Frame", ScrollContainer)
			row.Size = UDim2.new(1, 0, 0, h or 38)
			row.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
			row.BackgroundTransparency = 0.55
			row.LayoutOrder = itemOrder
			row.ZIndex = 11
			Instance.new("UICorner", row).CornerRadius = UDim.new(0, 10)
			local s = Instance.new("UIStroke", row)
			s.Color = YELLOW
			s.Thickness = 1
			s.Transparency = 0.35
			return row, s
		end

		local function makeLabel(parent, text)
			local lbl = Instance.new("TextLabel", parent)
			lbl.Size = UDim2.new(0, 150, 1, 0)
			lbl.Position = UDim2.new(0, 14, 0, 0)
			lbl.BackgroundTransparency = 1
			lbl.Text = text
			lbl.TextColor3 = WHITE
			lbl.Font = Enum.Font.Gotham
			lbl.TextSize = 13
			lbl.TextXAlignment = Enum.TextXAlignment.Left
			lbl.ZIndex = 12
			return lbl
		end

		function Tab:AddButton(btnConfig)
			btnConfig = btnConfig or {}
			local name = btnConfig.Name or "Button"
			local callback = btnConfig.Callback or function() end

			local row, rStroke = makeRow(38)
			makeLabel(row, name)

			local clickHint = Instance.new("TextLabel", row)
			clickHint.Size = UDim2.new(0, 35, 1, 0)
			clickHint.Position = UDim2.new(1, -42, 0, 0)
			clickHint.BackgroundTransparency = 1
			clickHint.Text = "click"
			clickHint.TextColor3 = Color3.fromRGB(160, 120, 0)
			clickHint.Font = Enum.Font.Gotham
			clickHint.TextSize = 10
			clickHint.TextXAlignment = Enum.TextXAlignment.Right
			clickHint.ZIndex = 12

			local btn = Instance.new("TextButton", row)
			btn.Size = UDim2.new(1, 0, 1, 0)
			btn.BackgroundTransparency = 1
			btn.Text = ""
			btn.ZIndex = 13
			btn.MouseButton1Click:Connect(function()
				TweenService:Create(rStroke, TweenInfo.new(0.1), {Transparency = 0}):Play()
				task.delay(0.2, function()
					TweenService:Create(rStroke, TweenInfo.new(0.2), {Transparency = 0.35}):Play()
				end)
				callback()
			end)
		end

		function Tab:AddToggle(togConfig)
			togConfig = togConfig or {}
			local name = togConfig.Name or "Toggle"
			local default = togConfig.Default or false
			local callback = togConfig.Callback or function() end
			local state = default

			local row, rStroke = makeRow(38)
			makeLabel(row, name)

			local toggleTrack = Instance.new("Frame", row)
			toggleTrack.Size = UDim2.new(0, 40, 0, 22)
			toggleTrack.Position = UDim2.new(1, -52, 0.5, -11)
			toggleTrack.BackgroundColor3 = Color3.fromRGB(45, 35, 35)
			toggleTrack.BorderSizePixel = 0
			toggleTrack.ZIndex = 12
			Instance.new("UICorner", toggleTrack).CornerRadius = UDim.new(1, 0)

			local trackStroke = Instance.new("UIStroke", toggleTrack)
			trackStroke.Color = YELLOW
			trackStroke.Thickness = 1
			trackStroke.Transparency = 0.6

			local knob = Instance.new("Frame", toggleTrack)
			knob.Size = UDim2.new(0, 16, 0, 16)
			knob.Position = UDim2.new(0, 3, 0.5, -8)
			knob.BackgroundColor3 = WHITE
			knob.BorderSizePixel = 0
			knob.ZIndex = 13
			Instance.new("UICorner", knob).CornerRadius = UDim.new(1, 0)

			local function updateVisual(s)
				if s then
					TweenService:Create(toggleTrack, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(90, 65, 0)}):Play()
					TweenService:Create(trackStroke, TweenInfo.new(0.2), {Transparency = 0}):Play()
					TweenService:Create(knob, TweenInfo.new(0.2), {Position = UDim2.new(0, 21, 0.5, -8), BackgroundColor3 = YELLOW}):Play()
				else
					TweenService:Create(toggleTrack, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(45, 35, 35)}):Play()
					TweenService:Create(trackStroke, TweenInfo.new(0.2), {Transparency = 0.6}):Play()
					TweenService:Create(knob, TweenInfo.new(0.2), {Position = UDim2.new(0, 3, 0.5, -8), BackgroundColor3 = WHITE}):Play()
				end
			end

			updateVisual(state)

			local btn = Instance.new("TextButton", row)
			btn.Size = UDim2.new(1, 0, 1, 0)
			btn.BackgroundTransparency = 1
			btn.Text = ""
			btn.ZIndex = 14
			btn.MouseButton1Click:Connect(function()
				state = not state
				updateVisual(state)
				callback(state)
			end)
		end

		function Tab:AddInput(inputConfig)
			inputConfig = inputConfig or {}
			local name = inputConfig.Name or "Input"
			local placeholder = inputConfig.Placeholder or "Enter text..."
			local callback = inputConfig.Callback or function() end

			local row, rStroke = makeRow(38)
			makeLabel(row, name)

			local inputBg = Instance.new("Frame", row)
			inputBg.Size = UDim2.new(0, 170, 0, 24)
			inputBg.Position = UDim2.new(1, -178, 0.5, -12)
			inputBg.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
			inputBg.BackgroundTransparency = 0.55
			inputBg.ZIndex = 12
			Instance.new("UICorner", inputBg).CornerRadius = UDim.new(0, 8)

			local inputStroke = Instance.new("UIStroke", inputBg)
			inputStroke.Color = YELLOW
			inputStroke.Thickness = 1
			inputStroke.Transparency = 0.55

			local textBox = Instance.new("TextBox", inputBg)
			textBox.Size = UDim2.new(1, -10, 1, 0)
			textBox.Position = UDim2.new(0, 7, 0, 0)
			textBox.BackgroundTransparency = 1
			textBox.Text = ""
			textBox.PlaceholderText = placeholder
			textBox.TextColor3 = WHITE
			textBox.PlaceholderColor3 = GRAY
			textBox.Font = Enum.Font.Gotham
			textBox.TextSize = 12
			textBox.TextXAlignment = Enum.TextXAlignment.Left
			textBox.ClearTextOnFocus = false
			textBox.ZIndex = 13

			textBox.Focused:Connect(function()
				TweenService:Create(inputStroke, TweenInfo.new(0.15), {Transparency = 0}):Play()
			end)
			textBox.FocusLost:Connect(function(enter)
				TweenService:Create(inputStroke, TweenInfo.new(0.15), {Transparency = 0.55}):Play()
				if enter then callback(textBox.Text) end
			end)
		end

		function Tab:AddDropdown(dropConfig)
			dropConfig = dropConfig or {}
			local name = dropConfig.Name or "Dropdown"
			local options = dropConfig.Options or {}
			local callback = dropConfig.Callback or function() end
			local selected = options[1] or "Select"
			local isDropOpen = false

			local row, rStroke = makeRow(38)
			row.ClipsDescendants = false
			makeLabel(row, name)

			local dropBox = Instance.new("Frame", row)
			dropBox.Size = UDim2.new(0, 170, 0, 24)
			dropBox.Position = UDim2.new(1, -178, 0.5, -12)
			dropBox.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
			dropBox.BackgroundTransparency = 0.55
			dropBox.ZIndex = 12
			Instance.new("UICorner", dropBox).CornerRadius = UDim.new(0, 8)

			local dropStroke = Instance.new("UIStroke", dropBox)
			dropStroke.Color = YELLOW
			dropStroke.Thickness = 1
			dropStroke.Transparency = 0.55

			local selLabel = Instance.new("TextLabel", dropBox)
			selLabel.Size = UDim2.new(1, -22, 1, 0)
			selLabel.Position = UDim2.new(0, 7, 0, 0)
			selLabel.BackgroundTransparency = 1
			selLabel.Text = selected
			selLabel.TextColor3 = WHITE
			selLabel.Font = Enum.Font.Gotham
			selLabel.TextSize = 12
			selLabel.TextXAlignment = Enum.TextXAlignment.Left
			selLabel.ZIndex = 13

			local arrow = Instance.new("TextLabel", dropBox)
			arrow.Size = UDim2.new(0, 16, 1, 0)
			arrow.Position = UDim2.new(1, -18, 0, 0)
			arrow.BackgroundTransparency = 1
			arrow.Text = "v"
			arrow.TextColor3 = YELLOW
			arrow.Font = Enum.Font.GothamBold
			arrow.TextSize = 11
			arrow.ZIndex = 13
			arrow.Rotation = 0

			local optionHeight = 26
			local totalHeight = #options * (optionHeight + 2) + 8

			local dropList = Instance.new("Frame", row)
			dropList.Size = UDim2.new(0, 170, 0, 0)
			dropList.Position = UDim2.new(1, -178, 0, 38)
			dropList.BackgroundColor3 = Color3.fromRGB(8, 6, 6)
			dropList.BackgroundTransparency = 0.1
			dropList.BorderSizePixel = 0
			dropList.ZIndex = 30
			dropList.ClipsDescendants = true
			Instance.new("UICorner", dropList).CornerRadius = UDim.new(0, 8)

			local dlStroke = Instance.new("UIStroke", dropList)
			dlStroke.Color = YELLOW
			dlStroke.Thickness = 1
			dlStroke.Transparency = 0.4

			local dlList = Instance.new("UIListLayout", dropList)
			dlList.SortOrder = Enum.SortOrder.LayoutOrder
			dlList.Padding = UDim.new(0, 2)

			local dlPad = Instance.new("UIPadding", dropList)
			dlPad.PaddingTop = UDim.new(0, 4)
			dlPad.PaddingBottom = UDim.new(0, 4)
			dlPad.PaddingLeft = UDim.new(0, 4)
			dlPad.PaddingRight = UDim.new(0, 4)

			for idx, opt in ipairs(options) do
				local optBtn = Instance.new("TextButton", dropList)
				optBtn.Size = UDim2.new(1, 0, 0, optionHeight)
				optBtn.BackgroundColor3 = Color3.fromRGB(20, 15, 15)
				optBtn.BackgroundTransparency = 0.5
				optBtn.Text = opt
				optBtn.TextColor3 = WHITE
				optBtn.Font = Enum.Font.Gotham
				optBtn.TextSize = 12
				optBtn.ZIndex = 31
				optBtn.LayoutOrder = idx
				Instance.new("UICorner", optBtn).CornerRadius = UDim.new(0, 5)

				optBtn.MouseEnter:Connect(function()
					TweenService:Create(optBtn, TweenInfo.new(0.1), {BackgroundTransparency = 0.1, TextColor3 = YELLOW}):Play()
				end)
				optBtn.MouseLeave:Connect(function()
					TweenService:Create(optBtn, TweenInfo.new(0.1), {BackgroundTransparency = 0.5, TextColor3 = WHITE}):Play()
				end)
				optBtn.MouseButton1Click:Connect(function()
					selected = opt
					selLabel.Text = opt
					isDropOpen = false
					TweenService:Create(dropList, TweenInfo.new(0.25, Enum.EasingStyle.Quart), {Size = UDim2.new(0, 170, 0, 0)}):Play()
					TweenService:Create(arrow, TweenInfo.new(0.25), {Rotation = 0}):Play()
					callback(opt)
				end)
			end

			local dropBtn = Instance.new("TextButton", dropBox)
			dropBtn.Size = UDim2.new(1, 0, 1, 0)
			dropBtn.BackgroundTransparency = 1
			dropBtn.Text = ""
			dropBtn.ZIndex = 14
			dropBtn.MouseButton1Click:Connect(function()
				isDropOpen = not isDropOpen
				if isDropOpen then
					TweenService:Create(dropList, TweenInfo.new(0.3, Enum.EasingStyle.Quart), {Size = UDim2.new(0, 170, 0, totalHeight)}):Play()
					TweenService:Create(arrow, TweenInfo.new(0.25), {Rotation = 180}):Play()
				else
					TweenService:Create(dropList, TweenInfo.new(0.25, Enum.EasingStyle.Quart), {Size = UDim2.new(0, 170, 0, 0)}):Play()
					TweenService:Create(arrow, TweenInfo.new(0.25), {Rotation = 0}):Play()
				end
			end)
		end

		return Tab
	end

	return Window
end

return NyzScriptsLibrary
