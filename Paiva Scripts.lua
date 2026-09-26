local P=game:GetService("Players").LocalPlayer
local G=P:WaitForChild("PlayerGui")
local R=game:GetService("RunService")
local L=game:GetService("Lighting")
local T=game:GetService("TweenService")
local C=Color3.fromRGB
local purple=C(170,90,255)

local gui=Instance.new("ScreenGui",G)
gui.Name="PaivaScripts"
gui.IgnoreGuiInset=true
gui.ResetOnSpawn=false
gui.DisplayOrder=100

local load=Instance.new("Frame",gui)
load.Size=UDim2.fromScale(1,1)
load.BackgroundColor3=C(15,10,20)

local function txt(parent,size,pos,text,color,font)
	local x=Instance.new("TextLabel",parent)
	x.Size=size;x.Position=pos;x.BackgroundTransparency=1
	x.Text=text;x.TextColor3=color or Color3.new(1,1,1)
	x.Font=font or Enum.Font.Gotham;x.TextSize=20
	return x
end

local lt=txt(load,UDim2.new(0,400,0,60),UDim2.new(.5,-200,.43,0),"Loading...",purple,Enum.Font.GothamBold)
lt.TextSize=32

local pc=txt(load,UDim2.new(0,200,0,30),UDim2.new(.5,-100,.50,0),"0%")
pc.TextSize=18

local bb=Instance.new("Frame",load)
bb.Size=UDim2.new(0,400,0,8)
bb.Position=UDim2.new(.5,-200,.56,0)
bb.BackgroundColor3=C(45,35,50)
bb.BorderSizePixel=0

local bar=Instance.new("Frame",bb)
bar.Size=UDim2.new()
bar.BackgroundColor3=purple
bar.BorderSizePixel=0

for i=0,100 do
	bar.Size=UDim2.new(i/100,0,1,0)
	pc.Text=i.."%"
	task.wait(.025)
end

lt.Visible=false
pc.Visible=false
bb.Visible=false

local cr=txt(load,UDim2.new(0,500,0,50),UDim2.new(.5,-250,.43,0),"CRIADO POR")
cr.Font=Enum.Font.GothamBold
cr.TextSize=25
cr.TextTransparency=1

local cn=txt(load,UDim2.new(0,500,0,70),UDim2.new(.5,-250,.49,0),"PAIVASCRIPT",purple,Enum.Font.GothamBlack)
cn.TextSize=38
cn.TextTransparency=1

T:Create(cr,TweenInfo.new(.5),{TextTransparency=0}):Play()
T:Create(cn,TweenInfo.new(.5),{TextTransparency=0}):Play()
task.wait(5)
T:Create(cr,TweenInfo.new(.5),{TextTransparency=1}):Play()
T:Create(cn,TweenInfo.new(.5),{TextTransparency=1}):Play()
task.wait(.6)
load:Destroy()

local main=Instance.new("Frame",gui)
main.Size=UDim2.new(0,600,0,390)
main.Position=UDim2.new(.5,-300,.5,-195)
main.BackgroundColor3=C(45,25,65)
main.BorderSizePixel=0
Instance.new("UICorner",main).CornerRadius=UDim.new(0,14)

local title=txt(main,UDim2.new(1,-100,0,55),UDim2.new(0,25,0,5),"Configurações")
title.Font=Enum.Font.GothamBold
title.TextSize=24
title.TextXAlignment=Enum.TextXAlignment.Left

local function btn(par,size,pos,text,bg)
	local b=Instance.new("TextButton",par)
	b.Size=size;b.Position=pos;b.Text=text
	b.BackgroundColor3=bg or C(62,40,80)
	b.TextColor3=Color3.new(1,1,1)
	b.Font=Enum.Font.GothamBold;b.TextSize=14
	Instance.new("UICorner",b).CornerRadius=UDim.new(0,8)
	return b
end

local close=btn(main,UDim2.new(0,45,0,45),UDim2.new(1,-55,0,10),"×",C(70,35,80))
close.TextSize=25

local min=btn(main,UDim2.new(0,45,0,45),UDim2.new(1,-105,0,10),"−",C(70,35,80))
min.TextSize=25

local side=Instance.new("Frame",main)
side.Size=UDim2.new(0,155,1,-65)
side.Position=UDim2.new(0,0,0,65)
side.BackgroundColor3=C(35,20,50)
side.BorderSizePixel=0

local db=btn(side,UDim2.new(1,-20,0,45),UDim2.new(0,10,0,15),"DESEMPENHO",purple)
local fb=btn(side,UDim2.new(1,-20,0,45),UDim2.new(0,10,0,70),"FONTE",C(55,35,70))

local df=Instance.new("Frame",main)
df.Size=UDim2.new(1,-175,1,-75)
df.Position=UDim2.new(0,165,0,65)
df.BackgroundTransparency=1

local ff=df:Clone()
ff.Parent=main
ff.Visible=false

local function option(name,desc,y)
	local c=Instance.new("Frame",df)
	c.Size=UDim2.new(1,-15,0,75)
	c.Position=UDim2.new(0,5,0,y)
	c.BackgroundColor3=C(62,40,80)
	c.BorderSizePixel=0
	Instance.new("UICorner",c).CornerRadius=UDim.new(0,10)

	local n=txt(c,UDim2.new(1,-85,0,30),UDim2.new(0,15,0,8),name)
	n.Font=Enum.Font.GothamBold;n.TextSize=16;n.TextXAlignment=Enum.TextXAlignment.Left

	local d=txt(c,UDim2.new(1,-85,0,25),UDim2.new(0,15,0,38),desc,C(190,180,195))
	d.TextSize=12;d.TextXAlignment=Enum.TextXAlignment.Left

	local b=btn(c,UDim2.new(0,55,0,28),UDim2.new(1,-70,.5,-14),"",C(80,70,85))
	b.Text=""
	local q=Instance.new("Frame",b)
	q.Size=UDim2.new(0,22,0,22)
	q.Position=UDim2.new(0,3,.5,-11)
	q.BackgroundColor3=Color3.new(1,1,1)
	Instance.new("UICorner",q).CornerRadius=UDim.new(1,0)
	return b,q
end

local ft,fc=option("Mostrar FPS","Exibe os quadros por segundo",0)
local at,ac=option("Anti Lag","Deixa o mapa com visual simples estilo massinha",85)
local mt,mc=option("Remover Animações","Desativa as animações do personagem",170)

local function toggle(b,c,on)
	b.BackgroundColor3=on and purple or C(80,70,85)
	c.Position=on and UDim2.new(1,-25,.5,-11) or UDim2.new(0,3,.5,-11)
end

local fps=false
local frames,last=0,tick()

local fl=txt(gui,UDim2.new(0,110,0,35),UDim2.new(1,-120,0,10),"FPS: 0")
fl.BackgroundColor3=C(25,20,30)
fl.BackgroundTransparency=0
fl.Font=Enum.Font.GothamBold
fl.TextSize=15
fl.Visible=false
Instance.new("UICorner",fl).CornerRadius=UDim.new(0,8)

R.RenderStepped:Connect(function()
	frames+=1
	if tick()-last>=1 then
		fl.Text="FPS: "..frames
		frames=0
		last=tick()
	end
end)

ft.Activated:Connect(function()
	fps=not fps
	toggle(ft,fc,fps)
	fl.Visible=fps
end)

local function anti()
	L.GlobalShadows=false
	for _,o in ipairs(workspace:GetDescendants()) do
		if o:IsA("BasePart") then
			local n=o.Name:lower()
			local s=o.Size
			local col

			if n:find("water") or n:find("agua") then
				col=C(45,150,220)
			elseif n:find("road") or n:find("path") or n:find("caminho") or n:find("estrada") or n:find("sand") or n:find("areia") then
				col=C(205,175,105)
			elseif n:find("wall") or n:find("parede") or n:find("muro") or n:find("mountain") or n:find("montanha") or n:find("cliff") or n:find("barrier") then
				col=C(175,125,75)
			elseif n:find("tree") or n:find("arvore") or n:find("plant") or n:find("planta") or n:find("bush") or n:find("folha") or n:find("leaf") then
				col=C(60,175,70)
			elseif s.Y<s.X*.35 and s.Y<s.Z*.35 then
				col=C(75,180,60)
			elseif s.Y>s.X*2 or s.Y>s.Z*2 then
				col=C(175,125,75)
			else
				col=o.Color
			end

			pcall(function()
				o.Material=Enum.Material.SmoothPlastic
				o.CastShadow=false
				o.Reflectance=0
				o.Color=col
			end)

			if o:IsA("MeshPart") then
				pcall(function()
					o.RenderFidelity=Enum.RenderFidelity.Performance
				end)
			end
		elseif o:IsA("ParticleEmitter") or o:IsA("Trail") or o:IsA("Beam") or o:IsA("Smoke") or o:IsA("Fire") or o:IsA("Sparkles") or o:IsA("PostEffect") then
			pcall(function() o.Enabled=false end)
		end
	end
end

local antiOn=false
at.Activated:Connect(function()
	antiOn=not antiOn
	toggle(at,ac,antiOn)
	if antiOn then anti() end
end)

local animOn=false
local function anim(c)
	local h=c:FindFirstChildOfClass("Humanoid")
	if not h then return end
	local a=c:FindFirstChild("Animate")
	if a then a.Disabled=true end
	local an=h:FindFirstChildOfClass("Animator")
	if an then
		for _,t in ipairs(an:GetPlayingAnimationTracks()) do t:Stop() end
	end
end

mt.Activated:Connect(function()
	animOn=not animOn
	toggle(mt,mc,animOn)
	if animOn and P.Character then anim(P.Character) end
end)

P.CharacterAdded:Connect(function(c)
	if animOn then task.wait(.5);anim(c) end
end)

local ftit=txt(ff,UDim2.new(1,-15,0,35),UDim2.new(0,5,0,0),"Escolha a fonte")
ftit.Font=Enum.Font.GothamBold
ftit.TextSize=18
ftit.TextXAlignment=Enum.TextXAlignment.Left

local choose=btn(ff,UDim2.new(1,-15,0,50),UDim2.new(0,5,0,42),"Fonte: Gotham  ▼")
choose.TextXAlignment=Enum.TextXAlignment.Left

local list=Instance.new("ScrollingFrame",ff)
list.Size=UDim2.new(1,-15,0,165)
list.Position=UDim2.new(0,5,0,100)
list.BackgroundColor3=C(50,32,65)
list.BorderSizePixel=0
list.ScrollBarThickness=5
list.CanvasSize=UDim2.new(0,0,0,330)
list.Visible=false
Instance.new("UICorner",list).CornerRadius=UDim.new(0,10)

local current=Enum.Font.Gotham

local function font(f,n)
	current=f
	for _,o in ipairs(G:GetDescendants()) do
		if o:IsA("TextLabel") or o:IsA("TextButton") or o:IsA("TextBox") then
			pcall(function() o.Font=f end)
		end
	end
	choose.Text="Fonte: "..n.."  ▼"
	list.Visible=false
end

local fonts={
	{"Gotham",Enum.Font.Gotham},
	{"SourceSans",Enum.Font.SourceSans},
	{"Arcade",Enum.Font.Arcade},
	{"Cartoon",Enum.Font.Cartoon},
	{"SciFi",Enum.Font.SciFi},
	{"Fantasy",Enum.Font.Fantasy},
	{"Code",Enum.Font.Code}
}

for i,v in ipairs(fonts) do
	local b=btn(list,UDim2.new(1,-10,0,40),UDim2.new(0,5,0,(i-1)*45+5),v[1],C(62,40,80))
	b.Font=v[2]
	b.Activated:Connect(function() font(v[2],v[1]) end)
end

choose.Activated:Connect(function()
	list.Visible=not list.Visible
end)

db.Activated:Connect(function()
	df.Visible=true
	ff.Visible=false
	db.BackgroundColor3=purple
	fb.BackgroundColor3=C(55,35,70)
end)

fb.Activated:Connect(function()
	df.Visible=false
	ff.Visible=true
	fb.BackgroundColor3=purple
	db.BackgroundColor3=C(55,35,70)
end)

local mini=btn(gui,UDim2.new(0,55,0,55),UDim2.new(0,20,.5,-27),"P",purple)
mini.Font=Enum.Font.GothamBlack
mini.TextSize=25
mini.Visible=false
mini.BackgroundColor3=purple
mini.Size=UDim2.new(0,55,0,55)
Instance.new("UICorner",mini).CornerRadius=UDim.new(1,0)

min.Activated:Connect(function()
	main.Visible=false
	mini.Visible=true
end)

mini.Activated:Connect(function()
	main.Visible=true
	mini.Visible=false
end)

close.Activated:Connect(function()
	gui:Destroy()
end)

G.DescendantAdded:Connect(function(o)
	if o:IsA("TextLabel") or o:IsA("TextButton") or o:IsA("TextBox") then
		if not o:IsDescendantOf(gui) then
			pcall(function() o.Font=current end)
		end
	end
end)
