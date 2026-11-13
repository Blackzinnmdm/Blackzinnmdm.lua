
local P = game:GetService("Players").LocalPlayer
local G = Instance.new("ScreenGui")
G.Name = "Blackzinnmdm"
G.ResetOnSpawn = false
G.Parent = P:WaitForChild("PlayerGui")

local pos = {}
local red = Color3.fromRGB(190,0,0)
local black = Color3.fromRGB(12,0,0)

local function create(class,parent,size,position,color)
    local o = Instance.new(class)
    o.Size = size
    o.Position = position
    o.BackgroundColor3 = color
    o.Parent = parent
    Instance.new("UICorner",o).CornerRadius = UDim.new(0,10)
    local s = Instance.new("UIStroke",o)
    s.Color = red
    s.Thickness = 2
    return o
end

local panel = create("Frame",G,
    UDim2.fromOffset(300,220),
    UDim2.new(.5,-150,.5,-110),black)
panel.Active = true
panel.Draggable = true

local function btn(parent,text,size,position)
    local b = create("TextButton",parent,size,position,black)
    b.Text = text
    b.TextColor3 = Color3.new(1,1,1)
    b.TextScaled = true
    b.Font = Enum.Font.GothamBold
    return b
end

local title = Instance.new("TextLabel",panel)
title.Size = UDim2.new(1,-50,0,45)
title.Position = UDim2.fromOffset(10,5)
title.BackgroundTransparency = 1
title.Text = "♛ Blackzinnmdm"
title.TextColor3 = red
title.TextScaled = true
title.Font = Enum.Font.GothamBold

local close = btn(panel,"X",
    UDim2.fromOffset(35,35),
    UDim2.new(1,-42,0,8))

local icon = btn(G,"B",
    UDim2.fromOffset(55,55),
    UDim2.new(0,20,.5,-27))
icon.Active = true
icon.Draggable = true

local subtitle = Instance.new("TextLabel",panel)
subtitle.Size = UDim2.new(1,0,0,30)
subtitle.Position = UDim2.fromOffset(0,50)
subtitle.BackgroundTransparency = 1
subtitle.Text = "TELEPORTE"
subtitle.TextColor3 = red
subtitle.TextScaled = true
subtitle.Font = Enum.Font.GothamBold

local function root()
    local c = P.Character
    return c and c:FindFirstChild("HumanoidRootPart")
end

local function save(n)
    local r = root()
    if r then pos[n] = r.CFrame end
end

local function tp(n)
    local r = root()
    if r and pos[n] then
        r.CFrame = pos[n]
    end
end

local b1 = btn(panel,"Spawn 1",
    UDim2.fromOffset(130,45),
    UDim2.fromOffset(15,90))

local b2 = btn(panel,"Tp 1",
    UDim2.fromOffset(130,45),
    UDim2.fromOffset(155,90))

local b3 = btn(panel,"Spawn 2",
    UDim2.fromOffset(130,45),
    UDim2.fromOffset(15,150))

local b4 = btn(panel,"Tp 2",
    UDim2.fromOffset(130,45),
    UDim2.fromOffset(155,150))

b1.MouseButton1Click:Connect(function() save(1) end)
b2.MouseButton1Click:Connect(function() tp(1) end)
b3.MouseButton1Click:Connect(function() save(2) end)
b4.MouseButton1Click:Connect(function() tp(2) end)

close.MouseButton1Click:Connect(function()
    panel.Visible = false
end)

icon.MouseButton1Click:Connect(function()
    panel.Visible = not panel.Visible
end)

