-- PHUC HUNG HUB FINAL (Speed + Noclip + Rainbow + Minecraft Font)

local Players=game:GetService("Players")
local Run=game:GetService("RunService")
local Tween=game:GetService("TweenService")
local plr=Players.LocalPlayer

local ICON_ID="rbxassetid://83051005250135"

---------------- INTRO ----------------
local intro=Instance.new("ScreenGui",game.CoreGui)
local txt=Instance.new("TextLabel",intro)
txt.Size=UDim2.new(1,0,1,0)
txt.Text="PHÚC HƯNG DZAI 😈"
txt.TextScaled=true
txt.Font=Enum.Font.Arcade
txt.BackgroundColor3=Color3.new(0,0,0)
txt.TextColor3=Color3.new(1,1,1)
task.wait(1.2)
intro:Destroy()

--------------- MAIN GUI --------------
local gui=Instance.new("ScreenGui",game.CoreGui)

local main=Instance.new("Frame",gui)
main.Size=UDim2.new(0,0,0,0)
main.Position=UDim2.new(.35,0,.3,0)
main.BackgroundColor3=Color3.fromRGB(15,15,15)
main.Active=true main.Draggable=true
main.ClipsDescendants=true

Tween:Create(main,TweenInfo.new(.4,Enum.EasingStyle.Back),{Size=UDim2.new(0,260,0,220)}):Play()

local title=Instance.new("TextLabel",main)
title.Size=UDim2.new(1,0,0,40)
title.Text="🔥 Phuc Hung Hub"
title.BackgroundTransparency=1
title.Font=Enum.Font.Arcade
title.TextScaled=true
title.TextColor3=Color3.new(1,1,1)

-------------- SPEED ----------------
local speed=16
local sb=Instance.new("TextButton",main)
sb.Size=UDim2.new(.8,0,0,35)
sb.Position=UDim2.new(.1,0,.25,0)
sb.Text="Speed +"
sb.Font=Enum.Font.Arcade
sb.BackgroundColor3=Color3.fromRGB(40,40,40)
sb.TextColor3=Color3.new(1,1,1)

sb.MouseButton1Click:Connect(function()
 speed+=5
 if plr.Character then
  plr.Character.Humanoid.WalkSpeed=speed
 end
 sb.Text="Speed : "..speed
end)

------------- NOCLIP ---------------
local noclip=false
local noc=Instance.new("TextButton",main)
noc.Size=UDim2.new(.8,0,0,35)
noc.Position=UDim2.new(.1,0,.45,0)
noc.Text="Noclip OFF"
noc.Font=Enum.Font.Arcade
noc.BackgroundColor3=Color3.fromRGB(40,40,40)
noc.TextColor3=Color3.new(1,1,1)

Run.Stepped:Connect(function()
 if noclip and plr.Character then
  for _,v in pairs(plr.Character:GetDescendants()) do
   if v:IsA("BasePart") then v.CanCollide=false end
  end
 end
end)

noc.MouseButton1Click:Connect(function()
 noclip=not noclip
 noc.Text=noclip and "Noclip ON" or "Noclip OFF"
 noc.BackgroundColor3=noclip and Color3.fromRGB(0,200,0) or Color3.fromRGB(40,40,40)
end)

------------- MINIMIZE --------------
local mini=Instance.new("TextButton",main)
mini.Size=UDim2.new(.3,0,0,30)
mini.Position=UDim2.new(.35,0,.75,0)
mini.Text="Thu nhỏ"
mini.Font=Enum.Font.Arcade
mini.BackgroundColor3=Color3.fromRGB(50,50,50)
mini.TextColor3=Color3.new(1,1,1)

------------- ICON ------------------
local icon=Instance.new("ImageButton",gui)
icon.Size=UDim2.new(0,60,0,60)
icon.Position=UDim2.new(.05,0,.5,0)
icon.Image=ICON_ID
icon.Visible=false
icon.BackgroundTransparency=1

local glow=Instance.new("UIStroke",icon)
glow.Thickness=2

local spin=Tween:Create(icon,TweenInfo.new(2,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut,-1),{Rotation=360})
spin:Play()

mini.MouseButton1Click:Connect(function()
 main.Visible=false
 icon.Visible=true
end)

icon.MouseButton1Click:Connect(function()
 main.Visible=true
 icon.Visible=false
end)

---------------- RAINBOW TEXT + HUB ----------------
task.spawn(function()
 local h=0
 while true do
  h+=0.01
  if h>1 then h=0 end
  local c=Color3.fromHSV(h,1,1)
  glow.Color=c
  main.BackgroundColor3=c:Lerp(Color3.fromRGB(15,15,15),0.7)
  title.TextColor3=c
  task.wait(.05)
 end
end)

print("PHUC HUNG HUB READY")
