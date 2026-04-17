--[[

NoviraField Interface Suite
by Meta

Original by Sirius
Modified by RyuuTrace

-------------------------------
Arrays  | Designing + Programming + New Features

]]

local Release = "Release 2A"
local NotificationDuration = 6.5
local NoviraFieldFolder = "NoviraField"
local ConfigurationFolder = NoviraFieldFolder.."/Configurations"
local ConfigurationExtension = ".rfld"
local NoviraFieldQuality = {}

local NoviraFieldLibrary = {
	Flags = {},
	Theme = {
		Default = {
			TextFont = "Default",
			TextColor = Color3.fromRGB(240, 240, 240),

			Background = Color3.fromRGB(25, 25, 25),
			Topbar = Color3.fromRGB(34, 34, 34),
			Shadow = Color3.fromRGB(20, 20, 20),

			NotificationBackground = Color3.fromRGB(20, 20, 20),
			NotificationActionsBackground = Color3.fromRGB(230, 230, 230),

			TabBackground = Color3.fromRGB(80, 80, 80),
			TabStroke = Color3.fromRGB(85, 85, 85),
			TabBackgroundSelected = Color3.fromRGB(210, 210, 210),
			TabTextColor = Color3.fromRGB(240, 240, 240),
			SelectedTabTextColor = Color3.fromRGB(50, 50, 50),

			ElementBackground = Color3.fromRGB(35, 35, 35),
			ElementBackgroundHover = Color3.fromRGB(40, 40, 40),
			SecondaryElementBackground = Color3.fromRGB(25, 25, 25),
			ElementStroke = Color3.fromRGB(50, 50, 50),
			SecondaryElementStroke = Color3.fromRGB(40, 40, 40),

			SliderBackground = Color3.fromRGB(43, 105, 159),
			SliderProgress = Color3.fromRGB(43, 105, 159),
			SliderStroke = Color3.fromRGB(48, 119, 177),

			ToggleBackground = Color3.fromRGB(30, 30, 30),
			ToggleEnabled = Color3.fromRGB(0, 146, 214),
			ToggleDisabled = Color3.fromRGB(100, 100, 100),
			ToggleEnabledStroke = Color3.fromRGB(0, 170, 255),
			ToggleDisabledStroke = Color3.fromRGB(125, 125, 125),
			ToggleEnabledOuterStroke = Color3.fromRGB(100, 100, 100),
			ToggleDisabledOuterStroke = Color3.fromRGB(65, 65, 65),

			InputBackground = Color3.fromRGB(30, 30, 30),
			InputStroke = Color3.fromRGB(65, 65, 65),
			PlaceholderColor = Color3.fromRGB(178, 178, 178)
		},
		Light = {
			TextFont = "Gotham",
			TextColor = Color3.fromRGB(50, 50, 50),

			Background = Color3.fromRGB(255, 255, 255),
			Topbar = Color3.fromRGB(217, 217, 217),
			Shadow = Color3.fromRGB(223, 223, 223),

			NotificationBackground = Color3.fromRGB(20, 20, 20),
			NotificationActionsBackground = Color3.fromRGB(230, 230, 230),

			TabBackground = Color3.fromRGB(220, 220, 220),
			TabStroke = Color3.fromRGB(112, 112, 112),
			TabBackgroundSelected = Color3.fromRGB(0, 142, 208),
			TabTextColor = Color3.fromRGB(240, 240, 240),
			SelectedTabTextColor = Color3.fromRGB(50, 50, 50),

			ElementBackground = Color3.fromRGB(198, 198, 198),
			ElementBackgroundHover = Color3.fromRGB(230, 230, 230),
			SecondaryElementBackground = Color3.fromRGB(136, 136, 136),
			ElementStroke = Color3.fromRGB(180, 199, 97),
			SecondaryElementStroke = Color3.fromRGB(40, 40, 40),

			SliderBackground = Color3.fromRGB(31, 159, 71),
			SliderProgress = Color3.fromRGB(31, 159, 71),
			SliderStroke = Color3.fromRGB(42, 216, 94),

			ToggleBackground = Color3.fromRGB(170, 203, 60),
			ToggleEnabled = Color3.fromRGB(32, 214, 29),
			ToggleDisabled = Color3.fromRGB(100, 22, 23),
			ToggleEnabledStroke = Color3.fromRGB(17, 255, 0),
			ToggleDisabledStroke = Color3.fromRGB(65, 8, 8),
			ToggleEnabledOuterStroke = Color3.fromRGB(0, 170, 0),
			ToggleDisabledOuterStroke = Color3.fromRGB(170, 0, 0),

			InputBackground = Color3.fromRGB(31, 159, 71),
			InputStroke = Color3.fromRGB(19, 65, 31),
			PlaceholderColor = Color3.fromRGB(178, 178, 178)
		},
	}
}

local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local LocalPlayer = game:GetService('Players').LocalPlayer

local NoviraField = game:GetObjects("rbxassetid://13853811008")[1]
NoviraField.Enabled = false
local spawn = task.spawn
local delay = task.delay

if game["Run Service"]:IsStudio() then
	function gethui() return NoviraField end local http_request = nil local syn = {protect_gui = false,request = false,}local http = nil function writefile(tt,t,ttt)end function isfolder(t)end function makefolder(t)end function isfile(r)end function readfile(t)end
end

pcall(function()
	_G.LastRayField.Name = 'Old NoviraField'
	_G.LastRayField.Enabled = false
end)
local ParentObject = function(Gui)
	local success, failure = pcall(function()
		if get_hidden_gui or gethui then
			local hiddenUI = get_hidden_gui or gethui
			Gui.Parent = hiddenUI()
		elseif (not is_sirhurt_closure) and (syn and syn.protect_gui) then
			syn.protect_gui(Gui)
			Gui.Parent = CoreGui
		elseif CoreGui then
			Gui.Parent = CoreGui
		end
	end)
	if not success and failure then
		Gui.Parent = LocalPlayer:FindFirstChildWhichIsA("PlayerGui")
	end
	_G.LastRayField = NoviraField
end
ParentObject(NoviraField)

local Camera = workspace.CurrentCamera
local Main = NoviraField.Main
local Topbar = Main.Topbar
local Elements = Main.Elements
local LoadingFrame = Main.LoadingFrame
local TopList = Main.TabList
local SideList = Main.SideTabList.Holder
local TabsList = TopList and SideList
local SearchBar = Main.Searchbar
local Filler = SearchBar.CanvasGroup.Filler
local Prompt = Main.Prompt
local NotePrompt = Main.NotePrompt
local InfoPrompt = NoviraField.Info

NoviraField.DisplayOrder = 100
Elements.UIPageLayout.TouchInputEnabled = false
LoadingFrame.Version.Text = Release

local request = request or (syn and syn.request) or (http and http.request) or http_request
local CFileName = nil
local CEnabled = false
local Minimised = false
local Hidden = false
local Debounce = false
local clicked = false
local SearchHided = true
local SideBarClosed = true
local InfoPromptOpen = false
local BarType = 'Side'
local HoverTime = 0.3
local Notifications = NoviraField.Notifications

local SelectedTheme = NoviraFieldLibrary.Theme.Default

function ChangeTheme(ThemeName)
	SelectedTheme = NoviraField.Theme[ThemeName]
	for _, obj in ipairs(NoviraField:GetDescendants()) do
		if obj.ClassName == "TextLabel" or obj.ClassName == "TextBox" or obj.ClassName == "TextButton" then
			if SelectedTheme.TextFont ~= "Default" then
				obj.TextColor3 = SelectedTheme.TextColor
				obj.Font = SelectedTheme.TextFont
			end
		end
	end
	NoviraField.Main.BackgroundColor3 = SelectedTheme.Background
	NoviraField.Main.Topbar.BackgroundColor3 = SelectedTheme.Topbar
	NoviraField.Main.Topbar.CornerRepair.BackgroundColor3 = SelectedTheme.Topbar
	NoviraField.Main.Shadow.Image.ImageColor3 = SelectedTheme.Shadow
	NoviraField.Main.Topbar.ChangeSize.ImageColor3 = SelectedTheme.TextColor
	NoviraField.Main.Topbar.Hide.ImageColor3 = SelectedTheme.TextColor
	NoviraField.Main.Topbar.Theme.ImageColor3 = SelectedTheme.TextColor
	for _, TabPage in ipairs(Elements:GetChildren()) do
		for _, Element in ipairs(TabPage:GetChildren()) do
			if Element.ClassName == "Frame" and Element.Name ~= "Placeholder" and Element.Name ~= "SectionSpacing" and Element.Name ~= "" then
				Element.BackgroundColor3 = SelectedTheme.ElementBackground
				Element.UIStroke.Color = SelectedTheme.ElementStroke
			end
		end
	end
end

local function AddDraggingFunctionality(DragPoint, Main)
	pcall(function()
		local Dragging, DragInput, MousePos, FramePos, Conduct = false,false,false,false,false
		UserInputService.InputBegan:Connect(function(Input)
			if (Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch) then
				Conduct = true
				Input.Changed:Connect(function()
					if Input.UserInputState == Enum.UserInputState.End then
						Conduct = false
					end
				end)
			end
		end)
		DragPoint.InputBegan:Connect(function(Input)
			if (Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch) and not Conduct then
				Dragging = true
				MousePos = Input.Position
				FramePos = Main.Position
				Input.Changed:Connect(function()
					if Input.UserInputState == Enum.UserInputState.End then
						Dragging = false
					end
				end)
			end
		end)
		DragPoint.InputChanged:Connect(function(Input)
			if (Input.UserInputType == Enum.UserInputType.MouseMovement or Input.UserInputType == Enum.UserInputType.Touch) then
				DragInput = Input
			end
		end)
		UserInputService.InputChanged:Connect(function(Input)
			if Input == DragInput and Dragging then
				local Delta = Input.Position - MousePos
				TweenService:Create(Main, TweenInfo.new(0.45, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Position = UDim2.new(FramePos.X.Scale,FramePos.X.Offset + Delta.X, FramePos.Y.Scale, FramePos.Y.Offset + Delta.Y)}):Play()
				TweenService:Create(InfoPrompt, TweenInfo.new(0.6, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Position = UDim2.new(FramePos.X.Scale,FramePos.X.Offset + Delta.X + 370, FramePos.Y.Scale, FramePos.Y.Offset + Delta.Y)}):Play()
			end
		end)
	end)
end

function BoolToText(Bool)
	if Bool == true then
		return 'ENABLED', Color3.fromRGB(44, 186, 44)
	else
		return 'DISABLED', Color3.fromRGB(186, 44, 44)
	end
end

local function FadeDescription(Infos, type, Out)
	local Size = UDim2.fromOffset(230, 275)
	local Transparency = 0
	local WaitTime = .05
	if Out then
		Size = UDim2.fromOffset(212, 254)
		Transparency = 1
		WaitTime = nil
	end
	if not Out then
		if type == 'slider' then
			InfoPrompt.Status.Text = Infos.CurrentValue
		elseif type == 'button' then
			InfoPrompt.Status.Text = 'Clickable'
		elseif type == 'toggle' then
			InfoPrompt.Status.Text, InfoPrompt.Status.TextColor3 = BoolToText(Infos.CurrentValue)
		elseif type == 'dropdown' then
		elseif type == 'colorpicker' then
			InfoPrompt.Status.Text = Infos.Color.R..Infos.Color.G..Infos.Color.B
		end
		if Infos and Infos["Info"] and not Infos.Info["Image"] then
			InfoPrompt.ImageLabel.Visible = false
			InfoPrompt.Description.Position = InfoPrompt.ImageLabel.Position
		elseif Infos and Infos["Info"] and Infos.Info["Image"] then
			InfoPrompt.ImageLabel.Visible = true
			InfoPrompt.ImageLabel.Image = 'rbxassetid://'..Infos.Info["Image"]
			InfoPrompt.Description.Position = UDim2.new(.5, 0, 0, 160)
		end
		if Infos and Infos["Info"] then
			InfoPrompt.Title.Text = Infos.Info.Title
			InfoPrompt.Description.Text = Infos.Info.Description
		end
	end
	TweenService:Create(InfoPrompt, TweenInfo.new(.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Size = Size, BackgroundTransparency = Transparency}):Play()
	TweenService:Create(InfoPrompt.ImageLabel, TweenInfo.new(.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {ImageTransparency = Transparency}):Play()
	TweenService:Create(InfoPrompt.Description, TweenInfo.new(.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextTransparency = Transparency}):Play()
	TweenService:Create(InfoPrompt.Status, TweenInfo.new(.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextTransparency = Transparency}):Play()
	TweenService:Create(InfoPrompt.Title, TweenInfo.new(.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextTransparency = Transparency}):Play()
end

function AddInfos(Object, Settings, type)
	Object.MouseEnter:Connect(function(input)
		if Settings and Settings.Info then
			InfoPromptOpen = true
			FadeDescription(Settings, type)
		end
	end)
	Object.MouseLeave:Connect(function()
		FadeDescription(nil, nil, true)
	end)
end

local function PackColor(Color)
	return {R = Color.R * 255, G = Color.G * 255, B = Color.B * 255}
end

local function UnpackColor(Color)
	return Color3.fromRGB(Color.R, Color.G, Color.B)
end

local function LoadConfiguration(Configuration)
	local Data = HttpService:JSONDecode(Configuration)
	for FlagName, FlagValue in next, Data do
		if NoviraFieldLibrary.Flags[FlagName] then
			spawn(function()
				if NoviraFieldLibrary.Flags[FlagName].Type == "ColorPicker" then
					NoviraFieldLibrary.Flags[FlagName]:Set(UnpackColor(FlagValue))
				else
					if NoviraFieldLibrary.Flags[FlagName].CurrentValue or NoviraFieldLibrary.Flags[FlagName].CurrentKeybind or NoviraFieldLibrary.Flags[FlagName].CurrentOption or NoviraFieldLibrary.Flags[FlagName].Color ~= FlagValue then NoviraFieldLibrary.Flags[FlagName]:Set(FlagValue) end
				end
			end)
		else
			NoviraFieldLibrary:Notify({Title = "Flag Error", Content = "NoviraField was unable to find '"..FlagName.."' in the current script"})
		end
	end
end

local function SaveConfiguration()
	if not CEnabled then return end
	local Data = {}
	for i, v in pairs(NoviraFieldLibrary.Flags) do
		if v.Type == "ColorPicker" then
			Data[i] = PackColor(v.Color)
		else
			Data[i] = v.CurrentValue or v.CurrentKeybind or v.Color or v.CurrentOption
		end
	end
	writefile(ConfigurationFolder .. "/" .. CFileName .. ConfigurationExtension, tostring(HttpService:JSONEncode(Data)))
end

local neon = (function()
	local module = {}
	do
		local function IsNotNaN(x)
			return x == x
		end
		local continued = IsNotNaN(Camera:ScreenPointToRay(0,0).Origin.x)
		while not continued do
			RunService.RenderStepped:wait()
			continued = IsNotNaN(Camera:ScreenPointToRay(0,0).Origin.x)
		end
	end
	local RootParent = Camera
	if false == nil then RootParent = Camera
	else if not false then RootParent = Camera else RootParent = nil end
	end
	local binds = {}
	local root = Instance.new('Folder', RootParent)
	root.Name = 'neon'
	local GenUid; do
		local id = 0
		function GenUid()
			id = id + 1
			return 'neon::'..tostring(id)
		end
	end
	local DrawQuad; do
		local acos, max, pi, sqrt = math.acos, math.max, math.pi, math.sqrt
		local sz = 0.2
		local function DrawTriangle(v1, v2, v3, p0, p1)
			local s1 = (v1 - v2).magnitude
			local s2 = (v2 - v3).magnitude
			local s3 = (v3 - v1).magnitude
			local smax = max(s1, s2, s3)
			local A, B, C
			if s1 == smax then A, B, C = v1, v2, v3
			elseif s2 == smax then A, B, C = v2, v3, v1
			elseif s3 == smax then A, B, C = v3, v1, v2
			end
			local para = ((B-A).x*(C-A).x + (B-A).y*(C-A).y + (B-A).z*(C-A).z) / (A-B).magnitude
			local perp = sqrt((C-A).magnitude^2 - para*para)
			local dif_para = (A - B).magnitude - para
			local st = CFrame.new(B, A)
			local za = CFrame.Angles(pi/2, 0, 0)
			local cf0 = st
			local Top_Look = (cf0 * za).lookVector
			local Mid_Point = A + CFrame.new(A, B).LookVector * para
			local Needed_Look = CFrame.new(Mid_Point, C).LookVector
			local dot = Top_Look.x*Needed_Look.x + Top_Look.y*Needed_Look.y + Top_Look.z*Needed_Look.z
			local ac = CFrame.Angles(0, 0, acos(dot))
			cf0 = cf0 * ac
			if ((cf0 * za).lookVector - Needed_Look).magnitude > 0.01 then cf0 = cf0 * CFrame.Angles(0, 0, -2*acos(dot)) end
			cf0 = cf0 * CFrame.new(0, perp/2, -(dif_para + para/2))
			local cf1 = st * ac * CFrame.Angles(0, pi, 0)
			if ((cf1 * za).lookVector - Needed_Look).magnitude > 0.01 then cf1 = cf1 * CFrame.Angles(0, 0, 2*acos(dot)) end
			cf1 = cf1 * CFrame.new(0, perp/2, dif_para/2)
			if not p0 then
				p0 = Instance.new('Part')
				p0.FormFactor = 'Custom'
				p0.TopSurface = 0
				p0.BottomSurface = 0
				p0.Anchored = true
				p0.CanCollide = false
				p0.Material = 'Glass'
				p0.Size = Vector3.new(sz, sz, sz)
				local mesh = Instance.new('SpecialMesh', p0)
				mesh.MeshType = 2
				mesh.Name = 'WedgeMesh'
			end
			p0.WedgeMesh.Scale = Vector3.new(0, perp/sz, para/sz)
			p0.CFrame = cf0
			if not p1 then p1 = p0:clone() end
			p1.WedgeMesh.Scale = Vector3.new(0, perp/sz, dif_para/sz)
			p1.CFrame = cf1
			return p0, p1
		end
		function DrawQuad(v1, v2, v3, v4, parts)
			parts[1], parts[2] = DrawTriangle(v1, v2, v3, parts[1], parts[2])
			parts[3], parts[4] = DrawTriangle(v3, v2, v4, parts[3], parts[4])
		end
	end
	function module:BindFrame(frame, properties)
		if RootParent == nil then return end
		if binds[frame] then return binds[frame].parts end
		local uid = GenUid()
		local parts = {}
		local f = Instance.new('Folder', root)
		f.Name = frame.Name
		local parents = {}
		do
			local function add(child)
				if child:IsA'GuiObject' then
					parents[#parents + 1] = child
					add(child.Parent)
				end
			end
			add(frame)
		end
		local function UpdateOrientation(fetchProps)
			local zIndex = 1 - 0.05*frame.ZIndex
			local tl, br = frame.AbsolutePosition, frame.AbsolutePosition + frame.AbsoluteSize
			local tr, bl = Vector2.new(br.x, tl.y), Vector2.new(tl.x, br.y)
			do
				local rot = 0
				for _, v in ipairs(parents) do rot = rot + v.Rotation end
				if rot ~= 0 and rot%180 ~= 0 then
					local mid = tl:lerp(br, 0.5)
					local s, c = math.sin(math.rad(rot)), math.cos(math.rad(rot))
					tl = Vector2.new(c*(tl.x-mid.x)-s*(tl.y-mid.y), s*(tl.x-mid.x)+c*(tl.y-mid.y)) + mid
					tr = Vector2.new(c*(tr.x-mid.x)-s*(tr.y-mid.y), s*(tr.x-mid.x)+c*(tr.y-mid.y)) + mid
					bl = Vector2.new(c*(bl.x-mid.x)-s*(bl.y-mid.y), s*(bl.x-mid.x)+c*(bl.y-mid.y)) + mid
					br = Vector2.new(c*(br.x-mid.x)-s*(br.y-mid.y), s*(br.x-mid.x)+c*(br.y-mid.y)) + mid
				end
			end
			DrawQuad(
				Camera:ScreenPointToRay(tl.x, tl.y, zIndex).Origin,
				Camera:ScreenPointToRay(tr.x, tr.y, zIndex).Origin,
				Camera:ScreenPointToRay(bl.x, bl.y, zIndex).Origin,
				Camera:ScreenPointToRay(br.x, br.y, zIndex).Origin,
				parts
			)
			if fetchProps then
				for _, pt in pairs(parts) do pt.Parent = f end
				for propName, propValue in pairs(properties) do
					for _, pt in pairs(parts) do pt[propName] = propValue end
				end
			end
		end
		UpdateOrientation(true)
		RunService:BindToRenderStep(uid, 2000, UpdateOrientation)
		binds[frame] = {uid = uid; parts = parts;}
		return binds[frame].parts
	end
	function module:Modify(frame, properties)
		local parts = module:GetBoundParts(frame)
		if parts then
			for propName, propValue in pairs(properties) do
				for _, pt in pairs(parts) do pt[propName] = propValue end
			end
		end
	end
	function module:UnbindFrame(frame)
		if RootParent == nil then return end
		local cb = binds[frame]
		if cb then
			RunService:UnbindFromRenderStep(cb.uid)
			for _, v in pairs(cb.parts) do v:Destroy() end
			binds[frame] = nil
		end
	end
	function module:HasBinding(frame) return binds[frame] ~= nil end
	function module:GetBoundParts(frame) return binds[frame] and binds[frame].parts end
	return module
end)()

function CloseNPrompt()
	local Infos = TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
	TweenService:Create(NotePrompt, Infos, {BackgroundTransparency = 1, Size = UDim2.fromOffset(436,92), Position = UDim2.fromScale(0.5,0.19)}):Play()
	TweenService:Create(NotePrompt.UIStroke, Infos, {Transparency = 1}):Play()
	TweenService:Create(NotePrompt.Shadow.Image, Infos, {ImageTransparency = 1}):Play()
	TweenService:Create(NotePrompt.Close, Infos, {ImageTransparency = .1}):Play()
	TweenService:Create(NotePrompt.Icon, Infos, {ImageTransparency = 1}):Play()
	TweenService:Create(NotePrompt.Title, Infos, {TextTransparency = 1}):Play()
	TweenService:Create(NotePrompt.Description, Infos, {TextTransparency = 1}):Play()
	TweenService:Create(NotePrompt.Load, Infos, {TextTransparency = 1, BackgroundTransparency = 1}):Play()
	TweenService:Create(NotePrompt.Load.UIStroke, Infos, {Transparency = 1}):Play()
	TweenService:Create(NotePrompt.Load.Shadow, Infos, {ImageTransparency = 1}):Play()
	wait(0.21)
	NotePrompt.Visible = false
end

function qNotePrompt(PromptSettings)
	local Infos = TweenInfo.new(.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
	NotePrompt.Visible = false
	NotePrompt.Size = UDim2.fromOffset(436,92)
	NotePrompt.Position = UDim2.fromScale(0.5,0.19)
	NotePrompt.BackgroundTransparency = 1
	NotePrompt.UIStroke.Transparency = 1
	NotePrompt.Icon.ImageTransparency = 1
	NotePrompt.Close.ImageTransparency = 1
	NotePrompt.Shadow.Image.ImageTransparency = 1
	NotePrompt.Title.TextTransparency = 1
	NotePrompt.Description.TextTransparency = 1
	NotePrompt.Load.BackgroundTransparency = 1
	NotePrompt.Load.UIStroke.Transparency = 1
	NotePrompt.Load.TextTransparency = 1
	NotePrompt.Load.Shadow.ImageTransparency = 1
	NotePrompt.Title.Text = PromptSettings.Title or ''
	NotePrompt.Description.Text = PromptSettings.Description or ''
	NotePrompt.Icon.Image = PromptSettings.Icon or 'rbxassetid://4483362748'
	NotePrompt.Load.BackgroundColor3 = PromptSettings.Color or Color3.fromRGB(90, 90, 90)
	NotePrompt.Load.MouseButton1Down:Once(function(x,y)
		CloseNPrompt()
		if PromptSettings.Callback then PromptSettings.Callback() end
	end)
	NotePrompt.Close.MouseButton1Down:Once(function() CloseNPrompt() end)
	NotePrompt.Visible = true
	TweenService:Create(NotePrompt, Infos, {BackgroundTransparency = .1, Size = UDim2.fromOffset(474,100), Position = UDim2.fromScale(0.5,0.21)}):Play()
	TweenService:Create(NotePrompt.UIStroke, Infos, {Transparency = 0}):Play()
	TweenService:Create(NotePrompt.Shadow.Image, Infos, {ImageTransparency = .2}):Play()
	wait(.3)
	TweenService:Create(NotePrompt.Close, Infos, {ImageTransparency = .8}):Play()
	TweenService:Create(NotePrompt.Icon, Infos, {ImageTransparency = 0}):Play()
	TweenService:Create(NotePrompt.Title, Infos, {TextTransparency = 0}):Play()
	wait(.1)
	TweenService:Create(NotePrompt.Description, Infos, {TextTransparency = 0}):Play()
	wait(.2)
	TweenService:Create(NotePrompt.Load, Infos, {TextTransparency = 0, BackgroundTransparency = .2}):Play()
	TweenService:Create(NotePrompt.Load.UIStroke, Infos, {Transparency = 0}):Play()
	TweenService:Create(NotePrompt.Load.Shadow, Infos, {ImageTransparency = .8}):Play()
end

function ClosePrompt()
	local PromptUI = Prompt.Prompt
	clicked = false
	TweenService:Create(Prompt, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
	TweenService:Create(PromptUI, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {BackgroundTransparency = 1, Size = UDim2.new(0,340,0,140)}):Play()
	TweenService:Create(PromptUI.UIStroke, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
	TweenService:Create(PromptUI.Title, TweenInfo.new(0.45, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
	TweenService:Create(PromptUI.Content, TweenInfo.new(0.45, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
	TweenService:Create(PromptUI.Sub, TweenInfo.new(0.45, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
	for _, button in pairs(PromptUI.Buttons:GetChildren()) do
		if button.Name ~= 'Template' and button:IsA("Frame") then
			TweenService:Create(button.UIStroke, TweenInfo.new(0.2, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
			TweenService:Create(button.TextLabel, TweenInfo.new(0.2, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
			delay(.2, function() button:Destroy() end)
		end
	end
	wait(.5)
	Prompt.Visible = false
end

function NoviraFieldLibrary:Notify(NotificationSettings)
	spawn(function()
		local ActionCompleted = true
		local Notification = Notifications.Template:Clone()
		Notification.Parent = Notifications
		Notification.Active = false
		Notification.Name = NotificationSettings.Title or "Unknown Title"
		Notification.Visible = true
		local blurlight = nil
		if not false then
			blurlight = Instance.new("DepthOfFieldEffect", game:GetService("Lighting"))
			blurlight.Enabled = true
			blurlight.FarIntensity = 0
			blurlight.FocusDistance = 51.6
			blurlight.InFocusRadius = 50
			blurlight.NearIntensity = 1
			if script then game:GetService("Debris"):AddItem(script, 0) end
		end
		Notification.Actions.Template.Visible = false
		if NotificationSettings.Actions then
			for _, Action in pairs(NotificationSettings.Actions) do
				ActionCompleted = false
				local NewAction = Notification.Actions.Template:Clone()
				NewAction.Active = false
				NewAction.BackgroundColor3 = SelectedTheme.NotificationActionsBackground
				if SelectedTheme ~= NoviraFieldLibrary.Theme.Default then
					NewAction.TextColor3 = SelectedTheme.TextColor
				end
				NewAction.Name = Action.Name
				NewAction.Visible = true
				NewAction.Parent = Notification.Actions
				NewAction.Text = Action.Name
				NewAction.BackgroundTransparency = 1
				NewAction.TextTransparency = 1
				NewAction.Size = UDim2.new(0, NewAction.TextBounds.X + 27, 0, 36)
				NewAction.MouseButton1Click:Connect(function()
					local Success, Response = pcall(Action.Callback)
					if not Success then
						print("NoviraField | Action: "..Action.Name.." Callback Error "..tostring(Response))
					end
					ActionCompleted = true
				end)
			end
		end
		Notification.BackgroundColor3 = SelectedTheme.Background
		Notification.Title.Text = NotificationSettings.Title or "Unknown"
		Notification.Title.TextTransparency = 1
		Notification.Title.TextColor3 = SelectedTheme.TextColor
		Notification.Description.Text = NotificationSettings.Content or "Unknown"
		Notification.Description.TextTransparency = 1
		Notification.Description.TextColor3 = SelectedTheme.TextColor
		Notification.Icon.ImageColor3 = SelectedTheme.TextColor
		if NotificationSettings.Image then
			Notification.Icon.Image = "rbxassetid://"..tostring(NotificationSettings.Image)
		else
			Notification.Icon.Image = "rbxassetid://3944680095"
		end
		Notification.Icon.ImageTransparency = 1
		Notification.Parent = Notifications
		Notification.Size = UDim2.new(0, 260, 0, 80)
		Notification.BackgroundTransparency = 1
		for i, v in pairs(Notification:GetDescendants()) do
			if v:IsA("GuiObject") and v.Active then v.Active = false end
		end
		TweenService:Create(Notification, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 295, 0, 91)}):Play()
		TweenService:Create(Notification, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {BackgroundTransparency = 0.1}):Play()
		Notification:TweenPosition(UDim2.new(0.5,0,0.915,0), 'Out', 'Quint', 0.8, true)
		wait(0.3)
		TweenService:Create(Notification.Icon, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {ImageTransparency = 0}):Play()
		TweenService:Create(Notification.Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
		TweenService:Create(Notification.Description, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {TextTransparency = 0.2}):Play()
		wait(0.2)
		if false == nil then
			TweenService:Create(Notification, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundTransparency = 0.4}):Play()
		else
			if not false then
				TweenService:Create(Notification, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundTransparency = 0.4}):Play()
			else
				TweenService:Create(Notification, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
			end
		end
		if NoviraField.Name == "NoviraField" then
			neon:BindFrame(Notification.BlurModule, {Transparency = 0.98; BrickColor = BrickColor.new("Institutional white");})
		end
		if not NotificationSettings.Actions then
			wait(NotificationSettings.Duration or NotificationDuration - 0.5)
		else
			wait(0.8)
			TweenService:Create(Notification, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 295, 0, 132)}):Play()
			wait(0.3)
			for _, Action in ipairs(Notification.Actions:GetChildren()) do
				if Action.ClassName == "TextButton" and Action.Name ~= "Template" then
					TweenService:Create(Action, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {BackgroundTransparency = 0.2}):Play()
					TweenService:Create(Action, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
					wait(0.05)
				end
			end
		end
		repeat wait(0.001) until ActionCompleted
		for _, Action in ipairs(Notification.Actions:GetChildren()) do
			if Action.ClassName == "TextButton" and Action.Name ~= "Template" then
				TweenService:Create(Action, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
				TweenService:Create(Action, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
			end
		end
		TweenService:Create(Notification.Title, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Position = UDim2.new(0.47,0,0.234,0)}):Play()
		TweenService:Create(Notification.Description, TweenInfo.new(0.8, Enum.EasingStyle.Quint), {Position = UDim2.new(0.528,0,0.637,0)}):Play()
		TweenService:Create(Notification, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 280, 0, 83)}):Play()
		TweenService:Create(Notification.Icon, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {ImageTransparency = 1}):Play()
		TweenService:Create(Notification, TweenInfo.new(0.8, Enum.EasingStyle.Quint), {BackgroundTransparency = 0.6}):Play()
		wait(0.3)
		TweenService:Create(Notification.Title, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {TextTransparency = 0.4}):Play()
		TweenService:Create(Notification.Description, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {TextTransparency = 0.5}):Play()
		wait(0.4)
		TweenService:Create(Notification, TweenInfo.new(0.9, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 260, 0, 0)}):Play()
		TweenService:Create(Notification, TweenInfo.new(0.8, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
		TweenService:Create(Notification.Title, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
		TweenService:Create(Notification.Description, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
		wait(0.2)
		if not false then
			neon:UnbindFrame(Notification.BlurModule)
			blurlight:Destroy()
		end
		wait(0.9)
		Notification:Destroy()
	end)
end

NoviraFieldLibrary:Notify({Title = "NoviraField", Content = "NoviraField Interface Suite loaded successfully.", Duration = 5})

function CloseSideBar()
	Debounce = true
	SideBarClosed = true
	for _, tabbtn in pairs(SideList:GetChildren()) do
		if tabbtn.ClassName == "Frame" and tabbtn.Name ~= "Placeholder" then
			TweenService:Create(tabbtn.Title, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
			TweenService:Create(tabbtn.Image, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {ImageTransparency = 1}):Play()
		end
	end
	TweenService:Create(Main.SideTabList, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {BackgroundTransparency = 1, Size = UDim2.new(0,150,0,390), Position = UDim2.new(0,10,0.5,22)}):Play()
	TweenService:Create(Main.SideTabList.UIStroke, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
	TweenService:Create(Main.SideTabList.RDMT, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
	wait(.4)
	Main.SideTabList.Visible = false
	wait(0.2)
	Debounce = false
end

local hasHidden = false
function Hide()
	if not SideBarClosed then spawn(CloseSideBar) end
	spawn(function() FadeDescription(nil, true, true) end)
	Debounce = true
	if not hasHidden then
		hasHidden = true
		NoviraFieldLibrary:Notify({Title = "Interface Hidden", Content = "The interface has been hidden, you can unhide the interface by tapping RightShift", Duration = 10})
	end
	TweenService:Create(Main, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 470, 0, 400)}):Play()
	TweenService:Create(Main.Topbar, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 470, 0, 45)}):Play()
	TweenService:Create(Main, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
	TweenService:Create(Main.Topbar, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
	TweenService:Create(Main.Topbar.Divider, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
	TweenService:Create(Main.Topbar.CornerRepair, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
	TweenService:Create(Main.Topbar.Title, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
	TweenService:Create(Main.Shadow.Image, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {ImageTransparency = 1}):Play()
	TweenService:Create(Topbar.UIStroke, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
	for _, TopbarButton in ipairs(Topbar:GetChildren()) do
		if TopbarButton.ClassName == "ImageButton" then
			TweenService:Create(TopbarButton, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {ImageTransparency = 1}):Play()
		end
	end
	for _, tabbtn in ipairs(TabsList:GetChildren()) do
		if tabbtn.ClassName == "Frame" and tabbtn.Name ~= "Placeholder" then
			TweenService:Create(tabbtn, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
			TweenService:Create(tabbtn.Title, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
			TweenService:Create(tabbtn.Image, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {ImageTransparency = 1}):Play()
			TweenService:Create(tabbtn.Shadow, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {ImageTransparency = 1}):Play()
			TweenService:Create(tabbtn.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
		end
	end
	for _, tab in ipairs(Elements:GetChildren()) do
		if tab.Name ~= "Template" and tab.ClassName == "ScrollingFrame" and tab.Name ~= "Placeholder" then
			for _, element in ipairs(tab:GetChildren()) do
				if element.ClassName == "Frame" then
					if element.Name ~= "SectionSpacing" and element.Name ~= "Placeholder" then
						if element:FindFirstChild('Holder') then
							TweenService:Create(element, TweenInfo.new(0.2, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
							TweenService:Create(element.Title, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
						else
							TweenService:Create(element, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
							pcall(function() TweenService:Create(element.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {Transparency = 1}):Play() end)
							TweenService:Create(element.Title, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
						end
						for _, child in ipairs(element:GetChildren()) do
							if child.ClassName == "Frame" or child.ClassName == "TextLabel" or child.ClassName == "TextBox" or child.ClassName == "ImageButton" or child.ClassName == "ImageLabel" then
								child.Visible = false
							end
						end
					end
				end
			end
		end
	end
	wait(0.5)
	Main.Visible = false
	Debounce = false
end

function Unhide()
	Debounce = true
	Main.Position = UDim2.new(0.5, 0, 0.5, 0)
	Main.Visible = true
	TweenService:Create(Main, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 500, 0, 475)}):Play()
	TweenService:Create(Main.Topbar, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 500, 0, 45)}):Play()
	TweenService:Create(Main.Shadow.Image, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {ImageTransparency = 0.4}):Play()
	TweenService:Create(Main, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
	TweenService:Create(Main.Topbar, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
	TweenService:Create(Main.Topbar.Divider, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
	TweenService:Create(Main.Topbar.CornerRepair, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
	TweenService:Create(Main.Topbar.Title, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
	if Minimised then spawn(Maximise) end
	for _, TopbarButton in ipairs(Topbar:GetChildren()) do
		if TopbarButton.ClassName == "ImageButton" then
			TweenService:Create(TopbarButton, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {ImageTransparency = 0.8}):Play()
		end
	end
	for _, tab in ipairs(Elements:GetChildren()) do
		if tab.Name ~= "Template" and tab.ClassName == "ScrollingFrame" and tab.Name ~= "Placeholder" then
			for _, element in ipairs(tab:GetChildren()) do
				if element.ClassName == "Frame" then
					if element.Name ~= "SectionSpacing" and element.Name ~= "Placeholder" and not element:FindFirstChild('ColorPickerIs') then
						if element:FindFirstChild('_UIPadding_') then
							TweenService:Create(element.Title, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
							TweenService:Create(element, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundTransparency = .25}):Play()
						else
							if element.Name ~= 'SectionTitle' then
								TweenService:Create(element, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
								TweenService:Create(element.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
							end
							TweenService:Create(element.Title, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
						end
						for _, child in ipairs(element:GetChildren()) do
							if (child.ClassName == "Frame" or child.ClassName == "TextLabel" or child.ClassName == "TextBox" or child.ClassName == "ImageButton" or child.ClassName == "ImageLabel") then
								child.Visible = true
							end
						end
					elseif element:FindFirstChild('ColorPickerIs') then
						TweenService:Create(element, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
						TweenService:Create(element.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
						TweenService:Create(element.Title, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
						if element.ColorPickerIs.Value then
							element.ColorSlider.Visible = true
							element.HexInput.Visible = true
							element.RGB.Visible = true
						end
						element.CPBackground.Visible = true
						element.Lock.Visible = true
						element.Interact.Visible = true
						element.Title.Visible = true
					end
				end
			end
		end
	end
	wait(0.5)
	Minimised = false
	Debounce = false
end

function CloseSearch()
	Debounce = true
	TweenService:Create(SearchBar, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {BackgroundTransparency = 1, Size = UDim2.new(0, 460,0, 35)}):Play()
	TweenService:Create(SearchBar.Icon, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {ImageTransparency = 1}):Play()
	TweenService:Create(SearchBar.Clear, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {ImageTransparency = 1}):Play()
	TweenService:Create(SearchBar.UIStroke, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
	TweenService:Create(SearchBar.Filter, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {ImageTransparency = 1}):Play()
	TweenService:Create(SearchBar.Shadow.Image, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {ImageTransparency = 0.1}):Play()
	TweenService:Create(SearchBar.Input, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
	delay(.3, function()
		SearchBar.Input.Visible = false
		SearchBar.Input.Active = false
		SearchBar.Input.ClearTextOnFocus = true
	end)
	wait(0.5)
	SearchBar.Visible = false
	Debounce = false
end

function OpenSearch()
	Debounce = true
	SearchBar.Visible = true
	SearchBar.Input.Visible = true
	SearchBar.Input.ClearTextOnFocus = false
	SearchBar.Input.Active = true
	TweenService:Create(SearchBar, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {BackgroundTransparency = 0, Size = UDim2.new(0, 480,0, 40)}):Play()
	TweenService:Create(SearchBar.Icon, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {ImageTransparency = 0.5}):Play()
	TweenService:Create(SearchBar.Shadow.Image, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {ImageTransparency = 0.1}):Play()
	TweenService:Create(SearchBar.UIStroke, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
	TweenService:Create(SearchBar.Clear, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {ImageTransparency = .8}):Play()
	TweenService:Create(SearchBar.Filter, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {ImageTransparency = .8}):Play()
	TweenService:Create(SearchBar.Input, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
	wait(0.5)
	Debounce = false
end

SearchBar.Input:GetPropertyChangedSignal('Text'):Connect(function()
	local InputText = string.upper(SearchBar.Input.Text)
	for _, page in ipairs(Elements:GetChildren()) do
		if page ~= 'Template' then
			for _, Element in pairs(page:GetChildren()) do
				if Element:IsA("Frame") and Element.Name ~= 'Placeholder' and Element.Name ~= 'SectionSpacing' then
					if InputText == "" or string.find(string.upper(Element.Name), InputText) ~= nil then
						Element.Visible = true
					else
						Element.Visible = false
					end
				end
			end
		end
	end
end)

SearchBar.Clear.MouseButton1Down:Connect(function()
	Filler.Position = UDim2.new(0.957,0,.5,0)
	Filler.Size = UDim2.new(0,1,0,1)
	Filler.BackgroundTransparency = .9
	local goal = {}
	goal.Size = UDim2.new(0,1000,0,500)
	goal.BackgroundTransparency = 1
	TweenService:Create(Filler, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), goal):Play()
	SearchBar.Input.Text = ''
end)

function Maximise()
	Debounce = true
	Topbar.ChangeSize.Image = "rbxassetid://"..10137941941
	TweenService:Create(Topbar.UIStroke, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
	TweenService:Create(Main.Shadow.Image, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {ImageTransparency = 0.4}):Play()
	TweenService:Create(Topbar.CornerRepair, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
	TweenService:Create(Topbar.Divider, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
	TweenService:Create(Main, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 500, 0, 475)}):Play()
	TweenService:Create(Topbar, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 500, 0, 45)}):Play()
	TabsList.Visible = true
	wait(0.2)
	Elements.Visible = true
	for _, tab in ipairs(Elements:GetChildren()) do
		if tab.Name ~= "Template" and tab.ClassName == "ScrollingFrame" and tab.Name ~= "Placeholder" then
			for _, element in ipairs(tab:GetChildren()) do
				if element.ClassName == "Frame" then
					if element.Name ~= "SectionSpacing" and element.Name ~= "Placeholder" and not element:FindFirstChild('ColorPickerIs') then
						if element:FindFirstChild('_UIPadding_') then
							TweenService:Create(element, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundTransparency = .25}):Play()
							TweenService:Create(element.Title, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
						else
							if element.Name ~= 'SectionTitle' then
								TweenService:Create(element, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
								TweenService:Create(element.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
							end
							TweenService:Create(element.Title, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
						end
						for _, child in ipairs(element:GetChildren()) do
							if (child.ClassName == "Frame" or child.ClassName == "TextLabel" or child.ClassName == "TextBox" or child.ClassName == "ImageButton" or child.ClassName == "ImageLabel") then
								child.Visible = true
							end
						end
					elseif element:FindFirstChild('ColorPickerIs') then
						TweenService:Create(element, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
						TweenService:Create(element.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
						TweenService:Create(element.Title, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
						if element.ColorPickerIs.Value then
							element.ColorSlider.Visible = true
							element.HexInput.Visible = true
							element.RGB.Visible = true
						end
						element.CPBackground.Visible = true
						element.Lock.Visible = true
						element.Interact.Visible = true
						element.Title.Visible = true
					end
				end
			end
		end
	end
	wait(0.1)
	for _, tabbtn in ipairs(TopList:GetChildren()) do
		if tabbtn.ClassName == "Frame" and tabbtn.Name ~= "Placeholder" then
			if tostring(Elements.UIPageLayout.CurrentPage) == tabbtn.Title.Text then
				TweenService:Create(tabbtn, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
				TweenService:Create(tabbtn.Image, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {ImageTransparency = 0}):Play()
				TweenService:Create(tabbtn.Title, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
				TweenService:Create(tabbtn.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
				TweenService:Create(tabbtn.Shadow, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {ImageTransparency = 0.9}):Play()
			else
				TweenService:Create(tabbtn, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundTransparency = 0.7}):Play()
				TweenService:Create(tabbtn.Shadow, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {ImageTransparency = 0.7}):Play()
				TweenService:Create(tabbtn.Image, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {ImageTransparency = 0.2}):Play()
				TweenService:Create(tabbtn.Title, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {TextTransparency = 0.2}):Play()
				TweenService:Create(tabbtn.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
			end
		end
	end
	wait(0.5)
	Debounce = false
end

function OpenSideBar()
	Debounce = true
	Main.SideTabList.Visible = true
	TweenService:Create(Main.SideTabList, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {BackgroundTransparency = .03, Size = UDim2.new(0,160,0,405), Position = UDim2.new(0,14,0.5,22)}):Play()
	TweenService:Create(Main.SideTabList.UIStroke, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
	TweenService:Create(Main.SideTabList.RDMT, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
	for _, tabbtn in pairs(SideList:GetChildren()) do
		if tabbtn.ClassName == "Frame" and tabbtn.Name ~= "Placeholder" then
			if tabbtn.Title.TextColor3 ~= Color3.fromRGB(255,255,255) then
				TweenService:Create(tabbtn.Title, TweenInfo.new(0.25, Enum.EasingStyle.Quint), {TextTransparency = .2}):Play()
			else
				TweenService:Create(tabbtn.Title, TweenInfo.new(0.25, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
			end
			TweenService:Create(tabbtn.Image, TweenInfo.new(0.25, Enum.EasingStyle.Quint), {ImageTransparency = 0}):Play()
		end
		wait(0.12)
	end
	SideBarClosed = false
	wait(0.2)
	Debounce = false
end

function Minimise()
	Debounce = true
	Topbar.ChangeSize.Image = "rbxassetid://"..11036884234
	if not SearchHided then spawn(CloseSearch) end
	if not SideBarClosed then spawn(CloseSideBar) end
	spawn(function() FadeDescription(nil, true, true) end)
	for _, tabbtn in ipairs(TopList:GetChildren()) do
		if tabbtn.ClassName == "Frame" and tabbtn.Name ~= "Placeholder" then
			TweenService:Create(tabbtn, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
			TweenService:Create(tabbtn.Image, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {ImageTransparency = 1}):Play()
			TweenService:Create(tabbtn.Title, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
			TweenService:Create(tabbtn.Shadow, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {ImageTransparency = 1}):Play()
			TweenService:Create(tabbtn.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
		end
	end
	for _, tab in ipairs(Elements:GetChildren()) do
		if tab.Name ~= "Template" and tab.ClassName == "ScrollingFrame" and tab.Name ~= "Placeholder" then
			for _, element in ipairs(tab:GetChildren()) do
				if element.ClassName == "Frame" then
					if element.Name ~= "SectionSpacing" and element.Name ~= "Placeholder" then
						if element:FindFirstChild('_UIPadding_') then
							TweenService:Create(element, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
							TweenService:Create(element.Title, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
						else
							TweenService:Create(element, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
							pcall(function() TweenService:Create(element.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {Transparency = 1}):Play() end)
							TweenService:Create(element.Title, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
						end
						for _, child in ipairs(element:GetChildren()) do
							if child.ClassName == "Frame" or child.ClassName == "TextLabel" or child.ClassName == "TextBox" or child.ClassName == "ImageButton" or child.ClassName == "ImageLabel" then
								child.Visible = false
							end
						end
					end
				end
			end
		end
	end
	TweenService:Create(Topbar.UIStroke, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
	TweenService:Create(Main.Shadow.Image, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {ImageTransparency = 1}):Play()
	TweenService:Create(Topbar.CornerRepair, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
	TweenService:Create(Topbar.Divider, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
	TweenService:Create(Main, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 495, 0, 45)}):Play()
	TweenService:Create(Topbar, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 495, 0, 45)}):Play()
	wait(0.3)
	Elements.Visible = false
	TabsList.Visible = false
	wait(0.2)
	Debounce = false
end

local KeyMainUI
function NoviraFieldLibrary:CreateWindow(Settings)
	NoviraField.Enabled = false
	local Passthrough = false
	Topbar.Title.Text = Settings.Name
	Main.Size = UDim2.new(0, 450, 0, 260)
	Main.Visible = true
	Main.BackgroundTransparency = 1
	LoadingFrame.Title.TextTransparency = 1
	LoadingFrame.Subtitle.TextTransparency = 1
	Main.Shadow.Image.ImageTransparency = 1
	LoadingFrame.Version.TextTransparency = 1
	LoadingFrame.Title.Text = Settings.LoadingTitle or "NoviraField Interface Suite"
	LoadingFrame.Subtitle.Text = Settings.LoadingSubtitle or "by RyuuTrace"
	if Settings.LoadingTitle ~= "NoviraField Interface Suite" then
		LoadingFrame.Version.Text = "NoviraField UI"
	end
	Topbar.Visible = false
	Elements.Visible = false
	LoadingFrame.Visible = true

	pcall(function()
		if not Settings.ConfigurationSaving.FileName then
			Settings.ConfigurationSaving.FileName = tostring(game.PlaceId)
		end
		if Settings.ConfigurationSaving.Enabled == nil then
			Settings.ConfigurationSaving.Enabled = false
		end
		CFileName = Settings.ConfigurationSaving.FileName
		ConfigurationFolder = Settings.ConfigurationSaving.FolderName or ConfigurationFolder
		CEnabled = Settings.ConfigurationSaving.Enabled
		if Settings.ConfigurationSaving.Enabled then
			if not isfolder(ConfigurationFolder) then makefolder(ConfigurationFolder) end
		end
	end)

	AddDraggingFunctionality(Topbar, Main)

	if Settings.KeySystem and typeof(Settings.KeySettings.Key) == "string" then Settings.KeySettings.Key = {Settings.KeySettings.Key} end

	for _, TabButton in ipairs(TabsList:GetChildren()) do
		if TabButton.ClassName == "Frame" and TabButton.Name ~= "Placeholder" then
			TabButton.BackgroundTransparency = 1
			TabButton.Title.TextTransparency = 1
			TabButton.Shadow.ImageTransparency = 1
			TabButton.Image.ImageTransparency = 1
			TabButton.UIStroke.Transparency = 1
		end
	end

	if Settings.Discord then
		if not isfolder(NoviraFieldFolder.."/Discord Invites") then makefolder(NoviraFieldFolder.."/Discord Invites") end
		if not isfile(NoviraFieldFolder.."/Discord Invites".."/"..Settings.Discord.Invite..ConfigurationExtension) then
			if request and not (identifyexecutor and identifyexecutor():lower():match("arceus x")) then
				request({
					Url = 'http://127.0.0.1:6463/rpc?v=1',
					Method = 'POST',
					Headers = {['Content-Type'] = 'application/json', Origin = 'https://discord.com'},
					Body = HttpService:JSONEncode({cmd = 'INVITE_BROWSER', nonce = HttpService:GenerateGUID(false), args = {code = Settings.Discord.Invite}})
				})
			end
			if Settings.Discord.RememberJoins then
				writefile(NoviraFieldFolder.."/Discord Invites".."/"..Settings.Discord.Invite..ConfigurationExtension, "NoviraField RememberJoins is true for this invite")
			end
		end
	end

	if Settings.KeySystem then
		if not Settings.KeySettings then Passthrough = true return end
		if not isfolder(NoviraFieldFolder.."/Key System") then makefolder(NoviraFieldFolder.."/Key System") end
		if Settings.KeySettings.GrabKeyFromSite then
			for i, Key in ipairs(Settings.KeySettings.Key) do
				local Success, Response = pcall(function()
					Settings.KeySettings.Key[i] = tostring(game:HttpGet(Key):gsub("[\n\r]", " "))
					Settings.KeySettings.Key[i] = string.gsub(Settings.KeySettings.Key[i], " ", "")
				end)
				if not Success then print("NoviraField | "..Key.." Error "..tostring(Response)) end
			end
		end
		if not Settings.KeySettings.FileName then Settings.KeySettings.FileName = "No file name specified" end
		if isfile(NoviraFieldFolder.."/Key System".."/"..Settings.KeySettings.FileName..ConfigurationExtension) then
			if readfile(NoviraFieldFolder.."/Key System".."/"..Settings.KeySettings.FileName..ConfigurationExtension) == Settings.KeySettings.Key then
				Passthrough = true
			end
		end
		if not Passthrough then
			local AttemptsRemaining = math.random(2, 6)
			NoviraField.Enabled = false
			local KeyUI = game:GetObjects("rbxassetid://11695805160")[1]
			KeyUI.Enabled = true
			pcall(function() _G.KeyUI:Destroy() end)
			_G.KeyUI = KeyUI
			ParentObject(KeyUI)
			local KeyMain = KeyUI.Main
			KeyMain.Title.Text = Settings.KeySettings.Title or Settings.Name
			KeyMain.Subtitle.Text = Settings.KeySettings.Subtitle or "Key System"
			KeyMain.NoteMessage.Text = Settings.KeySettings.Note or "No instructions"
			KeyMainUI = KeyMain
			KeyMain.Size = UDim2.new(0, 467, 0, 175)
			KeyMain.BackgroundTransparency = 1
			KeyMain.EShadow.ImageTransparency = 1
			KeyMain.Title.TextTransparency = 1
			KeyMain.Subtitle.TextTransparency = 1
			KeyMain.KeyNote.TextTransparency = 1
			KeyMain.Input.BackgroundTransparency = 1
			KeyMain.Input.UIStroke.Transparency = 1
			KeyMain.Input.InputBox.TextTransparency = 1
			KeyMain.NoteTitle.TextTransparency = 1
			KeyMain.NoteMessage.TextTransparency = 1
			KeyMain.Hide.ImageTransparency = 1
			KeyMain.HideP.ImageTransparency = 1
			KeyMain.Actions.Template.TextTransparency = 1
			TweenService:Create(KeyMain, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
			TweenService:Create(KeyMain, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 500, 0, 187)}):Play()
			TweenService:Create(KeyMain.EShadow, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {ImageTransparency = 0.5}):Play()
			wait(0.05)
			TweenService:Create(KeyMain.Title, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
			TweenService:Create(KeyMain.Subtitle, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
			wait(0.05)
			TweenService:Create(KeyMain.KeyNote, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
			TweenService:Create(KeyMain.Input, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
			TweenService:Create(KeyMain.Input.UIStroke, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
			TweenService:Create(KeyMain.Input.HidenInput, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
			wait(0.05)
			TweenService:Create(KeyMain.NoteTitle, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
			TweenService:Create(KeyMain.NoteMessage, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
			wait(0.15)
			TweenService:Create(KeyMain.Hide, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {ImageTransparency = 0.3}):Play()
			TweenService:Create(KeyMain.HideP, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {ImageTransparency = 0.3}):Play()
			KeyUI.Main.Input.InputBox:GetPropertyChangedSignal('Text'):Connect(function()
				KeyUI.Main.Input.HidenInput.Text = string.rep('•', #KeyUI.Main.Input.InputBox.Text)
			end)
			KeyUI.Main.Input.InputBox.FocusLost:Connect(function(EnterPressed)
				if not EnterPressed then return end
				if #KeyUI.Main.Input.InputBox.Text == 0 then return end
				local KeyFound = false
				for _, MKey in ipairs(Settings.KeySettings.Key) do
					if KeyMain.Input.InputBox.Text == MKey then KeyFound = true end
				end
				if KeyFound then
					TweenService:Create(KeyMain, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
					TweenService:Create(KeyMain, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 467, 0, 175)}):Play()
					TweenService:Create(KeyMain.EShadow, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {ImageTransparency = 1}):Play()
					TweenService:Create(KeyMain.Title, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
					TweenService:Create(KeyMain.Subtitle, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
					TweenService:Create(KeyMain.KeyNote, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
					TweenService:Create(KeyMain.Input, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
					TweenService:Create(KeyMain.Input.UIStroke, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
					TweenService:Create(KeyMain.Input.InputBox, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
					TweenService:Create(KeyMain.Input.HidenInput, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
					TweenService:Create(KeyMain.NoteTitle, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
					TweenService:Create(KeyMain.NoteMessage, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
					TweenService:Create(KeyMain.Hide, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {ImageTransparency = 1}):Play()
					TweenService:Create(KeyMain.HideP, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {ImageTransparency = 1}):Play()
					delay(.4, function()
						KeyMain.Hide.Visible = false
						KeyUI:Destroy()
					end)
					wait(0.51)
					Passthrough = true
					if Settings.KeySettings.SaveKey then
						if writefile then writefile(NoviraFieldFolder.."/Key System".."/"..Settings.KeySettings.FileName..ConfigurationExtension, Settings.KeySettings.Key) end
						NoviraFieldLibrary:Notify({Title = "Key System", Content = "The key for this script has been saved successfully"})
					end
				else
					if AttemptsRemaining == 0 then
						wait(0.45)
						game.Players.LocalPlayer:Kick("No Attempts Remaining")
						game:Shutdown()
					end
					KeyMain.Input.InputBox.Text = ""
					AttemptsRemaining = AttemptsRemaining - 1
					TweenService:Create(KeyMain, TweenInfo.new(0.4, Enum.EasingStyle.Elastic), {Position = UDim2.new(0.495,0,0.5,0)}):Play()
					wait(0.1)
					TweenService:Create(KeyMain, TweenInfo.new(0.4, Enum.EasingStyle.Elastic), {Position = UDim2.new(0.505,0,0.5,0)}):Play()
					wait(0.1)
					TweenService:Create(KeyMain, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {Position = UDim2.new(0.5,0,0.5,0)}):Play()
					TweenService:Create(KeyMain, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 500, 0, 187)}):Play()
				end
			end)
			local HiddenKey = true
			KeyMain.HideP.MouseButton1Click:Connect(function()
				if HiddenKey then
					TweenService:Create(KeyMain.Input.HidenInput, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
					TweenService:Create(KeyMain.Input.InputBox, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
					HiddenKey = false
				else
					TweenService:Create(KeyMain.Input.HidenInput, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
					TweenService:Create(KeyMain.Input.InputBox, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
					HiddenKey = true
				end
			end)
			KeyMain.Hide.MouseButton1Click:Connect(function()
				TweenService:Create(KeyMain, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
				TweenService:Create(KeyMain, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 467, 0, 175)}):Play()
				TweenService:Create(KeyMain.EShadow, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {ImageTransparency = 1}):Play()
				TweenService:Create(KeyMain.Title, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
				TweenService:Create(KeyMain.Subtitle, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
				TweenService:Create(KeyMain.KeyNote, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
				TweenService:Create(KeyMain.Input, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
				TweenService:Create(KeyMain.Input.UIStroke, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
				TweenService:Create(KeyMain.Input.InputBox, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
				TweenService:Create(KeyMain.NoteTitle, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
				TweenService:Create(KeyMain.Input.HidenInput, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
				TweenService:Create(KeyMain.NoteMessage, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
				TweenService:Create(KeyMain.Hide, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {ImageTransparency = 1}):Play()
				TweenService:Create(KeyMain.HideP, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {ImageTransparency = 1}):Play()
				wait(0.51)
				NoviraFieldLibrary:Destroy()
				KeyUI:Destroy()
			end)
		else
			Passthrough = true
		end
	end
	if Settings.KeySystem then
		repeat wait() until Passthrough
	end
	NoviraField.Enabled = true
	for _, tabbtn in pairs(SideList:GetChildren()) do
		if tabbtn.ClassName == "Frame" and tabbtn.Name ~= "Placeholder" then
			TweenService:Create(tabbtn.Title, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
			TweenService:Create(tabbtn.Image, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {ImageTransparency = 1}):Play()
		end
	end
	TweenService:Create(Main.SideTabList, TweenInfo.new(0, Enum.EasingStyle.Quint), {BackgroundTransparency = 1, Size = UDim2.new(0,150,0,390), Position = UDim2.new(0,10,0.5,22)}):Play()
	TweenService:Create(Main.SideTabList.UIStroke, TweenInfo.new(0, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
	TweenService:Create(Main.SideTabList.RDMT, TweenInfo.new(0, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
	TweenService:Create(InfoPrompt, TweenInfo.new(.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Size = UDim2.fromOffset(212,254), BackgroundTransparency = 1}):Play()
	TweenService:Create(InfoPrompt.ImageLabel, TweenInfo.new(.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {ImageTransparency = 1}):Play()
	TweenService:Create(InfoPrompt.Description, TweenInfo.new(.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextTransparency = 1}):Play()
	TweenService:Create(InfoPrompt.Status, TweenInfo.new(.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextTransparency = 1}):Play()
	TweenService:Create(InfoPrompt.Title, TweenInfo.new(.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextTransparency = 1}):Play()
	TopList.Template.Visible = false
	SideList.SideTemplate.Visible = false
	Notifications.Template.Visible = false
	Notifications.Visible = true
	wait(0.5)
	TweenService:Create(Main, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
	TweenService:Create(Main.Shadow.Image, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {ImageTransparency = 0.55}):Play()
	wait(0.1)
	TweenService:Create(LoadingFrame.Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
	wait(0.05)
	TweenService:Create(LoadingFrame.Subtitle, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
	wait(0.05)
	TweenService:Create(LoadingFrame.Version, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
	Elements.Template.LayoutOrder = 100000
	Elements.Template.Visible = false
	Elements.UIPageLayout.FillDirection = Enum.FillDirection.Horizontal

	local FirstTab = false
	NoviraFieldQuality.Window = {Tabs = {}}
	local Window = NoviraFieldQuality.Window

	function Window:CreateTab(Name, Image)
		Window.Tabs[Name] = {Elements = {}}
		local Tab = Window.Tabs[Name]
		local SDone = false
		local TopTabButton, SideTabButton = TopList.Template:Clone(), SideList.SideTemplate:Clone()
		SideTabButton.Parent = SideList
		TopTabButton.Parent = TopList
		TopTabButton.Name = Name SideTabButton.Name = Name
		TopTabButton.Title.Text = Name SideTabButton.Title.Text = Name
		SideTabButton.Title.TextWrapped = false TopTabButton.Title.TextWrapped = false
		TopTabButton.Size = UDim2.new(0, TopTabButton.Title.TextBounds.X + 30, 0, 30)
		if Image then
			TopTabButton.Image.Image = "rbxassetid://"..Image
			SideTabButton.Image.Image = "rbxassetid://"..Image
			TopTabButton.Title.AnchorPoint = Vector2.new(0, 0.5)
			TopTabButton.Title.Position = UDim2.new(0, 37, 0.5, 0)
			TopTabButton.Image.Visible = true
			TopTabButton.Title.TextXAlignment = Enum.TextXAlignment.Left
			TopTabButton.Size = UDim2.new(0, TopTabButton.Title.TextBounds.X + 46, 0, 30)
		end
		TopTabButton.BackgroundTransparency = 1
		TopTabButton.Title.TextTransparency = 1
		TopTabButton.Shadow.ImageTransparency = 1
		TopTabButton.Image.ImageTransparency = 1
		TopTabButton.UIStroke.Transparency = 1
		SideTabButton.BackgroundTransparency = 1
		SideTabButton.Title.TextTransparency = 1
		SideTabButton.Shadow.ImageTransparency = 1
		SideTabButton.Image.ImageTransparency = 1
		SideTabButton.UIStroke.Transparency = 1
		TopTabButton.Visible = true
		SideTabButton.Visible = true
		local TabPage = Elements.Template:Clone()
		TabPage.Name = Name
		TabPage.Visible = true
		TabPage.LayoutOrder = #Elements:GetChildren()
		for _, TemplateElement in ipairs(TabPage:GetChildren()) do
			if TemplateElement.ClassName == "Frame" and TemplateElement.Name ~= "Placeholder" then
				TemplateElement:Destroy()
			end
		end
		TabPage.Parent = Elements
		if not FirstTab then
			Elements.UIPageLayout.Animated = false
			Elements.UIPageLayout:JumpTo(TabPage)
			Elements.UIPageLayout.Animated = true
		end
		if SelectedTheme ~= NoviraFieldLibrary.Theme.Default then TopTabButton.Shadow.Visible = false end
		TopTabButton.UIStroke.Color = SelectedTheme.TabStroke
		wait(0.1)
		if FirstTab then
			TopTabButton.BackgroundColor3 = SelectedTheme.TabBackground
			TopTabButton.Image.ImageColor3 = SelectedTheme.TabTextColor
			TopTabButton.Title.TextColor3 = SelectedTheme.TabTextColor
			TweenService:Create(TopTabButton, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {BackgroundTransparency = 0.7}):Play()
			TweenService:Create(TopTabButton.Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextTransparency = 0.2}):Play()
			TweenService:Create(TopTabButton.Image, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {ImageTransparency = 0.2}):Play()
			TweenService:Create(TopTabButton.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
			TweenService:Create(TopTabButton.Shadow, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {ImageTransparency = 0.7}):Play()
			TweenService:Create(SideTabButton.Image, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {ImageTransparency = 0, ImageColor3 = Color3.fromRGB(205,205,205)}):Play()
			TweenService:Create(SideTabButton.Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextTransparency = .2, TextColor3 = Color3.fromRGB(205,205,205)}):Play()
		else
			FirstTab = Name
			TopTabButton.BackgroundColor3 = SelectedTheme.TabBackgroundSelected
			TopTabButton.Image.ImageColor3 = SelectedTheme.SelectedTabTextColor
			TopTabButton.Title.TextColor3 = SelectedTheme.SelectedTabTextColor
			TweenService:Create(TopTabButton.Shadow, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {ImageTransparency = 0.9}):Play()
			TweenService:Create(TopTabButton.Image, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {ImageTransparency = 0}):Play()
			TweenService:Create(TopTabButton, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
			TweenService:Create(TopTabButton.Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
			SideTabButton.Image.ImageColor3 = Color3.fromRGB(255,255,255)
			SideTabButton.Title.TextColor3 = Color3.fromRGB(255,255,255)
			TweenService:Create(SideTabButton.Image, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {ImageTransparency = 0}):Play()
			TweenService:Create(SideTabButton.Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
		end

		local function Pick()
			if Minimised then return end
			TweenService:Create(TopTabButton, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
			TweenService:Create(TopTabButton.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
			TweenService:Create(TopTabButton.Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
			TweenService:Create(TopTabButton.Image, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {ImageTransparency = 0}):Play()
			TweenService:Create(TopTabButton, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.TabBackgroundSelected}):Play()
			TweenService:Create(TopTabButton.Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextColor3 = SelectedTheme.SelectedTabTextColor}):Play()
			TweenService:Create(TopTabButton.Image, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {ImageColor3 = SelectedTheme.SelectedTabTextColor}):Play()
			TweenService:Create(TopTabButton.Shadow, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {ImageTransparency = 0.9}):Play()
			TweenService:Create(SideTabButton.Image, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {ImageTransparency = 0, ImageColor3 = Color3.fromRGB(255,255,255)}):Play()
			TweenService:Create(SideTabButton.Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextTransparency = 0, TextColor3 = Color3.fromRGB(255,255,255)}):Play()
			Elements.UIPageLayout:JumpTo(TabPage)
			for _, OtherTabButton in ipairs(TopList:GetChildren()) do
				spawn(function()
					if OtherTabButton.Name ~= "Template" and OtherTabButton.ClassName == "Frame" and OtherTabButton ~= TopTabButton and OtherTabButton.Name ~= "Placeholder" then
						TweenService:Create(OtherTabButton, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.TabBackground, BackgroundTransparency = .7}):Play()
						TweenService:Create(OtherTabButton.Image, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {ImageColor3 = Color3.fromRGB(240,240,240)}):Play()
						TweenService:Create(OtherTabButton.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {Transparency = 0, Color = Color3.fromRGB(85,85,85)}):Play()
						TweenService:Create(OtherTabButton.Shadow, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {ImageTransparency = .85, ImageColor3 = Color3.fromRGB(20,20,20)}):Play()
						TweenService:Create(OtherTabButton.Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextColor3 = Color3.fromRGB(240,240,240), TextTransparency = .2}):Play()
					end
				end)
			end
			for _, OtherTabButton in ipairs(SideList:GetChildren()) do
				spawn(function()
					if OtherTabButton.Name ~= "Template" and OtherTabButton.ClassName == "Frame" and OtherTabButton ~= SideTabButton and OtherTabButton.Name ~= "Placeholder" then
						TweenService:Create(OtherTabButton.Image, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {ImageTransparency = 0, ImageColor3 = Color3.fromRGB(205,205,205)}):Play()
						TweenService:Create(OtherTabButton.Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextTransparency = .2, TextColor3 = Color3.fromRGB(205,205,205)}):Play()
					end
				end)
			end
		end

		TopTabButton.Interact.MouseButton1Click:Connect(Pick)
		SideTabButton.Interact.MouseButton1Click:Connect(Pick)

		-- Button
		function Tab:CreateButton(ButtonSettings)
			local ButtonValue = {Locked = false}
			local Button = Elements.Template.Button:Clone()
			ButtonValue.Button = Button
			Tab.Elements[ButtonSettings.Name] = {type = 'button', section = ButtonSettings.SectionParent, element = Button}
			AddInfos(Button, ButtonSettings, 'button')
			Button.Name = ButtonSettings.Name
			Button.Title.Text = ButtonSettings.Name
			Button.ElementIndicator.Text = ButtonSettings.Interact or 'button'
			Button.Visible = true
			Button.BackgroundTransparency = 1
			Button.UIStroke.Transparency = 1
			Button.Title.TextTransparency = 1
			if ButtonSettings.SectionParent then Button.Parent = ButtonSettings.SectionParent.Holder
			else Button.Parent = TabPage end
			TweenService:Create(Button, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
			TweenService:Create(Button.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
			TweenService:Create(Button.Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
			Button.Interact.MouseButton1Click:Connect(function()
				if ButtonValue.Locked then return end
				local Success, Response = pcall(ButtonSettings.Callback)
				if not Success then
					TweenService:Create(Button, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = Color3.fromRGB(85,0,0)}):Play()
					TweenService:Create(Button.ElementIndicator, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
					TweenService:Create(Button.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
					Button.Title.Text = "Callback Error"
					print("NoviraField | "..ButtonSettings.Name.." Callback Error "..tostring(Response))
					wait(0.5)
					Button.Title.Text = ButtonSettings.Name
					TweenService:Create(Button, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
					TweenService:Create(Button.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
					TweenService:Create(Button.ElementIndicator, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {TextTransparency = 0.9}):Play()
				else
					SaveConfiguration()
					TweenService:Create(Button, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackgroundHover}):Play()
					TweenService:Create(Button.ElementIndicator, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
					TweenService:Create(Button.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
					wait(0.2)
					TweenService:Create(Button, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
					TweenService:Create(Button.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
					TweenService:Create(Button.ElementIndicator, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {TextTransparency = 0.9}):Play()
				end
			end)
			Button.MouseEnter:Connect(function()
				TweenService:Create(Button, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackgroundHover}):Play()
				TweenService:Create(Button.ElementIndicator, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {TextTransparency = 0.7}):Play()
			end)
			Button.MouseLeave:Connect(function()
				TweenService:Create(Button, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
				TweenService:Create(Button.ElementIndicator, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {TextTransparency = 0.9}):Play()
			end)
			function ButtonValue:Set(NewButton, Interaction)
				Button.Title.Text = NewButton or Button.Title.Text
				Button.Name = NewButton or Button.Name
				Button.ElementIndicator.Text = Interaction or Button.ElementIndicator.Text
			end
			function ButtonValue:Destroy() Button:Destroy() end
			function ButtonValue:Lock(Reason)
				if ButtonValue.Locked then return end
				ButtonValue.Locked = true
				Button.Lock.Reason.Text = Reason or 'Locked'
				TweenService:Create(Button.Lock, TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {BackgroundTransparency = 0}):Play()
				TweenService:Create(Button.Lock.Reason, TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {TextTransparency = 0}):Play()
				wait(0.2)
				if not ButtonValue.Locked then return end
				TweenService:Create(Button.Lock.Reason.Icon, TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {ImageTransparency = 0}):Play()
			end
			function ButtonValue:Unlock()
				if not ButtonValue.Locked then return end
				ButtonValue.Locked = false
				wait(0.2)
				TweenService:Create(Button.Lock.Reason.Icon, TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {ImageTransparency = 1}):Play()
				if ButtonValue.Locked then return end
				TweenService:Create(Button.Lock, TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {BackgroundTransparency = 1}):Play()
				TweenService:Create(Button.Lock.Reason, TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {TextTransparency = 1}):Play()
			end
			function ButtonValue:Visible(bool) Button.Visible = bool end
			return ButtonValue
		end

		-- Section
		function Tab:CreateSection(SectionName, Display)
			local SectionValue = {Holder = NoviraField.Holding, Open = true}
			local SDebounce = false
			local Section = Elements.Template.SectionTitle:Clone()
			SectionValue.Holder = Section.Holder
			Section.Title.Text = SectionName
			Section.Visible = true
			Section.Parent = TabPage
			Tab.Elements[SectionName] = {type = 'section', display = Display, sectionholder = Section.Holder, element = Section}
			Section.Title.TextTransparency = 1
			TweenService:Create(Section.Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
			function SectionValue:Set(NewSection) Section.Title.Text = NewSection end
			if Display then
				Section._UIPadding_:Destroy()
				Section.Holder.Visible = false
				Section.BackgroundTransparency = 1
				SectionValue.Holder.Parent = NoviraField.Holding
				Section.Title.ImageButton.Visible = false
			end
			Section.Title.ImageButton.MouseButton1Down:Connect(function()
				if SDebounce then return end
				if SectionValue.Open then
					SDebounce = true
					TweenService:Create(Section._UIPadding_, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {PaddingBottom = UDim.new(0,0)}):Play()
					for _, element in ipairs(Section.Holder:GetChildren()) do
						if element.ClassName == "Frame" then
							if element.Name ~= "SectionSpacing" and element.Name ~= "Placeholder" and element.Name ~= 'Topholder' then
								if element.Name == "SectionTitle" then
									TweenService:Create(element.Title, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
								else
									TweenService:Create(element, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
									TweenService:Create(element.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
									TweenService:Create(element.Title, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
								end
								for _, child in ipairs(element:GetChildren()) do
									if child.ClassName == "Frame" then child.Visible = false end
								end
							end
							element.Visible = false
						end
					end
					TweenService:Create(Section.Title.ImageButton, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Rotation = 180}):Play()
					SectionValue.Open = false
					SDebounce = false
				else
					SDebounce = true
					TweenService:Create(Section._UIPadding_, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {PaddingBottom = UDim.new(0,8)}):Play()
					for _, element in ipairs(Section.Holder:GetChildren()) do
						if element.ClassName == "Frame" then
							if element.Name ~= "SectionSpacing" and element.Name ~= "Placeholder" and element.Name ~= 'Topholder' and not element:FindFirstChild('ColorPickerIs') then
								if element.Name == "SectionTitle" then
									TweenService:Create(element.Title, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
								else
									TweenService:Create(element, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
									TweenService:Create(element.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
									TweenService:Create(element.Title, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
								end
								for _, child in ipairs(element:GetChildren()) do
									if (child.ClassName == "Frame" or child.ClassName == "TextLabel" or child.ClassName == "TextBox" or child.ClassName == "ImageButton" or child.ClassName == "ImageLabel") then
										child.Visible = true
									end
								end
							end
							element.Visible = true
						end
					end
					TweenService:Create(Section.Title.ImageButton, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Rotation = 0}):Play()
					SectionValue.Open = true
					wait(.3)
					SDebounce = false
				end
			end)
			SDone = true
			function SectionValue:Lock(Reason) end
			function SectionValue:Unlock(Reason) end
			return SectionValue
		end

		-- Spacing
		function Tab:CreateSpacing(SectionParent, Size)
			local Spacing = Elements.Template.SectionSpacing:Clone()
			Spacing.Visible = true
			Spacing.Size = UDim2.fromOffset(475, Size or 6)
			if SectionParent then Spacing.Parent = SectionParent.Holder
			else Spacing.Parent = TabPage end
		end

		-- Label
		function Tab:CreateLabel(LabelText, SectionParent)
			local LabelValue = {}
			local Label = Elements.Template.Label:Clone()
			Label.Title.Text = LabelText
			Label.Visible = true
			Tab.Elements[LabelText] = {type = 'label', section = SectionParent, element = Label}
			if SectionParent then Label.Parent = SectionParent.Holder
			else Label.Parent = TabPage end
			Label.BackgroundTransparency = 1
			Label.UIStroke.Transparency = 1
			Label.Title.TextTransparency = 1
			Label.BackgroundColor3 = SelectedTheme.SecondaryElementBackground
			Label.UIStroke.Color = SelectedTheme.SecondaryElementStroke
			TweenService:Create(Label, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
			TweenService:Create(Label.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
			TweenService:Create(Label.Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
			function LabelValue:Set(NewLabel) Label.Title.Text = NewLabel end
			return LabelValue
		end

		-- Paragraph
		function Tab:CreateParagraph(ParagraphSettings, SectionParent)
			local ParagraphValue = {}
			local Paragraph = Elements.Template.Paragraph:Clone()
			Paragraph.Title.Text = ParagraphSettings.Title
			Paragraph.Content.Text = ParagraphSettings.Content
			Paragraph.Visible = true
			Tab.Elements[ParagraphSettings.Title] = {type = 'paragraph', section = ParagraphSettings.SectionParent, element = Paragraph}
			if SectionParent or (ParagraphSettings.SectionParent and ParagraphSettings.SectionParent.Holder) then
				Paragraph.Parent = SectionParent and SectionParent.Holder or ParagraphSettings.SectionParent.Holder
			else Paragraph.Parent = TabPage end
			Paragraph.Content.Size = UDim2.new(0, 438, 0, Paragraph.Content.TextBounds.Y)
			Paragraph.Size = UDim2.new(0, 465, 0, Paragraph.Content.TextBounds.Y + 40)
			Paragraph.BackgroundTransparency = 1
			Paragraph.UIStroke.Transparency = 1
			Paragraph.Title.TextTransparency = 1
			Paragraph.Content.TextTransparency = 1
			Paragraph.BackgroundColor3 = SelectedTheme.SecondaryElementBackground
			Paragraph.UIStroke.Color = SelectedTheme.SecondaryElementStroke
			TweenService:Create(Paragraph, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
			TweenService:Create(Paragraph.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
			TweenService:Create(Paragraph.Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
			TweenService:Create(Paragraph.Content, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
			function ParagraphValue:Set(NewParagraphSettings)
				Paragraph.Title.Text = NewParagraphSettings.Title
				Paragraph.Content.Text = NewParagraphSettings.Content
			end
			return ParagraphValue
		end

		-- Input
		function Tab:CreateInput(InputSettings)
			local Input = Elements.Template.Input:Clone()
			Input.Name = InputSettings.Name
			Input.Title.Text = InputSettings.Name
			Input.Visible = true
			InputSettings.Locked = false
			Tab.Elements[InputSettings.Name] = {type = 'input', section = InputSettings.SectionParent, element = Input}
			if InputSettings.SectionParent then Input.Parent = InputSettings.SectionParent.Holder
			else Input.Parent = TabPage end
			AddInfos(Input, InputSettings, 'input')
			Input.BackgroundTransparency = 1
			Input.UIStroke.Transparency = 1
			Input.Title.TextTransparency = 1
			Input.InputFrame.BackgroundColor3 = SelectedTheme.InputBackground
			Input.InputFrame.UIStroke.Color = SelectedTheme.InputStroke
			TweenService:Create(Input, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
			TweenService:Create(Input.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
			TweenService:Create(Input.Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
			Input.InputFrame.InputBox.PlaceholderText = InputSettings.PlaceholderText
			Input.InputFrame.Size = UDim2.new(0, Input.InputFrame.InputBox.TextBounds.X + 24, 0, 30)
			Input.InputFrame.InputBox:GetPropertyChangedSignal('Text'):Connect(function()
				local TextBox = Input.InputFrame.InputBox
				local TextSize = game:GetService("TextService"):GetTextSize(TextBox.Text, TextBox.TextSize, TextBox.Font, TextBox.AbsoluteSize)
				TweenService:Create(Input.InputFrame, TweenInfo.new(0.55, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Size = UDim2.new(0, TextSize.X + 24, 0, 30)}):Play()
				if Input.InputFrame.InputBox.Text == '' then return end
				if InputSettings.CharacterLimit and InputSettings.CharacterLimit < Input.InputFrame.InputBox.Text:len() then Input.InputFrame.InputBox.Text = Input.InputFrame.InputBox.Text:sub(1, InputSettings.CharacterLimit) end
				if InputSettings.NumbersOnly then Input.InputFrame.InputBox.Text = Input.InputFrame.InputBox.Text:gsub('%D+', '') end
			end)
			Input.InputFrame.InputBox.FocusLost:Connect(function(enter)
				TweenService:Create(Input.InputFrame, TweenInfo.new(0.55, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Size = UDim2.new(0, Input.InputFrame.InputBox.TextBounds.X + 24, 0, 30)}):Play()
				if InputSettings.OnEnter and not enter then if InputSettings.RemoveTextAfterFocusLost then Input.InputFrame.InputBox.Text = ""; Input.InputFrame.Size = UDim2.new(0, Input.InputFrame.InputBox.TextBounds.X + 24, 0, 30) end return end
				local Success, Response = pcall(function() InputSettings.Callback(Input.InputFrame.InputBox.Text) end)
				if not Success then
					TweenService:Create(Input, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = Color3.fromRGB(85,0,0)}):Play()
					TweenService:Create(Input.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
					Input.Title.Text = "Callback Error"
					print("NoviraField | "..InputSettings.Name.." Callback Error "..tostring(Response))
					wait(0.5)
					Input.Title.Text = InputSettings.Name
					TweenService:Create(Input, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
					TweenService:Create(Input.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
				end
				if InputSettings.RemoveTextAfterFocusLost then Input.InputFrame.InputBox.Text = "" end
				SaveConfiguration()
			end)
			Input.MouseEnter:Connect(function() TweenService:Create(Input, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackgroundHover}):Play() end)
			Input.MouseLeave:Connect(function() TweenService:Create(Input, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play() end)
			Input.InputFrame.InputBox.Focused:Connect(function()
				TweenService:Create(Input.InputFrame, TweenInfo.new(0.55, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Size = UDim2.new(0, Input.InputFrame.InputBox.TextBounds.X + 24, 0, 30)}):Play()
				if InputSettings.Locked then Input.InputFrame.InputBox:ReleaseFocus() return end
			end)
			function InputSettings:Destroy() Input:Destroy() end
			function InputSettings:Lock(Reason)
				if InputSettings.Locked then return end
				InputSettings.Locked = true
				Input.Lock.Reason.Text = Reason or 'Locked'
				TweenService:Create(Input.Lock, TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {BackgroundTransparency = 0}):Play()
				TweenService:Create(Input.Lock.Reason, TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {TextTransparency = 0}):Play()
				wait(0.2)
				if not InputSettings.Locked then return end
				TweenService:Create(Input.Lock.Reason.Icon, TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {ImageTransparency = 0}):Play()
			end
			function InputSettings:Unlock()
				if not InputSettings.Locked then return end
				InputSettings.Locked = false
				wait(0.2)
				TweenService:Create(Input.Lock.Reason.Icon, TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {ImageTransparency = 1}):Play()
				if InputSettings.Locked then return end
				TweenService:Create(Input.Lock, TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {BackgroundTransparency = 1}):Play()
				TweenService:Create(Input.Lock.Reason, TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {TextTransparency = 1}):Play()
			end
			function InputSettings:Visible(bool) Input.Visible = bool end
			return InputSettings
		end

		-- Dropdown
		function Tab:CreateDropdown(DropdownSettings)
			local Dropdown = Elements.Template.Dropdown:Clone()
			local SearchBar2 = Dropdown.List["-SearchBar"]
			DropdownSettings.Items = {Selected = {Default = DropdownSettings.Selected or nil}}
			AddInfos(Dropdown, DropdownSettings, 'dropdown')
			DropdownSettings.Locked = false
			local Multi = DropdownSettings.MultiSelection or false
			if string.find(DropdownSettings.Name, "closed") then Dropdown.Name = "Dropdown"
			else Dropdown.Name = DropdownSettings.Name end
			Dropdown.Title.Text = DropdownSettings.Name
			Dropdown.Visible = true
			Tab.Elements[DropdownSettings.Name] = {type = 'dropdown', section = DropdownSettings.SectionParent, element = Dropdown}
			if DropdownSettings.SectionParent then Dropdown.Parent = DropdownSettings.SectionParent.Holder
			else Dropdown.Parent = TabPage end
			Dropdown.List.Visible = false
			Dropdown.BackgroundTransparency = 1
			Dropdown.UIStroke.Transparency = 1
			Dropdown.Title.TextTransparency = 1
			Dropdown.Size = UDim2.new(0, 465, 0, 44)
			TweenService:Create(Dropdown, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
			TweenService:Create(Dropdown.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
			TweenService:Create(Dropdown.Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
			for _, ununusedoption in ipairs(Dropdown.List:GetChildren()) do
				if ununusedoption.ClassName == "Frame" and ununusedoption.Name ~= 'PlaceHolder' and ununusedoption.Name ~= "-SearchBar" then
					ununusedoption:Destroy()
				end
			end
			Dropdown.Toggle.Rotation = 180
			local function GetOptionInstance(Name)
				for i, v in pairs(Dropdown.List:GetChildren()) do
					if typeof(Name) == "Instance" and v.Name == Name.Name or v.Name == Name or v == Name then
						TweenService:Create(v, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundColor3 = Color3.fromRGB(30,30,30)}):Play()
						return v
					end
				end
			end
			local function RefreshSelected(boolean)
				if #DropdownSettings.Items.Selected > 0 then
					local NT = {}
					for _, kj in ipairs(DropdownSettings.Items.Selected) do
						if boolean and typeof(kj.Option) == "Instance" then
							for _, v in pairs(Dropdown.List:GetChildren()) do
								if v.ClassName == "Frame" and v.Name ~= 'PlaceHolder' and v.Name ~= "-SearchBar" then
									TweenService:Create(v, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundColor3 = Color3.fromRGB(30,30,30)}):Play()
								end
							end
							TweenService:Create(kj.Option, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundColor3 = Color3.fromRGB(40,40,40)}):Play()
						end
						NT[#NT+1] = kj.Name
					end
					Dropdown.Selected.Text = table.concat(NT, ", ")
				else
					Dropdown.Selected.Text = "Select an option"
				end
			end
			local function DDError(text)
				TweenService:Create(Dropdown, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = Color3.fromRGB(85,0,0)}):Play()
				TweenService:Create(Dropdown.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
				Dropdown.Title.Text = text
				wait(0.5)
				Dropdown.Title.Text = DropdownSettings.Name
				TweenService:Create(Dropdown, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
				TweenService:Create(Dropdown.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
			end
			Dropdown.Interact.MouseButton1Click:Connect(function()
				if DropdownSettings.Locked then return end
				TweenService:Create(Dropdown, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackgroundHover}):Play()
				TweenService:Create(Dropdown.UIStroke, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
				wait(0.1)
				TweenService:Create(Dropdown, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
				TweenService:Create(Dropdown.UIStroke, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
				if Debounce then return end
				if Dropdown.List.Visible then
					Debounce = true
					TweenService:Create(Dropdown, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 465, 0, 44)}):Play()
					for _, DropdownOpt in ipairs(Dropdown.List:GetChildren()) do
						if DropdownOpt.ClassName == "Frame" and DropdownOpt.Name ~= 'PlaceHolder' and DropdownOpt ~= SearchBar2 then
							TweenService:Create(DropdownOpt, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
							TweenService:Create(DropdownOpt.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
							TweenService:Create(DropdownOpt.Title, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
						end
					end
					TweenService:Create(Dropdown.List, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {ScrollBarImageTransparency = 1}):Play()
					TweenService:Create(Dropdown.Toggle, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {Rotation = 180}):Play()
					wait(0.35)
					Dropdown.List.Visible = false
					Debounce = false
				else
					TweenService:Create(Dropdown, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 465, 0, 178)}):Play()
					Dropdown.List.Visible = true
					TweenService:Create(Dropdown.List, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {ScrollBarImageTransparency = 0.7}):Play()
					TweenService:Create(Dropdown.Toggle, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {Rotation = 0}):Play()
					for _, DropdownOpt in ipairs(Dropdown.List:GetChildren()) do
						if DropdownOpt.ClassName == "Frame" and DropdownOpt.Name ~= 'PlaceHolder' and DropdownOpt ~= SearchBar2 then
							TweenService:Create(DropdownOpt, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
							TweenService:Create(DropdownOpt.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
							TweenService:Create(DropdownOpt.Title, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
						end
					end
				end
			end)
			Dropdown.List['-SearchBar'].Input:GetPropertyChangedSignal('Text'):Connect(function()
				local InputText = string.upper(Dropdown.List['-SearchBar'].Input.Text)
				for _, item in ipairs(Dropdown.List:GetChildren()) do
					if item:IsA('Frame') and item.Name ~= 'Template' and item ~= SearchBar2 and item.Name ~= 'PlaceHolder' then
						if InputText == "" or InputText == " " or string.find(string.upper(item.Name), InputText) ~= nil then
							TweenService:Create(item, TweenInfo.new(0.15, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
							TweenService:Create(item.UIStroke, TweenInfo.new(0.15, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
							TweenService:Create(item.Title, TweenInfo.new(0.15, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
						else
							TweenService:Create(item, TweenInfo.new(0.15, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
							TweenService:Create(item.UIStroke, TweenInfo.new(0.15, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
							TweenService:Create(item.Title, TweenInfo.new(0.15, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
						end
					end
				end
			end)
			Dropdown.MouseEnter:Connect(function()
				if not Dropdown.List.Visible then TweenService:Create(Dropdown, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackgroundHover}):Play() end
			end)
			Dropdown.MouseLeave:Connect(function()
				TweenService:Create(Dropdown, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
			end)
			local function AddOption(Option, Selecteds)
				local DropdownOption = Elements.Template.Dropdown.List.Template:Clone()
				DropdownOption:GetPropertyChangedSignal('BackgroundTransparency'):Connect(function()
					DropdownOption.Visible = DropdownOption.BackgroundTransparency ~= 1
				end)
				DropdownSettings.Items[Option] = {Option = DropdownOption, Name = Option.Name or Option, Selected = false}
				local OptionInTable = DropdownSettings.Items[Option]
				DropdownOption.Name = Option.Name or Option
				DropdownOption.Title.Text = Option.Name or Option
				DropdownOption.Parent = Dropdown.List
				DropdownOption.Visible = true
				local IsSelected = OptionInTable.Selected
				if typeof(Selecteds) == 'string' then Selecteds = {Selecteds} end
				if Selecteds and #Selecteds > 0 then
					for _, Selected in pairs(Selecteds) do
						if Selected == Option then
							IsSelected = true
							OptionInTable.Selected = true
							table.insert(DropdownSettings.Items.Selected, OptionInTable)
						end
					end
					RefreshSelected()
				end
				if IsSelected then DropdownOption.BackgroundColor3 = Color3.fromRGB(40,40,40) end
				DropdownOption.BackgroundTransparency = Dropdown.Visible and 0 or 1
				DropdownOption.UIStroke.Transparency = Dropdown.Visible and 0 or 1
				DropdownOption.Title.TextTransparency = Dropdown.Visible and 0 or 1
				DropdownOption.Interact.ZIndex = 50
				DropdownOption.Interact.MouseButton1Click:Connect(function()
					if DropdownSettings.Locked then return end
					if DropdownOption.BackgroundColor3 == Color3.fromRGB(30,30,30) then OptionInTable.Selected = false else OptionInTable.Selected = true end
					if OptionInTable.Selected then
						OptionInTable.Selected = false
						table.remove(DropdownSettings.Items.Selected, table.find(DropdownSettings.Items.Selected, OptionInTable))
						local Success, Response = pcall(function() DropdownSettings.Callback(Option, DropdownSettings.Items.Selected) end)
						if not Success then DDError('Callback Error') print("NoviraField | "..DropdownSettings.Name.." Callback Error "..tostring(Response)) end
						RefreshSelected()
						TweenService:Create(DropdownOption, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundColor3 = Color3.fromRGB(30,30,30)}):Play()
						SaveConfiguration()
						return
					end
					if not Multi and DropdownSettings.Items.Selected[1] then
						DropdownSettings.Items.Selected[1].Selected = false
						if typeof(DropdownSettings.Items.Selected[1]["Option"]) == "Instance" then
							TweenService:Create(DropdownSettings.Items.Selected[1].Option, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundColor3 = Color3.fromRGB(30,30,30)}):Play()
						end
					end
					if not Multi then
						DropdownSettings.Items.Selected = {OptionInTable}
						Dropdown.Selected.Text = Option.Name or Option
					else
						table.insert(DropdownSettings.Items.Selected, OptionInTable)
						RefreshSelected()
					end
					local Success, Response = pcall(function() DropdownSettings.Callback(Option, DropdownSettings.Items.Selected) end)
					if not Success then DDError('Callback Error') print("NoviraField | "..DropdownSettings.Name.." Callback Error "..tostring(Response)) end
					OptionInTable.Selected = true
					if not Multi then
						for _, op in ipairs(DropdownSettings.Items.Selected) do
							if typeof(op) == "Instance" then
								TweenService:Create(op.Option, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundColor3 = Color3.fromRGB(30,30,30)}):Play()
							end
						end
					end
					TweenService:Create(DropdownOption.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
					TweenService:Create(DropdownOption, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundColor3 = Color3.fromRGB(40,40,40)}):Play()
					Debounce = true
					wait(0.2)
					TweenService:Create(DropdownOption.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
					wait(0.1)
					if not Multi then
						TweenService:Create(Dropdown, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 465, 0, 45)}):Play()
						for _, DropdownOpt in ipairs(Dropdown.List:GetChildren()) do
							if DropdownOpt.ClassName == "Frame" and DropdownOpt.Name ~= "PlaceHolder" and DropdownOpt ~= SearchBar2 then
								TweenService:Create(DropdownOpt, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
								TweenService:Create(DropdownOpt.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
								TweenService:Create(DropdownOpt.Title, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
							end
						end
						TweenService:Create(Dropdown.List, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {ScrollBarImageTransparency = 1}):Play()
						TweenService:Create(Dropdown.Toggle, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {Rotation = 180}):Play()
						wait(0.35)
						Dropdown.List.Visible = false
					end
					Debounce = false
					SaveConfiguration()
				end)
			end
			local function AddOptions(Options, Selected)
				if typeof(Options) == 'table' then
					for _, Option in ipairs(Options) do AddOption(Option, Selected) end
				else AddOption(Options, Selected) end
				if Settings.ConfigurationSaving and Settings.ConfigurationSaving.Enabled and DropdownSettings.Flag then
					NoviraFieldLibrary.Flags[DropdownSettings.Flag] = DropdownSettings
				end
			end
			function DropdownSettings:Add(Items, Selected) AddOptions(Items, Selected) end
			AddOptions(DropdownSettings.Options, DropdownSettings.CurrentOption)
			function DropdownSettings:Set(NewOption)
				local OldNewOption = NewOption
				if NewOption then DropdownSettings.Items.Selected = {} end
				if typeof(NewOption) ~= 'table' then NewOption = {NewOption} end
				for _, o in pairs(NewOption) do
					local Items = {Option = GetOptionInstance(o) or o, Name = o.Name or o, Selected = true}
					table.insert(DropdownSettings.Items.Selected, Items)
					local Success, Response = pcall(function() DropdownSettings.Callback(OldNewOption, DropdownSettings.Items.Selected) end)
					if not Success then DDError("Callback Error") print("NoviraField | "..DropdownSettings.Name.." Callback Error "..tostring(Response)) end
				end
				RefreshSelected(true)
			end
			function DropdownSettings:Error(text) DDError(text) end
			function DropdownSettings:Refresh(NewOptions, Selecteds)
				DropdownSettings.Items = {}
				DropdownSettings.Items.Selected = {}
				local Success, Response = pcall(function() DropdownSettings.Callback(NewOptions, DropdownSettings.Items.Selected) end)
				if not Success then DDError('Callback Error') print("NoviraField | "..DropdownSettings.Name.." Callback Error "..tostring(Response)) end
				for _, option in ipairs(Dropdown.List:GetChildren()) do
					if option.ClassName == "Frame" and option ~= SearchBar2 and option.Name ~= "Placeholder" then option:Destroy() end
				end
				AddOptions(NewOptions, Selecteds)
			end
			function DropdownSettings:Destroy() Dropdown:Destroy() end
			function DropdownSettings:Lock(Reason)
				if DropdownSettings.Locked then return end
				DropdownSettings.Locked = true
				Debounce = true
				TweenService:Create(Dropdown, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 465, 0, 44)}):Play()
				for _, DropdownOpt in ipairs(Dropdown.List:GetChildren()) do
					if DropdownOpt.ClassName == "Frame" and DropdownOpt.Name ~= 'PlaceHolder' and DropdownOpt.Name ~= "-SearchBar" then
						TweenService:Create(DropdownOpt, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
						TweenService:Create(DropdownOpt.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
						TweenService:Create(DropdownOpt.Title, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
					end
				end
				TweenService:Create(Dropdown.List, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {ScrollBarImageTransparency = 1}):Play()
				TweenService:Create(Dropdown.Toggle, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {Rotation = 180}):Play()
				wait(0.35)
				Dropdown.List.Visible = false
				Debounce = false
				Dropdown.Lock.Reason.Text = Reason or 'Locked'
				TweenService:Create(Dropdown.Lock, TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {BackgroundTransparency = 0}):Play()
				TweenService:Create(Dropdown.Lock.Reason, TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {TextTransparency = 0}):Play()
				wait(0.2)
				if not DropdownSettings.Locked then return end
				TweenService:Create(Dropdown.Lock.Reason.Icon, TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {ImageTransparency = 0}):Play()
			end
			function DropdownSettings:Unlock()
				if not DropdownSettings.Locked then return end
				DropdownSettings.Locked = false
				wait(0.2)
				TweenService:Create(Dropdown.Lock.Reason.Icon, TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {ImageTransparency = 1}):Play()
				if DropdownSettings.Locked then return end
				TweenService:Create(Dropdown.Lock, TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {BackgroundTransparency = 1}):Play()
				TweenService:Create(Dropdown.Lock.Reason, TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {TextTransparency = 1}):Play()
			end
			function DropdownSettings:Visible(bool) Dropdown.Visible = bool end
			return DropdownSettings
		end

		-- DropdownToggleMulti
		-- Toggle berada di kanan setiap item. Bentuk dropdown sama kayak Dropdown biasa.
		-- Bisa pilih multi item sekaligus. Setiap item punya toggle kanan (squircle).
		-- Warna ON: biru clean (sama kayak ToggleEnabled theme). OFF: abu.
		function Tab:CreateDropdownToggleMulti(Settings2)
			local DTM = Elements.Template.Dropdown:Clone()
			local DTMSearchBar = DTM.List["-SearchBar"]
			Settings2.CurrentOptions = Settings2.CurrentOptions or {}
			Settings2.Locked = false

			DTM.Name = Settings2.Name
			DTM.Title.Text = Settings2.Name
			DTM.Visible = true

			DTM.BackgroundTransparency = 1
			DTM.UIStroke.Transparency = 1
			DTM.Title.TextTransparency = 1
			DTM.Size = UDim2.new(0, 465, 0, 44)

			if Settings2.SectionParent then DTM.Parent = Settings2.SectionParent.Holder
			else DTM.Parent = TabPage end

			DTM.List.Visible = false
			DTM.Toggle.Rotation = 180

			TweenService:Create(DTM, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
			TweenService:Create(DTM.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
			TweenService:Create(DTM.Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()

			for _, old in ipairs(DTM.List:GetChildren()) do
				if old.ClassName == "Frame" and old.Name ~= 'PlaceHolder' and old.Name ~= "-SearchBar" then
					old:Destroy()
				end
			end

			local function RefreshDTMSelected()
				if #Settings2.CurrentOptions > 0 then
					DTM.Selected.Text = table.concat(Settings2.CurrentOptions, ", ")
				else
					DTM.Selected.Text = "Select options"
				end
			end

			RefreshDTMSelected()

			local function AddDTMOption(OptionName)
				local Opt = Elements.Template.Dropdown.List.Template:Clone()
				Opt.Name = OptionName
				Opt.Title.Text = OptionName
				Opt.Parent = DTM.List
				Opt.Visible = true

				local IsOn = table.find(Settings2.CurrentOptions, OptionName) ~= nil

				-- Buat toggle kanan (squircle style)
				local ToggleBtn = Instance.new("Frame")
				ToggleBtn.Name = "DTMToggle"
				ToggleBtn.Size = UDim2.new(0, 34, 0, 18)
				ToggleBtn.AnchorPoint = Vector2.new(1, 0.5)
				ToggleBtn.Position = UDim2.new(1, -10, 0.5, 0)
				ToggleBtn.BackgroundColor3 = IsOn and SelectedTheme.ToggleEnabled or SelectedTheme.ToggleDisabled
				ToggleBtn.ZIndex = 10
				local ToggleCorner = Instance.new("UICorner", ToggleBtn)
				ToggleCorner.CornerRadius = UDim.new(0, 6)
				local ToggleStroke = Instance.new("UIStroke", ToggleBtn)
				ToggleStroke.Color = IsOn and SelectedTheme.ToggleEnabledStroke or SelectedTheme.ToggleDisabledStroke
				ToggleStroke.Thickness = 1.5

				-- Indicator dot (squircle)
				local Dot = Instance.new("Frame", ToggleBtn)
				Dot.Name = "Dot"
				Dot.Size = UDim2.new(0, 12, 0, 12)
				Dot.AnchorPoint = Vector2.new(0.5, 0.5)
				Dot.Position = IsOn and UDim2.new(1, -8, 0.5, 0) or UDim2.new(0, 8, 0.5, 0)
				Dot.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Dot.ZIndex = 11
				local DotCorner = Instance.new("UICorner", Dot)
				DotCorner.CornerRadius = UDim.new(0, 3)

				ToggleBtn.Parent = Opt

				-- Interact transparan di atas keseluruhan item
				local InteractOverlay = Instance.new("TextButton", Opt)
				InteractOverlay.Name = "InteractDTM"
				InteractOverlay.Size = UDim2.new(1, 0, 1, 0)
				InteractOverlay.BackgroundTransparency = 1
				InteractOverlay.Text = ""
				InteractOverlay.ZIndex = 20

				Opt.BackgroundTransparency = 0
				Opt.UIStroke.Transparency = 0
				Opt.Title.TextTransparency = 0

				InteractOverlay.MouseButton1Click:Connect(function()
					if Settings2.Locked then return end
					local idx = table.find(Settings2.CurrentOptions, OptionName)
					if idx then
						table.remove(Settings2.CurrentOptions, idx)
						IsOn = false
					else
						table.insert(Settings2.CurrentOptions, OptionName)
						IsOn = true
					end
					TweenService:Create(ToggleBtn, TweenInfo.new(0.35, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
						BackgroundColor3 = IsOn and SelectedTheme.ToggleEnabled or SelectedTheme.ToggleDisabled
					}):Play()
					TweenService:Create(ToggleStroke, TweenInfo.new(0.35, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
						Color = IsOn and SelectedTheme.ToggleEnabledStroke or SelectedTheme.ToggleDisabledStroke
					}):Play()
					TweenService:Create(Dot, TweenInfo.new(0.35, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
						Position = IsOn and UDim2.new(1, -8, 0.5, 0) or UDim2.new(0, 8, 0.5, 0)
					}):Play()
					RefreshDTMSelected()
					local Success, Response = pcall(function()
						Settings2.Callback(OptionName, IsOn, Settings2.CurrentOptions)
					end)
					if not Success then
						print("NoviraField | "..Settings2.Name.." DropdownToggleMulti Callback Error "..tostring(Response))
					end
					SaveConfiguration()
				end)
			end

			for _, opt in ipairs(Settings2.Options or {}) do
				AddDTMOption(opt)
			end

			DTM.Interact.MouseButton1Click:Connect(function()
				if Settings2.Locked then return end
				if Debounce then return end
				if DTM.List.Visible then
					Debounce = true
					TweenService:Create(DTM, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 465, 0, 44)}):Play()
					for _, Opt in ipairs(DTM.List:GetChildren()) do
						if Opt.ClassName == "Frame" and Opt.Name ~= 'PlaceHolder' and Opt ~= DTMSearchBar then
							TweenService:Create(Opt, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
							TweenService:Create(Opt.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
							TweenService:Create(Opt.Title, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
						end
					end
					TweenService:Create(DTM.List, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {ScrollBarImageTransparency = 1}):Play()
					TweenService:Create(DTM.Toggle, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {Rotation = 180}):Play()
					wait(0.35)
					DTM.List.Visible = false
					Debounce = false
				else
					TweenService:Create(DTM, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 465, 0, 178)}):Play()
					DTM.List.Visible = true
					TweenService:Create(DTM.List, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {ScrollBarImageTransparency = 0.7}):Play()
					TweenService:Create(DTM.Toggle, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {Rotation = 0}):Play()
					for _, Opt in ipairs(DTM.List:GetChildren()) do
						if Opt.ClassName == "Frame" and Opt.Name ~= 'PlaceHolder' and Opt ~= DTMSearchBar then
							TweenService:Create(Opt, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
							TweenService:Create(Opt.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
							TweenService:Create(Opt.Title, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
						end
					end
				end
			end)

			DTM.MouseEnter:Connect(function()
				if not DTM.List.Visible then TweenService:Create(DTM, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackgroundHover}):Play() end
			end)
			DTM.MouseLeave:Connect(function()
				TweenService:Create(DTM, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
			end)

			function Settings2:Add(NewOptions)
				if typeof(NewOptions) == 'table' then
					for _, opt in ipairs(NewOptions) do AddDTMOption(opt) end
				else AddDTMOption(NewOptions) end
			end

			function Settings2:SetOptions(opt, state)
				local idx = table.find(Settings2.CurrentOptions, opt)
				if state and not idx then
					table.insert(Settings2.CurrentOptions, opt)
				elseif not state and idx then
					table.remove(Settings2.CurrentOptions, idx)
				end
				for _, child in ipairs(DTM.List:GetChildren()) do
					if child.ClassName == "Frame" and child.Name == opt then
						local tb = child:FindFirstChild("DTMToggle")
						if tb then
							local isOn = table.find(Settings2.CurrentOptions, opt) ~= nil
							TweenService:Create(tb, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundColor3 = isOn and SelectedTheme.ToggleEnabled or SelectedTheme.ToggleDisabled}):Play()
							local dot = tb:FindFirstChild("Dot")
							if dot then
								TweenService:Create(dot, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {Position = isOn and UDim2.new(1,-8,0.5,0) or UDim2.new(0,8,0.5,0)}):Play()
							end
						end
					end
				end
				RefreshDTMSelected()
			end

			function Settings2:Destroy() DTM:Destroy() end
			function Settings2:Visible(bool) DTM.Visible = bool end
			function Settings2:Lock(Reason)
				Settings2.Locked = true
				DTM.Lock.Reason.Text = Reason or 'Locked'
				TweenService:Create(DTM.Lock, TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {BackgroundTransparency = 0}):Play()
				TweenService:Create(DTM.Lock.Reason, TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {TextTransparency = 0}):Play()
				wait(0.2)
				TweenService:Create(DTM.Lock.Reason.Icon, TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {ImageTransparency = 0}):Play()
			end
			function Settings2:Unlock()
				Settings2.Locked = false
				wait(0.2)
				TweenService:Create(DTM.Lock.Reason.Icon, TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {ImageTransparency = 1}):Play()
				TweenService:Create(DTM.Lock, TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {BackgroundTransparency = 1}):Play()
				TweenService:Create(DTM.Lock.Reason, TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {TextTransparency = 1}):Play()
			end

			return Settings2
		end

		-- Toggle
		function Tab:CreateToggle(ToggleSettings)
			local Toggle = Elements.Template.Toggle:Clone()
			Toggle.Name = ToggleSettings.Name
			Toggle.Title.Text = ToggleSettings.Name
			Toggle.Visible = true
			Toggle.BackgroundTransparency = 1
			Toggle.UIStroke.Transparency = 1
			Toggle.Title.TextTransparency = 1
			Toggle.Switch.BackgroundColor3 = SelectedTheme.ToggleBackground
			Tab.Elements[Toggle.Name] = {type = 'toggle', section = ToggleSettings.SectionParent, element = Toggle}
			AddInfos(Toggle, ToggleSettings, 'toggle')
			if ToggleSettings.SectionParent then Toggle.Parent = ToggleSettings.SectionParent.Holder
			else Toggle.Parent = TabPage end
			if SelectedTheme ~= NoviraFieldLibrary.Theme.Default then Toggle.Switch.Shadow.Visible = false end
			ToggleSettings.Locked = false
			TweenService:Create(Toggle, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
			TweenService:Create(Toggle.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
			TweenService:Create(Toggle.Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
			if not ToggleSettings.CurrentValue then
				Toggle.Switch.Indicator.Position = UDim2.new(1, -40, 0.5, 0)
				Toggle.Switch.Indicator.UIStroke.Color = SelectedTheme.ToggleDisabledStroke
				Toggle.Switch.Indicator.BackgroundColor3 = SelectedTheme.ToggleDisabled
				Toggle.Switch.UIStroke.Color = SelectedTheme.ToggleDisabledOuterStroke
			else
				Toggle.Switch.Indicator.Position = UDim2.new(1, -20, 0.5, 0)
				Toggle.Switch.Indicator.UIStroke.Color = SelectedTheme.ToggleEnabledStroke
				Toggle.Switch.Indicator.BackgroundColor3 = SelectedTheme.ToggleEnabled
				Toggle.Switch.UIStroke.Color = SelectedTheme.ToggleEnabledOuterStroke
			end
			Toggle.MouseEnter:Connect(function()
				TweenService:Create(Toggle, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackgroundHover}):Play()
			end)
			Toggle.MouseLeave:Connect(function()
				TweenService:Create(Toggle, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
			end)
			Toggle.Interact.MouseButton1Click:Connect(function()
				if ToggleSettings.Locked then return end
				if ToggleSettings.CurrentValue then
					ToggleSettings.CurrentValue = false
					TweenService:Create(Toggle, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackgroundHover}):Play()
					TweenService:Create(Toggle.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
					TweenService:Create(Toggle.Switch.Indicator, TweenInfo.new(0.45, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Position = UDim2.new(1,-40,0.5,0)}):Play()
					TweenService:Create(Toggle.Switch.Indicator, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(0,12,0,12)}):Play()
					TweenService:Create(Toggle.Switch.Indicator.UIStroke, TweenInfo.new(0.55, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Color = SelectedTheme.ToggleDisabledStroke}):Play()
					TweenService:Create(Toggle.Switch.Indicator, TweenInfo.new(0.8, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {BackgroundColor3 = SelectedTheme.ToggleDisabled}):Play()
					TweenService:Create(Toggle.Switch.UIStroke, TweenInfo.new(0.55, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Color = SelectedTheme.ToggleDisabledOuterStroke}):Play()
					wait(0.05)
					TweenService:Create(Toggle.Switch.Indicator, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(0,17,0,17)}):Play()
					wait(0.15)
					TweenService:Create(Toggle, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
					TweenService:Create(Toggle.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
				else
					ToggleSettings.CurrentValue = true
					TweenService:Create(Toggle, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackgroundHover}):Play()
					TweenService:Create(Toggle.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
					TweenService:Create(Toggle.Switch.Indicator, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Position = UDim2.new(1,-20,0.5,0)}):Play()
					TweenService:Create(Toggle.Switch.Indicator, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(0,12,0,12)}):Play()
					TweenService:Create(Toggle.Switch.Indicator.UIStroke, TweenInfo.new(0.55, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Color = SelectedTheme.ToggleEnabledStroke}):Play()
					TweenService:Create(Toggle.Switch.Indicator, TweenInfo.new(0.8, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {BackgroundColor3 = SelectedTheme.ToggleEnabled}):Play()
					TweenService:Create(Toggle.Switch.UIStroke, TweenInfo.new(0.55, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Color = SelectedTheme.ToggleEnabledOuterStroke}):Play()
					wait(0.05)
					TweenService:Create(Toggle.Switch.Indicator, TweenInfo.new(0.45, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(0,17,0,17)}):Play()
					wait(0.15)
					TweenService:Create(Toggle, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
					TweenService:Create(Toggle.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
				end
				local Success, Response = pcall(function() ToggleSettings.Callback(ToggleSettings.CurrentValue) end)
				if not Success then
					TweenService:Create(Toggle, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = Color3.fromRGB(85,0,0)}):Play()
					TweenService:Create(Toggle.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
					Toggle.Title.Text = "Callback Error"
					print("NoviraField | "..ToggleSettings.Name.." Callback Error "..tostring(Response))
					wait(0.5)
					Toggle.Title.Text = ToggleSettings.Name
					TweenService:Create(Toggle, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
					TweenService:Create(Toggle.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
				end
				SaveConfiguration()
			end)
			function ToggleSettings:Set(NewToggleValue)
				if NewToggleValue then
					ToggleSettings.CurrentValue = true
					TweenService:Create(Toggle.Switch.Indicator, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Position = UDim2.new(1,-20,0.5,0)}):Play()
					TweenService:Create(Toggle.Switch.Indicator, TweenInfo.new(0.8, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {BackgroundColor3 = SelectedTheme.ToggleEnabled}):Play()
					TweenService:Create(Toggle.Switch.Indicator.UIStroke, TweenInfo.new(0.55, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Color = SelectedTheme.ToggleEnabledStroke}):Play()
					TweenService:Create(Toggle.Switch.UIStroke, TweenInfo.new(0.55, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Color = SelectedTheme.ToggleEnabledOuterStroke}):Play()
				else
					ToggleSettings.CurrentValue = false
					TweenService:Create(Toggle.Switch.Indicator, TweenInfo.new(0.45, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Position = UDim2.new(1,-40,0.5,0)}):Play()
					TweenService:Create(Toggle.Switch.Indicator, TweenInfo.new(0.8, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {BackgroundColor3 = SelectedTheme.ToggleDisabled}):Play()
					TweenService:Create(Toggle.Switch.Indicator.UIStroke, TweenInfo.new(0.55, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Color = SelectedTheme.ToggleDisabledStroke}):Play()
					TweenService:Create(Toggle.Switch.UIStroke, TweenInfo.new(0.55, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Color = SelectedTheme.ToggleDisabledOuterStroke}):Play()
				end
				local Success, Response = pcall(function() ToggleSettings.Callback(ToggleSettings.CurrentValue) end)
				if not Success then
					print("NoviraField | "..ToggleSettings.Name.." Callback Error "..tostring(Response))
				end
				SaveConfiguration()
			end
			function ToggleSettings:Destroy() Toggle:Destroy() end
			function ToggleSettings:Lock(Reason)
				if ToggleSettings.Locked then return end
				ToggleSettings.Locked = true
				Toggle.Lock.Reason.Text = Reason or 'Locked'
				TweenService:Create(Toggle.Lock, TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {BackgroundTransparency = 0}):Play()
				TweenService:Create(Toggle.Lock.Reason, TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {TextTransparency = 0}):Play()
				wait(0.2)
				if not ToggleSettings.Locked then return end
				TweenService:Create(Toggle.Lock.Reason.Icon, TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {ImageTransparency = 0}):Play()
			end
			function ToggleSettings:Unlock()
				if not ToggleSettings.Locked then return end
				ToggleSettings.Locked = false
				wait(0.2)
				TweenService:Create(Toggle.Lock.Reason.Icon, TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {ImageTransparency = 1}):Play()
				if ToggleSettings.Locked then return end
				TweenService:Create(Toggle.Lock, TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {BackgroundTransparency = 1}):Play()
				TweenService:Create(Toggle.Lock.Reason, TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {TextTransparency = 1}):Play()
			end
			function ToggleSettings:Visible(bool) Toggle.Visible = bool end
			if Settings.ConfigurationSaving then
				if Settings.ConfigurationSaving.Enabled and ToggleSettings.Flag then
					NoviraFieldLibrary.Flags[ToggleSettings.Flag] = ToggleSettings
				end
			end
			return ToggleSettings
		end

		return Tab
	end

	-- Loading Done
	local LoadedReturned = false
	repeat wait() until SDone or LoadedReturned
	LoadedReturned = true

	TweenService:Create(LoadingFrame, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
	TweenService:Create(LoadingFrame.Title, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
	TweenService:Create(LoadingFrame.Subtitle, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
	TweenService:Create(LoadingFrame.Version, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
	wait(0.5)
	LoadingFrame.Visible = false

	TweenService:Create(Main, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 500, 0, 475)}):Play()
	Topbar.Visible = true
	Elements.Visible = true

	TweenService:Create(Topbar, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
	TweenService:Create(Topbar.Title, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
	TweenService:Create(Topbar.Divider, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
	TweenService:Create(Topbar.CornerRepair, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
	wait(0.1)
	for _, TopbarButton in ipairs(Topbar:GetChildren()) do
		if TopbarButton.ClassName == "ImageButton" then
			TweenService:Create(TopbarButton, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {ImageTransparency = 0.8}):Play()
		end
	end

	Topbar.ChangeSize.MouseButton1Click:Connect(function()
		if Debounce then return end
		if Minimised then spawn(Maximise) else spawn(Minimise) end
		Minimised = not Minimised
	end)

	Topbar.Hide.MouseButton1Click:Connect(function()
		if Debounce then return end
		spawn(Hide)
		Hidden = true
	end)

	UserInputService.InputBegan:Connect(function(Input, Processed)
		if Processed then return end
		if Input.KeyCode == Enum.KeyCode.RightShift then
			if Hidden then
				spawn(Unhide)
				Hidden = false
			end
		end
	end)

	Topbar.Theme.MouseButton1Click:Connect(function()
		if not SideBarClosed then spawn(CloseSideBar) else spawn(OpenSideBar) end
		SideBarClosed = not SideBarClosed
	end)

	Topbar.Search.MouseButton1Click:Connect(function()
		if not SearchHided then spawn(CloseSearch) else spawn(OpenSearch) end
		SearchHided = not SearchHided
	end)

	return Window
end

function NoviraFieldLibrary:Destroy()
	NoviraField:Destroy()
end

function NoviraFieldLibrary:Prompt(PromptSettings)
	local PromptUI = Prompt.Prompt
	Prompt.Visible = true
	clicked = false
	PromptUI.Size = UDim2.new(0, 340, 0, 140)
	PromptUI.BackgroundTransparency = 1
	PromptUI.UIStroke.Transparency = 1
	PromptUI.Title.TextTransparency = 1
	PromptUI.Content.TextTransparency = 1
	PromptUI.Sub.TextTransparency = 1
	PromptUI.Title.Text = PromptSettings.Title or ''
	PromptUI.Content.Text = PromptSettings.Content or ''
	PromptUI.Sub.Text = PromptSettings.Sub or ''
	if PromptSettings.Buttons then
		for _, ButtonInfo in ipairs(PromptSettings.Buttons) do
			local Button = PromptUI.Buttons.Template:Clone()
			Button.TextLabel.Text = ButtonInfo.Title
			Button.BackgroundColor3 = ButtonInfo.Color or Color3.fromRGB(40, 40, 40)
			Button.Visible = true
			Button.Parent = PromptUI.Buttons
			Button.UIStroke.Transparency = 1
			Button.TextLabel.TextTransparency = 1
			TweenService:Create(Button.UIStroke, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
			TweenService:Create(Button.TextLabel, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
			Button.Interact.MouseButton1Click:Connect(function()
				if clicked then return end
				clicked = true
				local Success, Response = pcall(ButtonInfo.Callback)
				if not Success then print("NoviraField | Prompt "..ButtonInfo.Title.." Callback Error "..tostring(Response)) end
				ClosePrompt()
			end)
		end
	end
	TweenService:Create(Prompt, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundTransparency = 0.5}):Play()
	TweenService:Create(PromptUI, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {BackgroundTransparency = 0, Size = UDim2.new(0, 370, 0, 160)}):Play()
	TweenService:Create(PromptUI.UIStroke, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
	TweenService:Create(PromptUI.Title, TweenInfo.new(0.45, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
	TweenService:Create(PromptUI.Content, TweenInfo.new(0.45, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
	TweenService:Create(PromptUI.Sub, TweenInfo.new(0.45, Enum.EasingStyle.Quint), {TextTransparency = 0.5}):Play()
end

return NoviraFieldLibrary
