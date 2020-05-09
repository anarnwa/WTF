
PlaterDB = {
	["profileKeys"] = {
		["十里扬州路 - 亡语者"] = "Default",
		["风起春城暮 - 亡语者"] = "Default",
	},
	["profiles"] = {
		["Default"] = {
			["script_data"] = {
				{
					["Enabled"] = true,
					["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.glowEffect:Hide()\n    \n    --restore the nameplate size\n    local nameplateHeight = Plater.db.profile.plate_config.enemynpc.health_incombat [2]\n    unitFrame.healthBar:SetHeight (nameplateHeight)    \n    \nend\n\n\n",
					["Revision"] = 156,
					["Icon"] = 135996,
					["Author"] = "Izimode-Azralon",
					["ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --settings (you may need /reload if some configs isn't applied immediately)    \n    --change the nameplate color to this if allowed\n    envTable.CanChangeNameplateColor = false --change to true to change the color\n    envTable.NameplateColor = \"pink\"\n    envTable.NameplateSizeOffset = 6 --increase the nameplate height by this value\n    envTable.GlowAlpha = 0.5 --amount of alpha in the outside glow effect\n    \n    --create a glow effect around the nameplate\n    envTable.glowEffect = envTable.glowEffect or Plater.CreateNameplateGlow (unitFrame.healthBar, envTable.NameplateColor)\n    envTable.glowEffect:SetOffset (-27, 25, 9, -11)\n    --envTable.glowEffect:Show() --envTable.glowEffect:Hide() --\n    \n    --set the glow effect alpha\n    envTable.glowEffect:SetAlpha (envTable.GlowAlpha)\n    \nend\n\n--[=[\nUsing spellIDs for multi-language support\n\n135029 - A Knot of Snakes (Temple of Sethraliss)\n135388 - A Knot of Snakes (Temple of Sethraliss)\n134612 - Grasping Tentacles (Shrine of the Storm)\n133361 - Wasting Servant (Waycrest Manor)\n136330 - Soul Thorns (Waycrest Manor)\n130896 - Blackout Barrel (Freehold)\n129758 - Irontide Grenadier (Freehold)\n131009 - Spirit of Gold (Atal`Dazar)\n--]=]",
					["ScriptType"] = 3,
					["Name"] = "Unit - Important [Plater]",
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --check if can change the nameplate color\n    if (envTable.CanChangeNameplateColor) then\n        Plater.SetNameplateColor (unitFrame, envTable.NameplateColor)\n    end\n    \nend\n\n\n\n\n",
					["Time"] = 1537884697,
					["PlaterCore"] = 1,
					["SpellIds"] = {
					},
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.glowEffect:Show()\n    \n    --increase the nameplate size\n    local nameplateHeight = Plater.db.profile.plate_config.enemynpc.health_incombat [2]\n    unitFrame.healthBar:SetHeight (nameplateHeight + envTable.NameplateSizeOffset)\n    \nend\n\n\n",
					["NpcNames"] = {
						"135029", -- [1]
						"134388", -- [2]
						"134612", -- [3]
						"133361", -- [4]
						"136330", -- [5]
						"130896", -- [6]
						"129758", -- [7]
						"Healing Tide Totem", -- [8]
						"131009", -- [9]
					},
					["Desc"] = "Highlight a nameplate of an important Add. Add the unit name or NpcID into the trigger box to add more.",
				}, -- [1]
				{
					["Enabled"] = true,
					["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.buffIconGlow:Hide()\n    \nend",
					["Revision"] = 399,
					["Icon"] = "Interface\\AddOns\\Plater\\images\\icon_aura",
					["Author"] = "Tercioo-Sylvanas",
					["ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --creates a glow around the icon\n    envTable.buffIconGlow = envTable.buffIconGlow or Plater.CreateIconGlow (self)\n    \nend",
					["ScriptType"] = 1,
					["Name"] = "Aura - Buff Alert [Plater]",
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    \n    \n    \nend",
					["Time"] = 1539013601,
					["PlaterCore"] = 1,
					["SpellIds"] = {
						275826, -- [1]
						272888, -- [2]
						272659, -- [3]
						267901, -- [4]
						267830, -- [5]
						265393, -- [6]
					},
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.buffIconGlow:Show()\n    \nend",
					["NpcNames"] = {
					},
					["Desc"] = "Add the buff name in the trigger box.",
				}, -- [2]
				{
					["ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --settings (you may need /reload if some configs isn't applied immediately)\n    local CONFIG_BACKGROUND_FLASH_DURATION = 0.8 --0.8\n    local CONFIG_BORDER_GLOW_ALPHA = 0.3 --0.3\n    local CONFIG_SHAKE_DURATION = 0.2 --0.2\n    local CONFIG_SHAKE_AMPLITUDE = 5 --5\n    \n    --create a glow effect in the border of the cast bar\n    envTable.glowEffect = envTable.glowEffect or Plater.CreateNameplateGlow (self)\n    envTable.glowEffect:SetOffset (-32, 30, 7, -9)\n    envTable.glowEffect:SetAlpha (CONFIG_BORDER_GLOW_ALPHA)\n    --envTable.glowEffect:Show() --envTable.glowEffect:Hide() \n    \n    --create a texture to use for a flash behind the cast bar\n    local backGroundFlashTexture = Plater:CreateImage (self, [[Interface\\ACHIEVEMENTFRAME\\UI-Achievement-Alert-Glow]], self:GetWidth()+40, self:GetHeight()+20, \"background\", {0, 400/512, 0, 170/256})\n    backGroundFlashTexture:SetBlendMode (\"ADD\")\n    backGroundFlashTexture:SetPoint (\"center\", self, \"center\")\n    backGroundFlashTexture:Hide()\n    \n    --create the animation hub to hold the flash animation sequence\n    envTable.BackgroundFlash = envTable.BackgroundFlash or Plater:CreateAnimationHub (backGroundFlashTexture, \n        function()\n            backGroundFlashTexture:Show()\n        end,\n        function()\n            backGroundFlashTexture:Hide()\n        end\n    )\n    \n    --create the flash animation sequence\n    local fadeIn = Plater:CreateAnimation (envTable.BackgroundFlash, \"ALPHA\", 1, CONFIG_BACKGROUND_FLASH_DURATION/2, 0, 1)\n    local fadeOut = Plater:CreateAnimation (envTable.BackgroundFlash, \"ALPHA\", 2, CONFIG_BACKGROUND_FLASH_DURATION/2, 1, 0)    \n    --envTable.BackgroundFlash:Play() --envTable.BackgroundFlash:Stop()\n    \n    --create a camera shake for the nameplate\n    envTable.FrameShake = Plater:CreateFrameShake (unitFrame, CONFIG_SHAKE_DURATION, CONFIG_SHAKE_AMPLITUDE, 35, false, false, 0, 1, 0.05, 0.1, Plater.GetPoints (unitFrame))    \n    \n    \n    --update the config for the flash here so it wont need a /reload\n    fadeIn:SetDuration (CONFIG_BACKGROUND_FLASH_DURATION/2)\n    fadeOut:SetDuration (CONFIG_BACKGROUND_FLASH_DURATION/2)    \n    \n    --update the config for the skake here so it wont need a /reload\n    envTable.FrameShake.OriginalAmplitude = CONFIG_SHAKE_AMPLITUDE\n    envTable.FrameShake.OriginalDuration = CONFIG_SHAKE_DURATION  \n    \nend",
					["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.glowEffect:Hide()\n    \n    envTable.BackgroundFlash:Stop()\n    \n    unitFrame:StopFrameShake (envTable.FrameShake)    \n    \nend\n\n\n",
					["Temp_OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.glowEffect:Show()\n    \n    envTable.BackgroundFlash:Play()\n    \n    Plater.FlashNameplateBorder (unitFrame, 0.05)   \n    Plater.FlashNameplateBody (unitFrame, \"\", 0.075)\n    \n    self:PlayFrameShake (envTable.FrameShake)\n    \nend\n\n\n",
					["ScriptType"] = 2,
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \nend\n\n\n",
					["Time"] = 1550151794,
					["Temp_ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --settings (you may need /reload if some configs isn't applied immediately)\n    local CONFIG_BACKGROUND_FLASH_DURATION = 0.8 --0.8\n    local CONFIG_BORDER_GLOW_ALPHA = 0.3 --0.3\n    local CONFIG_SHAKE_DURATION = 0.2 --0.2\n    local CONFIG_SHAKE_AMPLITUDE = 5 --5\n    \n    --create a glow effect in the border of the cast bar\n    envTable.glowEffect = envTable.glowEffect or Plater.CreateNameplateGlow (self)\n    envTable.glowEffect:SetOffset (-32, 30, 7, -9)\n    envTable.glowEffect:SetAlpha (CONFIG_BORDER_GLOW_ALPHA)\n    --envTable.glowEffect:Show() --envTable.glowEffect:Hide() \n    \n    --create a texture to use for a flash behind the cast bar\n    local backGroundFlashTexture = Plater:CreateImage (self, [[Interface\\ACHIEVEMENTFRAME\\UI-Achievement-Alert-Glow]], self:GetWidth()+40, self:GetHeight()+20, \"background\", {0, 400/512, 0, 170/256})\n    backGroundFlashTexture:SetBlendMode (\"ADD\")\n    backGroundFlashTexture:SetPoint (\"center\", self, \"center\")\n    backGroundFlashTexture:Hide()\n    \n    --create the animation hub to hold the flash animation sequence\n    envTable.BackgroundFlash = envTable.BackgroundFlash or Plater:CreateAnimationHub (backGroundFlashTexture, \n        function()\n            backGroundFlashTexture:Show()\n        end,\n        function()\n            backGroundFlashTexture:Hide()\n        end\n    )\n    \n    --create the flash animation sequence\n    local fadeIn = Plater:CreateAnimation (envTable.BackgroundFlash, \"ALPHA\", 1, CONFIG_BACKGROUND_FLASH_DURATION/2, 0, 1)\n    local fadeOut = Plater:CreateAnimation (envTable.BackgroundFlash, \"ALPHA\", 2, CONFIG_BACKGROUND_FLASH_DURATION/2, 1, 0)    \n    --envTable.BackgroundFlash:Play() --envTable.BackgroundFlash:Stop()\n    \n    --create a camera shake for the nameplate\n    envTable.FrameShake = Plater:CreateFrameShake (self, CONFIG_SHAKE_DURATION, CONFIG_SHAKE_AMPLITUDE, 35, false, false, 0, 1, 0.05, 0.1, true)    \n    \n    \n    --update the config for the flash here so it wont need a /reload\n    fadeIn:SetDuration (CONFIG_BACKGROUND_FLASH_DURATION/2)\n    fadeOut:SetDuration (CONFIG_BACKGROUND_FLASH_DURATION/2)    \n    \n    --update the config for the skake here so it wont need a /reload\n    envTable.FrameShake.OriginalAmplitude = CONFIG_SHAKE_AMPLITUDE\n    envTable.FrameShake.OriginalDuration = CONFIG_SHAKE_DURATION  \n    \nend",
					["NpcNames"] = {
					},
					["Temp_OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.glowEffect:Hide()\n    \n    envTable.BackgroundFlash:Stop()\n    \n    self:StopFrameShake (envTable.FrameShake)    \n    \nend\n\n\n",
					["Revision"] = 391,
					["Author"] = "Bombad�o-Azralon",
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.glowEffect:Show()\n    \n    envTable.BackgroundFlash:Play()\n    \n    Plater.FlashNameplateBorder (unitFrame, 0.05)   \n    Plater.FlashNameplateBody (unitFrame, \"\", 0.075)\n    \n    unitFrame:PlayFrameShake (envTable.FrameShake)\n    \nend\n\n\n",
					["Temp_UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \nend\n\n\n",
					["Name"] = "Cast - Very Important [Plater]",
					["PlaterCore"] = 1,
					["Enabled"] = true,
					["Desc"] = "Highlight a very important cast applying several effects into the Cast Bar. Add spell in the Add Trigger field.",
					["SpellIds"] = {
						257785, -- [1]
						267237, -- [2]
						266951, -- [3]
						267273, -- [4]
						267433, -- [5]
						263066, -- [6]
						255577, -- [7]
						255371, -- [8]
					},
					["Icon"] = "Interface\\AddOns\\Plater\\images\\cast_bar",
				}, -- [3]
				{
					["Enabled"] = true,
					["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.glowEffect:Hide()\n    \n    envTable.overlaySpark:Hide()\n    envTable.topArrow:Hide()\n    \n    Plater.RefreshNameplateColor (unitFrame)\n    \n    envTable.smallScaleAnimation:Stop()\n    \n    --increase the nameplate size\n    local nameplateHeight = Plater.db.profile.plate_config.enemynpc.health_incombat [2]\n    unitFrame.healthBar:SetHeight (nameplateHeight)\nend\n\n\n",
					["Revision"] = 324,
					["Icon"] = 2175503,
					["Author"] = "Bombad�o-Azralon",
					["ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --settings\n    envTable.NameplateSizeOffset = 3\n    envTable.GlowAlpha = .45\n    envTable.ShowArrow = true\n    envTable.ArrowAlpha = .45    \n    envTable.HealthBarColor = \"orange\"\n    \n    --custom frames\n    envTable.glowEffect = envTable.glowEffect or Plater.CreateNameplateGlow (unitFrame.healthBar)\n    --envTable.glowEffect:Show() --envTable.glowEffect:Hide() \n    envTable.glowEffect:SetOffset (-27, 25, 6, -8)\n    \n    --creates the spark to show the cast progress inside the health bar\n    envTable.overlaySpark = envTable.overlaySpark or Plater:CreateImage (unitFrame.healthBar)\n    envTable.overlaySpark:SetBlendMode (\"ADD\")\n    envTable.overlaySpark.width = 32\n    envTable.overlaySpark.height = 36\n    envTable.overlaySpark.alpha = .9\n    envTable.overlaySpark.texture = [[Interface\\CastingBar\\UI-CastingBar-Spark]]\n    \n    envTable.topArrow = envTable.topArrow or Plater:CreateImage (unitFrame.healthBar)\n    envTable.topArrow:SetBlendMode (\"ADD\")\n    envTable.topArrow.width = 8\n    envTable.topArrow.height = 8\n    envTable.topArrow.alpha = envTable.ArrowAlpha\n    envTable.topArrow.texture = [[Interface\\BUTTONS\\Arrow-Down-Up]]\n    \n    --scale animation\n    envTable.smallScaleAnimation = envTable.smallScaleAnimation or Plater:CreateAnimationHub (unitFrame.healthBar)\n    Plater:CreateAnimation (envTable.smallScaleAnimation, \"SCALE\", 1, 0.075, 1, 1, 1.08, 1.08)\n    Plater:CreateAnimation (envTable.smallScaleAnimation, \"SCALE\", 2, 0.075, 1, 1, 0.95, 0.95)    \n    --envTable.smallScaleAnimation:Play() --envTable.smallScaleAnimation:Stop()\n    \nend\n\n\n\n\n\n\n\n",
					["ScriptType"] = 2,
					["Name"] = "Explosion Affix M+ [Plater]",
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --update the percent\n    envTable.overlaySpark:SetPoint (\"left\", unitFrame.healthBar:GetWidth() * (envTable._CastPercent / 100)-16, 0)\n    \n    envTable.topArrow:SetPoint (\"bottomleft\", unitFrame.healthBar, \"topleft\", unitFrame.healthBar:GetWidth() * (envTable._CastPercent / 100) - 4, 2 )\n    \n    --forces the script to update on a 60Hz base\n    self.ThrottleUpdate = 0.016\n    \n    --update the health bar color coloring from yellow to red\n    --Plater.SetNameplateColor (unitFrame, max (envTable._CastPercent/100, .66), abs (envTable._CastPercent/100 - 1), 0, 1)\n    \n    Plater.SetNameplateColor (unitFrame, envTable.HealthBarColor)\n    envTable.glowEffect.Texture:SetAlpha (envTable.GlowAlpha)\n    \nend\n\n\n",
					["Time"] = 1540663131,
					["PlaterCore"] = 1,
					["SpellIds"] = {
						240446, -- [1]
						273577, -- [2]
					},
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.glowEffect:Show()\n    envTable.overlaySpark:Show()\n    \n    if (envTable.ShowArrow) then\n        envTable.topArrow:Show()\n    end\n    \n    Plater.FlashNameplateBorder (unitFrame, 0.05)   \n    Plater.FlashNameplateBody (unitFrame, \"\", 0.075)\n    \n    envTable.smallScaleAnimation:Play()\n    \n    --increase the nameplate size\n    local nameplateHeight = Plater.db.profile.plate_config.enemynpc.health_incombat [2]\n    unitFrame.healthBar:SetHeight (nameplateHeight + envTable.NameplateSizeOffset)\n    \n    envTable.overlaySpark.height = nameplateHeight + 32\n    \n    envTable.glowEffect.Texture:SetAlpha (envTable.GlowAlpha)\n    \n    \nend\n\n\n\n\n\n\n",
					["NpcNames"] = {
					},
					["Desc"] = "Apply several animations when the explosion orb cast starts on a Mythic Dungeon with Explosion Affix",
				}, -- [4]
				{
					["Enabled"] = true,
					["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.debuffIconGlow:Hide()\n    \nend\n\n\n",
					["Revision"] = 232,
					["Icon"] = "Interface\\AddOns\\Plater\\images\\icon_aura",
					["Author"] = "Tercioo-Sylvanas",
					["ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --creates a glow around the icon\n    envTable.debuffIconGlow = envTable.debuffIconGlow or Plater.CreateIconGlow (self)\n    \nend\n\n\n",
					["ScriptType"] = 1,
					["Name"] = "Aura - Debuff Alert [Plater]",
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \nend\n\n\n",
					["Time"] = 1538429739,
					["PlaterCore"] = 1,
					["SpellIds"] = {
					},
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.debuffIconGlow:Show()\n    \nend\n\n\n",
					["NpcNames"] = {
					},
					["Desc"] = "Add the debuff name in the trigger box.",
				}, -- [5]
				{
					["ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --https://www.wowhead.com/spell=253583/fiery-enchant\n    \n    --settings (you may need /reload if some configs isn't applied immediately)\n    \n    --castbar color (when can be interrupted)\n    envTable.CastbarColor = \"darkorange\"\n    --flash duration\n    local CONFIG_BACKGROUND_FLASH_DURATION = 0.4\n    --add this value to the cast bar height\n    envTable.CastBarHeightAdd = 5\n    \n    \n    \n    --create a fast flash above the cast bar\n    envTable.FullBarFlash = envTable.FullBarFlash or Plater.CreateFlash (self, 0.05, 1, \"white\")\n    \n    --create a camera shake for the nameplate\n    envTable.FrameShake = Plater:CreateFrameShake (unitFrame, 0.2, 5, 35, false, false, 0, 1, 0.05, 0.1, Plater.GetPoints (unitFrame))\n    \n    --create a texture to use for a flash behind the cast bar\n    local backGroundFlashTexture = Plater:CreateImage (self, [[Interface\\ACHIEVEMENTFRAME\\UI-Achievement-Alert-Glow]], self:GetWidth()+60, self:GetHeight()+50, \"background\", {0, 400/512, 0, 170/256})\n    backGroundFlashTexture:SetBlendMode (\"ADD\")\n    backGroundFlashTexture:SetPoint (\"center\", self, \"center\")\n    backGroundFlashTexture:Hide()\n    \n    --create the animation hub to hold the flash animation sequence\n    envTable.BackgroundFlash = envTable.BackgroundFlash or Plater:CreateAnimationHub (backGroundFlashTexture, \n        function()\n            backGroundFlashTexture:Show()\n        end,\n        function()\n            backGroundFlashTexture:Hide()\n        end\n    )\n    \n    --create the flash animation sequence\n    local fadeIn = Plater:CreateAnimation (envTable.BackgroundFlash, \"ALPHA\", 1, CONFIG_BACKGROUND_FLASH_DURATION/2, 0, .75)\n    local fadeOut = Plater:CreateAnimation (envTable.BackgroundFlash, \"ALPHA\", 2, CONFIG_BACKGROUND_FLASH_DURATION/2, 1, 0)    \n    --envTable.BackgroundFlash:Play() --envTable.BackgroundFlash:Stop()        \n    \nend\n\n\n",
					["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --don't execute on battlegrounds and arenas\n    if (Plater.ZoneInstanceType == \"arena\" or Plater.ZoneInstanceType == \"pvp\") then\n        return\n    end    \n    \n    --restore the cast bar to its original height\n    if (envTable.OriginalHeight) then\n        self:SetHeight (envTable.OriginalHeight)\n        envTable.OriginalHeight = nil\n    end\n    \n    --stop the camera shake\n    unitFrame:StopFrameShake (envTable.FrameShake)\n    \n    envTable.FullBarFlash:Stop()\n    envTable.BackgroundFlash:Stop()\n    \nend\n\n\n\n\n\n",
					["Temp_OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --don't execute on battlegrounds and arenas\n    if (Plater.ZoneInstanceType == \"arena\" or Plater.ZoneInstanceType == \"pvp\") then\n        return\n    end\n    \n    --play flash animations\n    envTable.FullBarFlash:Play()\n    \n    --restoring the default size (not required since it already restore in the hide script)\n    if (envTable.OriginalHeight) then\n        self:SetHeight (envTable.OriginalHeight)\n    end\n    \n    --increase the cast bar size\n    local height = self:GetHeight()\n    envTable.OriginalHeight = height\n    \n    self:SetHeight (height + envTable.CastBarHeightAdd)\n    \n    Plater.SetCastBarBorderColor (self, 1, .2, .2, 0.4)\n    \n    self:PlayFrameShake (envTable.FrameShake)\n    \n    --set the color of the cast bar to dark orange (only if can be interrupted)\n    --Plater auto set this color to default when a new cast starts, no need to reset this value at OnHide.    \n    if (envTable._CanInterrupt) then\n        self:SetStatusBarColor (Plater:ParseColors (envTable.CastbarColor))\n    end\n    \n    envTable.BackgroundFlash:Play()\n    \nend\n\n\n\n\n\n\n\n\n",
					["ScriptType"] = 2,
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \nend\n\n\n",
					["Time"] = 1550151761,
					["Temp_ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --https://www.wowhead.com/spell=253583/fiery-enchant\n    \n    --settings (you may need /reload if some configs isn't applied immediately)\n    \n    --castbar color (when can be interrupted)\n    envTable.CastbarColor = \"darkorange\"\n    --flash duration\n    local CONFIG_BACKGROUND_FLASH_DURATION = 0.4\n    --add this value to the cast bar height\n    envTable.CastBarHeightAdd = 5\n    \n    \n    \n    --create a fast flash above the cast bar\n    envTable.FullBarFlash = envTable.FullBarFlash or Plater.CreateFlash (self, 0.05, 1, \"white\")\n    \n    --create a camera shake for the nameplate\n    envTable.FrameShake = Plater:CreateFrameShake (self, 0.2, 5, 35, false, false, 0, 1, 0.05, 0.1, true)\n    \n    --create a texture to use for a flash behind the cast bar\n    local backGroundFlashTexture = Plater:CreateImage (self, [[Interface\\ACHIEVEMENTFRAME\\UI-Achievement-Alert-Glow]], self:GetWidth()+60, self:GetHeight()+50, \"background\", {0, 400/512, 0, 170/256})\n    backGroundFlashTexture:SetBlendMode (\"ADD\")\n    backGroundFlashTexture:SetPoint (\"center\", self, \"center\")\n    backGroundFlashTexture:Hide()\n    \n    --create the animation hub to hold the flash animation sequence\n    envTable.BackgroundFlash = envTable.BackgroundFlash or Plater:CreateAnimationHub (backGroundFlashTexture, \n        function()\n            backGroundFlashTexture:Show()\n        end,\n        function()\n            backGroundFlashTexture:Hide()\n        end\n    )\n    \n    --create the flash animation sequence\n    local fadeIn = Plater:CreateAnimation (envTable.BackgroundFlash, \"ALPHA\", 1, CONFIG_BACKGROUND_FLASH_DURATION/2, 0, .75)\n    local fadeOut = Plater:CreateAnimation (envTable.BackgroundFlash, \"ALPHA\", 2, CONFIG_BACKGROUND_FLASH_DURATION/2, 1, 0)    \n    --envTable.BackgroundFlash:Play() --envTable.BackgroundFlash:Stop()        \n    \nend\n\n\n",
					["NpcNames"] = {
					},
					["Temp_OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --don't execute on battlegrounds and arenas\n    if (Plater.ZoneInstanceType == \"arena\" or Plater.ZoneInstanceType == \"pvp\") then\n        return\n    end    \n    \n    --restore the cast bar to its original height\n    if (envTable.OriginalHeight) then\n        self:SetHeight (envTable.OriginalHeight)\n        envTable.OriginalHeight = nil\n    end\n    \n    --stop the camera shake\n    self:StopFrameShake (envTable.FrameShake)\n    \n    envTable.FullBarFlash:Stop()\n    envTable.BackgroundFlash:Stop()\n    \nend\n\n\n\n\n\n",
					["Revision"] = 570,
					["Author"] = "Tercioo-Sylvanas",
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --don't execute on battlegrounds and arenas\n    if (Plater.ZoneInstanceType == \"arena\" or Plater.ZoneInstanceType == \"pvp\") then\n        return\n    end\n    \n    --play flash animations\n    envTable.FullBarFlash:Play()\n    \n    --restoring the default size (not required since it already restore in the hide script)\n    if (envTable.OriginalHeight) then\n        self:SetHeight (envTable.OriginalHeight)\n    end\n    \n    --increase the cast bar size\n    local height = self:GetHeight()\n    envTable.OriginalHeight = height\n    \n    self:SetHeight (height + envTable.CastBarHeightAdd)\n    \n    Plater.SetCastBarBorderColor (self, 1, .2, .2, 0.4)\n    \n    unitFrame:PlayFrameShake (envTable.FrameShake)\n    \n    --set the color of the cast bar to dark orange (only if can be interrupted)\n    --Plater auto set this color to default when a new cast starts, no need to reset this value at OnHide.    \n    if (envTable._CanInterrupt) then\n        self:SetStatusBarColor (Plater:ParseColors (envTable.CastbarColor))\n    end\n    \n    envTable.BackgroundFlash:Play()\n    \nend\n\n\n\n\n\n\n\n\n",
					["Temp_UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \nend\n\n\n",
					["Name"] = "Cast - Big Alert [Plater]",
					["PlaterCore"] = 1,
					["Enabled"] = true,
					["Desc"] = "Flash, Bounce and Red Color the CastBar border when when an important cast is happening. Add spell in the Add Trigger field.",
					["SpellIds"] = {
						258153, -- [1]
						258313, -- [2]
						257069, -- [3]
						274569, -- [4]
						278020, -- [5]
						261635, -- [6]
						272700, -- [7]
						280404, -- [8]
						268030, -- [9]
						265368, -- [10]
						263891, -- [11]
						264520, -- [12]
						265407, -- [13]
						278567, -- [14]
						278602, -- [15]
						258128, -- [16]
						257791, -- [17]
						258938, -- [18]
						265089, -- [19]
						272183, -- [20]
						256060, -- [21]
						257397, -- [22]
						257899, -- [23]
						269972, -- [24]
						270901, -- [25]
						270492, -- [26]
						268129, -- [27]
						268709, -- [28]
						263215, -- [29]
						268797, -- [30]
						262540, -- [31]
						262554, -- [32]
						253517, -- [33]
						255041, -- [34]
						252781, -- [35]
						250368, -- [36]
						258777, -- [37]
					},
					["Icon"] = "Interface\\AddOns\\Plater\\images\\cast_bar",
				}, -- [6]
				{
					["ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --settings (you may need /reload if some configs isn't applied immediately)\n    \n    --flash duration\n    local CONFIG_FLASH_DURATION = 0.6\n    \n    --manually create a new texture for the flash animation\n    if (not envTable.SmallFlashTexture) then\n        envTable.SmallFlashTexture = envTable.SmallFlashTexture or Plater:CreateImage (unitFrame.castBar)\n        envTable.SmallFlashTexture:SetColorTexture (1, 1, 1)\n        envTable.SmallFlashTexture:SetAllPoints()\n    end\n    \n    --manually create a flash animation using the framework\n    if (not envTable.SmallFlashAnimationHub) then \n        \n        local onPlay = function()\n            envTable.SmallFlashTexture:Show()\n        end\n        \n        local onFinished = function()\n            envTable.SmallFlashTexture:Hide()\n        end\n        \n        local animationHub = Plater:CreateAnimationHub (envTable.SmallFlashTexture, onPlay, onFinished)\n        Plater:CreateAnimation (animationHub, \"Alpha\", 1, CONFIG_FLASH_DURATION/2, 0, .6)\n        Plater:CreateAnimation (animationHub, \"Alpha\", 2, CONFIG_FLASH_DURATION/2, 1, 0)\n        \n        envTable.SmallFlashAnimationHub = animationHub\n    end\n    \n    \n    \nend\n\n\n\n\n\n\n\n",
					["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.SmallFlashAnimationHub:Stop()\n    \nend\n\n\n",
					["Temp_OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.SmallFlashAnimationHub:Play()\n    \nend\n\n\n",
					["ScriptType"] = 2,
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    \n    \nend\n\n\n",
					["Time"] = 1588953598,
					["Temp_ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --settings (you may need /reload if some configs isn't applied immediately)\n    \n    --flash duration\n    local CONFIG_FLASH_DURATION = 0.6\n    \n    --manually create a new texture for the flash animation\n    if (not envTable.SmallFlashTexture) then\n        envTable.SmallFlashTexture = envTable.SmallFlashTexture or Plater:CreateImage (unitFrame.castBar)\n        envTable.SmallFlashTexture:SetColorTexture (1, 1, 1)\n        envTable.SmallFlashTexture:SetAllPoints()\n    end\n    \n    --manually create a flash animation using the framework\n    if (not envTable.SmallFlashAnimationHub) then \n        \n        local onPlay = function()\n            envTable.SmallFlashTexture:Show()\n        end\n        \n        local onFinished = function()\n            envTable.SmallFlashTexture:Hide()\n        end\n        \n        local animationHub = Plater:CreateAnimationHub (envTable.SmallFlashTexture, onPlay, onFinished)\n        Plater:CreateAnimation (animationHub, \"Alpha\", 1, CONFIG_FLASH_DURATION/2, 0, .6)\n        Plater:CreateAnimation (animationHub, \"Alpha\", 2, CONFIG_FLASH_DURATION/2, 1, 0)\n        \n        envTable.SmallFlashAnimationHub = animationHub\n    end\n    \n    \n    \nend\n\n\n\n\n\n\n\n",
					["NpcNames"] = {
					},
					["Temp_OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.SmallFlashAnimationHub:Stop()\n    \nend\n\n\n",
					["Revision"] = 383,
					["Author"] = "Tercioo-Sylvanas",
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.SmallFlashAnimationHub:Play()\n    \nend\n\n\n",
					["Prio"] = 99,
					["Temp_UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    \n    \nend\n\n\n",
					["Name"] = "Cast - Small Alert [Plater]",
					["PlaterCore"] = 1,
					["Enabled"] = true,
					["Desc"] = "Flashes the Cast Bar when a spell in the trigger list is Cast. Add spell in the Add Trigger field.",
					["SpellIds"] = {
						275192, -- [1]
						265912, -- [2]
						274438, -- [3]
						268317, -- [4]
						268375, -- [5]
						276767, -- [6]
						264105, -- [7]
						265876, -- [8]
						270464, -- [9]
						266106, -- [10]
						272180, -- [11]
						278961, -- [12]
						278755, -- [13]
						265468, -- [14]
						256405, -- [15]
						256897, -- [16]
						264101, -- [17]
						280604, -- [18]
						268702, -- [19]
						281621, -- [20]
						262515, -- [21]
						255824, -- [22]
						253583, -- [23]
						250096, -- [24]
					},
					["Icon"] = "Interface\\AddOns\\Plater\\images\\cast_bar",
				}, -- [7]
				{
					["ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --color to set the nameplate\n    envTable.NameplateColor = \"gray\"\n    \nend\n\n\n",
					["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    \nend\n\n\n",
					["Temp_OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \nend\n\n\n",
					["ScriptType"] = 1,
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --only change the nameplate color in combat\n    if (InCombatLockdown()) then\n        Plater.SetNameplateColor (unitFrame, envTable.NameplateColor)\n    end\n    \nend\n\n\n\n\n\n\n",
					["Time"] = 1550151754,
					["Temp_ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --color to set the nameplate\n    envTable.NameplateColor = \"gray\"\n    \nend\n\n\n",
					["NpcNames"] = {
					},
					["Temp_OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    \nend\n\n\n",
					["Revision"] = 107,
					["Author"] = "Izimode-Azralon",
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \nend\n\n\n",
					["Temp_UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --only change the nameplate color in combat\n    if (InCombatLockdown()) then\n        Plater.SetNameplateColor (unitFrame, envTable.NameplateColor)\n    end\n    \nend\n\n\n\n\n\n\n",
					["Name"] = "Aura - Invalidate Unit [Plater]",
					["PlaterCore"] = 1,
					["Enabled"] = true,
					["Desc"] = "When an aura makes the unit invulnarable and you don't want to attack it. Add spell in the Add Trigger field.",
					["SpellIds"] = {
						261265, -- [1]
						261266, -- [2]
						271590, -- [3]
					},
					["Icon"] = "Interface\\AddOns\\Plater\\images\\icon_invalid",
				}, -- [8]
				{
					["Enabled"] = true,
					["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --make plater refresh the nameplate color\n    Plater.RefreshNameplateColor (unitFrame)\n    \n        envTable.smallFlash:Stop()\n    \nend\n\n\n",
					["Revision"] = 59,
					["Icon"] = 135024,
					["Author"] = "Izimode-Azralon",
					["ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --settings:\n    do\n        \n        --change the nameplate color to this color\n        --can use color names: \"red\", \"yellow\"\n        --can use color hex: \"#FF0000\", \"#FFFF00\"\n        --con use color table: {1, 0, 0}, {1, 1, 0}\n        \n        envTable.Color = \"green\"\n        \n        --if true, it'll replace the health info with the unit name\n        envTable.ReplaceHealthWithName = false\n        \n        --use flash when the unit is shown in the screen\n        envTable.FlashNameplate = true\n        \n    end\n    \n    --private:\n    do\n        --create a flash for when the unit if shown\n        envTable.smallFlash = envTable.smallFlash or Plater.CreateFlash (unitFrame.healthBar, 0.15, 1, envTable.Color)\n        \n    end\n    \nend\n\n--[=[\n\nNpc IDS:\n\n141851: Spawn of G'Huun on Mythic Dungeons\n\n\n--]=]\n\n\n\n\n",
					["ScriptType"] = 3,
					["Name"] = "Color Change [Plater]",
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --adjust the nameplate color\n    Plater.SetNameplateColor (unitFrame, envTable.Color)\n    \n    --check if can replace the health amount with the unit name\n    if (envTable.ReplaceHealthWithName) then\n        \n        local healthPercent = format (\"%.1f\", unitFrame.healthBar.CurrentHealth / unitFrame.healthBar.CurrentHealthMax *100)\n        \n        unitFrame.healthBar.lifePercent:SetText (unitFrame.namePlateUnitName .. \"  (\" .. healthPercent  .. \"%)\")\n        \n    end\n    \nend\n\n\n",
					["Time"] = 1543253273,
					["PlaterCore"] = 1,
					["SpellIds"] = {
					},
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --check if can flash the nameplate\n    if (envTable.FlashNameplate) then\n        envTable.smallFlash:Play()\n    end\n    \nend\n\n\n\n\n\n\n\n\n",
					["NpcNames"] = {
						"141851", -- [1]
					},
					["Desc"] = "Add a unitID or unit name in 'Add Trigger' entry. See the constructor script for options.",
				}, -- [9]
				{
					["ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --settings (require a /reload after editing any setting)\n    do\n        --blink and glow\n        envTable.BlinkEnabled = true --set to 'false' to disable blinks\n        envTable.GlowEnabled = true --set to 'false' to disable glows\n        envTable.ChangeNameplateColor = true; --set to 'true' to enable nameplate color change\n        envTable.TimeLeftToBlink = 4.5; --in seconds, affects the blink effect only\n        envTable.BlinkSpeed = 1.0; --time to complete a blink loop\n        envTable.BlinkColor = \"white\"; --color of the blink\n        envTable.BlinkMaxAlpha = 0.50; --max transparency in the animation loop (1.0 is full opaque)\n        envTable.NameplateColor = \"darkred\"; --nameplate color if ChangeNameplateColor is true\n        \n        --text color\n        envTable.TimerColorEnabled = true --set to 'false' to disable changes in the color of the time left text\n        envTable.TimeLeftWarning = 8.0; --in seconds, affects the color of the text\n        envTable.TimeLeftCritical = 3.0; --in seconds, affects the color of the text    \n        envTable.TextColor_Warning = \"yellow\"; --color when the time left entered in a warning zone\n        envTable.TextColor_Critical = \"red\"; --color when the time left is critical\n        \n        --list of spellIDs to ignore\n        envTable.IgnoredSpellID = {\n            [12] = true, --use a simple comma here\n            [13] = true,\n        }\n    end\n    \n    \n    --private\n    do\n        envTable.blinkTexture = Plater:CreateImage (self, \"\", 1, 1, \"overlay\")\n        envTable.blinkTexture:SetPoint ('center', 0, 0)\n        envTable.blinkTexture:Hide()\n        \n        local onPlay = function()\n            envTable.blinkTexture:Show() \n            envTable.blinkTexture.color = envTable.BlinkColor\n        end\n        local onStop = function()\n            envTable.blinkTexture:Hide()  \n        end\n        envTable.blinkAnimation = Plater:CreateAnimationHub (envTable.blinkTexture, onPlay, onStop)\n        Plater:CreateAnimation (envTable.blinkAnimation, \"ALPHA\", 1, envTable.BlinkSpeed / 2, 0, envTable.BlinkMaxAlpha)\n        Plater:CreateAnimation (envTable.blinkAnimation, \"ALPHA\", 2, envTable.BlinkSpeed / 2, envTable.BlinkMaxAlpha, 0)\n        \n        envTable.glowEffect = envTable.glowEffect or Plater.CreateIconGlow (self)\n        --envTable.glowEffect:Show() --envTable.glowEffect:Hide()\n        \n    end\n    \nend\n\n\n\n\n",
					["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.blinkAnimation:Stop()\n    envTable.blinkTexture:Hide()\n    envTable.blinkAnimation:Stop()\n    envTable.glowEffect:Stop()\n    Plater:SetFontColor (self.Cooldown.Timer, Plater.db.profile.aura_timer_text_color)\nend\n\n\n",
					["Temp_OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.blinkTexture:SetSize (self:GetSize())\n    \nend\n\n\n",
					["ScriptType"] = 1,
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    local timeLeft = envTable._RemainingTime\n    \n    --check if the spellID isn't being ignored\n    if (envTable.IgnoredSpellID [envTable._SpellID]) then\n        return\n    end\n    \n    --check the time left and start or stop the blink animation and also check if the time left is > zero\n    if ((envTable.BlinkEnabled or envTable.GlowEnabled) and timeLeft > 0) then\n        if (timeLeft < envTable.TimeLeftToBlink) then\n            --blink effect\n            if (envTable.BlinkEnabled) then\n                if (not envTable.blinkAnimation:IsPlaying()) then\n                    envTable.blinkAnimation:Play()\n                end\n            end\n            --glow effect\n            if (envTable.GlowEnabled) then\n                envTable.glowEffect:Show()\n            end\n            --nameplate color\n            if (envTable.ChangeNameplateColor) then\n                Plater.SetNameplateColor (unitFrame, envTable.NameplateColor)\n            end\n        else\n            --blink effect\n            if (envTable.blinkAnimation:IsPlaying()) then\n                envTable.blinkAnimation:Stop()\n            end\n            --glow effect\n            if (envTable.GlowEnabled and envTable.glowEffect:IsShown()) then\n                envTable.glowEffect:Hide()\n            end\n        end\n    end\n    \n    --timer color\n    if (envTable.TimerColorEnabled and timeLeft > 0) then\n        if (timeLeft < envTable.TimeLeftCritical) then\n            Plater:SetFontColor (self.Cooldown.Timer, envTable.TextColor_Critical)\n        elseif (timeLeft < envTable.TimeLeftWarning) then\n            Plater:SetFontColor (self.Cooldown.Timer, envTable.TextColor_Warning)        \n        else\n            Plater:SetFontColor (self.Cooldown.Timer, Plater.db.profile.aura_timer_text_color)\n        end\n    end\n    \nend",
					["Time"] = 1550156096,
					["Temp_ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --settings (require a /reload after editing any setting)\n    do\n        --blink and glow\n        envTable.BlinkEnabled = true --set to 'false' to disable blinks\n        envTable.GlowEnabled = true --set to 'false' to disable glows\n        envTable.ChangeNameplateColor = true; --set to 'true' to enable nameplate color change\n        envTable.TimeLeftToBlink = 4.5; --in seconds, affects the blink effect only\n        envTable.BlinkSpeed = 1.0; --time to complete a blink loop\n        envTable.BlinkColor = \"white\"; --color of the blink\n        envTable.BlinkMaxAlpha = 0.50; --max transparency in the animation loop (1.0 is full opaque)\n        envTable.NameplateColor = \"darkred\"; --nameplate color if ChangeNameplateColor is true\n        \n        --text color\n        envTable.TimerColorEnabled = true --set to 'false' to disable changes in the color of the time left text\n        envTable.TimeLeftWarning = 8.0; --in seconds, affects the color of the text\n        envTable.TimeLeftCritical = 3.0; --in seconds, affects the color of the text    \n        envTable.TextColor_Warning = \"yellow\"; --color when the time left entered in a warning zone\n        envTable.TextColor_Critical = \"red\"; --color when the time left is critical\n        \n        --list of spellIDs to ignore\n        envTable.IgnoredSpellID = {\n            [12] = true, --use a simple comma here\n            [13] = true,\n        }\n    end\n    \n    \n    --private\n    do\n        envTable.blinkTexture = Plater:CreateImage (self, \"\", 1, 1, \"overlay\")\n        envTable.blinkTexture:SetPoint ('center', 0, 0)\n        envTable.blinkTexture:Hide()\n        \n        local onPlay = function()\n            envTable.blinkTexture:Show() \n            envTable.blinkTexture.color = envTable.BlinkColor\n        end\n        local onStop = function()\n            envTable.blinkTexture:Hide()  \n        end\n        envTable.blinkAnimation = Plater:CreateAnimationHub (envTable.blinkTexture, onPlay, onStop)\n        Plater:CreateAnimation (envTable.blinkAnimation, \"ALPHA\", 1, envTable.BlinkSpeed / 2, 0, envTable.BlinkMaxAlpha)\n        Plater:CreateAnimation (envTable.blinkAnimation, \"ALPHA\", 2, envTable.BlinkSpeed / 2, envTable.BlinkMaxAlpha, 0)\n        \n        envTable.glowEffect = envTable.glowEffect or Plater.CreateIconGlow (self)\n        --envTable.glowEffect:Show() --envTable.glowEffect:Hide()\n        \n    end\n    \nend\n\n\n\n\n",
					["NpcNames"] = {
					},
					["Temp_OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.blinkAnimation:Stop()\n    envTable.blinkTexture:Hide()\n    envTable.blinkAnimation:Stop()\n    envTable.glowEffect:Stop()\n    Plater:SetFontColor (self.Cooldown.Timer, Plater.db.profile.aura_timer_text_color)\nend\n\n\n",
					["Revision"] = 162,
					["Author"] = "Izimode-Azralon",
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.blinkTexture:SetSize (self:GetSize())\n    \nend\n\n\n",
					["Temp_UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    local timeLeft = envTable._RemainingTime\n    \n    --check if the spellID isn't being ignored\n    if (envTable.IgnoredSpellID [envTable._SpellID]) then\n        return\n    end\n    \n    --check the time left and start or stop the blink animation and also check if the time left is > zero\n    if ((envTable.BlinkEnabled or envTable.GlowEnabled) and timeLeft > 0) then\n        if (timeLeft < envTable.TimeLeftToBlink) then\n            --blink effect\n            if (envTable.BlinkEnabled) then\n                if (not envTable.blinkAnimation:IsPlaying()) then\n                    envTable.blinkAnimation:Play()\n                end\n            end\n            --glow effect\n            if (envTable.GlowEnabled) then\n                envTable.glowEffect:Show()\n            end\n            --nameplate color\n            if (envTable.ChangeNameplateColor) then\n                Plater.SetNameplateColor (unitFrame, envTable.NameplateColor)\n            end\n        else\n            --blink effect\n            if (envTable.blinkAnimation:IsPlaying()) then\n                envTable.blinkAnimation:Stop()\n            end\n            --glow effect\n            if (envTable.GlowEnabled and envTable.glowEffect:IsShown()) then\n                envTable.glowEffect:Hide()\n            end\n        end\n    end\n    \n    --timer color\n    if (envTable.TimerColorEnabled and timeLeft > 0) then\n        if (timeLeft < envTable.TimeLeftCritical) then\n            Plater:SetFontColor (self.Cooldown.Timer, envTable.TextColor_Critical)\n        elseif (timeLeft < envTable.TimeLeftWarning) then\n            Plater:SetFontColor (self.Cooldown.Timer, envTable.TextColor_Warning)        \n        else\n            Plater:SetFontColor (self.Cooldown.Timer, Plater.db.profile.aura_timer_text_color)\n        end\n    end\n    \nend",
					["Name"] = "Aura - Blink by Time Left [Plater]",
					["PlaterCore"] = 1,
					["Enabled"] = true,
					["Desc"] = "Blink, change the number and nameplate color. Add the debuffs int he trigger box. Set settings on constructor script.",
					["SpellIds"] = {
					},
					["Icon"] = "Interface\\AddOns\\Plater\\images\\icon_aura_blink",
				}, -- [10]
				{
					["Enabled"] = true,
					["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --reset the border color\n    self:SetBackdropBorderColor (0, 0, 0, 0)\n    \nend\n\n\n",
					["Revision"] = 45,
					["Icon"] = 133006,
					["Author"] = "Izimode-Azralon",
					["ConstructorCode"] = "--gray lines are comments and doesn't affect the code\n\n--1) add the aura you want by typing its name or spellID into the \"Add Trigger\" and click the \"Add\" button.\n--2) the border will use the default color set below, to a custom color type aura name and the color you want in the BorderColorByAura table.\n\nfunction (self, unitId, unitFrame, envTable)\n    \n    --default color if the aura name isn't found in the Color By Aura table below\n    envTable.DefaultBorderColor = \"orange\"\n    \n    --transparency, affect all borders\n    envTable.BorderAlpha = 1.0\n    \n    --add the aura name and the color, \n    envTable.BorderColorByAura = {\n        \n        --examples:\n        --[\"Aura Name\"] = \"yellow\", --using regular aura name | using the name of the color\n        --[\"aura name\"] = \"#FFFF00\", --using lower case in the aura name |using html #hex for the color\n        --[54214] = {1, 1, 0}, --using the spellID instead of the name | using rgb table (0 to 1) for the color\n        --color table uses zero to one values: 255 = 1.0, 127 = 0.5, orange color = {1, 0.7, 0}\n        \n        --add your custom border colors below:\n        \n        [\"Aura Name\"] = {1, .5, 0}, --example to copy/paste\n        \n    }\n    \n    \nend\n\n\n\n\n",
					["ScriptType"] = 1,
					["Name"] = "Aura - Border Color [Plater]",
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --get the custom color added by the user or the default color\n    local color = envTable.CustomBorderColor or envTable.DefaultBorderColor\n    --parse the color since it can be a color name, hex or color table\n    local r, g, b = DetailsFramework:ParseColors (color)\n    \n    --set the border color\n    self:SetBackdropBorderColor (r, g, b, envTable.BorderAlpha)\n    \nend\n\n\n\n\n",
					["Time"] = 1543680853,
					["PlaterCore"] = 1,
					["SpellIds"] = {
					},
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --get the aura name in lower case\n    local auraLowerName = string.lower (envTable._SpellName)\n    \n    --attempt to get a custom color added by the user in the constructor script\n    local hasCustomBorderColor = envTable.BorderColorByAura [auraLowerName] or envTable.BorderColorByAura [envTable._SpellName] or envTable.BorderColorByAura [envTable._SpellID]\n    \n    --save the custom color\n    envTable.CustomBorderColor = hasCustomBorderColor\n    \nend\n\n\n",
					["NpcNames"] = {
					},
					["Desc"] = "Add a border to an aura icon. Add the aura into the Add Trigger entry. You can customize the icon color at the constructor script.",
				}, -- [11]
				{
					["Enabled"] = true,
					["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.EnergyAmount:Hide()\nend\n\n\n",
					["Revision"] = 131,
					["Icon"] = 136048,
					["Author"] = "Celian-Sylvanas",
					["ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.EnergyAmount = Plater:CreateLabel (unitFrame, \"\", 16, \"silver\");\n    envTable.EnergyAmount:SetPoint (\"bottom\", unitFrame, \"top\", 0, 18);\nend\n\n--[=[\n\n\n--]=]",
					["ScriptType"] = 3,
					["Name"] = "UnitPower [Plater]",
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.EnergyAmount.text = \"\" .. UnitPower (unitId);\nend\n\n\n",
					["Time"] = 1539015649,
					["PlaterCore"] = 1,
					["SpellIds"] = {
					},
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.EnergyAmount:Show()\nend\n\n\n",
					["NpcNames"] = {
						"Guardian of Yogg-Saron", -- [1]
					},
					["Desc"] = "Show the energy amount above the nameplate",
				}, -- [12]
				{
					["Enabled"] = true,
					["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.movingAnimation:Stop()\nend\n\n\n",
					["Revision"] = 171,
					["Icon"] = "Interface\\AddOns\\Plater\\images\\cast_bar",
					["Author"] = "Izimode-Azralon",
					["ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.movingArrow = envTable.movingArrow or Plater:CreateImage (self, [[Interface\\PETBATTLES\\PetBattle-StatIcons]], 16, self:GetHeight(), \"background\", {0, 15/32, 18/32, 30/32})\n    \n    envTable.movingArrow:SetAlpha (0.275)\n    --envTable.movingArrow:SetDesaturated (true)\n    \n    envTable.movingAnimation = envTable.movingAnimation or Plater:CreateAnimationHub (envTable.movingArrow, \n        function() \n            envTable.movingArrow:Show() \n            envTable.movingArrow:SetPoint(\"left\", 0, 0)\n        end, \n        function() envTable.movingArrow:Hide() end)\n    \n    envTable.movingAnimation:SetLooping (\"REPEAT\")\n    \n    local animation = Plater:CreateAnimation (envTable.movingAnimation, \"translation\", 1, 0.2, self:GetWidth()-16, 0)\n    \n    \n    \nend\n\n\n",
					["ScriptType"] = 2,
					["Name"] = "Cast - Frontal Cone [Plater]",
					["UpdateCode"] = "		function (self, unitId, unitFrame, envTable)\n			\n		end\n	",
					["Time"] = 1539201849,
					["PlaterCore"] = 1,
					["SpellIds"] = {
						255952, -- [1]
						257426, -- [2]
						274400, -- [3]
						272609, -- [4]
						269843, -- [5]
						269029, -- [6]
						272827, -- [7]
						269266, -- [8]
						263912, -- [9]
						264923, -- [10]
						258864, -- [11]
						256955, -- [12]
						265540, -- [13]
						260793, -- [14]
						270003, -- [15]
						270507, -- [16]
						257337, -- [17]
						268415, -- [18]
						275907, -- [19]
						268865, -- [20]
						260669, -- [21]
						260280, -- [22]
						253239, -- [23]
						265541, -- [24]
						250258, -- [25]
					},
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.movingAnimation:Play()\nend\n\n\n",
					["NpcNames"] = {
					},
					["Desc"] = "Does an animation for casts that affect the frontal area of the enemy. Add spell in the Add Trigger field.",
				}, -- [13]
				{
					["Enabled"] = true,
					["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.FixateTarget:Hide()\n    envTable.FixateIcon:Hide()\nend\n\n\n",
					["Revision"] = 190,
					["Icon"] = 1029718,
					["Author"] = "Celian-Sylvanas",
					["ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.FixateTarget = Plater:CreateLabel (unitFrame);\n    envTable.FixateTarget:SetPoint (\"bottom\", unitFrame.BuffFrame, \"top\", 0, 10);    \n    \n    envTable.FixateIcon = Plater:CreateImage (unitFrame, 236188, 16, 16, \"overlay\");\n    envTable.FixateIcon:SetPoint (\"bottom\", envTable.FixateTarget, \"top\", 0, 4);    \n    \nend\n\n\n\n\n\n\n\n\n",
					["ScriptType"] = 1,
					["Name"] = "Fixate [Plater]",
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    local targetName = UnitName (unitId .. \"target\");\n    if (targetName) then\n        local _, class = UnitClass (unitId .. \"target\");\n        targetName = Plater.SetTextColorByClass (unitId .. \"target\", targetName);\n        envTable.FixateTarget.text = targetName;\n    end    \nend\n\n\n",
					["Time"] = 1539187387,
					["PlaterCore"] = 1,
					["SpellIds"] = {
						272584, -- [1]
						244653, -- [2]
					},
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.FixateTarget:Show();\n    envTable.FixateIcon:Show();\n    \nend\n\n\n",
					["NpcNames"] = {
					},
					["Desc"] = "Show above the nameplate who is the player fixated",
				}, -- [14]
				{
					["Enabled"] = true,
					["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.FixateTarget:SetText (\"\")\n    envTable.FixateTarget:Hide()\n    \n    envTable.IsFixated = false\n    \n    Plater.RefreshNameplateColor (unitFrame)\nend\n\n\n",
					["Revision"] = 194,
					["Icon"] = 841383,
					["Author"] = "Tecno-Azralon",
					["ConstructorCode"] = "--todo: add npc ids for multilanguage support\n\nfunction (self, unitId, unitFrame, envTable)\n    \n    --settings\n    envTable.TextAboveNameplate = \"** On You **\"\n    envTable.NameplateColor = \"green\"\n    \n    --label to show the text above the nameplate\n    envTable.FixateTarget = Plater:CreateLabel (unitFrame);\n    envTable.FixateTarget:SetPoint (\"bottom\", unitFrame.healthBar, \"top\", 0, 30);\n    \n    --the spell casted by the npc in the trigger list needs to be in the list below as well\n    local spellList = {\n        [268074] = \"Dark Purpose\", --G'huun Mythic Add\n        [260954] = \"Iron Gaze\", --Sergeant Bainbridge - Siege of Boralus\n        [257739] = \"Blind Rage\", --Blacktooth Scrapper - Freehold\n        [257314] = \"Black Powder Bomb\", --Irontide Grenadier - Freehold\n        [266107] = \"Thirst For Blood\", --Feral Bloodswarmer - The Underrot\n        [257582] = \"Raging Gaze\", --Earthrager - The MOTHERLODE!!\n        [262377] = \"Seek and Destroy\", --Crawler Mine - The MOTHERLODE!!\n        [257407] = \"Pursuit\", --Rezan - Atal'Dazar\n        --[] = \"\" --       \n        \n    }\n    \n    --build the list with localized spell names\n    envTable.FixateDebuffs = {}\n    for spellID, enUSSpellName in pairs (spellList) do\n        local localizedSpellName = GetSpellInfo (spellID)\n        envTable.FixateDebuffs [localizedSpellName or enUSSpellName] = true\n    end\n    \n    --debug - smuggled crawg\n    envTable.FixateDebuffs [\"Jagged Maw\"] = true\n    \nend\n\n--[=[\nNpcIDs:\n136461: Spawn of G'huun (mythic uldir G'huun)\n\n--]=]\n\n\n\n\n",
					["ScriptType"] = 3,
					["Name"] = "Fixate On You [Plater]",
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --swap this to true when it is fixated\n    local isFixated = false\n    \n    --check the debuffs the player has and see if any of these debuffs has been placed by this unit\n    for debuffId = 1, 40 do\n        local name, texture, count, debuffType, duration, expirationTime, caster = UnitDebuff (\"player\", debuffId)\n        \n        --cancel the loop if there's no more debuffs on the player\n        if (not name) then \n            break \n        end\n        \n        --check if the owner of the debuff is this unit\n        if (envTable.FixateDebuffs [name] and caster and UnitIsUnit (caster, unitId)) then\n            --the debuff the player has, has been placed by this unit, set the name above the unit name\n            envTable.FixateTarget:SetText (envTable.TextAboveNameplate)\n            envTable.FixateTarget:Show()\n            Plater.SetNameplateColor (unitFrame,  envTable.NameplateColor)\n            isFixated = true\n            \n            if (not envTable.IsFixated) then\n                envTable.IsFixated = true\n                Plater.FlashNameplateBody (unitFrame, \"fixate\", .2)\n            end\n        end\n        \n    end\n    \n    --check if the nameplate color is changed but isn't fixated any more\n    if (not isFixated and envTable.IsFixated) then\n        --refresh the nameplate color\n        Plater.RefreshNameplateColor (unitFrame)\n        --reset the text\n        envTable.FixateTarget:SetText (\"\")\n        \n        envTable.IsFixated = false\n    end\n    \nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
					["Time"] = 1543250950,
					["PlaterCore"] = 1,
					["SpellIds"] = {
						"spawn of g'huun", -- [1]
						"smuggled crawg", -- [2]
						"sergeant bainbridge", -- [3]
						"blacktooth scrapper", -- [4]
						"irontide grenadier", -- [5]
						"feral bloodswarmer", -- [6]
						"earthrager", -- [7]
						"crawler mine", -- [8]
						"rezan", -- [9]
					},
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \nend\n\n\n",
					["NpcNames"] = {
						"smuggled crawg", -- [1]
						"sergeant bainbridge", -- [2]
						"blacktooth scrapper", -- [3]
						"irontide grenadier", -- [4]
						"feral bloodswarmer", -- [5]
						"earthrager", -- [6]
						"crawler mine", -- [7]
						"rezan", -- [8]
						"136461", -- [9]
					},
					["Desc"] = "When an enemy places a debuff and starts to chase you. This script changes the nameplate color and place your name above the nameplate as well.",
				}, -- [15]
			},
			["aura_timer_text_color"] = {
				nil, -- [1]
				0.96470588235294, -- [2]
				0.92549019607843, -- [3]
			},
			["url"] = "https://wago.io/e_OehloIz/3",
			["show_shield_prediction"] = false,
			["stacking_nameplates_enabled"] = false,
			["aura_timer_text_anchor"] = {
				["y"] = 7,
				["x"] = -7,
			},
			["castbar_framelevel"] = 0,
			["plate_config"] = {
				["player"] = {
					["spellpercent_text_font"] = "Accidental Presidency",
					["cast"] = {
						nil, -- [1]
						6, -- [2]
					},
					["spellpercent_text_anchor"] = {
						["x"] = 4,
						["side"] = 5,
					},
					["power_percent_text_enabled"] = false,
					["level_text_font"] = "Accidental Presidency",
					["actorname_text_font"] = "Accidental Presidency",
					["power_percent_text_size"] = 8,
					["big_actortitle_text_font"] = "Accidental Presidency",
					["cast_incombat"] = {
						nil, -- [1]
						6, -- [2]
					},
					["spellname_text_anchor"] = {
						["side"] = 3,
					},
					["mana_incombat"] = {
						nil, -- [1]
						6, -- [2]
					},
					["spellname_text_font"] = "Accidental Presidency",
					["mana"] = {
						nil, -- [1]
						6, -- [2]
					},
					["big_actorname_text_font"] = "Accidental Presidency",
					["percent_text_font"] = "Accidental Presidency",
					["healthbar_color_by_hp"] = true,
					["power_percent_text_font"] = "Accidental Presidency",
				},
				["friendlyplayer"] = {
					["actorname_use_friends_color"] = false,
					["spellpercent_text_font"] = "Accidental Presidency",
					["actorname_friend_color"] = {
						0, -- [1]
						[3] = 0.9294117647058824,
					},
					["level_text_size"] = 8,
					["actorname_use_class_color"] = true,
					["cast"] = {
						122, -- [1]
					},
					["spellpercent_text_anchor"] = {
						["x"] = 2,
						["side"] = 5,
					},
					["spellname_text_outline"] = "OUTLINE",
					["big_actorname_text_shadow_color"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["level_text_font"] = "Accidental Presidency",
					["actorname_text_font"] = "Accidental Presidency",
					["big_actorname_text_shadow_color_offset"] = {
						1, -- [1]
						-1, -- [2]
					},
					["mana_incombat"] = {
						nil, -- [1]
						4, -- [2]
					},
					["actorname_use_guild_color"] = false,
					["all_names"] = true,
					["actorname_text_outline"] = "NONE",
					["big_actortitle_text_outline"] = "OUTLINE",
					["quest_color_enemy"] = {
						1, -- [1]
						0.369, -- [2]
						0, -- [3]
					},
					["only_thename"] = true,
					["big_actortitle_text_font"] = "Accidental Presidency",
					["percent_text_ooc"] = true,
					["level_text_anchor"] = {
						["y"] = 0,
						["x"] = 2,
						["side"] = 10,
					},
					["big_actortitle_text_shadow_color_offset"] = {
						1, -- [1]
						-1, -- [2]
					},
					["cast_incombat"] = {
						122, -- [1]
						8, -- [2]
					},
					["power_percent_text_font"] = "Accidental Presidency",
					["spellname_text_anchor"] = {
						["side"] = 3,
					},
					["big_actortitle_text_shadow_color"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["percent_text_anchor"] = {
						["side"] = 11,
					},
					["big_actortitle_text_size"] = 10,
					["spellname_text_font"] = "Accidental Presidency",
					["big_actorname_text_outline"] = "OUTLINE",
					["quest_color_neutral"] = {
						1, -- [1]
						0.65, -- [2]
						0, -- [3]
					},
					["actorname_text_size"] = 11,
					["big_actorname_text_font"] = "Accidental Presidency",
					["big_actorname_text_size"] = 10,
					["show_guild_name"] = true,
					["spellpercent_text_size"] = 11,
					["level_text_alpha"] = 0.5,
					["percent_text_size"] = 10,
					["percent_text_font"] = "Accidental Presidency",
					["buff_frame_y_offset"] = 20,
					["actorname_guild_color"] = {
						0, -- [1]
						[3] = 0.03137254901960784,
					},
					["quest_enabled"] = true,
					["mana"] = {
						nil, -- [1]
						4, -- [2]
					},
					["health_incombat"] = {
						120, -- [1]
						16, -- [2]
					},
					["health"] = {
						120, -- [1]
						14, -- [2]
					},
					["spellpercent_text_enabled"] = true,
					["spellname_text_size"] = 11,
					["percent_show_health"] = true,
					["percent_text_enabled"] = true,
					["level_text_enabled"] = true,
				},
				["friendlynpc"] = {
					["spellpercent_text_font"] = "Accidental Presidency",
					["level_text_size"] = 8,
					["cast"] = {
						122, -- [1]
						8, -- [2]
					},
					["spellpercent_text_anchor"] = {
						["x"] = 2,
						["side"] = 5,
					},
					["spellname_text_outline"] = "OUTLINE",
					["level_text_font"] = "Accidental Presidency",
					["actorname_text_font"] = "Accidental Presidency",
					["quest_color_enemy"] = {
						1, -- [1]
						0.369, -- [2]
						0, -- [3]
					},
					["big_actortitle_text_font"] = "Accidental Presidency",
					["percent_text_ooc"] = true,
					["level_text_anchor"] = {
						["y"] = 0,
						["x"] = 2,
						["side"] = 10,
					},
					["cast_incombat"] = {
						122, -- [1]
						8, -- [2]
					},
					["spellname_text_anchor"] = {
						["side"] = 3,
					},
					["percent_text_anchor"] = {
						["side"] = 11,
					},
					["spellname_text_font"] = "Accidental Presidency",
					["quest_color_neutral"] = {
						1, -- [1]
						0.65, -- [2]
						0, -- [3]
					},
					["actorname_text_size"] = 11,
					["big_actorname_text_font"] = "Accidental Presidency",
					["spellpercent_text_size"] = 11,
					["big_actorname_text_size"] = 10,
					["percent_show_health"] = true,
					["spellpercent_text_enabled"] = true,
					["big_actortitle_text_size"] = 10,
					["percent_text_font"] = "Accidental Presidency",
					["buff_frame_y_offset"] = 20,
					["spellname_text_size"] = 11,
					["health"] = {
						120, -- [1]
						14, -- [2]
					},
					["power_percent_text_font"] = "Accidental Presidency",
					["level_text_alpha"] = 0.5,
					["percent_text_size"] = 10,
					["percent_text_enabled"] = true,
					["level_text_enabled"] = true,
				},
				["enemyplayer"] = {
					["spellpercent_text_font"] = "Accidental Presidency",
					["level_text_size"] = 8,
					["cast"] = {
						120, -- [1]
						8, -- [2]
					},
					["spellpercent_text_anchor"] = {
						["x"] = 2,
						["side"] = 5,
					},
					["spellname_text_outline"] = "OUTLINE",
					["level_text_font"] = "Accidental Presidency",
					["actorname_text_font"] = "Accidental Presidency",
					["all_names"] = true,
					["actorname_text_spacing"] = 10,
					["quest_color_enemy"] = {
						1, -- [1]
						0.369, -- [2]
						0, -- [3]
					},
					["big_actortitle_text_font"] = "Accidental Presidency",
					["spellpercent_text_size"] = 11,
					["level_text_anchor"] = {
						["y"] = 0,
						["x"] = 2,
						["side"] = 10,
					},
					["cast_incombat"] = {
						nil, -- [1]
						8, -- [2]
					},
					["actorname_text_anchor"] = {
						["side"] = 8,
					},
					["spellname_text_anchor"] = {
						["side"] = 3,
					},
					["percent_text_anchor"] = {
						["side"] = 11,
					},
					["spellname_text_font"] = "Accidental Presidency",
					["quest_color_neutral"] = {
						1, -- [1]
						0.65, -- [2]
						0, -- [3]
					},
					["big_actorname_text_font"] = "Accidental Presidency",
					["big_actorname_text_size"] = 10,
					["level_text_alpha"] = 0.5,
					["percent_text_size"] = 10,
					["percent_text_font"] = "Accidental Presidency",
					["buff_frame_y_offset"] = 20,
					["big_actortitle_text_size"] = 10,
					["quest_enabled"] = true,
					["spellname_text_size"] = 11,
					["health"] = {
						120, -- [1]
						14, -- [2]
					},
					["actorname_text_size"] = 11,
					["power_percent_text_font"] = "Accidental Presidency",
				},
				["enemynpc"] = {
					["spellpercent_text_font"] = "Accidental Presidency",
					["cast"] = {
						120, -- [1]
						8, -- [2]
					},
					["spellpercent_text_anchor"] = {
						["x"] = 0,
						["side"] = 5,
					},
					["level_text_font"] = "Accidental Presidency",
					["actorname_text_font"] = "Accidental Presidency",
					["big_actortitle_text_font"] = "Accidental Presidency",
					["level_text_anchor"] = {
						["y"] = 0,
						["x"] = 2,
						["side"] = 10,
					},
					["cast_incombat"] = {
						nil, -- [1]
						8, -- [2]
					},
					["spellname_text_anchor"] = {
						["side"] = 3,
					},
					["percent_text_anchor"] = {
						["side"] = 11,
					},
					["level_text_alpha"] = 0.5,
					["spellname_text_font"] = "Accidental Presidency",
					["power_percent_text_font"] = "Accidental Presidency",
					["actorname_text_anchor"] = {
						["side"] = 8,
					},
					["percent_text_size"] = 10,
					["percent_text_font"] = "Accidental Presidency",
					["buff_frame_y_offset"] = 20,
					["spellname_text_size"] = 11,
					["health"] = {
						120, -- [1]
						14, -- [2]
					},
					["big_actorname_text_font"] = "Accidental Presidency",
				},
			},
			["aura_alpha"] = 1,
			["use_ui_parent"] = true,
			["aura_show_defensive_cd"] = true,
			["pet_width_scale"] = 0.8999999761581421,
			["cast_statusbar_bgcolor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				0.79781, -- [4]
			},
			["aura_width_personal"] = 23,
			["npc_cache"] = {
				[154524] = {
					"克熙尔剜心者", -- [1]
					"奥格瑞玛的惊魂幻象", -- [2]
				},
				[155098] = {
					"雷克萨", -- [1]
					"奥格瑞玛的惊魂幻象", -- [2]
				},
				[134284] = {
					"堕落的亡语者", -- [1]
					"地渊孢林", -- [2]
				},
				[130909] = {
					"恶臭蛆虫", -- [1]
					"地渊孢林", -- [2]
				},
				[138428] = {
					"怨鳍侍从", -- [1]
					"Whispering Reef (Islands 10)", -- [2]
				},
				[133870] = {
					"染病鞭笞者", -- [1]
					"地渊孢林", -- [2]
				},
				[151752] = {
					"虚空群居兽", -- [1]
					"Emerald Dream - HoA Scenario", -- [2]
				},
				[157904] = {
					"亚基甲虫", -- [1]
					"奥格瑞玛的惊魂幻象", -- [2]
				},
				[156406] = {
					"虚缚荣誉卫兵", -- [1]
					"奥格瑞玛的惊魂幻象", -- [2]
				},
				[152135] = {
					"折虚织法者", -- [1]
					"Eastern Kingdoms - Vermillion Redoubt - HoA Scenario", -- [2]
				},
				[132532] = {
					"库尔提拉斯神射手", -- [1]
					"围攻伯拉勒斯", -- [2]
				},
				[161124] = {
					"乌尔格斯，勇士噬灭者", -- [1]
					"地渊孢林", -- [2]
				},
				[144071] = {
					"铁潮塑浪者", -- [1]
					"围攻伯拉勒斯", -- [2]
				},
				[134158] = {
					"影裔勇士", -- [1]
					"诸王之眠", -- [2]
				},
				[151785] = {
					"折虚巨龙杀手", -- [1]
					"Eastern Kingdoms - Vermillion Redoubt - HoA Scenario", -- [2]
				},
				[136549] = {
					"艾什凡炮手", -- [1]
					"围攻伯拉勒斯", -- [2]
				},
				[130639] = {
					"钳颚咀嚼者", -- [1]
					"Whispering Reef (Islands 10)", -- [2]
				},
				[157268] = {
					"蠕行腐蚀", -- [1]
					"奥格瑞玛的惊魂幻象", -- [2]
				},
				[156089] = {
					"亚基织毒者", -- [1]
					"奥格瑞玛的惊魂幻象", -- [2]
				},
				[134701] = {
					"未知目标", -- [1]
					"地渊孢林", -- [2]
				},
				[145061] = {
					"尖啸的夜翼鸦", -- [1]
					"Whispering Reef (Islands 10)", -- [2]
				},
				[151755] = {
					"暗影猎犬", -- [1]
					"Emerald Dream - HoA Scenario", -- [2]
				},
				[138464] = {
					"艾什凡水手", -- [1]
					"围攻伯拉勒斯", -- [2]
				},
				[161510] = {
					"裂魂触须", -- [1]
					"地渊孢林", -- [2]
				},
				[128967] = {
					"艾什凡狙击手", -- [1]
					"围攻伯拉勒斯", -- [2]
				},
				[164188] = {
					"惊魂臆想", -- [1]
					"奥格瑞玛的惊魂幻象", -- [2]
				},
				[138465] = {
					"艾什凡炮手", -- [1]
					"围攻伯拉勒斯", -- [2]
				},
				[147932] = {
					"焦躁的艾泽里特裂片", -- [1]
					"Whispering Reef (Islands 10)", -- [2]
				},
				[138019] = {
					"库尔提拉斯先锋", -- [1]
					"围攻伯拉勒斯", -- [2]
				},
				[138338] = {
					"复活的护卫", -- [1]
					"地渊孢林", -- [2]
				},
				[129366] = {
					"水鼠帮海盗", -- [1]
					"围攻伯拉勒斯", -- [2]
				},
				[164189] = {
					"惊魂臆想", -- [1]
					"奥格瑞玛的惊魂幻象", -- [2]
				},
				[135406] = {
					"活性黄金", -- [1]
					"诸王之眠", -- [2]
				},
				[137478] = {
					"沃希女王", -- [1]
					"诸王之眠", -- [2]
				},
				[153065] = {
					"虚缚破坏者", -- [1]
					"奥格瑞玛的惊魂幻象", -- [2]
				},
				[153097] = {
					"虚缚萨满祭司", -- [1]
					"奥格瑞玛的惊魂幻象", -- [2]
				},
				[152874] = {
					"无光者维兹奥克", -- [1]
					"奥格瑞玛的惊魂幻象", -- [2]
				},
				[141495] = {
					"库尔提拉斯步兵", -- [1]
					"围攻伯拉勒斯", -- [2]
				},
				[137989] = {
					"防腐液", -- [1]
					"诸王之眠", -- [2]
				},
				[137511] = {
					"水鼠帮杀手", -- [1]
					"围攻伯拉勒斯", -- [2]
				},
				[134993] = {
					"殓尸者姆沁巴", -- [1]
					"诸王之眠", -- [2]
				},
				[153130] = {
					"巨型虚空元素", -- [1]
					"奥格瑞玛的惊魂幻象", -- [2]
				},
				[129367] = {
					"水鼠帮唤风者", -- [1]
					"围攻伯拉勒斯", -- [2]
				},
				[135472] = {
					"智者扎纳扎尔", -- [1]
					"诸王之眠", -- [2]
				},
				[135759] = {
					"未知目标", -- [1]
					"诸王之眠", -- [2]
				},
				[128969] = {
					"艾什凡指挥官", -- [1]
					"围攻伯拉勒斯", -- [2]
				},
				[157594] = {
					"小型虚空元素", -- [1]
					"奥格瑞玛的惊魂幻象", -- [2]
				},
				[133943] = {
					"祖尔的爪牙", -- [1]
					"诸王之眠", -- [2]
				},
				[130436] = {
					"下班的劳工", -- [1]
					"暴富矿区！！", -- [2]
				},
				[133912] = {
					"血誓污染者", -- [1]
					"地渊孢林", -- [2]
				},
				[135761] = {
					"未知目标", -- [1]
					"诸王之眠", -- [2]
				},
				[140447] = {
					"攻城恐魔", -- [1]
					"围攻伯拉勒斯", -- [2]
				},
				[135475] = {
					"屠夫库拉", -- [1]
					"诸王之眠", -- [2]
				},
				[153532] = {
					"亚基猎心者", -- [1]
					"奥格瑞玛的惊魂幻象", -- [2]
				},
				[129369] = {
					"铁潮袭击者", -- [1]
					"围攻伯拉勒斯", -- [2]
				},
				[129640] = {
					"咆哮的港口猎犬", -- [1]
					"围攻伯拉勒斯", -- [2]
				},
				[137473] = {
					"守卫队长阿图", -- [1]
					"诸王之眠", -- [2]
				},
				[128652] = {
					"维克戈斯", -- [1]
					"围攻伯拉勒斯", -- [2]
				},
				[137484] = {
					"阿库尔大王", -- [1]
					"诸王之眠", -- [2]
				},
				[138281] = {
					"无面腐蚀者", -- [1]
					"地渊孢林", -- [2]
				},
				[137405] = {
					"攫握恐魔", -- [1]
					"围攻伯拉勒斯", -- [2]
				},
				[129208] = {
					"恐怖船长洛克伍德", -- [1]
					"围攻伯拉勒斯", -- [2]
				},
				[131492] = {
					"虔诚鲜血祭司", -- [1]
					"地渊孢林", -- [2]
				},
				[128651] = {
					"哈达尔·黑渊", -- [1]
					"围攻伯拉勒斯", -- [2]
				},
				[137517] = {
					"艾什凡破坏者", -- [1]
					"围攻伯拉勒斯", -- [2]
				},
				[137516] = {
					"艾什凡入侵者", -- [1]
					"围攻伯拉勒斯", -- [2]
				},
				[137485] = {
					"血誓代理", -- [1]
					"诸王之眠", -- [2]
				},
				[154347] = {
					"折虚腐蚀者", -- [1]
					"Eastern Kingdoms - Vermillion Redoubt - HoA Scenario", -- [2]
				},
				[135764] = {
					"爆裂图腾", -- [1]
					"诸王之眠", -- [2]
				},
				[132481] = {
					"库尔提拉斯先锋", -- [1]
					"围攻伯拉勒斯", -- [2]
				},
				[137103] = {
					"血面兽", -- [1]
					"地渊孢林", -- [2]
				},
				[135241] = {
					"水鼠帮劫掠者", -- [1]
					"围攻伯拉勒斯", -- [2]
				},
				[133852] = {
					"生命腐质", -- [1]
					"地渊孢林", -- [2]
				},
				[135245] = {
					"水鼠帮歼灭者", -- [1]
					"围攻伯拉勒斯", -- [2]
				},
				[136976] = {
					"提扎拉", -- [1]
					"诸王之眠", -- [2]
				},
				[151798] = {
					"维克修娜", -- [1]
					"Eastern Kingdoms - Vermillion Redoubt - HoA Scenario", -- [2]
				},
				[135765] = {
					"洪流图腾", -- [1]
					"诸王之眠", -- [2]
				},
				[136483] = {
					"艾什凡水手", -- [1]
					"围攻伯拉勒斯", -- [2]
				},
				[137614] = {
					"攻城恐魔", -- [1]
					"围攻伯拉勒斯", -- [2]
				},
				[134331] = {
					"拉胡艾大王", -- [1]
					"诸王之眠", -- [2]
				},
				[135893] = {
					"燃烬卫士", -- [1]
					"Whispering Reef (Islands 10)", -- [2]
				},
				[135925] = {
					"爆烈之焰", -- [1]
					"Whispering Reef (Islands 10)", -- [2]
				},
				[135192] = {
					"荣耀迅猛龙", -- [1]
					"诸王之眠", -- [2]
				},
				[135263] = {
					"艾什凡观察员", -- [1]
					"围攻伯拉勒斯", -- [2]
				},
				[155656] = {
					"米莎", -- [1]
					"奥格瑞玛的惊魂幻象", -- [2]
				},
				[141565] = {
					"库尔提拉斯步兵", -- [1]
					"围攻伯拉勒斯", -- [2]
				},
				[129371] = {
					"激流破浪者", -- [1]
					"围攻伯拉勒斯", -- [2]
				},
				[138254] = {
					"铁潮火枪手", -- [1]
					"围攻伯拉勒斯", -- [2]
				},
				[135894] = {
					"火元素", -- [1]
					"Whispering Reef (Islands 10)", -- [2]
				},
				[136181] = {
					"火山", -- [1]
					"Whispering Reef (Islands 10)", -- [2]
				},
				[133663] = {
					"狂热的猎头者", -- [1]
					"地渊孢林", -- [2]
				},
				[138247] = {
					"铁潮掠夺者", -- [1]
					"围攻伯拉勒斯", -- [2]
				},
				[155657] = {
					"霍弗", -- [1]
					"奥格瑞玛的惊魂幻象", -- [2]
				},
				[137486] = {
					"帕特拉女王", -- [1]
					"诸王之眠", -- [2]
				},
				[129370] = {
					"铁潮塑浪者", -- [1]
					"围攻伯拉勒斯", -- [2]
				},
				[129372] = {
					"黑油投弹者", -- [1]
					"围攻伯拉勒斯", -- [2]
				},
				[135895] = {
					"灼光火花", -- [1]
					"Whispering Reef (Islands 10)", -- [2]
				},
				[141282] = {
					"库尔提拉斯步兵", -- [1]
					"围攻伯拉勒斯", -- [2]
				},
				[134174] = {
					"影裔巫医", -- [1]
					"诸王之眠", -- [2]
				},
				[137521] = {
					"铁潮火枪手", -- [1]
					"围攻伯拉勒斯", -- [2]
				},
				[135258] = {
					"铁潮掠夺者", -- [1]
					"围攻伯拉勒斯", -- [2]
				},
				[132491] = {
					"库尔提拉斯神射手", -- [1]
					"围攻伯拉勒斯", -- [2]
				},
				[135322] = {
					"黄金风蛇", -- [1]
					"诸王之眠", -- [2]
				},
				[128649] = {
					"拜恩比吉中士", -- [1]
					"围攻伯拉勒斯", -- [2]
				},
				[138187] = {
					"怪诞恐魔", -- [1]
					"地渊孢林", -- [2]
				},
				[141283] = {
					"库尔提拉斯戟兵", -- [1]
					"围攻伯拉勒斯", -- [2]
				},
				[138255] = {
					"艾什凡观察员", -- [1]
					"围攻伯拉勒斯", -- [2]
				},
				[131402] = {
					"地渊孢林蜱虫", -- [1]
					"地渊孢林", -- [2]
				},
				[152089] = {
					"萨尔", -- [1]
					"奥格瑞玛的惊魂幻象", -- [2]
				},
				[153141] = {
					"未知目标", -- [1]
					"奥格瑞玛的惊魂幻象", -- [2]
				},
				["144942"] = {
					"Spark Bot", -- [1]
					"Battle of Dazar'alor", -- [2]
				},
				[141566] = {
					"雕骨切割者", -- [1]
					"围攻伯拉勒斯", -- [2]
				},
				[131817] = {
					"被感染的岩喉", -- [1]
					"地渊孢林", -- [2]
				},
				[157349] = {
					"虚空野猪", -- [1]
					"奥格瑞玛的惊魂幻象", -- [2]
				},
				[141285] = {
					"库尔提拉斯神射手", -- [1]
					"围攻伯拉勒斯", -- [2]
				},
				[141284] = {
					"库尔提拉斯护潮者", -- [1]
					"围攻伯拉勒斯", -- [2]
				},
				[137458] = {
					"腐烂孢子", -- [1]
					"地渊孢林", -- [2]
				},
				[161812] = {
					"无面毁伤者", -- [1]
					"心之秘室", -- [2]
				},
				[129373] = {
					"港口猎犬训练师", -- [1]
					"围攻伯拉勒斯", -- [2]
				},
				[161243] = {
					"萨姆莱克，混沌唤引者", -- [1]
					"地渊孢林", -- [2]
				},
				[151754] = {
					"虚空怨灵", -- [1]
					"Emerald Dream - HoA Scenario", -- [2]
				},
				[157605] = {
					"掘地附肢", -- [1]
					"奥格瑞玛的惊魂幻象", -- [2]
				},
				[137969] = {
					"葬礼构造体", -- [1]
					"诸王之眠", -- [2]
				},
				[120651] = {
					"爆炸物", -- [1]
					"地渊孢林", -- [2]
				},
				[131436] = {
					"鲜血主母选民", -- [1]
					"地渊孢林", -- [2]
				},
				[161813] = {
					"克熙尔刺客", -- [1]
					"心之秘室", -- [2]
				},
				[133935] = {
					"活化守卫", -- [1]
					"诸王之眠", -- [2]
				},
				[131318] = {
					"长者莉娅克萨", -- [1]
					"地渊孢林", -- [2]
				},
				[133836] = {
					"复活的护卫", -- [1]
					"地渊孢林", -- [2]
				},
				[153526] = {
					"亚基群居者", -- [1]
					"奥格瑞玛的惊魂幻象", -- [2]
				},
				[147948] = {
					"凝结的艾泽里特", -- [1]
					"Whispering Reef (Islands 10)", -- [2]
				},
				[157607] = {
					"无面召影者", -- [1]
					"奥格瑞玛的惊魂幻象", -- [2]
				},
				[137713] = {
					"值钱的螃蟹", -- [1]
					"暴富矿区！！", -- [2]
				},
				[157604] = {
					"蠕行腐蚀", -- [1]
					"奥格瑞玛的惊魂幻象", -- [2]
				},
				[140792] = {
					"断喙拾骨者", -- [1]
					"Whispering Reef (Islands 10)", -- [2]
				},
				[156268] = {
					"未知目标", -- [1]
					"心之秘室", -- [2]
				},
				[122266] = {
					"脊壳龟", -- [1]
					"Whispering Reef (Islands 10)", -- [2]
				},
				[151742] = {
					"折虚入侵者", -- [1]
					"Eastern Kingdoms - Vermillion Redoubt - HoA Scenario", -- [2]
				},
				[136984] = {
					"莱班", -- [1]
					"诸王之眠", -- [2]
				},
				[135231] = {
					"幽魂蛮兵", -- [1]
					"诸王之眠", -- [2]
				},
				[161273] = {
					"深渊之嗣", -- [1]
					"心之秘室", -- [2]
				},
				[161815] = {
					"克熙尔唤虚者", -- [1]
					"心之秘室", -- [2]
				},
				[153942] = {
					"歼灭者拉克哈尔", -- [1]
					"奥格瑞玛的惊魂幻象", -- [2]
				},
				[152699] = {
					"虚缚狂战士", -- [1]
					"奥格瑞玛的惊魂幻象", -- [2]
				},
				[137591] = {
					"未知目标", -- [1]
					"诸王之眠", -- [2]
				},
				[157608] = {
					"无面碎心者", -- [1]
					"奥格瑞玛的惊魂幻象", -- [2]
				},
				[153527] = {
					"亚基虫群领袖", -- [1]
					"奥格瑞玛的惊魂幻象", -- [2]
				},
				[137474] = {
					"提玛吉大王", -- [1]
					"诸王之眠", -- [2]
				},
				[156143] = {
					"虚狂巨兽", -- [1]
					"奥格瑞玛的惊魂幻象", -- [2]
				},
				[153401] = {
					"克熙尔支配者", -- [1]
					"奥格瑞玛的惊魂幻象", -- [2]
				},
				[153943] = {
					"屠戮者西克沃斯", -- [1]
					"奥格瑞玛的惊魂幻象", -- [2]
				},
				[158565] = {
					"纳罗斯", -- [1]
					"奥格瑞玛的惊魂幻象", -- [2]
				},
				[152987] = {
					"无面碎心者", -- [1]
					"奥格瑞玛的惊魂幻象", -- [2]
				},
				[135169] = {
					"灵魂汲取图腾", -- [1]
					"地渊孢林", -- [2]
				},
				[156161] = {
					"审判官格恩肖尔", -- [1]
					"奥格瑞玛的惊魂幻象", -- [2]
				},
				[156653] = {
					"凝结恐惧", -- [1]
					"奥格瑞玛的惊魂幻象", -- [2]
				},
				[134994] = {
					"幽魂猎头者", -- [1]
					"诸王之眠", -- [2]
				},
				[155952] = {
					"萨弗", -- [1]
					"奥格瑞玛的惊魂幻象", -- [2]
				},
				[152669] = {
					"虚空液球", -- [1]
					"奥格瑞玛的惊魂幻象", -- [2]
				},
				[134739] = {
					"净化构造体", -- [1]
					"诸王之眠", -- [2]
				},
				[152988] = {
					"无面召影者", -- [1]
					"奥格瑞玛的惊魂幻象", -- [2]
				},
				[157610] = {
					"克熙尔支配者", -- [1]
					"奥格瑞玛的惊魂幻象", -- [2]
				},
				[135470] = {
					"征服者阿卡阿里", -- [1]
					"诸王之眠", -- [2]
				},
				[161244] = {
					"腐蚀者之血", -- [1]
					"地渊孢林", -- [2]
				},
				[153244] = {
					"湮灭元素", -- [1]
					"奥格瑞玛的惊魂幻象", -- [2]
				},
				[155953] = {
					"克苏法", -- [1]
					"奥格瑞玛的惊魂幻象", -- [2]
				},
				[137625] = {
					"未知目标", -- [1]
					"围攻伯拉勒斯", -- [2]
				},
				[158567] = {
					"被折磨的库卡隆横扫者", -- [1]
					"奥格瑞玛的惊魂幻象", -- [2]
				},
				[152479] = {
					"折虚雏龙", -- [1]
					"Eastern Kingdoms - Vermillion Redoubt - HoA Scenario", -- [2]
				},
				[153531] = {
					"亚基碾骨虫", -- [1]
					"奥格瑞玛的惊魂幻象", -- [2]
				},
				[155951] = {
					"拉弗", -- [1]
					"奥格瑞玛的惊魂幻象", -- [2]
				},
				[156145] = {
					"掘地附肢", -- [1]
					"奥格瑞玛的惊魂幻象", -- [2]
				},
				[132755] = {
					"断喙食腐鸟", -- [1]
					"Whispering Reef (Islands 10)", -- [2]
				},
				[134157] = {
					"影裔战士", -- [1]
					"诸王之眠", -- [2]
				},
				[137626] = {
					"攻城恐魔", -- [1]
					"围攻伯拉勒斯", -- [2]
				},
				[153022] = {
					"斯诺恩", -- [1]
					"奥格瑞玛的惊魂幻象", -- [2]
				},
				[136160] = {
					"达萨大王", -- [1]
					"诸王之眠", -- [2]
				},
				[161437] = {
					"爆炸甲虫", -- [1]
					"地渊孢林", -- [2]
				},
				[135204] = {
					"鬼灵妖术祭司", -- [1]
					"诸王之眠", -- [2]
				},
				[156146] = {
					"虚缚持盾卫士", -- [1]
					"奥格瑞玛的惊魂幻象", -- [2]
				},
				[151872] = {
					"恐惧之握", -- [1]
					"Emerald Dream - HoA Scenario", -- [2]
				},
				[137487] = {
					"骸骨狩猎迅猛龙", -- [1]
					"诸王之眠", -- [2]
				},
				[152162] = {
					"折虚击天战士", -- [1]
					"Eastern Kingdoms - Vermillion Redoubt - HoA Scenario", -- [2]
				},
				[152704] = {
					"蠕行腐蚀", -- [1]
					"奥格瑞玛的惊魂幻象", -- [2]
				},
				[135235] = {
					"幽魂兽王", -- [1]
					"诸王之眠", -- [2]
				},
				[135931] = {
					"灰岩", -- [1]
					"Whispering Reef (Islands 10)", -- [2]
				},
				[161140] = {
					"布温巴", -- [1]
					"奥格瑞玛的惊魂幻象", -- [2]
				},
				[161502] = {
					"贪婪的血肉魔", -- [1]
					"地渊孢林", -- [2]
				},
				[153119] = {
					"小型虚空元素", -- [1]
					"奥格瑞玛的惊魂幻象", -- [2]
				},
				[157825] = {
					"疯狂的折磨者", -- [1]
					"奥格瑞玛的惊魂幻象", -- [2]
				},
				[157603] = {
					"虚空液球", -- [1]
					"奥格瑞玛的惊魂幻象", -- [2]
				},
				[133835] = {
					"狂野的群居血虱", -- [1]
					"地渊孢林", -- [2]
				},
				[157609] = {
					"克熙尔剜心者", -- [1]
					"奥格瑞玛的惊魂幻象", -- [2]
				},
				[138489] = {
					"祖尔之影", -- [1]
					"诸王之眠", -- [2]
				},
				[135167] = {
					"幽魂狂战士", -- [1]
					"诸王之眠", -- [2]
				},
				[161241] = {
					"纺虚者玛熙尔", -- [1]
					"地渊孢林", -- [2]
				},
				[138061] = {
					"风险投资公司装卸工", -- [1]
					"暴富矿区！！", -- [2]
				},
				[133007] = {
					"不羁畸变怪", -- [1]
					"地渊孢林", -- [2]
				},
				[137716] = {
					"食泥蟹", -- [1]
					"暴富矿区！！", -- [2]
				},
				[132051] = {
					"未知目标", -- [1]
					"地渊孢林", -- [2]
				},
				[161408] = {
					"恶毒增生", -- [1]
					"地渊孢林", -- [2]
				},
				[124581] = {
					"脊壳钳嘴龟", -- [1]
					"Whispering Reef (Islands 10)", -- [2]
				},
				[151836] = {
					"虚空恐魔", -- [1]
					"Emerald Dream - HoA Scenario", -- [2]
				},
				[135239] = {
					"幽魂巫医", -- [1]
					"诸王之眠", -- [2]
				},
				[134251] = {
					"总管姆巴拉", -- [1]
					"诸王之眠", -- [2]
				},
				[138493] = {
					"未知目标", -- [1]
					"诸王之眠", -- [2]
				},
				[132530] = {
					"库尔提拉斯先锋", -- [1]
					"围攻伯拉勒斯", -- [2]
				},
				[131383] = {
					"孢子召唤师赞查", -- [1]
					"地渊孢林", -- [2]
				},
			},
			["spell_animation_list"] = {
				["5374"] = {
					["1"] = {
						["scaleY"] = 1,
						["fade_out"] = 0.02,
						["duration"] = 0.12,
						["absolute_sineY"] = false,
						["animation_type"] = "frameshake",
						["scaleX"] = 0.1,
						["absolute_sineX"] = false,
						["amplitude"] = 1,
						["fade_in"] = 0.01,
						["enabled"] = true,
						["cooldown"] = 0.5,
						["frequency"] = 25,
					},
					["info"] = {
						["spellid"] = 5374,
						["class"] = "ROGUE",
						["time"] = 0,
						["desc"] = "",
					},
				},
				["31935"] = {
					["1"] = {
						["scale_upY"] = 1.03,
						["scale_upX"] = 1.03,
						["enabled"] = true,
						["cooldown"] = 0.75,
						["scale_downY"] = 0.97,
						["duration"] = 0.05,
						["scale_downX"] = 0.97,
						["animation_type"] = "scale",
					},
					["info"] = {
						["spellid"] = 31935,
						["class"] = "PALADIN",
						["time"] = 0,
						["desc"] = "",
					},
					["2"] = {
						["scaleY"] = 1,
						["fade_out"] = 0.09,
						["duration"] = 0.1,
						["absolute_sineX"] = true,
						["absolute_sineY"] = false,
						["animation_type"] = "frameshake",
						["scaleX"] = 1,
						["critical_scale"] = 1.05,
						["amplitude"] = 6,
						["fade_in"] = 0.01,
						["enabled"] = true,
						["cooldown"] = 0.5,
						["frequency"] = 1,
					},
				},
				["31661"] = {
					["1"] = {
						["scaleY"] = 1,
						["fade_out"] = 0.01,
						["duration"] = 0.1,
						["absolute_sineY"] = false,
						["animation_type"] = "frameshake",
						["scaleX"] = 0.2,
						["absolute_sineX"] = false,
						["amplitude"] = 0.75,
						["fade_in"] = 0.01,
						["enabled"] = true,
						["cooldown"] = 0,
						["frequency"] = 200,
					},
					["info"] = {
						["spellid"] = 31661,
						["class"] = "MAGE",
						["time"] = 0,
						["desc"] = "",
					},
				},
				["199552"] = {
					["1"] = {
						["scaleY"] = 0.79999923706055,
						["fade_out"] = 0.099999994039536,
						["duration"] = 0.099999994039536,
						["absolute_sineX"] = true,
						["absolute_sineY"] = false,
						["animation_type"] = "frameshake",
						["scaleX"] = 0.20000076293945,
						["amplitude"] = 2.5,
						["critical_scale"] = 1.05,
						["fade_in"] = 0,
						["enabled"] = true,
						["cooldown"] = 0.5,
						["frequency"] = 1,
					},
					["info"] = {
						["spellid"] = 199552,
						["class"] = "DEMONHUNTER",
						["time"] = 1539717392,
						["desc"] = "",
					},
					["2"] = {
						["enabled"] = true,
						["scale_upX"] = 1.0299999713898,
						["scale_upY"] = 1.0299999713898,
						["cooldown"] = 0.75,
						["scale_downY"] = 0.96999996900559,
						["duration"] = 0.05,
						["scale_downX"] = 0.96999996900559,
						["animation_type"] = "scale",
					},
				},
				["222024"] = {
					["1"] = {
						["scale_upY"] = 1.1,
						["scale_upX"] = 1.1,
						["enabled"] = true,
						["cooldown"] = 0.75,
						["scale_downY"] = 0.9,
						["duration"] = 0.035,
						["scale_downX"] = 0.9,
						["animation_type"] = "scale",
					},
					["info"] = {
						["spellid"] = 222024,
						["class"] = "DEATHKNIGHT",
						["time"] = 0,
						["desc"] = "",
					},
					["2"] = {
						["scaleY"] = -1,
						["fade_out"] = 0.02,
						["duration"] = 0.075,
						["absolute_sineX"] = true,
						["absolute_sineY"] = true,
						["animation_type"] = "frameshake",
						["scaleX"] = 1,
						["critical_scale"] = 2,
						["amplitude"] = 1.8,
						["fade_in"] = 0.01,
						["enabled"] = true,
						["cooldown"] = 0.5,
						["frequency"] = 50,
					},
				},
				["2098"] = {
					["1"] = {
						["scale_upY"] = 1.1999999284744,
						["scale_upX"] = 1.1000000238419,
						["enabled"] = true,
						["cooldown"] = 0.75,
						["scale_downY"] = 0.89999997615814,
						["duration"] = 0.04,
						["scale_downX"] = 0.89999997615814,
						["animation_type"] = "scale",
					},
					["info"] = {
						["spellid"] = 2098,
						["class"] = "ROGUE",
						["time"] = 1539293610,
						["desc"] = "",
					},
					["2"] = {
						["scaleY"] = 1,
						["fade_out"] = 0.079999998211861,
						["duration"] = 0.21999999880791,
						["absolute_sineY"] = true,
						["animation_type"] = "frameshake",
						["scaleX"] = 1,
						["absolute_sineX"] = false,
						["amplitude"] = 1.5,
						["fade_in"] = 0,
						["enabled"] = true,
						["cooldown"] = 0.5,
						["frequency"] = 2.710000038147,
					},
				},
				["228600"] = {
					["1"] = {
						["scaleY"] = 1,
						["fade_out"] = 0.09,
						["duration"] = 0.1,
						["absolute_sineX"] = false,
						["absolute_sineY"] = true,
						["animation_type"] = "frameshake",
						["scaleX"] = 0.1,
						["critical_scale"] = 1.2,
						["amplitude"] = 10,
						["fade_in"] = 0.01,
						["enabled"] = true,
						["cooldown"] = 0.5,
						["frequency"] = 1,
					},
					["info"] = {
						["spellid"] = 228600,
						["class"] = "MAGE",
						["time"] = 0,
						["desc"] = "",
					},
				},
				["203782"] = {
					["1"] = {
						["scaleY"] = -1,
						["fade_out"] = 0.089999996125698,
						["duration"] = 0.099999994039536,
						["absolute_sineX"] = true,
						["absolute_sineY"] = false,
						["animation_type"] = "frameshake",
						["scaleX"] = 0,
						["amplitude"] = 1.5,
						["critical_scale"] = 1.05,
						["fade_in"] = 0.0099999997764826,
						["enabled"] = true,
						["cooldown"] = 0.5,
						["frequency"] = 1,
					},
					["info"] = {
						["spellid"] = 203782,
						["class"] = "DEMONHUNTER",
						["time"] = 1539716639,
						["desc"] = "",
					},
				},
				["107270"] = {
					["1"] = {
						["scaleY"] = 1,
						["fade_out"] = 0.089999996125698,
						["duration"] = 0.1499999910593,
						["absolute_sineX"] = false,
						["absolute_sineY"] = false,
						["animation_type"] = "frameshake",
						["scaleX"] = 0.099998474121094,
						["critical_scale"] = 1.05,
						["amplitude"] = 0.1499999910593,
						["fade_in"] = 0.0099999997764826,
						["enabled"] = true,
						["cooldown"] = 0.5,
						["frequency"] = 200,
					},
					["info"] = {
						["spellid"] = 107270,
						["class"] = "MONK",
						["time"] = 1539296490,
						["desc"] = "",
					},
				},
				["162243"] = {
					["1"] = {
						["scaleY"] = 1,
						["fade_out"] = 0.089999996125698,
						["duration"] = 0.099999994039535,
						["absolute_sineX"] = false,
						["absolute_sineY"] = true,
						["animation_type"] = "frameshake",
						["scaleX"] = 0.099998474121094,
						["amplitude"] = 1,
						["critical_scale"] = 1.05,
						["fade_in"] = 0.0099999997764826,
						["enabled"] = true,
						["cooldown"] = 0.5,
						["frequency"] = 1,
					},
					["info"] = {
						["spellid"] = 162243,
						["class"] = "DEMONHUNTER",
						["time"] = 1539717356,
						["desc"] = "",
					},
				},
				["117418"] = {
					["1"] = {
						["scaleY"] = 1,
						["fade_out"] = 0.1499999910593,
						["absolute_sineX"] = false,
						["duration"] = 0.1799999922514,
						["absolute_sineY"] = false,
						["animation_type"] = "frameshake",
						["scaleX"] = 0.099998474121094,
						["critical_scale"] = 1.05,
						["amplitude"] = 0.1499999910593,
						["fade_in"] = 0.0099999997764826,
						["enabled"] = true,
						["cooldown"] = 0.5,
						["frequency"] = 116.00999450684,
					},
					["info"] = {
						["spellid"] = 117418,
						["class"] = "MONK",
						["time"] = 1539296387,
						["desc"] = "",
					},
				},
				[189112] = {
					{
						["fade_out"] = 0.3499999940395355,
						["duration"] = 0.4000000059604645,
						["amplitude"] = 1.879999995231628,
						["frequency"] = 51.97999954223633,
					}, -- [1]
				},
				["204157"] = {
					["1"] = {
						["scaleY"] = 1,
						["fade_out"] = 0.089999996125698,
						["duration"] = 0.1,
						["absolute_sineX"] = false,
						["absolute_sineY"] = true,
						["animation_type"] = "frameshake",
						["scaleX"] = 1,
						["amplitude"] = 6,
						["critical_scale"] = 1.05,
						["fade_in"] = 0.0099999997764826,
						["enabled"] = true,
						["cooldown"] = 0.5,
						["frequency"] = 1,
					},
					["info"] = {
						["spellid"] = 204157,
						["class"] = "DEMONHUNTER",
						["time"] = 1539716637,
						["desc"] = "",
					},
					["2"] = {
						["scale_upY"] = 1.03,
						["scale_upX"] = 1.03,
						["animation_type"] = "scale",
						["cooldown"] = 0.75,
						["scale_downY"] = 0.97,
						["duration"] = 0.05,
						["scale_downX"] = 0.97,
						["enabled"] = true,
					},
				},
				["222026"] = {
					["1"] = {
						["scale_upY"] = 1.1,
						["scale_upX"] = 1.1,
						["enabled"] = true,
						["cooldown"] = 0.75,
						["scale_downY"] = 0.9,
						["duration"] = 0.04,
						["scale_downX"] = 0.9,
						["animation_type"] = "scale",
					},
					["info"] = {
						["spellid"] = 222026,
						["class"] = "DEATHKNIGHT",
						["time"] = 0,
						["desc"] = "",
					},
					["2"] = {
						["scaleY"] = -1,
						["fade_out"] = 0.18,
						["duration"] = 0.08,
						["absolute_sineY"] = true,
						["animation_type"] = "frameshake",
						["scaleX"] = 1,
						["absolute_sineX"] = false,
						["amplitude"] = 10,
						["fade_in"] = 0.01,
						["enabled"] = true,
						["cooldown"] = 0.5,
						["frequency"] = 3.1,
					},
				},
				["264178"] = {
					["1"] = {
						["scaleY"] = 1,
						["fade_out"] = 0.08,
						["duration"] = 0.15,
						["absolute_sineY"] = false,
						["animation_type"] = "frameshake",
						["scaleX"] = 0.2,
						["absolute_sineX"] = false,
						["amplitude"] = 3,
						["fade_in"] = 0.01,
						["enabled"] = true,
						["cooldown"] = 0.25,
						["frequency"] = 25,
					},
					["info"] = {
						["spellid"] = 264178,
						["class"] = "WARLOCK",
						["time"] = 0,
						["desc"] = "",
					},
				},
				["185099"] = {
					["1"] = {
						["scaleY"] = 0.84999847412109,
						["fade_out"] = 0.18999999761581,
						["duration"] = 0.19999998807907,
						["absolute_sineX"] = false,
						["absolute_sineY"] = true,
						["animation_type"] = "frameshake",
						["scaleX"] = 0,
						["critical_scale"] = 1.05,
						["amplitude"] = 3,
						["fade_in"] = 0,
						["enabled"] = true,
						["cooldown"] = 0.5,
						["frequency"] = 1,
					},
					["info"] = {
						["spellid"] = 185099,
						["class"] = "MONK",
						["time"] = 1539712435,
						["desc"] = "",
					},
				},
				["55090"] = {
					["1"] = {
						["scaleY"] = 1,
						["fade_out"] = 0.18,
						["duration"] = 0.08,
						["absolute_sineY"] = true,
						["animation_type"] = "frameshake",
						["scaleX"] = 1,
						["absolute_sineX"] = false,
						["amplitude"] = 10,
						["fade_in"] = 0.01,
						["enabled"] = true,
						["cooldown"] = 0.5,
						["frequency"] = 4.1,
					},
					["info"] = {
						["spellid"] = 55090,
						["class"] = "DEATHKNIGHT",
						["time"] = 0,
						["desc"] = "",
					},
				},
				["46968"] = {
					["1"] = {
						["scaleY"] = 1,
						["fade_out"] = 0.01,
						["duration"] = 0.1,
						["absolute_sineY"] = false,
						["animation_type"] = "frameshake",
						["scaleX"] = 0.1,
						["absolute_sineX"] = false,
						["amplitude"] = 0.95,
						["fade_in"] = 0.01,
						["enabled"] = true,
						["cooldown"] = 0.1,
						["frequency"] = 120,
					},
					["info"] = {
						["spellid"] = 46968,
						["class"] = "WARRIOR",
						["time"] = 0,
						["desc"] = "",
					},
				},
				["148135"] = {
					["1"] = {
						["scaleY"] = 1,
						["fade_out"] = 0.09,
						["duration"] = 0.099999994039536,
						["absolute_sineX"] = false,
						["absolute_sineY"] = false,
						["animation_type"] = "frameshake",
						["scaleX"] = 1,
						["critical_scale"] = 1.05,
						["amplitude"] = 1.75,
						["fade_in"] = 0.01,
						["enabled"] = true,
						["cooldown"] = 0.5,
						["frequency"] = 60.874122619629,
					},
					["info"] = {
						["spellid"] = 148135,
						["class"] = "MONK",
						["time"] = 1539295958,
						["desc"] = "",
					},
				},
				["189112"] = {
					["1"] = {
						["scaleY"] = 1,
						["fade_out"] = 0.34999999403954,
						["duration"] = 0.40000000596046,
						["absolute_sineX"] = true,
						["absolute_sineY"] = true,
						["animation_type"] = "frameshake",
						["scaleX"] = 0,
						["critical_scale"] = 1.05,
						["amplitude"] = 1.8799999952316,
						["fade_in"] = 0,
						["enabled"] = true,
						["cooldown"] = 0.5,
						["frequency"] = 51.979999542236,
					},
					["info"] = {
						["spellid"] = 189112,
						["class"] = "DEMONHUNTER",
						["time"] = 1539715467,
						["desc"] = "",
					},
				},
				["85948"] = {
					["1"] = {
						["scaleY"] = 1,
						["fade_out"] = 0.02,
						["duration"] = 0.12,
						["absolute_sineY"] = false,
						["animation_type"] = "frameshake",
						["scaleX"] = 0.1,
						["absolute_sineX"] = false,
						["amplitude"] = 1,
						["fade_in"] = 0.01,
						["enabled"] = true,
						["cooldown"] = 0.5,
						["frequency"] = 25,
					},
					["info"] = {
						["spellid"] = 85948,
						["class"] = "DEATHKNIGHT",
						["time"] = 0,
						["desc"] = "",
					},
				},
				["35395"] = {
					["1"] = {
						["scaleY"] = 1,
						["fade_out"] = 0.02,
						["duration"] = 0.12,
						["absolute_sineY"] = false,
						["animation_type"] = "frameshake",
						["scaleX"] = 0.1,
						["absolute_sineX"] = false,
						["amplitude"] = 1,
						["fade_in"] = 0.01,
						["enabled"] = true,
						["cooldown"] = 0.5,
						["frequency"] = 25,
					},
					["info"] = {
						["spellid"] = 35395,
						["class"] = "PALADIN",
						["time"] = 0,
						["desc"] = "",
					},
				},
				["280720"] = {
					["1"] = {
						["scaleY"] = 1,
						["fade_out"] = 0.089999996125698,
						["duration"] = 0.19999998807907,
						["absolute_sineX"] = false,
						["absolute_sineY"] = false,
						["animation_type"] = "frameshake",
						["scaleX"] = 0.1,
						["critical_scale"] = 1.05,
						["amplitude"] = 0.89999997615814,
						["fade_in"] = 0.0099999997764826,
						["enabled"] = true,
						["cooldown"] = 0.5,
						["frequency"] = 200,
					},
					["info"] = {
						["spellid"] = 280720,
						["class"] = "ROGUE",
						["time"] = 1539292087,
						["desc"] = "",
					},
				},
				["49998"] = {
					["1"] = {
						["scaleY"] = 1,
						["fade_out"] = 0.02,
						["duration"] = 0.13,
						["absolute_sineY"] = false,
						["animation_type"] = "frameshake",
						["scaleX"] = 0.1,
						["absolute_sineX"] = false,
						["amplitude"] = 1.8,
						["fade_in"] = 0.01,
						["enabled"] = true,
						["cooldown"] = 0.5,
						["frequency"] = 25,
					},
					["info"] = {
						["spellid"] = 49998,
						["class"] = "DEATHKNIGHT",
						["time"] = 0,
						["desc"] = "",
					},
				},
				["155166"] = {
					["1"] = {
						["scaleY"] = 0.6,
						["fade_out"] = 0.01,
						["duration"] = 0.2,
						["absolute_sineY"] = false,
						["animation_type"] = "frameshake",
						["scaleX"] = 0.2,
						["absolute_sineX"] = false,
						["amplitude"] = 0.45,
						["fade_in"] = 0.01,
						["enabled"] = true,
						["cooldown"] = 0,
						["frequency"] = 200,
					},
					["info"] = {
						["spellid"] = 155166,
						["class"] = "DEATHKNIGHT",
						["time"] = 0,
						["desc"] = "",
					},
				},
				["228354"] = {
					["1"] = {
						["scaleY"] = 1,
						["fade_out"] = 0.02,
						["duration"] = 0.12,
						["absolute_sineY"] = false,
						["animation_type"] = "frameshake",
						["scaleX"] = 0.1,
						["absolute_sineX"] = false,
						["amplitude"] = 1,
						["fade_in"] = 0.01,
						["enabled"] = true,
						["cooldown"] = 0.5,
						["frequency"] = 25,
					},
					["info"] = {
						["spellid"] = 228354,
						["class"] = "MAGE",
						["time"] = 0,
						["desc"] = "",
					},
				},
				["27285"] = {
					["1"] = {
						["scale_upY"] = 1.1,
						["scale_upX"] = 1.1,
						["enabled"] = true,
						["cooldown"] = 0.75,
						["scale_downY"] = 0.9,
						["duration"] = 0.075,
						["scale_downX"] = 0.9,
						["animation_type"] = "scale",
					},
					["info"] = {
						["spellid"] = 27285,
						["class"] = "WARLOCK",
						["time"] = 0,
						["desc"] = "",
					},
				},
				["20243"] = {
					["1"] = {
						["scaleY"] = 1,
						["fade_out"] = 0.02,
						["duration"] = 0.12,
						["absolute_sineY"] = false,
						["animation_type"] = "frameshake",
						["scaleX"] = 0.1,
						["absolute_sineX"] = false,
						["amplitude"] = 1,
						["fade_in"] = 0.01,
						["enabled"] = true,
						["cooldown"] = 0.5,
						["frequency"] = 25,
					},
					["info"] = {
						["spellid"] = 20243,
						["class"] = "WARRIOR",
						["time"] = 0,
						["desc"] = "",
					},
				},
				["30451"] = {
					["1"] = {
						["scaleY"] = 1,
						["fade_out"] = 0.02,
						["duration"] = 0.12,
						["absolute_sineY"] = false,
						["animation_type"] = "frameshake",
						["scaleX"] = 0.1,
						["absolute_sineX"] = false,
						["amplitude"] = 1,
						["fade_in"] = 0.01,
						["enabled"] = true,
						["cooldown"] = 0.5,
						["frequency"] = 25,
					},
					["info"] = {
						["spellid"] = 30451,
						["class"] = "MAGE",
						["time"] = 0,
						["desc"] = "",
					},
				},
				["228598"] = {
					["1"] = {
						["scaleY"] = 1,
						["fade_out"] = 0.02,
						["duration"] = 0.12,
						["absolute_sineY"] = false,
						["animation_type"] = "frameshake",
						["scaleX"] = 0.1,
						["absolute_sineX"] = false,
						["amplitude"] = 2,
						["fade_in"] = 0.01,
						["enabled"] = true,
						["cooldown"] = 0.5,
						["frequency"] = 25,
					},
					["info"] = {
						["spellid"] = 228598,
						["class"] = "MAGE",
						["time"] = 0,
						["desc"] = "",
					},
				},
				["108853"] = {
					["1"] = {
						["scaleY"] = 1,
						["fade_out"] = 0.02,
						["duration"] = 0.12,
						["absolute_sineY"] = false,
						["animation_type"] = "frameshake",
						["scaleX"] = 0.1,
						["absolute_sineX"] = false,
						["amplitude"] = 1,
						["fade_in"] = 0.01,
						["enabled"] = true,
						["cooldown"] = 0.5,
						["frequency"] = 25,
					},
					["info"] = {
						["spellid"] = 108853,
						["class"] = "MAGE",
						["time"] = 0,
						["desc"] = "",
					},
				},
				["205523"] = {
					["1"] = {
						["scaleY"] = 1,
						["fade_out"] = 0.09,
						["duration"] = 0.099999994039536,
						["absolute_sineX"] = false,
						["absolute_sineY"] = false,
						["animation_type"] = "frameshake",
						["scaleX"] = 0.099998474121094,
						["critical_scale"] = 1.05,
						["amplitude"] = 3,
						["fade_in"] = 0.01,
						["enabled"] = true,
						["cooldown"] = 0.5,
						["frequency"] = 1,
					},
					["info"] = {
						["spellid"] = 205523,
						["class"] = "MONK",
						["time"] = 1539295885,
						["desc"] = "",
					},
				},
				["245388"] = {
					["1"] = {
						["scale_upY"] = 1.1,
						["scale_upX"] = 1.1,
						["enabled"] = true,
						["cooldown"] = 0.75,
						["scale_downY"] = 0.9,
						["duration"] = 0.03,
						["scale_downX"] = 0.9,
						["animation_type"] = "scale",
					},
					["info"] = {
						["spellid"] = 245388,
						["class"] = "ROGUE",
						["time"] = 0,
						["desc"] = "",
					},
					["2"] = {
						["scaleY"] = 1,
						["fade_out"] = 0.01,
						["duration"] = 0.06,
						["absolute_sineY"] = false,
						["animation_type"] = "frameshake",
						["scaleX"] = 1,
						["absolute_sineX"] = false,
						["amplitude"] = 5,
						["fade_in"] = 0.01,
						["enabled"] = true,
						["cooldown"] = 0.5,
						["frequency"] = 2,
					},
				},
				["6343"] = {
					["1"] = {
						["scaleY"] = 1,
						["fade_out"] = 0.01,
						["duration"] = 0.12,
						["absolute_sineY"] = false,
						["animation_type"] = "frameshake",
						["scaleX"] = 0.2,
						["absolute_sineX"] = false,
						["amplitude"] = 0.95,
						["fade_in"] = 0.01,
						["enabled"] = true,
						["cooldown"] = 0.1,
						["frequency"] = 200,
					},
					["info"] = {
						["spellid"] = 6343,
						["class"] = "WARRIOR",
						["time"] = 0,
						["desc"] = "",
					},
				},
				["199547"] = {
					["1"] = {
						["scaleY"] = 1,
						["fade_out"] = 0.089999996125698,
						["duration"] = 0.1,
						["absolute_sineX"] = false,
						["absolute_sineY"] = true,
						["animation_type"] = "frameshake",
						["scaleX"] = 0.59999847412109,
						["critical_scale"] = 1.05,
						["amplitude"] = 3,
						["fade_in"] = 0.0099999997764826,
						["enabled"] = true,
						["cooldown"] = 0.5,
						["frequency"] = 1,
					},
					["info"] = {
						["spellid"] = 199547,
						["class"] = "DEMONHUNTER",
						["time"] = 1539717795,
						["desc"] = "",
					},
					["2"] = {
						["enabled"] = true,
						["scale_upX"] = 1.039999961853,
						["scale_upY"] = 1.039999961853,
						["cooldown"] = 0.75,
						["scale_downY"] = 0.96999996900558,
						["duration"] = 0.05,
						["scale_downX"] = 0.96999996900558,
						["animation_type"] = "scale",
					},
				},
				["206930"] = {
					["1"] = {
						["scale_upY"] = 1.1,
						["scale_upX"] = 1.1,
						["enabled"] = true,
						["cooldown"] = 0.75,
						["scale_downY"] = 0.9,
						["duration"] = 0.035,
						["scale_downX"] = 0.9,
						["animation_type"] = "scale",
					},
					["info"] = {
						["spellid"] = 206930,
						["class"] = "DEATHKNIGHT",
						["time"] = 0,
						["desc"] = "",
					},
					["2"] = {
						["scaleY"] = 1,
						["fade_out"] = 0.02,
						["duration"] = 0.075,
						["absolute_sineX"] = true,
						["absolute_sineY"] = true,
						["animation_type"] = "frameshake",
						["scaleX"] = -1,
						["critical_scale"] = 2,
						["amplitude"] = 1.8,
						["fade_in"] = 0.01,
						["enabled"] = true,
						["cooldown"] = 0.5,
						["frequency"] = 50,
					},
				},
				["86040"] = {
					["1"] = {
						["scaleY"] = 1,
						["fade_out"] = 0.1,
						["duration"] = 0.15,
						["absolute_sineY"] = false,
						["animation_type"] = "frameshake",
						["scaleX"] = 0.1,
						["absolute_sineX"] = false,
						["amplitude"] = 2,
						["fade_in"] = 0.05,
						["enabled"] = true,
						["cooldown"] = 0.25,
						["frequency"] = 20,
					},
					["info"] = {
						["spellid"] = 86040,
						["class"] = "WARLOCK",
						["time"] = 0,
						["desc"] = "",
					},
				},
				["198030"] = {
					["1"] = {
						["scaleY"] = 1,
						["fade_out"] = 0.089999996125698,
						["duration"] = 0.31999999284744,
						["absolute_sineX"] = false,
						["absolute_sineY"] = false,
						["animation_type"] = "frameshake",
						["scaleX"] = 0.099998474121094,
						["amplitude"] = 0.5,
						["critical_scale"] = 1.05,
						["fade_in"] = 0.0099999997764826,
						["enabled"] = true,
						["cooldown"] = 0.5,
						["frequency"] = 200,
					},
					["info"] = {
						["spellid"] = 198030,
						["class"] = "DEMONHUNTER",
						["time"] = 1539717136,
						["desc"] = "",
					},
				},
				["228478"] = {
					["1"] = {
						["scaleY"] = 0.79999923706055,
						["fade_out"] = 0.099999994039536,
						["duration"] = 0.099999994039535,
						["absolute_sineX"] = true,
						["absolute_sineY"] = false,
						["animation_type"] = "frameshake",
						["scaleX"] = 0.20000076293945,
						["amplitude"] = 2.5,
						["critical_scale"] = 1.05,
						["fade_in"] = 0,
						["enabled"] = true,
						["cooldown"] = 0.5,
						["frequency"] = 1,
					},
					["info"] = {
						["spellid"] = 228478,
						["class"] = "DEMONHUNTER",
						["time"] = 1539716636,
						["desc"] = "",
					},
					["2"] = {
						["scale_upY"] = 1.0299999713898,
						["scale_upX"] = 1.0299999713898,
						["animation_type"] = "scale",
						["cooldown"] = 0.75,
						["scale_downY"] = 0.96999996900559,
						["duration"] = 0.05,
						["scale_downX"] = 0.96999996900559,
						["enabled"] = true,
					},
				},
				[199552] = {
					{
						["fade_out"] = 0.09999999403953552,
						["duration"] = 0.09999999403953552,
						["scaleX"] = 0.2000007629394531,
						["scaleY"] = 0.7999992370605469,
					}, -- [1]
				},
				["116858"] = {
					["1"] = {
						["scale_upY"] = 1.075,
						["scale_upX"] = 1.075,
						["enabled"] = true,
						["cooldown"] = 0.75,
						["scale_downY"] = 0.915,
						["duration"] = 0.075,
						["scale_downX"] = 0.915,
						["animation_type"] = "scale",
					},
					["info"] = {
						["spellid"] = 116858,
						["class"] = "WARLOCK",
						["time"] = 0,
						["desc"] = "",
					},
					["2"] = {
						["scaleY"] = 1,
						["fade_out"] = 0.1,
						["duration"] = 0.15,
						["absolute_sineY"] = false,
						["animation_type"] = "frameshake",
						["scaleX"] = 0.1,
						["absolute_sineX"] = false,
						["amplitude"] = 2,
						["fade_in"] = 0.05,
						["enabled"] = true,
						["cooldown"] = 0.25,
						["frequency"] = 60,
					},
				},
				["197834"] = {
					["1"] = {
						["scaleY"] = 1,
						["fade_out"] = 0.02,
						["duration"] = 0.12,
						["absolute_sineY"] = false,
						["animation_type"] = "frameshake",
						["scaleX"] = 0.1,
						["absolute_sineX"] = false,
						["amplitude"] = 1,
						["fade_in"] = 0.01,
						["enabled"] = true,
						["cooldown"] = 0.5,
						["frequency"] = 25,
					},
					["info"] = {
						["spellid"] = 197834,
						["class"] = "ROGUE",
						["time"] = 0,
						["desc"] = "",
					},
				},
				["32645"] = {
					["1"] = {
						["scale_upY"] = 1.1,
						["scale_upX"] = 1.1,
						["enabled"] = true,
						["cooldown"] = 0.75,
						["scale_downY"] = 0.9,
						["duration"] = 0.04,
						["scale_downX"] = 0.9,
						["animation_type"] = "scale",
					},
					["info"] = {
						["spellid"] = 32645,
						["class"] = "ROGUE",
						["time"] = 0,
						["desc"] = "",
					},
					["2"] = {
						["scaleY"] = 1,
						["fade_out"] = 0.18,
						["duration"] = 0.08,
						["absolute_sineY"] = true,
						["animation_type"] = "frameshake",
						["scaleX"] = 1,
						["absolute_sineX"] = false,
						["amplitude"] = 10,
						["fade_in"] = 0.01,
						["enabled"] = true,
						["cooldown"] = 0.5,
						["frequency"] = 4.1,
					},
				},
				["196278"] = {
					["1"] = {
						["scaleY"] = 1,
						["fade_out"] = 0.01,
						["duration"] = 0.05,
						["absolute_sineY"] = false,
						["animation_type"] = "frameshake",
						["scaleX"] = 0.2,
						["absolute_sineX"] = false,
						["amplitude"] = 0.75,
						["fade_in"] = 0.01,
						["enabled"] = true,
						["cooldown"] = 0,
						["frequency"] = 200,
					},
					["info"] = {
						["spellid"] = 196278,
						["class"] = "WARLOCK",
						["time"] = 0,
						["desc"] = "",
					},
				},
				["11366"] = {
					["1"] = {
						["scale_upY"] = 1.15,
						["scale_upX"] = 1.15,
						["enabled"] = true,
						["cooldown"] = 0.75,
						["scale_downY"] = 0.8,
						["duration"] = 0.05,
						["scale_downX"] = 0.8,
						["animation_type"] = "scale",
					},
					["info"] = {
						["spellid"] = 11366,
						["class"] = "MAGE",
						["time"] = 0,
						["desc"] = "",
					},
					["2"] = {
						["scaleY"] = 1,
						["fade_out"] = 0.09,
						["duration"] = 0.1,
						["absolute_sineX"] = false,
						["absolute_sineY"] = true,
						["animation_type"] = "frameshake",
						["scaleX"] = 0.1,
						["critical_scale"] = 1.2,
						["amplitude"] = 10,
						["fade_in"] = 0.01,
						["enabled"] = true,
						["cooldown"] = 0.5,
						["frequency"] = 1,
					},
				},
				["44425"] = {
					["1"] = {
						["scaleY"] = 1,
						["fade_out"] = 0.02,
						["duration"] = 0.12,
						["absolute_sineY"] = false,
						["animation_type"] = "frameshake",
						["scaleX"] = 0.1,
						["absolute_sineX"] = false,
						["amplitude"] = 1,
						["fade_in"] = 0.01,
						["enabled"] = true,
						["cooldown"] = 0.5,
						["frequency"] = 25,
					},
					["info"] = {
						["spellid"] = 44425,
						["class"] = "MAGE",
						["time"] = 0,
						["desc"] = "",
					},
				},
				["196819"] = {
					["1"] = {
						["enabled"] = true,
						["scale_upX"] = 1.1999999284744,
						["animation_type"] = "scale",
						["cooldown"] = 0.75,
						["scale_downY"] = 0.89999997615814,
						["duration"] = 0.04,
						["scale_downX"] = 0.89999997615814,
						["scale_upY"] = 1.2999999523163,
					},
					["info"] = {
						["spellid"] = 196819,
						["class"] = "ROGUE",
						["time"] = 0,
						["desc"] = "",
					},
					["2"] = {
						["scaleY"] = 1,
						["fade_out"] = 0.1799999922514,
						["duration"] = 0.21999999880791,
						["absolute_sineY"] = true,
						["animation_type"] = "frameshake",
						["scaleX"] = 1,
						["absolute_sineX"] = false,
						["amplitude"] = 5,
						["fade_in"] = 0.0099999997764826,
						["enabled"] = true,
						["cooldown"] = 0.5,
						["frequency"] = 3.3099999427795,
					},
				},
				["199804"] = {
					["1"] = {
						["scaleY"] = 0.88999938964844,
						["fade_out"] = 0.09,
						["duration"] = 0.19999998807907,
						["absolute_sineX"] = false,
						["absolute_sineY"] = true,
						["animation_type"] = "frameshake",
						["scaleX"] = 1,
						["critical_scale"] = 1.05,
						["amplitude"] = 1.1699999570847,
						["fade_in"] = 0.0099999997764826,
						["enabled"] = true,
						["cooldown"] = 0.5,
						["frequency"] = 23.525676727295,
					},
					["info"] = {
						["spellid"] = 199804,
						["class"] = "ROGUE",
						["time"] = 1539293872,
						["desc"] = "",
					},
					["2"] = {
						["enabled"] = true,
						["scale_upX"] = 1.0499999523163,
						["scale_upY"] = 1.0499999523163,
						["cooldown"] = 0.75,
						["scale_downY"] = 1,
						["duration"] = 0.050000000745058,
						["scale_downX"] = 1,
						["animation_type"] = "scale",
					},
				},
				["7268"] = {
					["1"] = {
						["scaleY"] = 1,
						["fade_out"] = 0.01,
						["duration"] = 0.1,
						["absolute_sineY"] = false,
						["animation_type"] = "frameshake",
						["scaleX"] = 0.2,
						["absolute_sineX"] = false,
						["amplitude"] = 0.75,
						["fade_in"] = 0.01,
						["enabled"] = true,
						["cooldown"] = 0,
						["frequency"] = 200,
					},
					["info"] = {
						["spellid"] = 7268,
						["class"] = "MAGE",
						["time"] = 0,
						["desc"] = "",
					},
				},
				["184575"] = {
					["1"] = {
						["scale_upY"] = 1.05,
						["scale_upX"] = 1.05,
						["enabled"] = true,
						["cooldown"] = 0.75,
						["scale_downY"] = 0.95,
						["duration"] = 0.05,
						["scale_downX"] = 0.95,
						["animation_type"] = "scale",
					},
					["info"] = {
						["spellid"] = 184575,
						["class"] = "PALADIN",
						["time"] = 0,
						["desc"] = "",
					},
					["2"] = {
						["scaleY"] = 1,
						["fade_out"] = 0.09,
						["duration"] = 0.1,
						["absolute_sineX"] = false,
						["absolute_sineY"] = true,
						["animation_type"] = "frameshake",
						["scaleX"] = 0.1,
						["critical_scale"] = 1.2,
						["amplitude"] = 2,
						["fade_in"] = 0.01,
						["enabled"] = true,
						["cooldown"] = 0.5,
						["frequency"] = 1,
					},
				},
				["100784"] = {
					["1"] = {
						["scaleY"] = 1,
						["fade_out"] = 0.09,
						["duration"] = 0.099999994039536,
						["absolute_sineX"] = false,
						["absolute_sineY"] = false,
						["animation_type"] = "frameshake",
						["scaleX"] = 1,
						["critical_scale"] = 1.05,
						["amplitude"] = 3,
						["fade_in"] = 0.01,
						["enabled"] = true,
						["cooldown"] = 0.5,
						["frequency"] = 1,
					},
					["info"] = {
						["spellid"] = 100784,
						["class"] = "MONK",
						["time"] = 1539296312,
						["desc"] = "",
					},
				},
				["185763"] = {
					["1"] = {
						["scaleY"] = 1,
						["fade_out"] = 0.25999999046326,
						["duration"] = 0.15999999642372,
						["absolute_sineX"] = false,
						["absolute_sineY"] = true,
						["animation_type"] = "frameshake",
						["scaleX"] = 0.099998474121094,
						["critical_scale"] = 1.05,
						["amplitude"] = 3.6583230495453,
						["fade_in"] = 0.0099999997764826,
						["enabled"] = true,
						["cooldown"] = 0.5,
						["frequency"] = 23.525663375854,
					},
					["info"] = {
						["spellid"] = 185763,
						["class"] = "ROGUE",
						["time"] = 1539275610,
						["desc"] = "",
					},
					["2"] = {
						["enabled"] = true,
						["scale_upX"] = 1.0299999713898,
						["animation_type"] = "scale",
						["cooldown"] = 0.75,
						["scale_downY"] = 0.96999996900559,
						["duration"] = 0.05,
						["scale_downX"] = 0.96999996900559,
						["scale_upY"] = 1.0299999713898,
					},
				},
				["100780"] = {
					["1"] = {
						["scaleY"] = 1,
						["fade_out"] = 0.09,
						["duration"] = 0.099999994039536,
						["absolute_sineX"] = false,
						["absolute_sineY"] = false,
						["animation_type"] = "frameshake",
						["scaleX"] = 0.1,
						["critical_scale"] = 1.05,
						["amplitude"] = 1,
						["fade_in"] = 0.01,
						["enabled"] = true,
						["cooldown"] = 0.5,
						["frequency"] = 1,
					},
					["info"] = {
						["spellid"] = 100780,
						["class"] = "MONK",
						["time"] = 1539295910,
						["desc"] = "",
					},
				},
				["52174"] = {
					["1"] = {
						["scale_upY"] = 1.15,
						["scale_upX"] = 1.15,
						["enabled"] = true,
						["cooldown"] = 0.75,
						["scale_downY"] = 0.8,
						["duration"] = 0.075,
						["scale_downX"] = 0.8,
						["animation_type"] = "scale",
					},
					["info"] = {
						["spellid"] = 52174,
						["class"] = "WARRIOR",
						["time"] = 0,
						["desc"] = "",
					},
					["2"] = {
						["scaleY"] = 1,
						["fade_out"] = 0.2,
						["duration"] = 0.3,
						["absolute_sineX"] = false,
						["absolute_sineY"] = false,
						["animation_type"] = "frameshake",
						["scaleX"] = 0.15,
						["critical_scale"] = 1.2,
						["amplitude"] = 6,
						["fade_in"] = 0.01,
						["enabled"] = true,
						["cooldown"] = 0.5,
						["frequency"] = 50,
					},
				},
				[162243] = {
					{
						["fade_out"] = 0.08999999612569809,
						["scaleX"] = 0.09999847412109375,
						["fade_in"] = 0.009999999776482582,
					}, -- [1]
				},
				["275779"] = {
					["1"] = {
						["scaleY"] = -1,
						["fade_out"] = 0.02,
						["duration"] = 0.12,
						["absolute_sineY"] = true,
						["animation_type"] = "frameshake",
						["scaleX"] = 0.1,
						["absolute_sineX"] = false,
						["amplitude"] = 1,
						["fade_in"] = 0.01,
						["enabled"] = true,
						["cooldown"] = 0.5,
						["frequency"] = 25,
					},
					["info"] = {
						["spellid"] = 275779,
						["class"] = "PALADIN",
						["time"] = 0,
						["desc"] = "",
					},
				},
				["53595"] = {
					["1"] = {
						["scale_upY"] = 1.03,
						["scale_upX"] = 1.03,
						["enabled"] = true,
						["cooldown"] = 0.75,
						["scale_downY"] = 0.97,
						["duration"] = 0.05,
						["scale_downX"] = 0.97,
						["animation_type"] = "scale",
					},
					["info"] = {
						["spellid"] = 53595,
						["class"] = "PALADIN",
						["time"] = 0,
						["desc"] = "",
					},
					["2"] = {
						["scaleY"] = 1,
						["fade_out"] = 0.09,
						["duration"] = 0.1,
						["absolute_sineX"] = false,
						["absolute_sineY"] = true,
						["animation_type"] = "frameshake",
						["scaleX"] = 0.1,
						["critical_scale"] = 1.05,
						["amplitude"] = 3,
						["fade_in"] = 0.01,
						["enabled"] = true,
						["cooldown"] = 0.5,
						["frequency"] = 1,
					},
				},
				["185438"] = {
					["1"] = {
						["scaleY"] = -1,
						["fade_out"] = 0.19999998807907,
						["duration"] = 0.099999994039536,
						["absolute_sineX"] = false,
						["absolute_sineY"] = true,
						["animation_type"] = "frameshake",
						["scaleX"] = 0.099998474121094,
						["amplitude"] = 6.460000038147,
						["critical_scale"] = 1.05,
						["fade_in"] = 0,
						["enabled"] = true,
						["cooldown"] = 0.5,
						["frequency"] = 25,
					},
					["info"] = {
						["spellid"] = 185438,
						["class"] = "ROGUE",
						["time"] = 1539204014,
						["desc"] = "",
					},
					["2"] = {
						["enabled"] = true,
						["scale_upX"] = 1.0299999713898,
						["scale_upY"] = 1.0299999713898,
						["cooldown"] = 0.75,
						["scale_downY"] = 0.96999996900559,
						["duration"] = 0.05,
						["scale_downX"] = 0.96999996900559,
						["animation_type"] = "scale",
					},
				},
			},
			["number_region"] = "eastasia",
			["health_selection_overlay_alpha"] = 0.099999994039535,
			["minor_height_scale"] = 0.94999998807907,
			["first_run2"] = true,
			["hook_data"] = {
				{
					["Enabled"] = true,
					["Revision"] = 54,
					["HooksTemp"] = {
						["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --list of npcs and their colors, can be inserted:\n    --name of the unit\n    --name of the unit in lower case\n    --npcID of the unit\n    \n    --color can be added as:\n    --color names: \"red\", \"yellow\"\n    --color hex: \"#FF0000\", \"#FFFF00\"\n    --color table: {1, 0, 0}, {1, 1, 0}    \n    \n    envTable.NpcColors = {\n        \n        --examples, using the unit name in lower case, regular unit name and the unitID:\n        \n        [\"Thunderlord Windreader\"] = \"red\", --using regular mob name and color it as red\n        [\"thunderlord crag-leaper\"] = {1, 1, 0}, --using lower case and coloring it yellow\n        [75790] = \"#00FF00\", --using the ID of the unit and using green as color\n        \n        --insert the new mobs here:\n        \n        \n        \n        \n        \n        \n        \n        \n        \n        \n        \n        \n        \n    } --close custom color bracket\n    \nend\n\n\n\n\n",
						["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    \n    --attempt to get the color from the unit color list\n    local color = envTable.NpcColors [unitFrame.namePlateUnitNameLower] or envTable.NpcColors [unitFrame.namePlateUnitName] or envTable.NpcColors [unitFrame.namePlateNpcId]\n    \n    --if the color exists, set the health bar color\n    if (color) then\n        Plater.SetNameplateColor (unitFrame, color)\n    end\n    \nend\n\n\n\n\n\n\n\n\n\n\n\n",
					},
					["Author"] = "Kastfall-Azralon",
					["Desc"] = "Easy way to change the color of an unit. Open the constructor script and follow the examples.",
					["Hooks"] = {
						["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    \n    --attempt to get the color from the unit color list\n    local color = envTable.NpcColors [unitFrame.namePlateUnitNameLower] or envTable.NpcColors [unitFrame.namePlateUnitName] or envTable.NpcColors [unitFrame.namePlateNpcId]\n    \n    --if the color exists, set the health bar color\n    if (color) then\n        Plater.SetNameplateColor (unitFrame, color)\n    end\n    \nend\n\n\n\n\n\n\n\n\n\n\n\n",
						["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --list of npcs and their colors, can be inserted:\n    --name of the unit\n    --name of the unit in lower case\n    --npcID of the unit\n    \n    --color can be added as:\n    --color names: \"red\", \"yellow\"\n    --color hex: \"#FF0000\", \"#FFFF00\"\n    --color table: {1, 0, 0}, {1, 1, 0}    \n    \n    envTable.NpcColors = {\n        \n        --examples, using the unit name in lower case, regular unit name and the unitID:\n        \n        [\"Thunderlord Windreader\"] = \"red\", --using regular mob name and color it as red\n        [\"thunderlord crag-leaper\"] = {1, 1, 0}, --using lower case and coloring it yellow\n        [75790] = \"#00FF00\", --using the ID of the unit and using green as color\n        \n        --insert the new mobs here:\n        \n        \n        \n        \n        \n        \n        \n        \n        \n        \n        \n        \n        \n    } --close custom color bracket\n    \nend\n\n\n\n\n",
					},
					["Name"] = "Color Automation [Plater]",
					["PlaterCore"] = 1,
					["LastHookEdited"] = "Constructor",
					["Time"] = 1550151943,
					["Icon"] = "Interface\\AddOns\\Plater\\images\\color_bar",
					["LoadConditions"] = {
						["talent"] = {
						},
						["group"] = {
						},
						["class"] = {
						},
						["map_ids"] = {
						},
						["race"] = {
						},
						["pvptalent"] = {
						},
						["role"] = {
						},
						["affix"] = {
						},
						["encounter_ids"] = {
						},
						["spec"] = {
						},
					},
				}, -- [1]
				{
					["Enabled"] = true,
					["Revision"] = 176,
					["HooksTemp"] = {
					},
					["Author"] = "Tecno-Azralon",
					["Desc"] = "Add another border with more customizations. This border can also be manipulated by other scripts.",
					["Hooks"] = {
						["Nameplate Created"] = "function (self, unitId, unitFrame, envTable)\n    \n    --run constructor!\n    \nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
						["Nameplate Added"] = "function (self, unitId, unitFrame, envTable)\n    if (envTable.IsEnabled) then\n        if (unitFrame.IsSelf) then\n            if (envTable.ShowOnPersonalBar) then\n                envTable.BorderFrame:Show()\n            else\n                envTable.BorderFrame:Hide() \n            end\n        else\n            envTable.BorderFrame:Show()\n        end   \n    end\n    \nend   \n\n\n\n",
						["Nameplate Removed"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.BorderFrame:Hide()\n    \nend\n\n\n",
						["Destructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.BorderFrame:Hide()\n    \nend\n\n\n",
						["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --border color\n    local borderColor = \"yellow\"\n    \n    --size of the border\n    local borderSize = 1\n    \n    --transparency\n    local borderAlpha = 1\n    \n    --enabled (set to false it you only want to use the extra border in other scripts)\n    local isEnabled = true\n    \n    --export border (allow the border to be used by other scripts)\n    --other scripts can use:\n    --unitFrame.healthBar.extraBorder:Show()\n    --unitFrame.healthBar.extraBorder:SetVertexColor (r, g, b)\n    --unitFrame.healthBar.extraBorder:SetBorderSizes (borderSize)\n    local canExportBorder = true\n    \n    --do not add the border to personal bar\n    local noPersonalBar = true\n    \n    --private\n    do\n        \n        local newBorder = CreateFrame (\"frame\", nil, unitFrame.healthBar, \"NamePlateFullBorderTemplate\")\n        envTable.BorderFrame = newBorder\n        \n        newBorder:SetBorderSizes (borderSize, borderSize, borderSize, borderSize)\n        newBorder:UpdateSizes()\n        \n        local r, g, b = DetailsFramework:ParseColors (borderColor)\n        newBorder:SetVertexColor (r, g, b, borderAlpha)\n        \n        envTable.ShowOnPersonalBar = not noPersonalBar\n        \n        if (canExportBorder) then\n            unitFrame.healthBar.extraBorder = newBorder\n        end\n        \n        if (not isEnabled) then\n            envTable.IsEnabled = false\n        else\n            envTable.IsEnabled = true\n        end\n    end\n    \nend\n\n\n",
					},
					["Name"] = "Extra Border [Plater]",
					["PlaterCore"] = 1,
					["LastHookEdited"] = "",
					["Time"] = 1547409079,
					["Icon"] = 133689,
					["LoadConditions"] = {
						["talent"] = {
						},
						["group"] = {
						},
						["class"] = {
						},
						["map_ids"] = {
						},
						["role"] = {
						},
						["pvptalent"] = {
						},
						["affix"] = {
						},
						["race"] = {
						},
						["encounter_ids"] = {
						},
						["spec"] = {
						},
					},
				}, -- [2]
				{
					["Enabled"] = true,
					["Revision"] = 59,
					["HooksTemp"] = {
						["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    \n    if (unitFrame.namePlateNpcId == envTable.NpcIDs.TemptingSiren) then\n        \n        if (envTable.Colors.TemptingSiren) then\n            Plater.SetNameplateColor (unitFrame, envTable.Colors.TemptingSiren)\n        end\n        \n    end\n    \n    \nend\n\n\n\n\n\n\n\n\n",
						["Nameplate Added"] = "function (self, unitId, unitFrame, envTable)\n    \n    if (unitFrame.namePlateNpcId == envTable.NpcIDs.TemptingSiren) then\n        \n        if (envTable.NameplateHeight.TemptingSiren) then\n            \n            Plater.SetNameplateSize (unitFrame, nil, envTable.NameplateHeight.TemptingSiren)\n            \n        end\n        \n    end    \n    \nend\n\n\n",
						["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --nameplate colors for unit\n    envTable.Colors = {}\n    envTable.Colors.TemptingSiren = \"orange\"\n    \n    --npcID\n    envTable.NpcIDs = {}\n    envTable.NpcIDs.TemptingSiren = 146436\n    \n    --nameplate height for each unit\n    envTable.NameplateHeight = {}\n    envTable.NameplateHeight.TemptingSiren = 18\n    \n    \n    \nend\n\n\n",
					},
					["Author"] = "Kastfall-Azralon",
					["Desc"] = "Script for Stormwall Blockade encounter on Battle for Dazzar'alor",
					["Hooks"] = {
						["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    \n    if (unitFrame.namePlateNpcId == envTable.NpcIDs.TemptingSiren) then\n        \n        if (envTable.Colors.TemptingSiren) then\n            Plater.SetNameplateColor (unitFrame, envTable.Colors.TemptingSiren)\n        end\n        \n    end\n    \n    \nend\n\n\n\n\n\n\n\n\n",
						["Nameplate Added"] = "function (self, unitId, unitFrame, envTable)\n    \n    if (unitFrame.namePlateNpcId == envTable.NpcIDs.TemptingSiren) then\n        \n        if (envTable.NameplateHeight.TemptingSiren) then\n            \n            Plater.SetNameplateSize (unitFrame, nil, envTable.NameplateHeight.TemptingSiren)\n            \n        end\n        \n    end    \n    \nend\n\n\n",
						["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --nameplate colors for unit\n    envTable.Colors = {}\n    envTable.Colors.TemptingSiren = \"orange\"\n    \n    --npcID\n    envTable.NpcIDs = {}\n    envTable.NpcIDs.TemptingSiren = 146436\n    \n    --nameplate height for each unit\n    envTable.NameplateHeight = {}\n    envTable.NameplateHeight.TemptingSiren = 18\n    \n    \n    \nend\n\n\n",
					},
					["Name"] = "Stormwall Encounter [Plater]",
					["PlaterCore"] = 1,
					["LastHookEdited"] = "Constructor",
					["Time"] = 1550154976,
					["Icon"] = "Interface\\AddOns\\Plater\\images\\encounter_stormwall_blockade",
					["LoadConditions"] = {
						["talent"] = {
						},
						["group"] = {
						},
						["class"] = {
						},
						["map_ids"] = {
						},
						["race"] = {
						},
						["pvptalent"] = {
						},
						["role"] = {
						},
						["affix"] = {
						},
						["encounter_ids"] = {
							["1"] = 2280,
							["Enabled"] = true,
						},
						["spec"] = {
						},
					},
				}, -- [3]
				{
					["Enabled"] = true,
					["Revision"] = 234,
					["HooksTemp"] = {
						["Nameplate Added"] = "function (self, unitId, unitFrame, envTable)\n    \n    --Unexploded Ordinance\n    if (unitFrame.namePlateNpcId == envTable.NpcIDs.UnexplodedOrdinance) then\n        \n        --make the life percent be bigger than the regular size\n        --so it's better to see the health percent of the barrel\n        local currentSize = Plater.db.profile.plate_config.enemynpc.percent_text_size\n        Plater:SetFontSize (unitFrame.healthBar.lifePercent, currentSize + envTable.UnexplodedOrdinanceTextSizeIncrease)\n    end\n    \n    if (envTable.IncreaseSize [unitFrame.namePlateNpcId]) then\n        local currentHeight = unitFrame.healthBar:GetHeight()\n        Plater.SetNameplateSize (unitFrame, nil, currentHeight + envTable.IncreaseSize [unitFrame.namePlateNpcId])\n    end\n    \nend\n\n\n\n\n\n\n",
						["Cast Start"] = "function (self, unitId, unitFrame, envTable)\n    if (envTable.UnexplodedOrdinanceCast and envTable._SpellID == envTable.UnexplodedOrdinanceSpellID) then\n        Plater.SetCastBarSize (unitFrame, nil, envTable.UnexplodedOrdinanceCastBarHeight)\n        Plater:SetFontSize (unitFrame.castBar.percentText, envTable.UnexplodedOrdinanceTimerSize)\n    end\nend\n\n\n",
						["Nameplate Removed"] = "function (self, unitId, unitFrame, envTable)\n    \n    --reset the health percent text size\n    local currentSize = Plater.db.profile.plate_config.enemynpc.percent_text_size\n    Plater:SetFontSize (unitFrame.healthBar.lifePercent, currentSize)    \n    \nend\n\n\n",
						["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    \n    --Override the color\n    if (envTable.Colors [unitFrame.namePlateNpcId]) then\n        Plater.SetNameplateColor (unitFrame, envTable.Colors [unitFrame.namePlateNpcId])\n    end    \n    \n    --Show the name of the unit in the Ice Block nameplate\n    if (unitFrame.namePlateNpcId == envTable.NpcIDs.IceBlock) then\n        --find which player this block are holding\n        for i = 1, GetNumGroupMembers() do\n            local unit = \"raid\" .. i\n            if (UnitExists (unit)) then\n                for debuffId = 1, 40 do\n                    local name, texture, count, debuffType, duration, expirationTime, caster = UnitDebuff (unit, debuffId)\n                    \n                    --cancel the loop if there's no more debuffs on the player\n                    if (not name) then \n                        break \n                    end                    \n                    \n                    --check if who casted this debuff is the unit shown on this nameplate\n                    if (UnitIsUnit (caster or \"\", unitId)) then\n                        local unitName = UnitName (unit)\n                        \n                        --color the text by the class\n                        unitName = Plater.SetTextColorByClass (unit, unitName)\n                        \n                        --add the role icon\n                        if (Details) then\n                            local role = UnitGroupRolesAssigned (unit)\n                            unitName = Details:AddRoleIcon (unitName, role, 12)\n                        end\n                        \n                        unitFrame.unitName:SetText (unitName)\n                        unitFrame.castBar.Text:SetText (unitName)\n                        break\n                    end\n                    \n                end\n            else\n                break\n            end\n        end\n    end\nend",
						["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --nameplate colors for unit\n    envTable.Colors = {}\n    envTable.Colors [148631] = \"orange\" --Unexploded Ordinance\n    envTable.Colors [148522] = \"white\" --Ice Block\n    \n    --increase the nameplate height for these units\n    envTable.IncreaseSize = {}\n    envTable.IncreaseSize [148522] = 4 --Ice Block (increase in 4 pixels)\n    \n    --increase the size of the life percent for the nameplate of the barrel\n    envTable.UnexplodedOrdinanceTextSizeIncrease = 3\n    \n    --increase the castbar size for the unexploded ordinance explosion cast\n    envTable.UnexplodedOrdinanceCast = true\n    envTable.UnexplodedOrdinanceSpellID = 288221 --12058 --(debug)\n    envTable.UnexplodedOrdinanceCastBarHeight = 18\n    envTable.UnexplodedOrdinanceTimerSize = 18\n    \n    --npcIDs\n    envTable.NpcIDs = {}\n    envTable.NpcIDs.UnexplodedOrdinance = 148631\n    envTable.NpcIDs.IceBlock = 148522\nend\n\n--tests 126023 --harbor saurid - dazar'alor harbor\n--tests 3127 venomtail scorpid - durotar\n--tests 12058 dustwind storm witch - durotar\n--Load Condition: EncounterID 2281\n\n\n",
						["Cast Stop"] = "function (self, unitId, unitFrame, envTable)\n    if (envTable.UnexplodedOrdinanceCast and envTable._SpellID == envTable.UnexplodedOrdinanceSpellID) then\n        Plater.SetCastBarSize (unitFrame)\n        Plater:SetFontSize (unitFrame.castBar.percentText, Plater.db.profile.plate_config.enemynpc.spellpercent_text_size)\n    end\nend\n\n\n",
					},
					["Author"] = "Kastfall-Azralon",
					["Desc"] = "Script for the Jaina encounter on Battle for Dazzar'alor",
					["Hooks"] = {
						["Nameplate Added"] = "function (self, unitId, unitFrame, envTable)\n    \n    --Unexploded Ordinance\n    if (unitFrame.namePlateNpcId == envTable.NpcIDs.UnexplodedOrdinance) then\n        \n        --make the life percent be bigger than the regular size\n        --so it's better to see the health percent of the barrel\n        local currentSize = Plater.db.profile.plate_config.enemynpc.percent_text_size\n        Plater:SetFontSize (unitFrame.healthBar.lifePercent, currentSize + envTable.UnexplodedOrdinanceTextSizeIncrease)\n    end\n    \n    if (envTable.IncreaseSize [unitFrame.namePlateNpcId]) then\n        local currentHeight = unitFrame.healthBar:GetHeight()\n        Plater.SetNameplateSize (unitFrame, nil, currentHeight + envTable.IncreaseSize [unitFrame.namePlateNpcId])\n    end\n    \nend\n\n\n\n\n\n\n",
						["Cast Start"] = "function (self, unitId, unitFrame, envTable)\n    if (envTable.UnexplodedOrdinanceCast and envTable._SpellID == envTable.UnexplodedOrdinanceSpellID) then\n        Plater.SetCastBarSize (unitFrame, nil, envTable.UnexplodedOrdinanceCastBarHeight)\n        Plater:SetFontSize (unitFrame.castBar.percentText, envTable.UnexplodedOrdinanceTimerSize)\n    end\nend\n\n\n",
						["Nameplate Removed"] = "function (self, unitId, unitFrame, envTable)\n    \n    --reset the health percent text size\n    local currentSize = Plater.db.profile.plate_config.enemynpc.percent_text_size\n    Plater:SetFontSize (unitFrame.healthBar.lifePercent, currentSize)    \n    \nend\n\n\n",
						["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    \n    --Override the color\n    if (envTable.Colors [unitFrame.namePlateNpcId]) then\n        Plater.SetNameplateColor (unitFrame, envTable.Colors [unitFrame.namePlateNpcId])\n    end    \n    \n    --Show the name of the unit in the Ice Block nameplate\n    if (unitFrame.namePlateNpcId == envTable.NpcIDs.IceBlock) then\n        --find which player this block are holding\n        for i = 1, GetNumGroupMembers() do\n            local unit = \"raid\" .. i\n            if (UnitExists (unit)) then\n                for debuffId = 1, 40 do\n                    local name, texture, count, debuffType, duration, expirationTime, caster = UnitDebuff (unit, debuffId)\n                    \n                    --cancel the loop if there's no more debuffs on the player\n                    if (not name) then \n                        break \n                    end                    \n                    \n                    --check if who casted this debuff is the unit shown on this nameplate\n                    if (UnitIsUnit (caster or \"\", unitId)) then\n                        local unitName = UnitName (unit)\n                        \n                        --color the text by the class\n                        unitName = Plater.SetTextColorByClass (unit, unitName)\n                        \n                        --add the role icon\n                        if (Details) then\n                            local role = UnitGroupRolesAssigned (unit)\n                            unitName = Details:AddRoleIcon (unitName, role, 12)\n                        end\n                        \n                        unitFrame.unitName:SetText (unitName)\n                        unitFrame.castBar.Text:SetText (unitName)\n                        break\n                    end\n                    \n                end\n            else\n                break\n            end\n        end\n    end\nend",
						["Cast Stop"] = "function (self, unitId, unitFrame, envTable)\n    if (envTable.UnexplodedOrdinanceCast and envTable._SpellID == envTable.UnexplodedOrdinanceSpellID) then\n        Plater.SetCastBarSize (unitFrame)\n        Plater:SetFontSize (unitFrame.castBar.percentText, Plater.db.profile.plate_config.enemynpc.spellpercent_text_size)\n    end\nend\n\n\n",
						["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --nameplate colors for unit\n    envTable.Colors = {}\n    envTable.Colors [148631] = \"orange\" --Unexploded Ordinance\n    envTable.Colors [148522] = \"white\" --Ice Block\n    \n    --increase the nameplate height for these units\n    envTable.IncreaseSize = {}\n    envTable.IncreaseSize [148522] = 4 --Ice Block (increase in 4 pixels)\n    \n    --increase the size of the life percent for the nameplate of the barrel\n    envTable.UnexplodedOrdinanceTextSizeIncrease = 3\n    \n    --increase the castbar size for the unexploded ordinance explosion cast\n    envTable.UnexplodedOrdinanceCast = true\n    envTable.UnexplodedOrdinanceSpellID = 288221 --12058 --(debug)\n    envTable.UnexplodedOrdinanceCastBarHeight = 18\n    envTable.UnexplodedOrdinanceTimerSize = 18\n    \n    --npcIDs\n    envTable.NpcIDs = {}\n    envTable.NpcIDs.UnexplodedOrdinance = 148631\n    envTable.NpcIDs.IceBlock = 148522\nend\n\n--tests 126023 --harbor saurid - dazar'alor harbor\n--tests 3127 venomtail scorpid - durotar\n--tests 12058 dustwind storm witch - durotar\n--Load Condition: EncounterID 2281\n\n\n",
					},
					["Name"] = "Jaina Encounter [Plater]",
					["PlaterCore"] = 1,
					["LastHookEdited"] = "Constructor",
					["Time"] = 1550156266,
					["Icon"] = "Interface\\AddOns\\Plater\\images\\encounter_jaina",
					["LoadConditions"] = {
						["talent"] = {
						},
						["group"] = {
						},
						["class"] = {
						},
						["map_ids"] = {
						},
						["race"] = {
						},
						["pvptalent"] = {
						},
						["role"] = {
						},
						["affix"] = {
						},
						["encounter_ids"] = {
							["1"] = 2281,
							["Enabled"] = true,
						},
						["spec"] = {
						},
					},
				}, -- [4]
				{
					["Enabled"] = true,
					["Revision"] = 84,
					["HooksTemp"] = {
					},
					["Author"] = "Ahwa-Azralon",
					["Desc"] = "Add extra effects to execute range. See the constructor script for options.",
					["Hooks"] = {
						["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    \n    if (envTable.UseCustomExecutePercent) then\n        \n        --manual detection\n        local healthBar = unitFrame.healthBar\n        if (healthBar.CurrentHealth / healthBar.CurrentHealthMax <= envTable.ExecutePercent) then\n            envTable.UnitInExecuteRange (unitFrame)\n        end        \n        \n    else\n        \n        --auto detection\n        if (unitFrame.InExecuteRange) then\n            envTable.UnitInExecuteRange (unitFrame)\n        end\n        \n    end\n    \nend\n\n\n\n\n\n\n\n\n\n\n\n\n",
						["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --execute detection, if true the script will handle the execute percent\n    --while false Plater will automatically trigger the execute range\n    --you only want to set this to true in case of Plater not detecting the execute range correctly\n    envTable.UseCustomExecutePercent = false\n    --execute percent, if not detecting automatic, this is the percent to active the execute range\n    --use from zero to one, 0.20 is equal to 20% of the unit life\n    envTable.ExecutePercent = 0.20\n    \n    --allow this script to change the nameplate color when the unit is in execute range\n    envTable.CanChangeColor = true\n    --change the health bar color to this color when the unit is in execute range\n    --color can be set as:\n    --color names: \"red\", \"yellow\"\n    --color hex: \"#FF0000\", \"#FFFF00\"\n    --color table: {1, 0, 0}, {1, 1, 0}\n    envTable.ExecuteColor = \"green\"\n    \n    --border color\n    envTable.CanChangeBorderColor = false\n    envTable.BorderColor = \"red\"\n    \n    --hide the default health divisor and the health execute indicator\n    envTable.HideHealthDivisor = false\n    --if not hidden, adjust the health divisor settings and the health execute indicator\n    envTable.HealthDivisorAlpha = 0.5\n    envTable.HealthDivisorColor = \"white\"\n    envTable.HealthExecuteIndicatorAlpha = 0.15\n    envTable.HealthExecuteIndicatorColor = \"darkred\"\n    \n    \n    --private (internal functions)\n    do\n        function envTable.UnitInExecuteRange (unitFrame)\n            --check if can change the execute color\n            if (envTable.CanChangeColor) then\n                Plater.SetNameplateColor (unitFrame, envTable.ExecuteColor)\n            end\n            \n            if (envTable.CanChangeBorderColor) then\n                Plater.SetBorderColor (unitFrame, envTable.BorderColor)\n            end\n            \n            if (envTable.HideHealthDivisor) then\n                unitFrame.healthBar.healthCutOff:Hide() \n                unitFrame.healthBar.executeRange:Hide()\n                \n            else\n                envTable.UpdateHealthDivisor (unitFrame)\n                \n            end\n        end\n        \n        function envTable.UpdateHealthDivisor (unitFrame)\n            local healthBar = unitFrame.healthBar\n            \n            healthBar.healthCutOff:Show()\n            healthBar.healthCutOff:SetVertexColor (DetailsFramework:ParseColors (envTable.HealthDivisorColor))\n            healthBar.healthCutOff:SetAlpha (envTable.HealthDivisorAlpha)\n            \n            healthBar.executeRange:Show()\n            healthBar.executeRange:SetVertexColor (DetailsFramework:ParseColors (envTable.HealthExecuteIndicatorColor))\n            healthBar.executeRange:SetAlpha (envTable.HealthExecuteIndicatorAlpha)\n            \n            if (envTable.UseCustomExecutePercent) then\n                healthBar.healthCutOff:ClearAllPoints()\n                healthBar.executeRange:ClearAllPoints()\n                \n                healthBar.healthCutOff:SetSize (healthBar:GetHeight(), healthBar:GetHeight())\n                healthBar.healthCutOff:SetPoint (\"center\", healthBar, \"left\", healthBar:GetWidth() * envTable.ExecutePercent, 0)\n                \n                healthBar.executeRange:SetTexCoord (0, envTable.ExecutePercent, 0, 1)\n                healthBar.executeRange:SetHeight (healthBar:GetHeight())\n                healthBar.executeRange:SetPoint (\"left\", healthBar, \"left\", 0, 0)\n                healthBar.executeRange:SetPoint (\"right\", healthBar.healthCutOff, \"center\")\n            end\n            \n        end\n    end\n    \nend",
					},
					["Name"] = "Execute Range [Plater]",
					["PlaterCore"] = 1,
					["LastHookEdited"] = "",
					["Time"] = 1547406548,
					["Icon"] = 135358,
					["LoadConditions"] = {
						["talent"] = {
						},
						["group"] = {
						},
						["class"] = {
						},
						["map_ids"] = {
						},
						["race"] = {
						},
						["pvptalent"] = {
						},
						["role"] = {
						},
						["affix"] = {
						},
						["encounter_ids"] = {
						},
						["spec"] = {
						},
					},
				}, -- [5]
				{
					["Enabled"] = true,
					["Revision"] = 225,
					["HooksTemp"] = {
						["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    \n    --get the GUID of the target of the unit\n    local targetGUID = UnitGUID (unitId .. \"target\")\n    \n    if (targetGUID) then\n        \n        --get the npcID of the target\n        local npcID = Plater.GetNpcIDFromGUID (targetGUID)\n        --check if the npcID of this unit is in the npc list \n        if (envTable.ListOfNpcs [npcID]) then\n            Plater.SetNameplateColor (unitFrame, envTable.ListOfNpcs [npcID])\n            \n        else\n            --check if the name of ths unit is in the list\n            local unitName = UnitName (unitId .. \"target\")\n            if (envTable.ListOfNpcs [unitName]) then\n                Plater.SetNameplateColor (unitFrame, envTable.ListOfNpcs [unitName])\n                \n            else\n                --check if the name of the unit in lower case is in the npc list\n                unitName = string.lower (unitName)\n                if (envTable.ListOfNpcs [unitName]) then\n                    Plater.SetNameplateColor (unitFrame, envTable.ListOfNpcs [unitName])                \n                    \n                end\n            end\n        end\n        \n    end\nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
						["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --list of npcs and their colors, can be inserted:\n    --name of the unit\n    --name of the unit in lower case\n    --npcID of the unit\n    \n    --color can be added as:\n    --color names: \"red\", \"yellow\"\n    --color hex: \"#FF0000\", \"#FFFF00\"\n    --color table: {1, 0, 0}, {1, 1, 0}    \n    \n    envTable.ListOfNpcs = {\n        [61146] = \"olive\", --monk statue npcID\n        [103822] = \"olive\", --druid treant npcID\n        \n    }\n    \n    \nend\n\n\n\n\n",
					},
					["Author"] = "Kastfall-Azralon",
					["Desc"] = "Change the nameplate color if the unit is attacking a specific unit like Monk's Ox Statue or Druid's Treants. You may edit which units it track in the constructor script.",
					["Hooks"] = {
						["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --list of npcs and their colors, can be inserted:\n    --name of the unit\n    --name of the unit in lower case\n    --npcID of the unit\n    \n    --color can be added as:\n    --color names: \"red\", \"yellow\"\n    --color hex: \"#FF0000\", \"#FFFF00\"\n    --color table: {1, 0, 0}, {1, 1, 0}    \n    \n    envTable.ListOfNpcs = {\n        [61146] = \"olive\", --monk statue npcID\n        [103822] = \"olive\", --druid treant npcID\n        \n    }\n    \n    \nend\n\n\n\n\n",
						["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    \n    --get the GUID of the target of the unit\n    local targetGUID = UnitGUID (unitId .. \"target\")\n    \n    if (targetGUID) then\n        \n        --get the npcID of the target\n        local npcID = Plater.GetNpcIDFromGUID (targetGUID)\n        --check if the npcID of this unit is in the npc list \n        if (envTable.ListOfNpcs [npcID]) then\n            Plater.SetNameplateColor (unitFrame, envTable.ListOfNpcs [npcID])\n            \n        else\n            --check if the name of ths unit is in the list\n            local unitName = UnitName (unitId .. \"target\")\n            if (envTable.ListOfNpcs [unitName]) then\n                Plater.SetNameplateColor (unitFrame, envTable.ListOfNpcs [unitName])\n                \n            else\n                --check if the name of the unit in lower case is in the npc list\n                unitName = string.lower (unitName)\n                if (envTable.ListOfNpcs [unitName]) then\n                    Plater.SetNameplateColor (unitFrame, envTable.ListOfNpcs [unitName])                \n                    \n                end\n            end\n        end\n        \n    end\nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
					},
					["Name"] = "Attacking Specific Unit [Plater]",
					["PlaterCore"] = 1,
					["LastHookEdited"] = "Constructor",
					["Time"] = 1550154976,
					["Icon"] = "Interface\\AddOns\\Plater\\images\\icon_attacking_unit",
					["LoadConditions"] = {
						["talent"] = {
						},
						["group"] = {
						},
						["class"] = {
						},
						["map_ids"] = {
						},
						["race"] = {
						},
						["pvptalent"] = {
						},
						["role"] = {
						},
						["affix"] = {
						},
						["encounter_ids"] = {
						},
						["spec"] = {
						},
					},
				}, -- [6]
				{
					["Enabled"] = true,
					["Revision"] = 88,
					["HooksTemp"] = {
					},
					["Author"] = "Kastfall-Azralon",
					["Desc"] = "Function Plater.UpdatePlateSize from Plater.lua exported to scritps.",
					["Hooks"] = {
						["Nameplate Added"] = "\n\n-- exported function Plater.UpdatePlateSize() from Plater.lua\n--this is for advanced users which wants to reorder the nameplate frame at their desire\n\n\n\nfunction (self, unitId, unitFrame, envTable)\n    \n    --check if there's a type of unit on this nameplate\n    local plateFrame = unitFrame:GetParent()\n    if (not plateFrame.actorType) then\n        return\n    end\n    \n    --get all the frames and cache some variables\n    local ACTORTYPE_ENEMY_PLAYER = \"enemyplayer\"\n    local profile = Plater.db.profile\n    local DB_PLATE_CONFIG = profile.plate_config\n    local isInCombat = Plater.IsInCombat()\n    local actorType = plateFrame.actorType\n    \n    local unitFrame = plateFrame.unitFrame\n    local healthBar = unitFrame.healthBar\n    local castBar = unitFrame.castBar\n    local powerBar = unitFrame.powerBar\n    local buffFrame1 = unitFrame.BuffFrame\n    local buffFrame2 = unitFrame.BuffFrame2\n    \n    --use in combat bars when in pvp\n    if (plateFrame.actorType == ACTORTYPE_ENEMY_PLAYER) then\n        if ((Plater.ZoneInstanceType == \"pvp\" or Plater.ZoneInstanceType == \"arena\") and DB_PLATE_CONFIG.player.pvp_always_incombat) then\n            isInCombat = true\n        end\n    end\n    \n    --get the config for this actor type\n    local plateConfigs = DB_PLATE_CONFIG [actorType]\n    --get the config key based if the player is in combat\n    local castBarConfigKey, healthBarConfigKey, manaConfigKey = Plater.GetHashKey (isInCombat)\n    \n    --get the width and height from what the user set in the options panel\n    local healthBarWidth, healthBarHeight = unitFrame.customHealthBarWidth or plateConfigs [healthBarConfigKey][1], unitFrame.customHealthBarHeight or plateConfigs [healthBarConfigKey][2]\n    local castBarWidth, castBarHeight = unitFrame.customCastBarWidth or plateConfigs [castBarConfigKey][1], unitFrame.customCastBarHeight or plateConfigs [castBarConfigKey][2]\n    local powerBarWidth, powerBarHeight = unitFrame.customPowerBarHeight or plateConfigs [manaConfigKey][1], unitFrame.customPowerBarHeight or plateConfigs [manaConfigKey][2]\n    \n    --calculate the offset for the cast bar, this is done due to the cast bar be anchored to topleft and topright\n    local castBarOffSetX = (healthBarWidth - castBarWidth) / 2\n    local castBarOffSetY = plateConfigs.castbar_offset\n    \n    --calculate offsets for the power bar\n    local powerBarOffSetX = (healthBarWidth - powerBarWidth) / 2\n    local powerBarOffSetY = 0\n    \n    --calculate the size deviation for pets\n    local unitType = Plater.GetUnitType (plateFrame)\n    if (unitType == \"pet\") then\n        healthBarHeight = healthBarHeight * Plater.db.profile.pet_height_scale\n        healthBarWidth = healthBarWidth * Plater.db.profile.pet_width_scale\n        \n    elseif (unitType == \"minus\") then\n        healthBarHeight = healthBarHeight * Plater.db.profile.minor_height_scale\n        healthBarWidth = healthBarWidth * Plater.db.profile.minor_width_scale\n    end\n    \n    --unit frame - is set to be the same size as the plateFrame\n    unitFrame:ClearAllPoints()\n    unitFrame:SetAllPoints()\n    \n    --calculates the health bar anchor points\n    --it will always be placed in the center of the nameplate area (where it accepts mouse clicks) \n    local xOffSet = (plateFrame:GetWidth() - healthBarWidth) / 2\n    local yOffSet = (plateFrame:GetHeight() - healthBarHeight) / 2\n    \n    --set the health bar point\n    healthBar:ClearAllPoints()\n    PixelUtil.SetPoint (healthBar, \"topleft\", unitFrame, \"topleft\", xOffSet + profile.global_offset_x, -yOffSet + profile.global_offset_y)\n    PixelUtil.SetPoint (healthBar, \"bottomright\", unitFrame, \"bottomright\", -xOffSet + profile.global_offset_x, yOffSet + profile.global_offset_y)\n    \n    --set the cast bar point and size\n    castBar:ClearAllPoints()\n    PixelUtil.SetPoint (castBar, \"topleft\", healthBar, \"bottomleft\", castBarOffSetX, castBarOffSetY)\n    PixelUtil.SetPoint (castBar, \"topright\", healthBar, \"bottomright\", -castBarOffSetX, castBarOffSetY)\n    PixelUtil.SetHeight (castBar, castBarHeight)\n    PixelUtil.SetSize (castBar.Icon, castBarHeight, castBarHeight)\n    PixelUtil.SetSize (castBar.BorderShield, castBarHeight * 1.4, castBarHeight * 1.4)\n    \n    --set the power bar point and size\n    powerBar:ClearAllPoints()\n    PixelUtil.SetPoint (powerBar, \"topleft\", healthBar, \"bottomleft\", powerBarOffSetX, powerBarOffSetY)\n    PixelUtil.SetPoint (powerBar, \"topright\", healthBar, \"bottomright\", -powerBarOffSetX, powerBarOffSetY)\n    PixelUtil.SetHeight (powerBar, powerBarHeight)\n    \n    --power bar are hidden by default, show it if there's a custom size for it\n    if (unitFrame.customPowerBarWidth and unitFrame.customPowerBarHeight) then\n        powerBar:SetUnit (unitFrame.unit)\n    end\n    \n    --aura frames\n    buffFrame1:ClearAllPoints()\n    PixelUtil.SetPoint (buffFrame1, \"bottom\", unitFrame, \"top\", profile.aura_x_offset,  plateConfigs.buff_frame_y_offset + profile.aura_y_offset)\n    \n    buffFrame2:ClearAllPoints()\n    PixelUtil.SetPoint (buffFrame2, \"bottom\", unitFrame, \"top\", profile.aura2_x_offset,  plateConfigs.buff_frame_y_offset + profile.aura2_y_offset)    \n    \nend\n\n\n",
					},
					["Name"] = "Reorder Nameplate [Plater]",
					["PlaterCore"] = 1,
					["LastHookEdited"] = "",
					["Time"] = 1548077443,
					["Icon"] = 574574,
					["LoadConditions"] = {
						["talent"] = {
						},
						["group"] = {
						},
						["class"] = {
						},
						["map_ids"] = {
						},
						["race"] = {
						},
						["pvptalent"] = {
						},
						["spec"] = {
						},
						["role"] = {
						},
						["encounter_ids"] = {
						},
						["affix"] = {
						},
					},
				}, -- [7]
				{
					["Enabled"] = true,
					["Revision"] = 45,
					["HooksTemp"] = {
						["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    \n    --can detect the reaping souls aggro?\n    if (envTable.detectAggro and Plater.IsInCombat()) then\n        \n        --is this npc a reaping soul?\n        if (envTable.npcIDs [unitFrame.namePlateNpcId]) then\n            \n            --check if the mob is attacking the player\n            if (UnitIsUnit (unitFrame.targetUnitID, \"player\")) then\n                Plater.SetNameplateColor (unitFrame, envTable.NameplateAggroColor)\n                \n            else\n                Plater.SetNameplateColor (unitFrame, envTable.NameplateNoAggroColor)\n            end\n            \n        end\n        \n    end\n    \nend",
						["Nameplate Added"] = "function (self, unitId, unitFrame, envTable)\n    \n    --when the nameplate is added and the npcID matches, cache the color for the nameplate\n    if (envTable.detectAggro) then\n        if (envTable.npcIDs [unitFrame.namePlateNpcId]) then\n            local profile = Plater.db.profile\n            local role = Plater:GetPlayerRole()\n            \n            if (role == \"TANK\") then\n                envTable.NameplateAggroColor = profile.tank.colors.aggro\n                envTable.NameplateNoAggroColor = profile.tank.colors.noaggro\n            else\n                envTable.NameplateAggroColor = profile.dps.colors.aggro\n                envTable.NameplateNoAggroColor = profile.dps.colors.noaggro\n            end\n            \n        end\n    end\n    \n    \nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
						["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --npcs affected by this script\n    \n    envTable.npcIDs = {\n        [148716] = true, --risen soul\n        [148893] = true, --tormented soul\n        [148894] = true, --lost soul\n        \n        [127278] = true, --skittering feeder (tests and debug, also need to disable the load conditions)\n    }\n    \n    --detect aggro, if true it will see which group member the soul is attacking and override the color\n    envTable.detectAggro = true\n    \n    \nend\n\n\n",
					},
					["Author"] = "Izimode-Azralon",
					["Desc"] = "Tint nameplates of Reaping Soul units (Mythic Dungeon Affix) depending on its target and role of the player",
					["Hooks"] = {
						["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    \n    --can detect the reaping souls aggro?\n    if (envTable.detectAggro and Plater.IsInCombat()) then\n        \n        --is this npc a reaping soul?\n        if (envTable.npcIDs [unitFrame.namePlateNpcId]) then\n            \n            --check if the mob is attacking the player\n            if (UnitIsUnit (unitFrame.targetUnitID, \"player\")) then\n                Plater.SetNameplateColor (unitFrame, envTable.NameplateAggroColor)\n                \n            else\n                Plater.SetNameplateColor (unitFrame, envTable.NameplateNoAggroColor)\n            end\n            \n        end\n        \n    end\n    \nend",
						["Nameplate Added"] = "function (self, unitId, unitFrame, envTable)\n    \n    --when the nameplate is added and the npcID matches, cache the color for the nameplate\n    if (envTable.detectAggro) then\n        if (envTable.npcIDs [unitFrame.namePlateNpcId]) then\n            local profile = Plater.db.profile\n            local role = Plater:GetPlayerRole()\n            \n            if (role == \"TANK\") then\n                envTable.NameplateAggroColor = profile.tank.colors.aggro\n                envTable.NameplateNoAggroColor = profile.tank.colors.noaggro\n            else\n                envTable.NameplateAggroColor = profile.dps.colors.aggro\n                envTable.NameplateNoAggroColor = profile.dps.colors.noaggro\n            end\n            \n        end\n    end\n    \n    \nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
						["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --npcs affected by this script\n    \n    envTable.npcIDs = {\n        [148716] = true, --risen soul\n        [148893] = true, --tormented soul\n        [148894] = true, --lost soul\n        \n        [127278] = true, --skittering feeder (tests and debug, also need to disable the load conditions)\n    }\n    \n    --detect aggro, if true it will see which group member the soul is attacking and override the color\n    envTable.detectAggro = true\n    \n    \nend\n\n\n",
					},
					["Name"] = "M+ Bwonsamdi Reaping",
					["PlaterCore"] = 1,
					["LastHookEdited"] = "Constructor",
					["Time"] = 1550155776,
					["Icon"] = 2446016,
					["LoadConditions"] = {
						["talent"] = {
						},
						["group"] = {
							["Enabled"] = true,
							["party"] = true,
						},
						["class"] = {
						},
						["map_ids"] = {
						},
						["race"] = {
						},
						["pvptalent"] = {
						},
						["spec"] = {
						},
						["role"] = {
						},
						["encounter_ids"] = {
						},
						["affix"] = {
							["Enabled"] = true,
							["117"] = true,
						},
					},
				}, -- [8]
				{
					["Enabled"] = true,
					["Revision"] = 182,
					["HooksTemp"] = {
					},
					["Author"] = "Izimode-Azralon",
					["Desc"] = "Show how many raid members are targeting the unit",
					["Hooks"] = {
						["Leave Combat"] = "function (self, unitId, unitFrame, envTable)\n    envTable.CanShow = false;\n    envTable.TargetAmount:SetText (\"\")\nend\n\n\n",
						["Nameplate Added"] = "function (self, unitId, unitFrame, envTable)\n    \n    --when a nameplate is added to the screen check if the player is in combat\n    if (InCombatLockdown()) then\n        --player is in combat, check if can check amount of targets\n        envTable.CanShow = envTable.CanShowTargetAmount();\n        \n    else\n        envTable.CanShow = false; \n    end\n    \n    envTable.TargetAmount:SetText (\"\");\n    \nend",
						["Nameplate Removed"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.TargetAmount:SetText (\"\");\n    envTable.CanShow = false;\n    \nend\n\n\n",
						["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    \n    --if the script is allowed to show the amount of targets\n    --also check if the unit is in combat\n    if (envTable.CanShow and UnitAffectingCombat (unitId)) then\n        \n        --check if can update the amount of targets following the cooldown set in the constructor script\n        --by default Plater updates the nameplate every 250ms, by default the cooldown is 2, so it'll update the amuont of target every 1/2 of a second\n        envTable.UpdateCooldown = envTable.UpdateCooldown + 1\n        if (envTable.UpdateCooldown < envTable.UpdateInterval) then\n            return\n        else\n            \n            --reset the cooldown interval to check the amount of target again\n            envTable.UpdateCooldown = 0\n            \n            --get the amount of targets\n            local amount;\n            if (envTable.InRaid) then\n                amount = envTable.NumTargetsInRaid (unitFrame)      \n                \n            elseif (envTable.InParty) then\n                amount = envTable.NumTargetsInParty (unitFrame)   \n                \n            else\n                envTable.TargetAmount:SetText (\"\")\n                return\n            end\n            \n            --update the amount text\n            if (amount == 0) then\n                envTable.TargetAmount:SetText (\"\")\n            else\n                envTable.TargetAmount:SetText (amount)\n            end\n            \n        end\n    end\nend\n\n\n",
						["Enter Combat"] = "function (self, unitId, unitFrame, envTable)\n    \n    --check if can show the amount of targets\n    envTable.CanShow = envTable.CanShowTargetAmount();\n    \n    if (not envTable.CanShow) then\n        envTable.TargetAmount:SetText (\"\") \n    end\nend\n\n\n\n\n",
						["Constructor"] = "--all gray text like this are comments and do not run as code\n--build the settings and basic functions for the hook\n\nfunction (self, unitId, unitFrame, envTable)\n    \n    --declare setting variables:\n    local textColor = \"orange\";\n    local textSize = 12;\n    \n    local showInRaid = true;\n    local showInDungeon = true;\n    local showInArena = false;\n    local showInBattleground = false;\n    local showInOpenWorld = true;\n    \n    envTable.UpdateInterval = 2; --each 2 updates in the nameplate it'll update the amount of targets\n    \n    local anchor = {\n        side = 6, --1 = topleft 2 = left 3 = bottomleft 4 = bottom 5 = bottom right 6 = right 7 = topright 8 = top\n        x = 4, --x offset\n        y = 0, --y offset\n    };\n    \n    \n    ---------------------------------------------------------------------------------------------------------------------------------------------\n    \n    \n    --frames:\n    \n    --create the text that will show the amount of people targeting the unit\n    if (not  unitFrame.healthBar.TargetAmount) then\n        envTable.TargetAmount = Plater:CreateLabel (unitFrame.healthBar, \"\", textSize, textColor);\n        Plater.SetAnchor (envTable.TargetAmount, anchor);\n        unitFrame.healthBar.TargetAmount = envTable.TargetAmount\n    end\n    \n    --in case Plater wipes the envTable\n    envTable.TargetAmount = unitFrame.healthBar.TargetAmount\n    \n    ---------------------------------------------------------------------------------------------------------------------------------------------           \n    --private variables (they will be used in the other scripts within this hook)\n    envTable.CanShow = false;\n    envTable.UpdateCooldown = 0;\n    envTable.InRaid = false;\n    envTable.InParty = false;\n    \n    ---------------------------------------------------------------------------------------------------------------------------------------------           \n    --functions\n    \n    --update the InRaid or InParty proprieties\n    function envTable.UpdateGroupType()\n        if (IsInRaid()) then\n            envTable.InRaid = true;\n            envTable.InParty = false;     \n            \n        elseif (IsInGroup()) then\n            envTable.InRaid = false;\n            envTable.InParty = true;   \n            \n        else\n            envTable.InRaid = false;            \n            envTable.InParty = false;\n        end\n    end\n    \n    --this function controls if the amount of targets can show following the settings in the top of this script\n    function envTable.CanShowTargetAmount()\n        \n        local _, instanceType, difficultyID, _, _, _, _, instanceMapID, instanceGroupSize = GetInstanceInfo()\n        \n        if (showInRaid and instanceType == \"raid\") then\n            envTable.UpdateGroupType()\n            return true\n        end\n        \n        if (showInDungeon and instanceType == \"party\") then\n            envTable.UpdateGroupType()\n            return true\n        end\n        \n        if (showInArena and instanceType == \"arena\") then\n            envTable.UpdateGroupType()\n            return true\n        end\n        \n        if (showInBattleground and instanceType == \"pvp\") then\n            envTable.UpdateGroupType()\n            return true\n        end\n        \n        if (showInOpenWorld and instanceType == \"none\") then\n            envTable.UpdateGroupType()\n            if (envTable.InRaid or envTable.InParty) then\n                return true\n            end\n        end\n        \n        return false\n    end\n    \n    --get the amount of player targetting the unit in raid or party\n    function envTable.NumTargetsInRaid (unitFrame)\n        local amount = 0\n        for i = 1, GetNumGroupMembers() do\n            local unit = \"raid\" .. i .. \"target\"\n            if (UnitGUID (unit) == unitFrame.namePlateUnitGUID) then\n                amount = amount + 1\n            end\n        end\n        \n        return amount\n    end\n    \n    function envTable.NumTargetsInParty()\n        local amount = 0\n        for i = 1, GetNumGroupMembers() - 1 do\n            local unit = \"party\" .. i .. \"target\"\n            if (UnitGUID (unit) == unitFrame.namePlateUnitGUID) then\n                amount = amount + 1\n            end\n        end\n        \n        local unit = \"playertarget\"\n        if (UnitGUID (unit) == unitFrame.namePlateUnitGUID) then\n            amount = amount + 1\n        end        \n        \n        return amount\n    end\n    \nend",
					},
					["Name"] = "Players Targeting a Target [Plater]",
					["PlaterCore"] = 1,
					["LastHookEdited"] = "",
					["Time"] = 1548278227,
					["Icon"] = 1966587,
					["LoadConditions"] = {
						["talent"] = {
						},
						["group"] = {
						},
						["class"] = {
						},
						["map_ids"] = {
						},
						["race"] = {
						},
						["pvptalent"] = {
						},
						["role"] = {
						},
						["affix"] = {
						},
						["encounter_ids"] = {
						},
						["spec"] = {
						},
					},
				}, -- [9]
				{
					["Enabled"] = true,
					["Revision"] = 93,
					["HooksTemp"] = {
					},
					["Author"] = "Izimode-Azralon",
					["Desc"] = "Changes the target color to the color set in the constructor script.",
					["Hooks"] = {
						["Nameplate Added"] = "function (self, unitId, unitFrame, envTable)\n    envTable.UpdateColor (unitFrame)\nend",
						["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    envTable.UpdateColor (unitFrame)\nend",
						["Target Changed"] = "function (self, unitId, unitFrame, envTable)\n    envTable.UpdateColor (unitFrame)\nend\n\n\n\n\n\n\n\n\n\n\n",
						["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --usage: color name e.g \"red\" \"yellow\"; color table e.g {1, 0, 0} {1, 1, 0}; hex string e.g. \"#FF0000\" \"FFFF00\"\n    \n    envTable.TargetColor = \"purple\"\n    --envTable.TargetColor = \"#FF00FF\"\n    --envTable.TargetColor = {252/255, 0/255, 254/255}\n    \n    function envTable.UpdateColor (unitFrame)\n        --do not change the color of the personal bar\n        if (not unitFrame.IsSelf) then\n            \n            --if this nameplate the current target of the player?\n            if (unitFrame.namePlateIsTarget) then\n                Plater.SetNameplateColor (unitFrame, envTable.TargetColor)  --rgb\n            else\n                --refresh the nameplate color\n                Plater.RefreshNameplateColor (unitFrame)\n            end\n        end\n    end\n    \nend\n\n\n\n\n",
					},
					["Name"] = "Current Target Color [Plater]",
					["LoadConditions"] = {
						["talent"] = {
						},
						["group"] = {
						},
						["class"] = {
						},
						["map_ids"] = {
						},
						["race"] = {
						},
						["pvptalent"] = {
						},
						["spec"] = {
						},
						["role"] = {
						},
						["encounter_ids"] = {
						},
						["affix"] = {
						},
					},
					["LastHookEdited"] = "",
					["Time"] = 1552354619,
					["Icon"] = 878211,
					["PlaterCore"] = 1,
				}, -- [10]
				{
					["Enabled"] = true,
					["Revision"] = 240,
					["HooksTemp"] = {
						["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --ATTENTION: after enabling this script, you may have to adjust the anchor point at the Buff Settings tab\n    \n    --space between each aura icon\n    envTable.padding = 1\n    \n    --space between each row of icons\n    envTable.rowPadding = 12\n    \n    --amount of icons in the row, it'll breakline and start a new row after reach the threshold\n    envTable.maxAurasPerRow = 5\n    \n    --stack auras of the same name that arent stacked by default from the game\n    envTable.consolidadeRepeatedAuras = true    \n    \n    --auras should grow to right or left?\n    envTable.GrowDirection = \"right\" --insert 'left' to grow to the left side\n    \n    --which auras goes first, assign a value (any number), bigger value goes first\n    envTable.priority = {\n        [\"Vampiric Touch\"] = 50,\n        [\"Shadow Word: Pain\"] = 22,\n        [\"Mind Flay\"] = 5,\n    }\n    \nend \n\n\n\n\n",
						["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    \n    local auraContainers = {unitFrame.BuffFrame.PlaterBuffList}\n\n    if (Plater.db.profile.buffs_on_aura2) then\n        auraContainers [2] = unitFrame.BuffFrame2.PlaterBuffList\n    end\n    \n    for containerID = 1, #auraContainers do\n        \n        local auraContainer = auraContainers [containerID]\n        local aurasShown = {}\n        local aurasDuplicated = {}\n        \n        --build the list of auras shown in the buff frame and check for each aura priority\n        --also check if the consolidate (stack) auras with the same name is enabled\n        for index, auraIcon in ipairs (auraContainer) do\n            if (auraIcon:IsShown()) then\n                if (envTable.consolidadeRepeatedAuras) then\n                    --is this aura already shown?\n                    local iconShownIndex = aurasDuplicated [auraIcon.SpellName]\n                    if (iconShownIndex) then\n                        --get the table with information about the shown icon\n                        local auraShownTable = aurasShown [iconShownIndex]\n                        --get the icon already in the table\n                        local icon = auraShownTable[1]\n                        --increase the amount of stacks\n                        auraShownTable[3] = auraShownTable[3] + 1\n                        \n                        --check if the remaining time of the icon already added in the table is lower than the current\n                        if (auraIcon.RemainingTime > icon.RemainingTime) then\n                            --replace the icon for the icon with bigger duration\n                            auraShownTable[1] = auraIcon\n                            icon:Hide()\n                        else\n                            auraIcon:Hide()\n                        end\n                    else    \n                        local priority = envTable.priority[auraIcon.SpellName] or envTable.priority[auraIcon.spellId] or 1\n                        tinsert (aurasShown, {auraIcon, priority, 1}) --icon frame, priority, stack amount\n                        aurasDuplicated [auraIcon.SpellName] = #aurasShown\n                    end\n                else\n                    --not stacking similar auras\n                    local priority = envTable.priority[auraIcon.SpellName] or envTable.priority[auraIcon.spellId] or 1\n                    tinsert (aurasShown, {auraIcon, priority})\n                    \n                end           \n            end\n        end\n        \n        --sort auras by priority\n        table.sort (aurasShown, DetailsFramework.SortOrder2)\n        \n        local growDirection\n        if (containerID == 1) then --debuff container\n            growDirection = Plater.db.profile.aura_grow_direction\n            --force to grow to right if it is anchored to center\n            if (growDirection == 2) then\n                growDirection = 3\n            end\n            -- \"Left\", \"Center\", \"Right\" - 1  2  3\n            \n        elseif (containerID == 2) then --buff container\n            growDirection = Plater.db.profile.aura2_grow_direction\n            --force to grow to left if it is anchored to center\n            if (growDirection == 2) then\n                growDirection = 1\n            end\n            \n        end\n        \n        local padding = envTable.padding\n        local framersPerRow = envTable.maxAurasPerRow + 1\n        \n        --first icon is where the row starts\n        local firstIcon = aurasShown[1] and aurasShown[1][1]\n        \n        if (firstIcon) then\n            local anchorPoint = firstIcon:GetParent() --anchor point is the BuffFrame\n            anchorPoint:SetSize (1, 1)\n            \n            firstIcon:ClearAllPoints()\n            firstIcon:SetPoint (\"center\", anchorPoint, \"center\", 0, 5)\n            \n            --check the consolidaded stacks, this is not the regular buff stacks\n            local firstIconStacks = aurasShown[1][3]\n            if (firstIconStacks and firstIconStacks > 1) then\n                firstIcon.StackText:SetText (firstIconStacks)\n                firstIcon.StackText:Show()\n            end\n            \n            --> left to right\n            if (growDirection == 3) then\n                --> iterate among all aura icons\n                for i = 2, #aurasShown do\n                    local auraIcon = aurasShown [i][1]\n                    auraIcon:ClearAllPoints()\n                    \n                    if (i == framersPerRow) then\n                        auraIcon:SetPoint (\"bottomleft\", firstIcon, \"topleft\", 0, envTable.rowPadding)\n                        framersPerRow = framersPerRow + framersPerRow\n                        \n                    else\n                        auraIcon:SetPoint (\"topleft\", aurasShown [i-1][1], \"topright\", padding, 0)\n                    end\n                    \n                    local stacks = aurasShown[i][3]\n                    if (stacks and stacks > 1) then\n                        auraIcon.StackText:SetText (stacks)\n                        auraIcon.StackText:Show()\n                    end\n                end        \n                \n                --right to left\n            elseif (growDirection == 1) then\n                --> iterate among all aura icons\n                for i = 2, #aurasShown do\n                    local auraIcon = aurasShown [i][1]\n                    auraIcon:ClearAllPoints()\n                    \n                    if (i == framersPerRow) then\n                        auraIcon:SetPoint (\"bottomright\", firstIcon, \"topright\", 0, envTable.rowPadding)\n                        framersPerRow = framersPerRow + framersPerRow\n                        \n                    else\n                        auraIcon:SetPoint (\"topright\", aurasShown [i-1][1], \"topleft\", -padding, 0)\n                    end\n                    \n                    local stacks = aurasShown[i][3]\n                    if (stacks and stacks > 1) then\n                        auraIcon.StackText:SetText (stacks)\n                        auraIcon.StackText:Show()\n                    end\n                    \n                end                    \n            end\n            \n        end\n    end\nend\n\n\n",
					},
					["Author"] = "Ditador-Azralon",
					["Desc"] = "Reorder buffs and debuffs following the settings set in the constructor.",
					["Hooks"] = {
						["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    \n    local auraContainers = {unitFrame.BuffFrame.PlaterBuffList}\n\n    if (Plater.db.profile.buffs_on_aura2) then\n        auraContainers [2] = unitFrame.BuffFrame2.PlaterBuffList\n    end\n    \n    for containerID = 1, #auraContainers do\n        \n        local auraContainer = auraContainers [containerID]\n        local aurasShown = {}\n        local aurasDuplicated = {}\n        \n        --build the list of auras shown in the buff frame and check for each aura priority\n        --also check if the consolidate (stack) auras with the same name is enabled\n        for index, auraIcon in ipairs (auraContainer) do\n            if (auraIcon:IsShown()) then\n                if (envTable.consolidadeRepeatedAuras) then\n                    --is this aura already shown?\n                    local iconShownIndex = aurasDuplicated [auraIcon.SpellName]\n                    if (iconShownIndex) then\n                        --get the table with information about the shown icon\n                        local auraShownTable = aurasShown [iconShownIndex]\n                        --get the icon already in the table\n                        local icon = auraShownTable[1]\n                        --increase the amount of stacks\n                        auraShownTable[3] = auraShownTable[3] + 1\n                        \n                        --check if the remaining time of the icon already added in the table is lower than the current\n                        if (auraIcon.RemainingTime > icon.RemainingTime) then\n                            --replace the icon for the icon with bigger duration\n                            auraShownTable[1] = auraIcon\n                            icon:Hide()\n                        else\n                            auraIcon:Hide()\n                        end\n                    else    \n                        local priority = envTable.priority[auraIcon.SpellName] or envTable.priority[auraIcon.spellId] or 1\n                        tinsert (aurasShown, {auraIcon, priority, 1}) --icon frame, priority, stack amount\n                        aurasDuplicated [auraIcon.SpellName] = #aurasShown\n                    end\n                else\n                    --not stacking similar auras\n                    local priority = envTable.priority[auraIcon.SpellName] or envTable.priority[auraIcon.spellId] or 1\n                    tinsert (aurasShown, {auraIcon, priority})\n                    \n                end           \n            end\n        end\n        \n        --sort auras by priority\n        table.sort (aurasShown, DetailsFramework.SortOrder2)\n        \n        local growDirection\n        if (containerID == 1) then --debuff container\n            growDirection = Plater.db.profile.aura_grow_direction\n            --force to grow to right if it is anchored to center\n            if (growDirection == 2) then\n                growDirection = 3\n            end\n            -- \"Left\", \"Center\", \"Right\" - 1  2  3\n            \n        elseif (containerID == 2) then --buff container\n            growDirection = Plater.db.profile.aura2_grow_direction\n            --force to grow to left if it is anchored to center\n            if (growDirection == 2) then\n                growDirection = 1\n            end\n            \n        end\n        \n        local padding = envTable.padding\n        local framersPerRow = envTable.maxAurasPerRow + 1\n        \n        --first icon is where the row starts\n        local firstIcon = aurasShown[1] and aurasShown[1][1]\n        \n        if (firstIcon) then\n            local anchorPoint = firstIcon:GetParent() --anchor point is the BuffFrame\n            anchorPoint:SetSize (1, 1)\n            \n            firstIcon:ClearAllPoints()\n            firstIcon:SetPoint (\"center\", anchorPoint, \"center\", 0, 5)\n            \n            --check the consolidaded stacks, this is not the regular buff stacks\n            local firstIconStacks = aurasShown[1][3]\n            if (firstIconStacks and firstIconStacks > 1) then\n                firstIcon.StackText:SetText (firstIconStacks)\n                firstIcon.StackText:Show()\n            end\n            \n            --> left to right\n            if (growDirection == 3) then\n                --> iterate among all aura icons\n                for i = 2, #aurasShown do\n                    local auraIcon = aurasShown [i][1]\n                    auraIcon:ClearAllPoints()\n                    \n                    if (i == framersPerRow) then\n                        auraIcon:SetPoint (\"bottomleft\", firstIcon, \"topleft\", 0, envTable.rowPadding)\n                        framersPerRow = framersPerRow + framersPerRow\n                        \n                    else\n                        auraIcon:SetPoint (\"topleft\", aurasShown [i-1][1], \"topright\", padding, 0)\n                    end\n                    \n                    local stacks = aurasShown[i][3]\n                    if (stacks and stacks > 1) then\n                        auraIcon.StackText:SetText (stacks)\n                        auraIcon.StackText:Show()\n                    end\n                end        \n                \n                --right to left\n            elseif (growDirection == 1) then\n                --> iterate among all aura icons\n                for i = 2, #aurasShown do\n                    local auraIcon = aurasShown [i][1]\n                    auraIcon:ClearAllPoints()\n                    \n                    if (i == framersPerRow) then\n                        auraIcon:SetPoint (\"bottomright\", firstIcon, \"topright\", 0, envTable.rowPadding)\n                        framersPerRow = framersPerRow + framersPerRow\n                        \n                    else\n                        auraIcon:SetPoint (\"topright\", aurasShown [i-1][1], \"topleft\", -padding, 0)\n                    end\n                    \n                    local stacks = aurasShown[i][3]\n                    if (stacks and stacks > 1) then\n                        auraIcon.StackText:SetText (stacks)\n                        auraIcon.StackText:Show()\n                    end\n                    \n                end                    \n            end\n            \n        end\n    end\nend\n\n\n",
						["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --ATTENTION: after enabling this script, you may have to adjust the anchor point at the Buff Settings tab\n    \n    --space between each aura icon\n    envTable.padding = 1\n    \n    --space between each row of icons\n    envTable.rowPadding = 12\n    \n    --amount of icons in the row, it'll breakline and start a new row after reach the threshold\n    envTable.maxAurasPerRow = 5\n    \n    --stack auras of the same name that arent stacked by default from the game\n    envTable.consolidadeRepeatedAuras = true    \n    \n    --auras should grow to right or left?\n    envTable.GrowDirection = \"right\" --insert 'left' to grow to the left side\n    \n    --which auras goes first, assign a value (any number), bigger value goes first\n    envTable.priority = {\n        [\"Vampiric Touch\"] = 50,\n        [\"Shadow Word: Pain\"] = 22,\n        [\"Mind Flay\"] = 5,\n    }\n    \nend \n\n\n\n\n",
					},
					["Name"] = "Aura Reorder [Plater]",
					["PlaterCore"] = 1,
					["LastHookEdited"] = "Constructor",
					["Time"] = 1550151943,
					["Icon"] = "Interface\\AddOns\\Plater\\images\\icon_aura_reorder",
					["LoadConditions"] = {
						["talent"] = {
						},
						["group"] = {
						},
						["class"] = {
						},
						["map_ids"] = {
						},
						["race"] = {
						},
						["pvptalent"] = {
						},
						["spec"] = {
						},
						["role"] = {
						},
						["encounter_ids"] = {
						},
						["affix"] = {
						},
					},
				}, -- [11]
				{
					["Enabled"] = true,
					["Revision"] = 22,
					["HooksTemp"] = {
						["Nameplate Created"] = "function (self, unitId, unitFrame, envTable)\n    \n    --added this event just to run the constructor script\n    \nend\n\n\n",
						["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --insert here the font you want to change then /reeload\n    --after the reload, check if the font has changed and disable this script\n    \n    local FONT = \"Accidental Presidency\"\n    \n    local profile = Plater.db.profile\n    local actorTables = profile.plate_config\n    \n    for plateType, plateTable in pairs (actorTables) do\n        \n        plateTable.actorname_text_font = FONT\n        plateTable.spellname_text_font = FONT\n        plateTable.spellpercent_text_font = FONT\n        plateTable.level_text_font = FONT\n        plateTable.percent_text_font = FONT\n        plateTable.big_actortitle_text_font = FONT\n        plateTable.big_actorname_text_font = FONT\n        plateTable.power_percent_text_font = FONT\n        \n    end\n    \n    profile.castbar_target_font = FONT\n    profile.aura_timer_text_font = FONT    \n    profile.aura_stack_font = FONT    \n    \nend\n\n\n",
					},
					["Author"] = "Izimode-Azralon",
					["Desc"] = "Edit the Constructor script setting the font you want in the FONT = \"\", then /reload.",
					["Hooks"] = {
						["Nameplate Created"] = "function (self, unitId, unitFrame, envTable)\n    \n    --added this event just to run the constructor script\n    \nend\n\n\n",
						["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --insert here the font you want to change then /reeload\n    --after the reload, check if the font has changed and disable this script\n    \n    local FONT = \"Accidental Presidency\"\n    \n    local profile = Plater.db.profile\n    local actorTables = profile.plate_config\n    \n    for plateType, plateTable in pairs (actorTables) do\n        \n        plateTable.actorname_text_font = FONT\n        plateTable.spellname_text_font = FONT\n        plateTable.spellpercent_text_font = FONT\n        plateTable.level_text_font = FONT\n        plateTable.percent_text_font = FONT\n        plateTable.big_actortitle_text_font = FONT\n        plateTable.big_actorname_text_font = FONT\n        plateTable.power_percent_text_font = FONT\n        \n    end\n    \n    profile.castbar_target_font = FONT\n    profile.aura_timer_text_font = FONT    \n    profile.aura_stack_font = FONT    \n    \nend\n\n\n",
					},
					["Name"] = "Change All Fonts",
					["LoadConditions"] = {
						["talent"] = {
						},
						["group"] = {
						},
						["class"] = {
						},
						["map_ids"] = {
						},
						["race"] = {
						},
						["pvptalent"] = {
						},
						["role"] = {
						},
						["affix"] = {
						},
						["encounter_ids"] = {
						},
						["spec"] = {
						},
					},
					["LastHookEdited"] = "Constructor",
					["Time"] = 1550154977,
					["Icon"] = 134331,
					["PlaterCore"] = 1,
				}, -- [12]
				{
					["Enabled"] = true,
					["Revision"] = 25,
					["HooksTemp"] = {
						["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    \n    local auras = unitFrame.BuffFrame.PlaterBuffList\n    \n    for _, auraIcon in ipairs (auras) do\n        if (auraIcon:IsVisible()) then\n            if (auraIcon.RemainingTime < envTable.Timers.critical) then\n                Plater:SetFontColor (auraIcon.TimerText, envTable.Colors.critical)\n                \n            elseif (auraIcon.RemainingTime < envTable.Timers.warning) then\n                Plater:SetFontColor (auraIcon.TimerText, envTable.Colors.warning)\n                \n            else\n                Plater:SetFontColor (auraIcon.TimerText, envTable.Colors.okay)\n            end \n        end\n        \n    end\nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
						["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --colors for each time bracket\n    envTable.Colors = {\n        critical = \"red\",\n        warning = \"yellow\",\n        okay = \"white\",\n    }\n    \n    --time amount to enter in warning or critical state\n    envTable.Timers = {\n        critical = 4.9,\n        warning = 8,\n    }\n    \nend\n\n\n",
					},
					["Author"] = "Ditador-Azralon",
					["Desc"] = "Change the color of the aura timer by it's time left",
					["Hooks"] = {
						["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    \n    local auras = unitFrame.BuffFrame.PlaterBuffList\n    \n    for _, auraIcon in ipairs (auras) do\n        if (auraIcon:IsVisible()) then\n            if (auraIcon.RemainingTime < envTable.Timers.critical) then\n                Plater:SetFontColor (auraIcon.TimerText, envTable.Colors.critical)\n                \n            elseif (auraIcon.RemainingTime < envTable.Timers.warning) then\n                Plater:SetFontColor (auraIcon.TimerText, envTable.Colors.warning)\n                \n            else\n                Plater:SetFontColor (auraIcon.TimerText, envTable.Colors.okay)\n            end \n        end\n        \n    end\nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
						["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --colors for each time bracket\n    envTable.Colors = {\n        critical = \"red\",\n        warning = \"yellow\",\n        okay = \"white\",\n    }\n    \n    --time amount to enter in warning or critical state\n    envTable.Timers = {\n        critical = 4.9,\n        warning = 8,\n    }\n    \nend\n\n\n",
					},
					["Name"] = "Paint Aura Timers",
					["PlaterCore"] = 1,
					["LastHookEdited"] = "Constructor",
					["Time"] = 1550155776,
					["Icon"] = "Interface\\Timer\\Challenges-Logo",
					["LoadConditions"] = {
						["talent"] = {
						},
						["group"] = {
						},
						["class"] = {
						},
						["map_ids"] = {
						},
						["race"] = {
						},
						["pvptalent"] = {
						},
						["spec"] = {
						},
						["role"] = {
						},
						["encounter_ids"] = {
						},
						["affix"] = {
						},
					},
				}, -- [13]
				{
					["Enabled"] = true,
					["Revision"] = 113,
					["HooksTemp"] = {
						["Cast Update"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.UpdateIconPosition (unitFrame)\n    self.ThrottleUpdate = -1\n    \nend\n\n\n",
						["Cast Stop"] = "function (self, unitId, unitFrame, envTable)\n    \n    \n    \nend\n\n\n",
						["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    \nend\n\n\n",
						["Cast Start"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.UpdateIconPosition (unitFrame)\n    \nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
						["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --settings:\n    --show cast icon\n    envTable.ShowIcon = true\n    --anchor icon on what side\n    envTable.IconAnchor = \"left\" --accep 'left' 'right'\n    --fine tune the size of the icon\n    envTable.IconSizeOffset = 1\n    \n    --shield for non interruptible casts\n    envTable.ShowShield = true\n    envTable.ShieldTexture = [[Interface\\GROUPFRAME\\UI-GROUP-MAINTANKICON]]\n    envTable.ShieldDesaturated = true\n    envTable.ShieldColor = {1, 1, 1 ,1}\n    envTable.ShieldSize = {10, 12}\n    \n    --private:\n    function envTable.UpdateIconPosition (unitFrame)\n        local castBar = unitFrame.castBar\n        local icon = castBar.Icon\n        local shield = castBar.BorderShield\n        \n        if (envTable.ShowIcon) then\n            icon:ClearAllPoints()\n            \n            if (envTable.IconAnchor == \"left\") then\n                icon:SetPoint (\"topright\", unitFrame.healthBar, \"topleft\", -1, envTable.IconSizeOffset)\n                icon:SetPoint (\"bottomright\", unitFrame.castBar, \"bottomleft\", -1, 0)    \n                \n            elseif (envTable.IconAnchor == \"right\") then\n                icon:SetPoint (\"topleft\", unitFrame.healthBar, \"topright\", 1, envTable.IconSizeOffset)\n                icon:SetPoint (\"bottomleft\", unitFrame.castBar, \"bottomright\", 1, 0)\n                \n            end\n            \n            icon:SetWidth (icon:GetHeight())\n            icon:Show()\n            \n        else\n            icon:Hide()\n            \n        end\n        \n        if (envTable.ShowShield and not castBar.canInterrupt) then\n            shield:Show()\n            shield:SetAlpha (1)\n            shield:SetTexCoord (0, 1, 0, 1)\n            shield:SetVertexColor (1, 1, 1, 1)\n            \n            shield:SetTexture (envTable.ShieldTexture)\n            shield:SetDesaturated (envTable.ShieldDesaturated)\n            \n            if (not envTable.ShieldDesaturated) then\n                shield:SetVertexColor (DetailsFramework:ParseColors (envTable.ShieldColor))\n            end\n            \n            shield:SetSize (unpack (envTable.ShieldSize))\n            \n            shield:ClearAllPoints()\n            shield:SetPoint (\"center\", castBar, \"left\", 0, 0)\n            \n        else\n            shield:Hide()\n            \n        end\n        \n    end\nend",
					},
					["Author"] = "Ditador-Azralon",
					["Desc"] = "Move the icon of the spell cast to the left or right side of the nameplate.",
					["Hooks"] = {
						["Cast Start"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.UpdateIconPosition (unitFrame)\n    \nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
						["Cast Update"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.UpdateIconPosition (unitFrame)\n    self.ThrottleUpdate = -1\n    \nend\n\n\n",
						["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --settings:\n    --show cast icon\n    envTable.ShowIcon = true\n    --anchor icon on what side\n    envTable.IconAnchor = \"left\" --accep 'left' 'right'\n    --fine tune the size of the icon\n    envTable.IconSizeOffset = 1\n    \n    --shield for non interruptible casts\n    envTable.ShowShield = true\n    envTable.ShieldTexture = [[Interface\\GROUPFRAME\\UI-GROUP-MAINTANKICON]]\n    envTable.ShieldDesaturated = true\n    envTable.ShieldColor = {1, 1, 1 ,1}\n    envTable.ShieldSize = {10, 12}\n    \n    --private:\n    function envTable.UpdateIconPosition (unitFrame)\n        local castBar = unitFrame.castBar\n        local icon = castBar.Icon\n        local shield = castBar.BorderShield\n        \n        if (envTable.ShowIcon) then\n            icon:ClearAllPoints()\n            \n            if (envTable.IconAnchor == \"left\") then\n                icon:SetPoint (\"topright\", unitFrame.healthBar, \"topleft\", -1, envTable.IconSizeOffset)\n                icon:SetPoint (\"bottomright\", unitFrame.castBar, \"bottomleft\", -1, 0)    \n                \n            elseif (envTable.IconAnchor == \"right\") then\n                icon:SetPoint (\"topleft\", unitFrame.healthBar, \"topright\", 1, envTable.IconSizeOffset)\n                icon:SetPoint (\"bottomleft\", unitFrame.castBar, \"bottomright\", 1, 0)\n                \n            end\n            \n            icon:SetWidth (icon:GetHeight())\n            icon:Show()\n            \n        else\n            icon:Hide()\n            \n        end\n        \n        if (envTable.ShowShield and not castBar.canInterrupt) then\n            shield:Show()\n            shield:SetAlpha (1)\n            shield:SetTexCoord (0, 1, 0, 1)\n            shield:SetVertexColor (1, 1, 1, 1)\n            \n            shield:SetTexture (envTable.ShieldTexture)\n            shield:SetDesaturated (envTable.ShieldDesaturated)\n            \n            if (not envTable.ShieldDesaturated) then\n                shield:SetVertexColor (DetailsFramework:ParseColors (envTable.ShieldColor))\n            end\n            \n            shield:SetSize (unpack (envTable.ShieldSize))\n            \n            shield:ClearAllPoints()\n            shield:SetPoint (\"center\", castBar, \"left\", 0, 0)\n            \n        else\n            shield:Hide()\n            \n        end\n        \n    end\nend",
					},
					["Name"] = "Cast Icon Anchor",
					["LoadConditions"] = {
						["talent"] = {
						},
						["group"] = {
						},
						["class"] = {
						},
						["map_ids"] = {
						},
						["role"] = {
						},
						["pvptalent"] = {
						},
						["affix"] = {
						},
						["race"] = {
						},
						["encounter_ids"] = {
						},
						["spec"] = {
						},
					},
					["LastHookEdited"] = "Constructor",
					["Time"] = 1550156349,
					["Icon"] = "Interface\\Buttons\\UI-Quickslot2",
					["PlaterCore"] = 1,
				}, -- [14]
				{
					["Enabled"] = true,
					["Revision"] = 215,
					["semver"] = "",
					["HooksTemp"] = {
						["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    \n    local buffSpecialGlow = true\n    \n    \n    -- functions --\n    local auraContainers = {unitFrame.BuffFrame.PlaterBuffList}\n    \n    if (Plater.db.profile.buffs_on_aura2) then\n        auraContainers [2] = unitFrame.BuffFrame2.PlaterBuffList\n    end\n    \n    for containerID = 1, #auraContainers do\n        \n        local auraContainer = auraContainers [containerID]\n        \n        for index, auraIcon in ipairs (auraContainer) do\n            if not Plater.StartGlow then\n                auraIcon.purgeGlowEffect = auraIcon.purgeGlowEffect or Plater.CreateIconGlow (auraIcon)\n                if (auraIcon:IsShown() and auraIcon.CanStealOrPurge) then\n                    auraIcon.purgeGlowEffect:SetColor( envTable.AntsColor, envTable.GlowColor)\n                    auraIcon.purgeGlowEffect:Show()\n                else\n                    auraIcon.purgeGlowEffect:Hide()\n                end\n            else\n                if (auraIcon:IsShown() and auraIcon.CanStealOrPurge) then\n                    Plater.StartGlow(auraIcon, envTable.AntsColor, envTable.options)\n                else\n                    Plater.StopGlow(auraIcon)\n                end                \n            end\n        end\n        \n    end\n    \n    if buffSpecialGlow then\n        for _, auraIcon in ipairs (unitFrame.ExtraIconFrame.IconPool) do\n            if auraIcon:IsShown() then\n                local canStealOrPurge = auraIcon.canStealOrPurge\n                \n                if not Plater.StartGlow then\n                    auraIcon.purgeGlowEffect = auraIcon.purgeGlowEffect or Plater.CreateIconGlow (auraIcon)\n                    if (auraIcon:IsShown() and canStealOrPurge) then\n                        auraIcon.purgeGlowEffect:SetColor( envTable.AntsColor, envTable.GlowColor)\n                        auraIcon.purgeGlowEffect:Show()\n                    else\n                        auraIcon.purgeGlowEffect:Hide()\n                    end\n                else\n                    if (auraIcon:IsShown() and canStealOrPurge) then\n                        Plater.StartGlow(auraIcon, envTable.AntsColor, envTable.options)\n                    else\n                        Plater.StopGlow(auraIcon)\n                    end                \n                end\n            end\n        end\n    end\n    \nend",
						["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    -- settings:\n    \n    -- for old-fashioned glows:\n    envTable.GlowColor = \"orange\"\n    envTable.AntsColor = \"red\"\n    \n    -- for the LibCustomGlow implementation (default):\n    envTable.options = {\n        glowType = \"pixel\",\n        color = \"red\", -- all plater color types accepted, from lib: {r,g,b,a}, color of lines and opacity, from 0 to 1. Defaul value is {0.95, 0.95, 0.32, 1}\n        N = 8, -- number of lines. Defaul value is 8;\n        frequency = 0.25, -- frequency, set to negative to inverse direction of rotation. Default value is 0.25;\n        length = 4, -- length of lines. Default value depends on region size and number of lines;\n        th = 2, -- thickness of lines. Default value is 2;\n        xOffset = 0,\n        yOffset = 0, -- offset of glow relative to region border;\n        border = false, -- set to true to create border under lines;\n        key = \"\", -- key of glow, allows for multiple glows on one frame;\n    }\n    \nend",
					},
					["version"] = -1,
					["Author"] = "Viashi-Antonidas",
					["LoadConditions"] = {
						["talent"] = {
						},
						["group"] = {
						},
						["class"] = {
						},
						["map_ids"] = {
						},
						["race"] = {
						},
						["pvptalent"] = {
						},
						["spec"] = {
						},
						["affix"] = {
						},
						["encounter_ids"] = {
						},
						["role"] = {
						},
					},
					["Desc"] = "Adds a glow to the aura if you can steal or purge the buff.",
					["Hooks"] = {
						["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    -- settings:\n    \n    -- for old-fashioned glows:\n    envTable.GlowColor = \"orange\"\n    envTable.AntsColor = \"red\"\n    \n    -- for the LibCustomGlow implementation (default):\n    envTable.options = {\n        glowType = \"pixel\",\n        color = \"red\", -- all plater color types accepted, from lib: {r,g,b,a}, color of lines and opacity, from 0 to 1. Defaul value is {0.95, 0.95, 0.32, 1}\n        N = 8, -- number of lines. Defaul value is 8;\n        frequency = 0.25, -- frequency, set to negative to inverse direction of rotation. Default value is 0.25;\n        length = 4, -- length of lines. Default value depends on region size and number of lines;\n        th = 2, -- thickness of lines. Default value is 2;\n        xOffset = 0,\n        yOffset = 0, -- offset of glow relative to region border;\n        border = false, -- set to true to create border under lines;\n        key = \"\", -- key of glow, allows for multiple glows on one frame;\n    }\n    \nend",
						["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    \n    local buffSpecialGlow = true\n    \n    \n    -- functions --\n    local auraContainers = {unitFrame.BuffFrame.PlaterBuffList}\n    \n    if (Plater.db.profile.buffs_on_aura2) then\n        auraContainers [2] = unitFrame.BuffFrame2.PlaterBuffList\n    end\n    \n    for containerID = 1, #auraContainers do\n        \n        local auraContainer = auraContainers [containerID]\n        \n        for index, auraIcon in ipairs (auraContainer) do\n            if not Plater.StartGlow then\n                auraIcon.purgeGlowEffect = auraIcon.purgeGlowEffect or Plater.CreateIconGlow (auraIcon)\n                if (auraIcon:IsShown() and auraIcon.CanStealOrPurge) then\n                    auraIcon.purgeGlowEffect:SetColor( envTable.AntsColor, envTable.GlowColor)\n                    auraIcon.purgeGlowEffect:Show()\n                else\n                    auraIcon.purgeGlowEffect:Hide()\n                end\n            else\n                if (auraIcon:IsShown() and auraIcon.CanStealOrPurge) then\n                    Plater.StartGlow(auraIcon, envTable.AntsColor, envTable.options)\n                else\n                    Plater.StopGlow(auraIcon)\n                end                \n            end\n        end\n        \n    end\n    \n    if buffSpecialGlow then\n        for _, auraIcon in ipairs (unitFrame.ExtraIconFrame.IconPool) do\n            if auraIcon:IsShown() then\n                local canStealOrPurge = auraIcon.canStealOrPurge\n                \n                if not Plater.StartGlow then\n                    auraIcon.purgeGlowEffect = auraIcon.purgeGlowEffect or Plater.CreateIconGlow (auraIcon)\n                    if (auraIcon:IsShown() and canStealOrPurge) then\n                        auraIcon.purgeGlowEffect:SetColor( envTable.AntsColor, envTable.GlowColor)\n                        auraIcon.purgeGlowEffect:Show()\n                    else\n                        auraIcon.purgeGlowEffect:Hide()\n                    end\n                else\n                    if (auraIcon:IsShown() and canStealOrPurge) then\n                        Plater.StartGlow(auraIcon, envTable.AntsColor, envTable.options)\n                    else\n                        Plater.StopGlow(auraIcon)\n                    end                \n                end\n            end\n        end\n    end\n    \nend",
					},
					["Prio"] = 99,
					["Time"] = 1589002141,
					["PlaterCore"] = 1,
					["LastHookEdited"] = "Constructor",
					["url"] = "",
					["Icon"] = "INTERFACE\\ICONS\\Ability_Creature_Cursed_04",
					["Name"] = "Steal/Purge Aura Glow",
				}, -- [15]
				{
					["Enabled"] = true,
					["Revision"] = 71,
					["semver"] = "",
					["HooksTemp"] = {
						["Player Logon"] = "function (self, unitId, unitFrame, envTable)\n    \n    -- /RELOAD AFTER IMPORTING OR CHANGING THE SCRIPT\n    -- SELECT THE INDICATOR AT THE TARGET TAB\n    \n    Plater.TargetIndicators    [\"Double Arrows\"] = {\n        path = [[Interface\\AddOns\\Plater\\media\\arrow_double_right_64]],\n        coords = {\n            {0, 1, 0, 1}, \n            {1, 0, 0, 1}\n        },\n        desaturated = false,\n        width = 20,\n        height = 16,\n        x = 28,\n        y = 0,\n        blend = \"ADD\",\n        color = \"gold\",\n    }    \n    \nend",
					},
					["version"] = -1,
					["Author"] = "�r��ne-Kel'thuzad",
					["LoadConditions"] = {
						["talent"] = {
						},
						["group"] = {
						},
						["class"] = {
						},
						["map_ids"] = {
						},
						["role"] = {
						},
						["pvptalent"] = {
						},
						["spec"] = {
						},
						["affix"] = {
						},
						["encounter_ids"] = {
						},
						["race"] = {
						},
					},
					["Desc"] = "Adds double arrow as a target indicators option",
					["Hooks"] = {
						["Player Logon"] = "function (self, unitId, unitFrame, envTable)\n    \n    -- /RELOAD AFTER IMPORTING OR CHANGING THE SCRIPT\n    -- SELECT THE INDICATOR AT THE TARGET TAB\n    \n    Plater.TargetIndicators    [\"Double Arrows\"] = {\n        path = [[Interface\\AddOns\\Plater\\media\\arrow_double_right_64]],\n        coords = {\n            {0, 1, 0, 1}, \n            {1, 0, 0, 1}\n        },\n        desaturated = false,\n        width = 20,\n        height = 16,\n        x = 28,\n        y = 0,\n        blend = \"ADD\",\n        color = \"gold\",\n    }    \n    \nend",
					},
					["Prio"] = 99,
					["Time"] = 1589002145,
					["PlaterCore"] = 1,
					["LastHookEdited"] = "Player Logon",
					["url"] = "",
					["Icon"] = "Interface\\AddOns\\Plater\\media\\arrow_double_right_64",
					["Name"] = "Double Arrow Target",
				}, -- [16]
				{
					["Enabled"] = true,
					["Revision"] = 60,
					["semver"] = "",
					["HooksTemp"] = {
						["Nameplate Added"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.CheckForQuest (unitFrame)\n    \nend\n\n\n",
						["Nameplate Removed"] = "function (self, unitId, unitFrame, envTable)\n    \n    unitFrame.ExtraQuestMarker22154:Hide()\n    \nend\n\n\n",
						["Destructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    if (unitFrame.ExtraQuestMarker22154) then\n        \n        unitFrame.ExtraQuestMarker22154:Hide()\n        \n    end    \n    \nend\n\n\n",
						["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.CheckForQuest (unitFrame)\n    \nend\n\n\n",
						["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.Texture = [[Interface\\OPTIONSFRAME\\UI-OptionsFrame-NewFeatureIcon]]\n    envTable.Size = 24\n    envTable.Anchor = {\n        side = 6, --right side\n        x = -80,\n        y = 36\n    }\n    \n    if (not unitFrame.ExtraQuestMarker22154) then\n        unitFrame.ExtraQuestMarker22154 = unitFrame:CreateTexture (nil, \"overlay\")\n        local texture = unitFrame.ExtraQuestMarker22154\n        \n        texture:SetTexture (envTable.Texture)\n        texture:SetSize (envTable.Size, envTable.Size)\n        Plater.SetAnchor (texture, envTable.Anchor)\n    end\n    \n    function envTable.CheckForQuest (unitFrame)\n        if (unitFrame.namePlateIsQuestObjective) then\n            unitFrame.ExtraQuestMarker22154:Show()\n            \n        else\n            unitFrame.ExtraQuestMarker22154:Hide()\n            \n        end\n    end\nend\n\n\n\n\n\n\n",
					},
					["Time"] = 1589007188,
					["Author"] = "Izimode-Azralon",
					["PlaterCore"] = 1,
					["Desc"] = "Show an extra icon if the unit is a part of a quest you're current doing. You may adjust where the exclamation mark is shown in the Constructor.",
					["Hooks"] = {
						["Nameplate Added"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.CheckForQuest (unitFrame)\n    \nend\n\n\n",
						["Nameplate Removed"] = "function (self, unitId, unitFrame, envTable)\n    \n    unitFrame.ExtraQuestMarker22154:Hide()\n    \nend\n\n\n",
						["Destructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    if (unitFrame.ExtraQuestMarker22154) then\n        \n        unitFrame.ExtraQuestMarker22154:Hide()\n        \n    end    \n    \nend\n\n\n",
						["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.CheckForQuest (unitFrame)\n    \nend\n\n\n",
						["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.Texture = [[Interface\\OPTIONSFRAME\\UI-OptionsFrame-NewFeatureIcon]]\n    envTable.Size = 24\n    envTable.Anchor = {\n        side = 6, --right side\n        x = -80,\n        y = 36\n    }\n    \n    if (not unitFrame.ExtraQuestMarker22154) then\n        unitFrame.ExtraQuestMarker22154 = unitFrame:CreateTexture (nil, \"overlay\")\n        local texture = unitFrame.ExtraQuestMarker22154\n        \n        texture:SetTexture (envTable.Texture)\n        texture:SetSize (envTable.Size, envTable.Size)\n        Plater.SetAnchor (texture, envTable.Anchor)\n    end\n    \n    function envTable.CheckForQuest (unitFrame)\n        if (unitFrame.namePlateIsQuestObjective) then\n            unitFrame.ExtraQuestMarker22154:Show()\n            \n        else\n            unitFrame.ExtraQuestMarker22154:Hide()\n            \n        end\n    end\nend\n\n\n\n\n\n\n",
					},
					["Prio"] = 99,
					["Name"] = "Extra Quest Icon",
					["LoadConditions"] = {
						["talent"] = {
						},
						["group"] = {
						},
						["class"] = {
						},
						["map_ids"] = {
						},
						["role"] = {
						},
						["pvptalent"] = {
						},
						["race"] = {
						},
						["affix"] = {
						},
						["encounter_ids"] = {
						},
						["spec"] = {
						},
					},
					["LastHookEdited"] = "Constructor",
					["url"] = "",
					["Icon"] = "Interface\\OPTIONSFRAME\\UI-OptionsFrame-NewFeatureIcon",
					["version"] = -1,
				}, -- [17]
			},
			["disable_omnicc_on_auras"] = true,
			["aura_width"] = 22,
			["aura_show_offensive_cd"] = true,
			["health_statusbar_bgcolor"] = {
				0.47450980392157, -- [1]
				0.47450980392157, -- [2]
				0.47450980392157, -- [3]
				0.79000000655651, -- [4]
			},
			["range_check_enabled"] = false,
			["quick_hide"] = true,
			["hook_data_trash"] = {
				{
					["Enabled"] = false,
					["Revision"] = 73,
					["HooksTemp"] = {
						["Leave Combat"] = "function (self, unitId, unitFrame, envTable)\n    if (unitFrame.namePlateUnitReaction == envTable.REACTION_NEUTRAL) then\n        \n        --plater already handle this\n        if (unitFrame.PlayerCannotAttack) then\n            return\n        end    \n        \n        --check if is only open world\n        if (envTable.OnlyInOpenWorld and Plater.ZoneInstanceType ~= \"none\") then\n            return \n        end\n        \n        --check for only in combat\n        if (envTable.ShowInCombat) then\n            envTable.HideNameplate (unitFrame)\n        end\n    end\nend\n\n\n",
						["Nameplate Added"] = "function (self, unitId, unitFrame, envTable)\n    \n    if (unitFrame.namePlateUnitReaction == envTable.REACTION_NEUTRAL) then\n        \n        --plater already handle this\n        if (unitFrame.PlayerCannotAttack) then\n            return\n        end\n        \n        --check if is only open world\n        if (envTable.OnlyInOpenWorld and Plater.ZoneInstanceType ~= \"none\") then\n            return \n        end\n        \n        --check for only in combat\n        if (envTable.ShowInCombat and InCombatLockdown()) then\n            return\n        end\n        \n        envTable.HideNameplate (unitFrame)\n    end\n    \nend\n\n\n\n\n\n\n",
						["Target Changed"] = "function (self, unitId, unitFrame, envTable)\n    \n    if (unitFrame.namePlateUnitReaction == envTable.REACTION_NEUTRAL) then\n        \n        --plater already handle this\n        if (unitFrame.PlayerCannotAttack) then\n            return\n        end    \n        \n        --check if is only open world\n        if (envTable.OnlyInOpenWorld and Plater.ZoneInstanceType ~= \"none\") then\n            return \n        end\n        \n        --check for only in combat\n        if (envTable.ShowInCombat and InCombatLockdown()) then\n            return\n        end\n        \n        --check the unit reaction\n        if (unitFrame.namePlateIsTarget) then\n            envTable.ShowNameplate (unitFrame)\n            \n        else\n            envTable.HideNameplate (unitFrame)\n            \n        end    \n    end\n    \nend\n\n\n\n\n\n\n",
						["Nameplate Removed"] = "function (self, unitId, unitFrame, envTable)\n    \n    if (unitFrame.namePlateUnitReaction == envTable.REACTION_NEUTRAL) then\n        envTable.ShowNameplate (unitFrame)\n    end\n    \nend\n\n\n\n\n",
						["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    \n    --when plater finishes an update on the nameplate\n    --check within the envTable if the healthBar of this nameplate should be hidden\n    if (envTable.IsHidden) then\n        if (unitFrame.healthBar:IsShown()) then\n            envTable.HideNameplate (unitFrame)\n        end\n    end\n    \nend\n\n\n\n\n",
						["Enter Combat"] = "function (self, unitId, unitFrame, envTable)\n    \n    if (unitFrame.namePlateUnitReaction == envTable.REACTION_NEUTRAL) then\n        \n        --plater already handle this\n        if (unitFrame.PlayerCannotAttack) then\n            return\n        end    \n        \n        --check if is only open world\n        if (envTable.OnlyInOpenWorld and Plater.ZoneInstanceType ~= \"none\") then\n            return \n        end\n        \n        --check for only in combat\n        if (envTable.ShowInCombat) then\n            envTable.ShowNameplate (unitFrame)\n        end\n    end\nend\n\n\n",
						["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --settings\n    envTable.OnlyInOpenWorld = true;\n    envTable.ShowInCombat = true;\n    \n    --consts\n    envTable.REACTION_NEUTRAL = 4;\n    \n    --functions to hide and show the healthBar\n    function envTable.HideNameplate (unitFrame)\n        Plater.HideHealthBar (unitFrame)\n        Plater.DisableHighlight (unitFrame)\n        envTable.IsHidden = true\n    end\n    \n    function envTable.ShowNameplate (unitFrame)\n        Plater.ShowHealthBar (unitFrame)\n        Plater.EnableHighlight (unitFrame)\n        envTable.IsHidden = false\n    end\n    \nend\n\n\n\n\n",
					},
					["Author"] = "Izimode-Azralon",
					["Desc"] = "Hide neutral units, show when selected, see the constructor script for options.",
					["Hooks"] = {
						["Leave Combat"] = "function (self, unitId, unitFrame, envTable)\n    if (unitFrame.namePlateUnitReaction == envTable.REACTION_NEUTRAL) then\n        \n        --plater already handle this\n        if (unitFrame.PlayerCannotAttack) then\n            return\n        end    \n        \n        --check if is only open world\n        if (envTable.OnlyInOpenWorld and Plater.ZoneInstanceType ~= \"none\") then\n            return \n        end\n        \n        --check for only in combat\n        if (envTable.ShowInCombat) then\n            envTable.HideNameplate (unitFrame)\n        end\n    end\nend\n\n\n",
						["Nameplate Added"] = "function (self, unitId, unitFrame, envTable)\n    \n    if (unitFrame.namePlateUnitReaction == envTable.REACTION_NEUTRAL) then\n        \n        --plater already handle this\n        if (unitFrame.PlayerCannotAttack) then\n            return\n        end\n        \n        --check if is only open world\n        if (envTable.OnlyInOpenWorld and Plater.ZoneInstanceType ~= \"none\") then\n            return \n        end\n        \n        --check for only in combat\n        if (envTable.ShowInCombat and InCombatLockdown()) then\n            return\n        end\n        \n        envTable.HideNameplate (unitFrame)\n    end\n    \nend\n\n\n\n\n\n\n",
						["Target Changed"] = "function (self, unitId, unitFrame, envTable)\n    \n    if (unitFrame.namePlateUnitReaction == envTable.REACTION_NEUTRAL) then\n        \n        --plater already handle this\n        if (unitFrame.PlayerCannotAttack) then\n            return\n        end    \n        \n        --check if is only open world\n        if (envTable.OnlyInOpenWorld and Plater.ZoneInstanceType ~= \"none\") then\n            return \n        end\n        \n        --check for only in combat\n        if (envTable.ShowInCombat and InCombatLockdown()) then\n            return\n        end\n        \n        --check the unit reaction\n        if (unitFrame.namePlateIsTarget) then\n            envTable.ShowNameplate (unitFrame)\n            \n        else\n            envTable.HideNameplate (unitFrame)\n            \n        end    \n    end\n    \nend\n\n\n\n\n\n\n",
						["Nameplate Removed"] = "function (self, unitId, unitFrame, envTable)\n    \n    if (unitFrame.namePlateUnitReaction == envTable.REACTION_NEUTRAL) then\n        envTable.ShowNameplate (unitFrame)\n    end\n    \nend\n\n\n\n\n",
						["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    \n    --when plater finishes an update on the nameplate\n    --check within the envTable if the healthBar of this nameplate should be hidden\n    if (envTable.IsHidden) then\n        if (unitFrame.healthBar:IsShown()) then\n            envTable.HideNameplate (unitFrame)\n        end\n    end\n    \nend\n\n\n\n\n",
						["Enter Combat"] = "function (self, unitId, unitFrame, envTable)\n    \n    if (unitFrame.namePlateUnitReaction == envTable.REACTION_NEUTRAL) then\n        \n        --plater already handle this\n        if (unitFrame.PlayerCannotAttack) then\n            return\n        end    \n        \n        --check if is only open world\n        if (envTable.OnlyInOpenWorld and Plater.ZoneInstanceType ~= \"none\") then\n            return \n        end\n        \n        --check for only in combat\n        if (envTable.ShowInCombat) then\n            envTable.ShowNameplate (unitFrame)\n        end\n    end\nend\n\n\n",
						["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --settings\n    envTable.OnlyInOpenWorld = true;\n    envTable.ShowInCombat = true;\n    \n    --consts\n    envTable.REACTION_NEUTRAL = 4;\n    \n    --functions to hide and show the healthBar\n    function envTable.HideNameplate (unitFrame)\n        Plater.HideHealthBar (unitFrame)\n        Plater.DisableHighlight (unitFrame)\n        envTable.IsHidden = true\n    end\n    \n    function envTable.ShowNameplate (unitFrame)\n        Plater.ShowHealthBar (unitFrame)\n        Plater.EnableHighlight (unitFrame)\n        envTable.IsHidden = false\n    end\n    \nend\n\n\n\n\n",
					},
					["__TrashAt"] = 1588953565,
					["Name"] = "Hide Neutral Units [Plater]",
					["PlaterCore"] = 1,
					["LastHookEdited"] = "Constructor",
					["Time"] = 1541606242,
					["Icon"] = 1990989,
					["LoadConditions"] = {
						["talent"] = {
						},
						["group"] = {
						},
						["class"] = {
						},
						["map_ids"] = {
						},
						["race"] = {
						},
						["pvptalent"] = {
						},
						["spec"] = {
						},
						["role"] = {
						},
						["encounter_ids"] = {
						},
						["affix"] = {
						},
					},
				}, -- [1]
				{
					["Enabled"] = false,
					["Revision"] = 46,
					["HooksTemp"] = {
						["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    --Important: lines starting with double dashes are comments and are not part of the script\n    \n    --if the unit does not have any of the following auras, it will be painted with the color listed below\n    --list of spells to track, can be the spell name (case-sensitive) or the spellID\n    envTable.TrackingAuras = {\n        --[\"Nightblade\"] = true, --this is an example using the spell name\n        --[195452] = true, --this is an example using the spellID\n        \n    }\n    \n    --which color the nameplate wil be changed\n    --color can be added as:\n    --color names: \"red\", \"yellow\"\n    --color hex: \"#FF0000\", \"#FFFF00\"\n    --color table: {1, 0, 0}, {1, 1, 0}    \n    --you may also use /plater colors\n    envTable.NameplateColor = \"pink\"\n    \nend\n\n\n",
						["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    \n    --do nothing if the player isn't in combat\n    if (not Plater.IsInCombat()) then\n        return \n    end\n    \n    --do nothing if the unit isn't in combat\n    if (not unitFrame.InCombat) then\n        return\n    end\n    \n    --check the auras\n    local hasAura = false\n    \n    for auraName, _ in pairs (envTable.TrackingAuras) do\n        if (Plater.NameplateHasAura (unitFrame, auraName)) then\n            hasAura = true\n            break\n        end\n    end\n    \n    if (not hasAura) then\n        Plater.SetNameplateColor (unitFrame, envTable.NameplateColor)\n    end    \n    \nend\n\n\n\n\n\n\n\n\n\n\n",
					},
					["Author"] = "Izimode-Azralon",
					["Desc"] = "Change the nameplate color when a nameplate does not have the auras set in the constructor script.",
					["Hooks"] = {
						["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    \n    --do nothing if the player isn't in combat\n    if (not Plater.IsInCombat()) then\n        return \n    end\n    \n    --do nothing if the unit isn't in combat\n    if (not unitFrame.InCombat) then\n        return\n    end\n    \n    --check the auras\n    local hasAura = false\n    \n    for auraName, _ in pairs (envTable.TrackingAuras) do\n        if (Plater.NameplateHasAura (unitFrame, auraName)) then\n            hasAura = true\n            break\n        end\n    end\n    \n    if (not hasAura) then\n        Plater.SetNameplateColor (unitFrame, envTable.NameplateColor)\n    end    \n    \nend\n\n\n\n\n\n\n\n\n\n\n",
						["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    --Important: lines starting with double dashes are comments and are not part of the script\n    \n    --if the unit does not have any of the following auras, it will be painted with the color listed below\n    --list of spells to track, can be the spell name (case-sensitive) or the spellID\n    envTable.TrackingAuras = {\n        --[\"Nightblade\"] = true, --this is an example using the spell name\n        --[195452] = true, --this is an example using the spellID\n        \n    }\n    \n    --which color the nameplate wil be changed\n    --color can be added as:\n    --color names: \"red\", \"yellow\"\n    --color hex: \"#FF0000\", \"#FFFF00\"\n    --color table: {1, 0, 0}, {1, 1, 0}    \n    --you may also use /plater colors\n    envTable.NameplateColor = \"pink\"\n    \nend\n\n\n",
					},
					["__TrashAt"] = 1588953674,
					["Name"] = "Don't Have Aura [Plater]",
					["PlaterCore"] = 1,
					["LastHookEdited"] = "Constructor",
					["Time"] = 1550151941,
					["Icon"] = "Interface\\ICONS\\Spell_Shadow_ShadowWordPain",
					["LoadConditions"] = {
						["talent"] = {
						},
						["group"] = {
						},
						["class"] = {
						},
						["map_ids"] = {
						},
						["race"] = {
						},
						["pvptalent"] = {
						},
						["role"] = {
						},
						["affix"] = {
						},
						["encounter_ids"] = {
						},
						["spec"] = {
						},
					},
				}, -- [2]
				{
					["Enabled"] = false,
					["Revision"] = 194,
					["HooksTemp"] = {
						["Nameplate Created"] = "function (self, unitId, unitFrame, envTable)\n    \n    --run constructor!\n    --constructor is executed only once when any script of the hook runs.\n    \nend\n\n\n",
						["Nameplate Added"] = "function (self, unitId, unitFrame, envTable)\n    \n    --check if need update the amount of combo points shown\n    if (envTable.LastPlayerTalentUpdate > envTable.LastUpdate) then\n        envTable.UpdateComboPointAmount()\n    end    \n    \n    if (unitFrame.namePlateIsTarget and not unitFrame.IsSelf) then\n        envTable.ComboPointFrame:Show()\n        envTable.UpdateComboPoints()\n        \n    else\n        envTable.ComboPointFrame:Hide()\n    end    \n    \nend\n\n\n",
						["Target Changed"] = "function (self, unitId, unitFrame, envTable)\n    \n    --check if this nameplate is the current target\n    if (unitFrame.namePlateIsTarget and not unitFrame.IsSelf) then\n        envTable.ComboPointFrame:Show()\n        \n    else\n        envTable.ComboPointFrame:Hide()\n    end\n    \nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
						["Player Power Update"] = "function (self, unitId, unitFrame, envTable)\n    \n    if (unitFrame.namePlateIsTarget and not unitFrame.IsSelf) then\n        envTable.UpdateComboPoints()\n    end\n    \n    \nend\n\n\n\n\n\n\n",
						["Nameplate Removed"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.ComboPointFrame:Hide()\n    \nend\n\n\n",
						["Destructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.ComboPointFrame:Hide()\n    \nend\n\n\n\n\n",
						["Player Talent Update"] = "function (self, unitId, unitFrame, envTable)\n    \n    --update the amount of comboo points shown when the player changes talents or specialization\n    envTable.UpdateComboPointAmount()\n    \n    --save the time of the last talent change\n    envTable.LastPlayerTalentUpdate = GetTime()\n    \n    \nend\n\n\n",
						["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --settings\n    local anchors = {\n        {\"bottom\", unitFrame.healthBar, \"top\", 0, 24},\n    }\n    \n    local sizes = {\n        width = 12,\n        height = 12,\n        scale = 1,\n    }\n    \n    local textures = {\n        backgroundTexture = [[Interface\\PLAYERFRAME\\ClassOverlayComboPoints]],\n        backgroundTexCoords = {78/128, 98/128, 21/64, 41/64},\n        \n        comboPointTexture = [[Interface\\PLAYERFRAME\\ClassOverlayComboPoints]],\n        comboPointTexCoords = {100/128, 120/128, 21/64, 41/64},\n    }\n    \n    local frameLevel = 1000\n    local frameStrata = \"high\"    \n    \n    --private\n    do\n        --store combo points frames on this table\n        envTable.ComboPoints = {}\n        --save when the player changed talents or spec\n        envTable.LastPlayerTalentUpdate = GetTime()\n        --save when this nameplate got a combo point amount and alignment update        \n        \n        --build combo points frame anchor (combo point are anchored to this)\n        if (not unitFrame.PlaterComboPointFrame) then\n            local hostFrame = CreateFrame (\"frame\", nil, unitFrame)\n            hostFrame.ComboPointFramesPool = {}\n            unitFrame.PlaterComboPointFrame = hostFrame\n            envTable.ComboPointFrame = hostFrame\n            \n            --DetailsFramework:ApplyStandardBackdrop (envTable.ComboPointFrame) --debug anchor size\n            \n            --animations\n            local onPlayShowAnimation = function (animation)\n                --stop the hide animation if it's playing\n                if (animation:GetParent():GetParent().HideAnimation:IsPlaying()) then\n                    animation:GetParent():GetParent().HideAnimation:Stop()\n                end\n                \n                animation:GetParent():Show()\n            end\n            \n            local onPlayHideAnimation = function (animation)\n                --stop the show animation if it's playing\n                if (animation:GetParent():GetParent().ShowAnimation:IsPlaying()) then\n                    animation:GetParent():GetParent().ShowAnimation:Stop()\n                end\n            end        \n            local onStopHideAnimation = function (animation)\n                animation:GetParent():Hide()       \n            end\n            \n            local createAnimations = function (comboPoint)\n                --on show\n                comboPoint.ShowAnimation = Plater:CreateAnimationHub (comboPoint.comboPointTexture, onPlayShowAnimation, nil)\n                Plater:CreateAnimation (comboPoint.ShowAnimation, \"scale\", 1, 0.1, 0, 0, 1, 1)\n                Plater:CreateAnimation (comboPoint.ShowAnimation, \"alpha\", 1, 0.1, .5, 1)\n                Plater:CreateAnimation (comboPoint.ShowAnimation, \"scale\", 2, 0.1, 1.2, 1.2, 1, 1)\n                \n                --on hide\n                comboPoint.HideAnimation = Plater:CreateAnimationHub (comboPoint.comboPointTexture, onPlayHideAnimation, onStopHideAnimation)\n                Plater:CreateAnimation (comboPoint.HideAnimation, \"scale\", 1, 0.1, 1, 1, 0, 0)\n                Plater:CreateAnimation (comboPoint.HideAnimation, \"alpha\", 1, 0.1, 1, 0)\n            end\n            \n            --build combo point frame        \n            for i =1, 10 do \n                local f = CreateFrame (\"frame\", nil, envTable.ComboPointFrame)\n                f:SetSize (sizes.width, sizes.height)\n                tinsert (envTable.ComboPoints, f)\n                tinsert (unitFrame.PlaterComboPointFrame.ComboPointFramesPool, f)\n                \n                local backgroundTexture = f:CreateTexture (nil, \"background\")\n                backgroundTexture:SetTexture (textures.backgroundTexture)\n                backgroundTexture:SetTexCoord (unpack (textures.backgroundTexCoords))\n                backgroundTexture:SetSize (sizes.width, sizes.height)\n                backgroundTexture:SetPoint (\"center\")\n                \n                local comboPointTexture = f:CreateTexture (nil, \"artwork\")\n                comboPointTexture:SetTexture (textures.comboPointTexture)\n                comboPointTexture:SetTexCoord (unpack (textures.comboPointTexCoords))\n                \n                comboPointTexture:SetSize (sizes.width, sizes.height)\n                comboPointTexture:SetPoint (\"center\")\n                comboPointTexture:Hide()            \n                \n                f.IsActive = false\n                \n                f.backgroundTexture = backgroundTexture\n                f.comboPointTexture = comboPointTexture\n                \n                createAnimations (f)\n            end\n            \n        else\n            envTable.ComboPointFrame = unitFrame.PlaterComboPointFrame\n            envTable.ComboPointFrame:SetScale (sizes.scale)\n            envTable.ComboPoints = unitFrame.PlaterComboPointFrame.ComboPointFramesPool\n            \n        end            \n        \n        envTable.ComboPointFrame:SetFrameLevel (frameLevel)\n        envTable.ComboPointFrame:SetFrameStrata (frameStrata)\n        \n        function envTable.UpdateComboPoints()\n            local comboPoints = UnitPower (\"player\", Enum.PowerType.ComboPoints)\n            \n            for i = 1, envTable.TotalComboPoints do\n                local thisComboPoint = envTable.ComboPoints [i]\n                \n                if (i <= comboPoints ) then\n                    --combo point enabled\n                    if (not thisComboPoint.IsActive) then\n                        thisComboPoint.ShowAnimation:Play()\n                        thisComboPoint.IsActive = true\n                        \n                    end\n                    \n                else\n                    --combo point disabled\n                    if (thisComboPoint.IsActive) then\n                        thisComboPoint.HideAnimation:Play()\n                        thisComboPoint.IsActive = false\n                        \n                    end\n                end\n            end\n            \n            \n        end\n        \n        function envTable.UpdateComboPointAmount()\n            local namePlateWidth = Plater.db.profile.plate_config.enemynpc.health_incombat[1]\n            local comboPoints = UnitPowerMax (\"player\", Enum.PowerType.ComboPoints)\n            local reservedSpace = namePlateWidth / comboPoints\n            \n            --store the total amount of combo points\n            envTable.TotalComboPoints = comboPoints\n            \n            --update anchor frame\n            envTable.ComboPointFrame:SetWidth (namePlateWidth)\n            envTable.ComboPointFrame:SetHeight (20)\n            envTable.ComboPointFrame:ClearAllPoints()\n            for i = 1, #anchors do\n                local anchor = anchors[i]\n                envTable.ComboPointFrame:SetPoint (unpack (anchor))\n            end        \n            \n            --\n            for i = 1, #envTable.ComboPoints do\n                envTable.ComboPoints[i]:Hide()\n                envTable.ComboPoints[i]:ClearAllPoints()\n            end\n            \n            for i = 1, comboPoints do\n                local comboPoint = envTable.ComboPoints[i]\n                comboPoint:SetPoint (\"left\", envTable.ComboPointFrame, \"left\", reservedSpace * (i-1), 0)\n                comboPoint:Show()\n            end\n            \n            envTable.LastUpdate = GetTime()\n            \n            envTable.UpdateComboPoints()\n        end\n        \n        --initialize\n        envTable.UpdateComboPointAmount()\n        envTable.ComboPointFrame:Hide()\n    end\n    \n    \nend",
					},
					["Author"] = "Izimode-Azralon",
					["LastHookEdited"] = "Constructor",
					["Desc"] = "Show combo points above the nameplate for Druid Feral and Rogues.",
					["Hooks"] = {
						["Nameplate Created"] = "function (self, unitId, unitFrame, envTable)\n    \n    --run constructor!\n    --constructor is executed only once when any script of the hook runs.\n    \nend\n\n\n",
						["Nameplate Added"] = "function (self, unitId, unitFrame, envTable)\n    \n    --check if need update the amount of combo points shown\n    if (envTable.LastPlayerTalentUpdate > envTable.LastUpdate) then\n        envTable.UpdateComboPointAmount()\n    end    \n    \n    if (unitFrame.namePlateIsTarget and not unitFrame.IsSelf) then\n        envTable.ComboPointFrame:Show()\n        envTable.UpdateComboPoints()\n        \n    else\n        envTable.ComboPointFrame:Hide()\n    end    \n    \nend\n\n\n",
						["Target Changed"] = "function (self, unitId, unitFrame, envTable)\n    \n    --check if this nameplate is the current target\n    if (unitFrame.namePlateIsTarget and not unitFrame.IsSelf) then\n        envTable.ComboPointFrame:Show()\n        \n    else\n        envTable.ComboPointFrame:Hide()\n    end\n    \nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
						["Player Power Update"] = "function (self, unitId, unitFrame, envTable)\n    \n    if (unitFrame.namePlateIsTarget and not unitFrame.IsSelf) then\n        envTable.UpdateComboPoints()\n    end\n    \n    \nend\n\n\n\n\n\n\n",
						["Nameplate Removed"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.ComboPointFrame:Hide()\n    \nend\n\n\n",
						["Destructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.ComboPointFrame:Hide()\n    \nend\n\n\n\n\n",
						["Player Talent Update"] = "function (self, unitId, unitFrame, envTable)\n    \n    --update the amount of comboo points shown when the player changes talents or specialization\n    envTable.UpdateComboPointAmount()\n    \n    --save the time of the last talent change\n    envTable.LastPlayerTalentUpdate = GetTime()\n    \n    \nend\n\n\n",
						["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --settings\n    local anchors = {\n        {\"bottom\", unitFrame.healthBar, \"top\", 0, 24},\n    }\n    \n    local sizes = {\n        width = 12,\n        height = 12,\n        scale = 1,\n    }\n    \n    local textures = {\n        backgroundTexture = [[Interface\\PLAYERFRAME\\ClassOverlayComboPoints]],\n        backgroundTexCoords = {78/128, 98/128, 21/64, 41/64},\n        \n        comboPointTexture = [[Interface\\PLAYERFRAME\\ClassOverlayComboPoints]],\n        comboPointTexCoords = {100/128, 120/128, 21/64, 41/64},\n    }\n    \n    local frameLevel = 1000\n    local frameStrata = \"high\"    \n    \n    --private\n    do\n        --store combo points frames on this table\n        envTable.ComboPoints = {}\n        --save when the player changed talents or spec\n        envTable.LastPlayerTalentUpdate = GetTime()\n        --save when this nameplate got a combo point amount and alignment update        \n        \n        --build combo points frame anchor (combo point are anchored to this)\n        if (not unitFrame.PlaterComboPointFrame) then\n            local hostFrame = CreateFrame (\"frame\", nil, unitFrame)\n            hostFrame.ComboPointFramesPool = {}\n            unitFrame.PlaterComboPointFrame = hostFrame\n            envTable.ComboPointFrame = hostFrame\n            \n            --DetailsFramework:ApplyStandardBackdrop (envTable.ComboPointFrame) --debug anchor size\n            \n            --animations\n            local onPlayShowAnimation = function (animation)\n                --stop the hide animation if it's playing\n                if (animation:GetParent():GetParent().HideAnimation:IsPlaying()) then\n                    animation:GetParent():GetParent().HideAnimation:Stop()\n                end\n                \n                animation:GetParent():Show()\n            end\n            \n            local onPlayHideAnimation = function (animation)\n                --stop the show animation if it's playing\n                if (animation:GetParent():GetParent().ShowAnimation:IsPlaying()) then\n                    animation:GetParent():GetParent().ShowAnimation:Stop()\n                end\n            end        \n            local onStopHideAnimation = function (animation)\n                animation:GetParent():Hide()       \n            end\n            \n            local createAnimations = function (comboPoint)\n                --on show\n                comboPoint.ShowAnimation = Plater:CreateAnimationHub (comboPoint.comboPointTexture, onPlayShowAnimation, nil)\n                Plater:CreateAnimation (comboPoint.ShowAnimation, \"scale\", 1, 0.1, 0, 0, 1, 1)\n                Plater:CreateAnimation (comboPoint.ShowAnimation, \"alpha\", 1, 0.1, .5, 1)\n                Plater:CreateAnimation (comboPoint.ShowAnimation, \"scale\", 2, 0.1, 1.2, 1.2, 1, 1)\n                \n                --on hide\n                comboPoint.HideAnimation = Plater:CreateAnimationHub (comboPoint.comboPointTexture, onPlayHideAnimation, onStopHideAnimation)\n                Plater:CreateAnimation (comboPoint.HideAnimation, \"scale\", 1, 0.1, 1, 1, 0, 0)\n                Plater:CreateAnimation (comboPoint.HideAnimation, \"alpha\", 1, 0.1, 1, 0)\n            end\n            \n            --build combo point frame        \n            for i =1, 10 do \n                local f = CreateFrame (\"frame\", nil, envTable.ComboPointFrame)\n                f:SetSize (sizes.width, sizes.height)\n                tinsert (envTable.ComboPoints, f)\n                tinsert (unitFrame.PlaterComboPointFrame.ComboPointFramesPool, f)\n                \n                local backgroundTexture = f:CreateTexture (nil, \"background\")\n                backgroundTexture:SetTexture (textures.backgroundTexture)\n                backgroundTexture:SetTexCoord (unpack (textures.backgroundTexCoords))\n                backgroundTexture:SetSize (sizes.width, sizes.height)\n                backgroundTexture:SetPoint (\"center\")\n                \n                local comboPointTexture = f:CreateTexture (nil, \"artwork\")\n                comboPointTexture:SetTexture (textures.comboPointTexture)\n                comboPointTexture:SetTexCoord (unpack (textures.comboPointTexCoords))\n                \n                comboPointTexture:SetSize (sizes.width, sizes.height)\n                comboPointTexture:SetPoint (\"center\")\n                comboPointTexture:Hide()            \n                \n                f.IsActive = false\n                \n                f.backgroundTexture = backgroundTexture\n                f.comboPointTexture = comboPointTexture\n                \n                createAnimations (f)\n            end\n            \n        else\n            envTable.ComboPointFrame = unitFrame.PlaterComboPointFrame\n            envTable.ComboPointFrame:SetScale (sizes.scale)\n            envTable.ComboPoints = unitFrame.PlaterComboPointFrame.ComboPointFramesPool\n            \n        end            \n        \n        envTable.ComboPointFrame:SetFrameLevel (frameLevel)\n        envTable.ComboPointFrame:SetFrameStrata (frameStrata)\n        \n        function envTable.UpdateComboPoints()\n            local comboPoints = UnitPower (\"player\", Enum.PowerType.ComboPoints)\n            \n            for i = 1, envTable.TotalComboPoints do\n                local thisComboPoint = envTable.ComboPoints [i]\n                \n                if (i <= comboPoints ) then\n                    --combo point enabled\n                    if (not thisComboPoint.IsActive) then\n                        thisComboPoint.ShowAnimation:Play()\n                        thisComboPoint.IsActive = true\n                        \n                    end\n                    \n                else\n                    --combo point disabled\n                    if (thisComboPoint.IsActive) then\n                        thisComboPoint.HideAnimation:Play()\n                        thisComboPoint.IsActive = false\n                        \n                    end\n                end\n            end\n            \n            \n        end\n        \n        function envTable.UpdateComboPointAmount()\n            local namePlateWidth = Plater.db.profile.plate_config.enemynpc.health_incombat[1]\n            local comboPoints = UnitPowerMax (\"player\", Enum.PowerType.ComboPoints)\n            local reservedSpace = namePlateWidth / comboPoints\n            \n            --store the total amount of combo points\n            envTable.TotalComboPoints = comboPoints\n            \n            --update anchor frame\n            envTable.ComboPointFrame:SetWidth (namePlateWidth)\n            envTable.ComboPointFrame:SetHeight (20)\n            envTable.ComboPointFrame:ClearAllPoints()\n            for i = 1, #anchors do\n                local anchor = anchors[i]\n                envTable.ComboPointFrame:SetPoint (unpack (anchor))\n            end        \n            \n            --\n            for i = 1, #envTable.ComboPoints do\n                envTable.ComboPoints[i]:Hide()\n                envTable.ComboPoints[i]:ClearAllPoints()\n            end\n            \n            for i = 1, comboPoints do\n                local comboPoint = envTable.ComboPoints[i]\n                comboPoint:SetPoint (\"left\", envTable.ComboPointFrame, \"left\", reservedSpace * (i-1), 0)\n                comboPoint:Show()\n            end\n            \n            envTable.LastUpdate = GetTime()\n            \n            envTable.UpdateComboPoints()\n        end\n        \n        --initialize\n        envTable.UpdateComboPointAmount()\n        envTable.ComboPointFrame:Hide()\n    end\n    \n    \nend",
					},
					["__TrashAt"] = 1589028042,
					["Name"] = "Combo Points [Plater]",
					["PlaterCore"] = 1,
					["LoadConditions"] = {
						["talent"] = {
						},
						["group"] = {
						},
						["class"] = {
							["Enabled"] = true,
							["DRUID"] = true,
							["ROGUE"] = true,
						},
						["map_ids"] = {
						},
						["role"] = {
						},
						["pvptalent"] = {
						},
						["affix"] = {
						},
						["race"] = {
						},
						["encounter_ids"] = {
						},
						["spec"] = {
							["103"] = true,
							["Enabled"] = true,
						},
					},
					["Time"] = 1589028010,
					["Icon"] = 135426,
					["Prio"] = 99,
				}, -- [3]
			},
			["script_auto_imported"] = {
				["Cast - Small Alert"] = 4,
				["Aura - Invalidate Unit"] = 1,
				["Aura - Buff Alert"] = 4,
				["Cast - Very Important"] = 2,
				["Aura Border Color"] = 1,
				["Aura - Blink Time Left"] = 1,
				["Explosion Affix M+"] = 3,
				["Aura - Debuff Alert"] = 3,
				["Unit Power"] = 1,
				["Cast - Frontal Cone"] = 2,
				["Fixate"] = 3,
				["Unit - Important"] = 5,
				["Color Change"] = 1,
				["Cast - Big Alert"] = 5,
				["Fixate On You"] = 2,
			},
			["target_highlight_color"] = {
				nil, -- [1]
				0.46274509803922, -- [2]
			},
			["extra_icon_anchor"] = {
				["y"] = 0,
			},
			["resources"] = {
				["y_offset_target"] = 17.79999542236328,
				["y_offset_target_withauras"] = 36,
			},
			["extra_icon_auras"] = {
				277242, -- [1]
			},
			["castbar_target_font"] = "Accidental Presidency",
			["semver"] = "1.0.2",
			["cast_statusbar_texture"] = "PlaterTexture",
			["aura_cooldown_edge_texture"] = "Interface\\GLUES\\loadingOld",
			["pet_height_scale"] = 0.94999998807907,
			["first_run3"] = true,
			["transparency_behavior"] = 4,
			["ui_parent_scale_tune"] = 1.124999991618097,
			["aura_stack_color"] = {
				nil, -- [1]
				0.94509803921569, -- [2]
				0.93725490196078, -- [3]
			},
			["aura_consolidate"] = true,
			["health_statusbar_bgtexture"] = "PlaterBackground",
			["indicator_raidmark_anchor"] = {
				["x"] = -34.02999877929688,
			},
			["health_statusbar_texture"] = "DGround",
			["hook_auto_imported"] = {
				["Targetting Alpha"] = 3,
				["Dont Have Aura"] = 1,
				["Players Targetting Amount"] = 4,
				["Color Automation"] = 1,
				["Bwonsamdi Reaping"] = 1,
				["Jaina Encounter"] = 6,
				["Blockade Encounter"] = 1,
				["Aura Reorder"] = 1,
				["Reorder Nameplate"] = 3,
				["Extra Border"] = 2,
				["Hide Neutral Units"] = 1,
				["Combo Points"] = 3,
				["Target Color"] = 3,
				["Execute Range"] = 1,
				["Attacking Specific Unit"] = 1,
			},
			["castbar_target_show"] = true,
			["update_throttle"] = 0.24999998509884,
			["minor_width_scale"] = 0.89999997615814,
			["captured_spells"] = {
				[269279] = {
					["type"] = "BUFF",
					["source"] = "万物咸覩-凤凰之神",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[272090] = {
					["type"] = "BUFF",
					["source"] = "蛋蛋宝宝猪-格瑞姆巴托",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[18499] = {
					["type"] = "BUFF",
					["source"] = "千年老妖丶",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[228537] = {
					["source"] = "万物咸覩-凤凰之神",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[295855] = {
					["type"] = "BUFF",
					["source"] = "开心的木头-布兰卡德",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[295856] = {
					["source"] = "艾泽拉斯守护者",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 152396,
				},
				[269029] = {
					["encounterID"] = 2109,
					["source"] = "恐怖船长洛克伍德",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 129208,
				},
				[266091] = {
					["type"] = "BUFF",
					["source"] = "丫丫小猫-血顶",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[29893] = {
					["source"] = "丫丫小猫-血顶",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[109128] = {
					["type"] = "BUFF",
					["source"] = "千年老妖丶",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[315787] = {
					["type"] = "BUFF",
					["source"] = "丫丫小猫-血顶",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[317065] = {
					["type"] = "BUFF",
					["source"] = "开心的木头-布兰卡德",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[319237] = {
					["type"] = "BUFF",
					["source"] = "千年老妖丶",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[268904] = {
					["type"] = "BUFF",
					["source"] = "万物咸覩-凤凰之神",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[300714] = {
					["type"] = "BUFF",
					["source"] = "丫丫小猫-血顶",
					["encounterID"] = 2109,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[268905] = {
					["type"] = "BUFF",
					["source"] = "开心的木头-布兰卡德",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[34428] = {
					["source"] = "千年老妖丶",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[768] = {
					["type"] = "BUFF",
					["source"] = "风起春城暮",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[116858] = {
					["source"] = "丫丫小猫-血顶",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[318219] = {
					["type"] = "BUFF",
					["source"] = "开心的木头-布兰卡德",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[314387] = {
					["type"] = "BUFF",
					["source"] = "恶毒增生",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 161408,
				},
				[195072] = {
					["source"] = "万物咸覩-凤凰之神",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[80354] = {
					["type"] = "DEBUFF",
					["source"] = "刀锋无极-血色十字军",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[2565] = {
					["source"] = "千年老妖丶",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[138927] = {
					["type"] = "BUFF",
					["source"] = "绝版疯牛-埃德萨拉",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[126664] = {
					["source"] = "千年老妖丶",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[6673] = {
					["type"] = "BUFF",
					["source"] = "千年老妖丶",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[774] = {
					["type"] = "BUFF",
					["source"] = "风起春城暮",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[3600] = {
					["type"] = "DEBUFF",
					["source"] = "地缚图腾",
					["encounterID"] = 2109,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 2630,
				},
				[314392] = {
					["type"] = "DEBUFF",
					["source"] = "恶毒增生",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 161408,
				},
				[275429] = {
					["type"] = "BUFF",
					["source"] = "丫丫小猫-血顶",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[276068] = {
					["encounterID"] = 2099,
					["source"] = "哈达尔·黑渊",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 128651,
				},
				[290121] = {
					["type"] = "BUFF",
					["source"] = "千年老妖丶",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[201846] = {
					["type"] = "BUFF",
					["source"] = "灬蘫灬-血色十字军",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[113858] = {
					["type"] = "BUFF",
					["source"] = "丫丫小猫-血顶",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[279902] = {
					["type"] = "BUFF",
					["source"] = "万物咸覩-凤凰之神",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[5176] = {
					["source"] = "风起春城暮",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[43308] = {
					["type"] = "BUFF",
					["source"] = "Rikii-冰风岗",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[279648] = {
					["type"] = "BUFF",
					["source"] = "风起春城暮",
					["encounterID"] = 2109,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[3110] = {
					["source"] = "盖尔尼克",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 416,
				},
				[314397] = {
					["source"] = "乌尔格斯，勇士噬灭者",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 161124,
				},
				[278244] = {
					["source"] = "风起春城暮",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[118905] = {
					["source"] = "电能图腾",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 61245,
				},
				[210152] = {
					["type"] = "BUFF",
					["source"] = "万物咸覩-凤凰之神",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[316826] = {
					["source"] = "扭曲的附肢",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 162764,
				},
				[22812] = {
					["type"] = "BUFF",
					["source"] = "风起春城暮",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[188499] = {
					["type"] = "BUFF",
					["source"] = "万物咸覩-凤凰之神",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[783] = {
					["source"] = "风起春城暮",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[40120] = {
					["type"] = "BUFF",
					["source"] = "风起春城暮",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[48265] = {
					["type"] = "BUFF",
					["source"] = "叫我可爱虎-燃烧之刃",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[23922] = {
					["source"] = "千年老妖丶",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[284277] = {
					["type"] = "BUFF",
					["source"] = "叫我可爱虎-燃烧之刃",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[108271] = {
					["type"] = "BUFF",
					["source"] = "开心的木头-布兰卡德",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[193786] = {
					["source"] = "灬蘫灬-血色十字军",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[297412] = {
					["type"] = "BUFF",
					["source"] = "风起春城暮",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[6262] = {
					["source"] = "风起春城暮",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[314531] = {
					["source"] = "贪婪的血肉魔",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 161502,
				},
				[292686] = {
					["type"] = "BUFF",
					["source"] = "万物咸覩-凤凰之神",
					["encounterID"] = 2097,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[304056] = {
					["type"] = "BUFF",
					["source"] = "风起春城暮",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[296003] = {
					["type"] = "BUFF",
					["source"] = "保护我方奶骑-埃德萨拉",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[21562] = {
					["type"] = "BUFF",
					["source"] = "保护我方奶骑-埃德萨拉",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[118779] = {
					["type"] = "BUFF",
					["source"] = "千年老妖丶",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[279742] = {
					["type"] = "BUFF",
					["source"] = "保护我方奶骑-埃德萨拉",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[6789] = {
					["source"] = "丫丫小猫-血顶",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[258883] = {
					["type"] = "DEBUFF",
					["source"] = "万物咸覩-凤凰之神",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[157331] = {
					["source"] = "原始风暴元素",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 77942,
				},
				[6795] = {
					["source"] = "风起春城暮",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[314406] = {
					["source"] = "纺虚者玛熙尔",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 161241,
				},
				[257168] = {
					["source"] = "铁潮掠夺者",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 135258,
				},
				[312107] = {
					["type"] = "BUFF",
					["source"] = "千年老妖丶",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[19483] = {
					["type"] = "BUFF",
					["source"] = "地狱火爪牙",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 89,
				},
				[77472] = {
					["source"] = "蛋蛋宝宝猪-格瑞姆巴托",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[288675] = {
					["type"] = "BUFF",
					["source"] = "蛋蛋宝宝猪-格瑞姆巴托",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[316835] = {
					["type"] = "DEBUFF",
					["source"] = "扭曲的附肢",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 162764,
				},
				[297034] = {
					["type"] = "BUFF",
					["source"] = "爷就是法-死亡之翼",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[297162] = {
					["type"] = "BUFF",
					["source"] = "开心的木头-布兰卡德",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[107570] = {
					["source"] = "千年老妖丶",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[300612] = {
					["type"] = "BUFF",
					["source"] = "风起春城暮",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[1064] = {
					["source"] = "蛋蛋宝宝猪-格瑞姆巴托",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[317859] = {
					["type"] = "BUFF",
					["source"] = "万物咸覩-凤凰之神",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[157153] = {
					["source"] = "蛋蛋宝宝猪-格瑞姆巴托",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[271103] = {
					["type"] = "BUFF",
					["source"] = "千年老妖丶",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[295248] = {
					["type"] = "BUFF",
					["source"] = "万物咸覩-凤凰之神",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[5302] = {
					["type"] = "BUFF",
					["source"] = "千年老妖丶",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[297037] = {
					["type"] = "BUFF",
					["source"] = "于二囍-格瑞姆巴托",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[73685] = {
					["type"] = "BUFF",
					["source"] = "蛋蛋宝宝猪-格瑞姆巴托",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[5246] = {
					["source"] = "千年老妖丶",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[22842] = {
					["type"] = "BUFF",
					["source"] = "风起春城暮",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[315176] = {
					["type"] = "DEBUFF",
					["source"] = "丫丫小猫-血顶",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[314467] = {
					["source"] = "爆炸甲虫",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 161437,
				},
				[316744] = {
					["type"] = "BUFF",
					["source"] = "蛋蛋宝宝猪-格瑞姆巴托",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[132168] = {
					["type"] = "DEBUFF",
					["source"] = "千年老妖丶",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[279793] = {
					["type"] = "BUFF",
					["source"] = "风起春城暮",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[227723] = {
					["type"] = "BUFF",
					["source"] = "刀锋无极-血色十字军",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[2908] = {
					["source"] = "风起春城暮",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[297168] = {
					["type"] = "BUFF",
					["source"] = "开心的木头-布兰卡德",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[61882] = {
					["source"] = "开心的木头-布兰卡德",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[279028] = {
					["type"] = "BUFF",
					["source"] = "开心的木头-布兰卡德",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[132169] = {
					["type"] = "DEBUFF",
					["source"] = "千年老妖丶",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[188443] = {
					["source"] = "开心的木头-布兰卡德",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[1850] = {
					["type"] = "BUFF",
					["source"] = "风起春城暮",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[279029] = {
					["type"] = "BUFF",
					["source"] = "开心的木头-布兰卡德",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[312372] = {
					["type"] = "BUFF",
					["source"] = "开心的木头-布兰卡德",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[298837] = {
					["type"] = "BUFF",
					["source"] = "于二囍-格瑞姆巴托",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[275836] = {
					["type"] = "DEBUFF",
					["source"] = "艾什凡入侵者",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 137516,
				},
				[274942] = {
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[1459] = {
					["type"] = "BUFF",
					["source"] = "爷就是法-死亡之翼",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[289277] = {
					["type"] = "BUFF",
					["source"] = "爷就是法-死亡之翼",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[318378] = {
					["type"] = "BUFF",
					["source"] = "丫丫小猫-血顶",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[200389] = {
					["type"] = "BUFF",
					["source"] = "风起春城暮",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[185123] = {
					["source"] = "万物咸覩-凤凰之神",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[1066] = {
					["type"] = "BUFF",
					["source"] = "风起春城暮",
					["encounterID"] = 2100,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[33917] = {
					["encounterID"] = 2100,
					["source"] = "风起春城暮",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[165961] = {
					["type"] = "BUFF",
					["source"] = "风起春城暮",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[279416] = {
					["type"] = "DEBUFF",
					["source"] = "千年老妖丶",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[279033] = {
					["type"] = "BUFF",
					["source"] = "开心的木头-布兰卡德",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[270590] = {
					["encounterID"] = 2100,
					["source"] = "攻城恐魔",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 140447,
				},
				[1604] = {
					["type"] = "DEBUFF",
					["source"] = "攻城恐魔",
					["encounterID"] = 2100,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 140447,
				},
				[295258] = {
					["type"] = "BUFF",
					["source"] = "万物咸覩-凤凰之神",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[164812] = {
					["type"] = "DEBUFF",
					["source"] = "风起春城暮",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[46968] = {
					["source"] = "千年老妖丶",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[298197] = {
					["type"] = "BUFF",
					["source"] = "千年老妖丶",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[298836] = {
					["type"] = "BUFF",
					["source"] = "Rikii-冰风岗",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[275014] = {
					["type"] = "DEBUFF",
					["source"] = "维克戈斯",
					["encounterID"] = 2100,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 128652,
				},
				[313352] = {
					["source"] = "千年老妖丶",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[52174] = {
					["source"] = "千年老妖丶",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[260881] = {
					["type"] = "BUFF",
					["source"] = "开心的木头-布兰卡德",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[315573] = {
					["type"] = "BUFF",
					["source"] = "风起春城暮",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[203651] = {
					["source"] = "风起春城暮",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[272528] = {
					["source"] = "艾什凡狙击手",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 128967,
				},
				[269456] = {
					["encounterID"] = 2100,
					["source"] = "维克戈斯",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 128652,
				},
				[107574] = {
					["type"] = "BUFF",
					["source"] = "千年老妖丶",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[281721] = {
					["type"] = "DEBUFF",
					["source"] = "万物咸覩-凤凰之神",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[20484] = {
					["encounterID"] = 2097,
					["source"] = "风起春城暮",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[319919] = {
					["type"] = "BUFF",
					["source"] = "于二囍-格瑞姆巴托",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[145205] = {
					["source"] = "风起春城暮",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[272888] = {
					["type"] = "BUFF",
					["source"] = "艾什凡破坏者",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 137517,
				},
				[298841] = {
					["type"] = "BUFF",
					["source"] = "叫我可爱虎-燃烧之刃",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[273930] = {
					["source"] = "库尔提拉斯步兵",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 141495,
				},
				[274569] = {
					["source"] = "水鼠帮唤风者",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 129367,
				},
				[275835] = {
					["type"] = "BUFF",
					["source"] = "艾什凡入侵者",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 137516,
				},
				[192090] = {
					["type"] = "DEBUFF",
					["source"] = "风起春城暮",
					["encounterID"] = 2100,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[48438] = {
					["type"] = "BUFF",
					["source"] = "风起春城暮",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[217832] = {
					["source"] = "万物咸覩-凤凰之神",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[54861] = {
					["type"] = "BUFF",
					["source"] = "千年老妖丶",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[257882] = {
					["encounterID"] = 2099,
					["source"] = "哈达尔·黑渊",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 128651,
				},
				[272144] = {
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[272581] = {
					["source"] = "水鼠帮唤风者",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 129367,
				},
				[157982] = {
					["type"] = "BUFF",
					["source"] = "风起春城暮",
					["encounterID"] = 2097,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[33763] = {
					["source"] = "风起春城暮",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[20243] = {
					["source"] = "千年老妖丶",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[295838] = {
					["type"] = "DEBUFF",
					["source"] = "开心的木头-布兰卡德",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[272827] = {
					["source"] = "水鼠帮劫掠者",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 135241,
				},
				[131347] = {
					["source"] = "万物咸覩-凤凰之神",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[188196] = {
					["source"] = "开心的木头-布兰卡德",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[196555] = {
					["type"] = "BUFF",
					["source"] = "万物咸覩-凤凰之神",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[240446] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[688] = {
					["source"] = "丫丫小猫-血顶",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[113899] = {
					["source"] = "恶魔传送门",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 59262,
				},
				[257169] = {
					["source"] = "水鼠帮歼灭者",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 135245,
				},
				[313923] = {
					["source"] = "丫丫小猫-血顶",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[113900] = {
					["source"] = "恶魔传送门",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 59271,
				},
				[315161] = {
					["type"] = "DEBUFF",
					["source"] = "万物咸覩-凤凰之神",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[162264] = {
					["type"] = "BUFF",
					["source"] = "万物咸覩-凤凰之神",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[188389] = {
					["source"] = "开心的木头-布兰卡德",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[8936] = {
					["type"] = "BUFF",
					["source"] = "风起春城暮",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[268774] = {
					["encounterID"] = 2109,
					["source"] = "千年老妖丶",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[314308] = {
					["source"] = "乌尔格斯，勇士噬灭者",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 161124,
				},
				[203975] = {
					["type"] = "BUFF",
					["source"] = "绝版疯牛-埃德萨拉",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[268998] = {
					["type"] = "BUFF",
					["source"] = "风起春城暮",
					["encounterID"] = 2109,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[29166] = {
					["type"] = "BUFF",
					["source"] = "风起春城暮",
					["encounterID"] = 2109,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[314309] = {
					["source"] = "乌尔格斯，勇士噬灭者",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 161124,
				},
				[257886] = {
					["type"] = "DEBUFF",
					["encounterID"] = 2099,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[273685] = {
					["type"] = "BUFF",
					["source"] = "千年老妖丶",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[2645] = {
					["type"] = "BUFF",
					["source"] = "开心的木头-布兰卡德",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[301308] = {
					["encounterID"] = 2097,
					["source"] = "开心的木头-布兰卡德",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[314565] = {
					["type"] = "DEBUFF",
					["source"] = "腐蚀者之血",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 161244,
				},
				[5215] = {
					["type"] = "BUFF",
					["source"] = "风起春城暮",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[164815] = {
					["type"] = "DEBUFF",
					["source"] = "风起春城暮",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[272422] = {
					["source"] = "艾什凡观察员",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 138255,
				},
				[32752] = {
					["type"] = "BUFF",
					["source"] = "丫丫小猫-血顶",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[6552] = {
					["source"] = "千年老妖丶",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[182387] = {
					["type"] = "DEBUFF",
					["source"] = "开心的木头-布兰卡德",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[275826] = {
					["source"] = "艾什凡指挥官",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 128969,
				},
				[348] = {
					["source"] = "丫丫小猫-血顶",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[12975] = {
					["type"] = "BUFF",
					["source"] = "千年老妖丶",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[272874] = {
					["source"] = "艾什凡指挥官",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 128969,
				},
				[260954] = {
					["encounterID"] = 2097,
					["source"] = "拜恩比吉中士",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 128649,
				},
				[250878] = {
					["type"] = "BUFF",
					["source"] = "丫丫小猫-血顶",
					["encounterID"] = 2097,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[53390] = {
					["type"] = "BUFF",
					["source"] = "蛋蛋宝宝猪-格瑞姆巴托",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[6572] = {
					["source"] = "千年老妖丶",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[97463] = {
					["type"] = "BUFF",
					["source"] = "千年老妖丶",
					["encounterID"] = 2097,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[257292] = {
					["type"] = "DEBUFF",
					["source"] = "库尔提拉斯先锋",
					["encounterID"] = 2097,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 132481,
				},
				[81262] = {
					["type"] = "BUFF",
					["source"] = "百花齐放",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 47649,
				},
				[277965] = {
					["type"] = "DEBUFF",
					["source"] = "重型军火",
					["encounterID"] = 2097,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 136975,
				},
				[51490] = {
					["source"] = "开心的木头-布兰卡德",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[272542] = {
					["source"] = "艾什凡狙击手",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 128967,
				},
				[147833] = {
					["type"] = "BUFF",
					["source"] = "千年老妖丶",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[206151] = {
					["type"] = "DEBUFF",
					["source"] = "万物咸覩-凤凰之神",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[260924] = {
					["encounterID"] = 2097,
					["source"] = "拜恩比吉中士",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 128649,
				},
				[198103] = {
					["source"] = "开心的木头-布兰卡德",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[61295] = {
					["source"] = "蛋蛋宝宝猪-格瑞姆巴托",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[278931] = {
					["type"] = "BUFF",
					["source"] = "丫丫小猫-血顶",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[198013] = {
					["type"] = "BUFF",
					["source"] = "万物咸覩-凤凰之神",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[297039] = {
					["type"] = "BUFF",
					["source"] = "开心的木头-布兰卡德",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[30283] = {
					["source"] = "丫丫小猫-血顶",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[8143] = {
					["source"] = "开心的木头-布兰卡德",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[280210] = {
					["type"] = "BUFF",
					["source"] = "千年老妖丶",
					["encounterID"] = 2097,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[266030] = {
					["type"] = "BUFF",
					["source"] = "丫丫小猫-血顶",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[118337] = {
					["type"] = "BUFF",
					["source"] = "原始土元素",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 61056,
				},
				[102342] = {
					["source"] = "风起春城暮",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[272546] = {
					["source"] = "水鼠帮海盗",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 129366,
				},
				[272471] = {
					["type"] = "BUFF",
					["source"] = "未知目标",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 138255,
				},
				[273714] = {
					["type"] = "BUFF",
					["source"] = "千年老妖丶",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[157736] = {
					["type"] = "DEBUFF",
					["source"] = "丫丫小猫-血顶",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[298225] = {
					["type"] = "BUFF",
					["source"] = "丫丫小猫-血顶",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[300761] = {
					["type"] = "BUFF",
					["source"] = "风起春城暮",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[257042] = {
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[201427] = {
					["source"] = "万物咸覩-凤凰之神",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[319241] = {
					["type"] = "DEBUFF",
					["source"] = "万物咸覩-凤凰之神",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[316007] = {
					["type"] = "BUFF",
					["source"] = "风起春城暮",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[272421] = {
					["type"] = "DEBUFF",
					["source"] = "艾什凡观察员",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 138255,
				},
				[209859] = {
					["type"] = "BUFF",
					["source"] = "库尔提拉斯步兵",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 141495,
				},
				[117828] = {
					["type"] = "BUFF",
					["source"] = "丫丫小猫-血顶",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[257063] = {
					["source"] = "库尔提拉斯护潮者",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 141284,
				},
				[314411] = {
					["source"] = "纺虚者玛熙尔",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 161241,
				},
				[279194] = {
					["type"] = "BUFF",
					["source"] = "刀锋无极-血色十字军",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[2825] = {
					["encounterID"] = 2097,
					["source"] = "开心的木头-布兰卡德",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[294966] = {
					["type"] = "BUFF",
					["source"] = "绝版疯牛-埃德萨拉",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[1160] = {
					["source"] = "千年老妖丶",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[355] = {
					["source"] = "千年老妖丶",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[8690] = {
					["source"] = "千年老妖丶",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[296059] = {
					["type"] = "BUFF",
					["source"] = "风起春城暮",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[29722] = {
					["source"] = "丫丫小猫-血顶",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[270661] = {
					["type"] = "BUFF",
					["source"] = "风起春城暮",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[264761] = {
					["type"] = "BUFF",
					["source"] = "绝版疯牛-埃德萨拉",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[308189] = {
					["type"] = "BUFF",
					["source"] = "灬蘫灬-血色十字军",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[212800] = {
					["type"] = "BUFF",
					["source"] = "万物咸覩-凤凰之神",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[209693] = {
					["source"] = "万物咸覩-凤凰之神",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[118345] = {
					["source"] = "原始土元素",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 61056,
				},
				[73920] = {
					["source"] = "蛋蛋宝宝猪-格瑞姆巴托",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[93402] = {
					["source"] = "风起春城暮",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[257641] = {
					["source"] = "库尔提拉斯神射手",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 141285,
				},
				[303344] = {
					["type"] = "BUFF",
					["source"] = "千年老妖丶",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[264764] = {
					["type"] = "BUFF",
					["source"] = "于二囍-格瑞姆巴托",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[303345] = {
					["type"] = "BUFF",
					["source"] = "千年老妖丶",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[192106] = {
					["type"] = "BUFF",
					["source"] = "灬蘫灬-血色十字军",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[127797] = {
					["type"] = "DEBUFF",
					["source"] = "风起春城暮",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[271711] = {
					["type"] = "BUFF",
					["source"] = "千年老妖丶",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[268854] = {
					["type"] = "BUFF",
					["source"] = "万物咸覩-凤凰之神",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[258920] = {
					["type"] = "BUFF",
					["source"] = "万物咸覩-凤凰之神",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[231390] = {
					["type"] = "BUFF",
					["source"] = "雷宁替丁亽-影之哀伤",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[2580] = {
					["type"] = "BUFF",
					["source"] = "千年老妖丶",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[269366] = {
					["encounterID"] = 2100,
					["source"] = "库尔提拉斯工程师",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 139830,
				},
				[287379] = {
					["type"] = "BUFF",
					["source"] = "千年老妖丶",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[285978] = {
					["type"] = "BUFF",
					["source"] = "灬蘫灬-血色十字军",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[269239] = {
					["type"] = "BUFF",
					["source"] = "千年老妖丶",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[268856] = {
					["type"] = "BUFF",
					["source"] = "万物咸覩-凤凰之神",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[102793] = {
					["source"] = "风起春城暮",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[1122] = {
					["source"] = "丫丫小猫-血顶",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[198304] = {
					["source"] = "千年老妖丶",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[314592] = {
					["source"] = "裂魂触须",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 161510,
				},
				[274991] = {
					["encounterID"] = 2100,
					["source"] = "维克戈斯",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 128652,
				},
				[8042] = {
					["source"] = "开心的木头-布兰卡德",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[8921] = {
					["source"] = "风起春城暮",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[328136] = {
					["type"] = "BUFF",
					["source"] = "爷就是法-死亡之翼",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[313445] = {
					["type"] = "DEBUFF",
					["source"] = "严酷之尼奥罗萨尖塔",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 160984,
				},
				[285979] = {
					["type"] = "BUFF",
					["source"] = "蛋蛋宝宝猪-格瑞姆巴托",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[196840] = {
					["source"] = "开心的木头-布兰卡德",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[191634] = {
					["type"] = "BUFF",
					["source"] = "开心的木头-布兰卡德",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[691] = {
					["source"] = "丫丫小猫-血顶",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[273232] = {
					["type"] = "BUFF",
					["source"] = "万物咸覩-凤凰之神",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[198589] = {
					["source"] = "万物咸覩-凤凰之神",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[2383] = {
					["type"] = "BUFF",
					["source"] = "风起春城暮",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[88423] = {
					["source"] = "风起春城暮",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[17962] = {
					["source"] = "丫丫小猫-血顶",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[263806] = {
					["type"] = "BUFF",
					["source"] = "开心的木头-布兰卡德",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[316522] = {
					["type"] = "BUFF",
					["source"] = "丫丫小猫-血顶",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[295310] = {
					["type"] = "BUFF",
					["source"] = "万物咸覩-凤凰之神",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[162794] = {
					["source"] = "万物咸覩-凤凰之神",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[272571] = {
					["source"] = "水鼠帮唤风者",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 129367,
				},
				[251836] = {
					["type"] = "BUFF",
					["source"] = "兰亭叙-埃德萨拉",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[97462] = {
					["encounterID"] = 2097,
					["source"] = "千年老妖丶",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[157375] = {
					["source"] = "原始风暴元素",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 77942,
				},
				[256627] = {
					["source"] = "库尔提拉斯戟兵",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 141283,
				},
				[313088] = {
					["type"] = "BUFF",
					["source"] = "万物咸覩-凤凰之神",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[113942] = {
					["type"] = "DEBUFF",
					["source"] = "丫丫小猫-血顶",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[152108] = {
					["source"] = "丫丫小猫-血顶",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[270657] = {
					["type"] = "BUFF",
					["source"] = "千年老妖丶",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[268230] = {
					["source"] = "艾什凡水手",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 138464,
				},
				[54049] = {
					["source"] = "卢罗恩",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 417,
				},
				[257650] = {
					["type"] = "BUFF",
					["source"] = "拜恩比吉中士",
					["encounterID"] = 2097,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 128649,
				},
				[318227] = {
					["type"] = "BUFF",
					["source"] = "丫丫小猫-血顶",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[296962] = {
					["type"] = "BUFF",
					["source"] = "丫丫小猫-血顶",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[6343] = {
					["source"] = "千年老妖丶",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[22703] = {
					["type"] = "DEBUFF",
					["source"] = "丫丫小猫-血顶",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[111771] = {
					["source"] = "丫丫小猫-血顶",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[273470] = {
					["encounterID"] = 2109,
					["source"] = "恐怖船长洛克伍德",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 129208,
				},
				[314478] = {
					["type"] = "DEBUFF",
					["source"] = "萨姆莱克，混沌唤引者",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 161243,
				},
				[162243] = {
					["source"] = "万物咸覩-凤凰之神",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[210320] = {
					["type"] = "BUFF",
					["source"] = "若见-死亡之翼",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[202719] = {
					["source"] = "万物咸覩-凤凰之神",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[77758] = {
					["encounterID"] = 2100,
					["source"] = "风起春城暮",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[277432] = {
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[157348] = {
					["type"] = "BUFF",
					["source"] = "原始风暴元素",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 77942,
				},
				[192249] = {
					["source"] = "开心的木头-布兰卡德",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[80240] = {
					["source"] = "丫丫小猫-血顶",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[272834] = {
					["type"] = "DEBUFF",
					["source"] = "水鼠帮劫掠者",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 135241,
				},
				[190456] = {
					["type"] = "BUFF",
					["source"] = "千年老妖丶",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[57994] = {
					["source"] = "开心的木头-布兰卡德",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[300174] = {
					["type"] = "BUFF",
					["source"] = "千年老妖丶",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[314483] = {
					["type"] = "DEBUFF",
					["source"] = "萨姆莱克，混沌唤引者",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 161243,
				},
				[200166] = {
					["source"] = "万物咸覩-凤凰之神",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[313571] = {
					["type"] = "BUFF",
					["source"] = "千年老妖丶",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[119905] = {
					["source"] = "丫丫小猫-血顶",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[102351] = {
					["source"] = "风起春城暮",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[296971] = {
					["type"] = "BUFF",
					["source"] = "丫丫小猫-血顶",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[36213] = {
					["source"] = "原始土元素",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 61056,
				},
				[740] = {
					["type"] = "BUFF",
					["source"] = "风起春城暮",
					["encounterID"] = 2097,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[57723] = {
					["type"] = "DEBUFF",
					["source"] = "万物咸覩-凤凰之神",
					["encounterID"] = 2097,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[57755] = {
					["source"] = "千年老妖丶",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[183752] = {
					["source"] = "万物咸覩-凤凰之神",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[111400] = {
					["type"] = "BUFF",
					["source"] = "丫丫小猫-血顶",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[176151] = {
					["type"] = "BUFF",
					["source"] = "雪舞琉璃-血色十字军",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[207386] = {
					["type"] = "BUFF",
					["source"] = "风起春城暮",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[179057] = {
					["source"] = "万物咸覩-凤凰之神",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[102352] = {
					["type"] = "BUFF",
					["source"] = "风起春城暮",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[871] = {
					["type"] = "BUFF",
					["source"] = "千年老妖丶",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[225080] = {
					["type"] = "DEBUFF",
					["source"] = "开心的木头-布兰卡德",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[107079] = {
					["source"] = "千年老妖丶",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[77505] = {
					["type"] = "DEBUFF",
					["source"] = "开心的木头-布兰卡德",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[269266] = {
					["encounterID"] = 2100,
					["source"] = "攻城恐魔",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 140447,
				},
				[18562] = {
					["source"] = "风起春城暮",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[300693] = {
					["type"] = "BUFF",
					["source"] = "风起春城暮",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[1490] = {
					["type"] = "DEBUFF",
					["source"] = "万物咸覩-凤凰之神",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[192058] = {
					["source"] = "开心的木头-布兰卡德",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[295840] = {
					["type"] = "BUFF",
					["source"] = "开心的木头-布兰卡德",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[102417] = {
					["source"] = "风起春城暮",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[115767] = {
					["type"] = "DEBUFF",
					["source"] = "千年老妖丶",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[8004] = {
					["source"] = "开心的木头-布兰卡德",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[57724] = {
					["type"] = "DEBUFF",
					["source"] = "开心的木头-布兰卡德",
					["encounterID"] = 2099,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[295842] = {
					["type"] = "BUFF",
					["source"] = "千年老妖丶",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[268887] = {
					["type"] = "BUFF",
					["source"] = "丫丫小猫-血顶",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[51886] = {
					["source"] = "开心的木头-布兰卡德",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[105771] = {
					["type"] = "DEBUFF",
					["source"] = "千年老妖丶",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[261428] = {
					["encounterID"] = 2097,
					["source"] = "拜恩比吉中士",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 128649,
				},
				[77762] = {
					["type"] = "BUFF",
					["source"] = "开心的木头-布兰卡德",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[160029] = {
					["type"] = "DEBUFF",
					["source"] = "风起春城暮",
					["encounterID"] = 2097,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[2484] = {
					["encounterID"] = 2109,
					["source"] = "开心的木头-布兰卡德",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[108366] = {
					["type"] = "BUFF",
					["source"] = "丫丫小猫-血顶",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[51505] = {
					["source"] = "开心的木头-布兰卡德",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[23920] = {
					["type"] = "BUFF",
					["source"] = "千年老妖丶",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[5487] = {
					["type"] = "BUFF",
					["source"] = "风起春城暮",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[277706] = {
					["type"] = "BUFF",
					["source"] = "丫丫小猫-血顶",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[280389] = {
					["encounterID"] = 2109,
					["source"] = "恐怖船长洛克伍德",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 129208,
				},
				[204262] = {
					["type"] = "BUFF",
					["source"] = "灬蘫灬-血色十字军",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[285976] = {
					["type"] = "BUFF",
					["source"] = "Rikii-冰风岗",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[268893] = {
					["type"] = "BUFF",
					["source"] = "丫丫小猫-血顶",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[274346] = {
					["type"] = "BUFF",
					["source"] = "万物咸覩-凤凰之神",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[202602] = {
					["type"] = "BUFF",
					["source"] = "千年老妖丶",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[16870] = {
					["type"] = "BUFF",
					["source"] = "风起春城暮",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[32216] = {
					["type"] = "BUFF",
					["source"] = "千年老妖丶",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[316801] = {
					["type"] = "BUFF",
					["source"] = "风起春城暮",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[132404] = {
					["type"] = "BUFF",
					["source"] = "千年老妖丶",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[298343] = {
					["type"] = "BUFF",
					["source"] = "丫丫小猫-血顶",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
			},
			["aura_timer_text_font"] = "Accidental Presidency",
			["not_affecting_combat_alpha"] = 0.799999,
			["range_check_alpha"] = 0.5,
			["aura_height"] = 18,
			["cast_statusbar_bgtexture"] = "PlaterBackground",
			["target_indicator"] = "Double Arrows",
			["indicator_enemyclass"] = true,
			["aura_height_personal"] = 19,
			["saved_cvars"] = {
				["ShowClassColorInNameplate"] = "1",
				["nameplateOverlapV"] = "1.1",
				["ShowNamePlateLoseAggroFlash"] = "1",
				["nameplateShowEnemyMinus"] = "1",
				["nameplatePersonalShowAlways"] = "0",
				["nameplateMotionSpeed"] = "0.05",
				["nameplatePersonalHideDelaySeconds"] = "0.2",
				["nameplateGlobalScale"] = "1.0",
				["nameplateShowEnemyMinions"] = "1",
				["nameplateShowFriendlyPets"] = "0",
				["nameplateShowFriendlyNPCs"] = "1",
				["nameplateSelectedScale"] = "1.15",
				["nameplatePersonalShowInCombat"] = "0",
				["nameplatePersonalShowWithTarget"] = "0",
				["nameplateShowSelf"] = "0",
				["nameplateSelfTopInset"] = "0.5",
				["nameplateResourceOnTarget"] = "0",
				["nameplateMotion"] = "0",
				["nameplateShowFriendlyMinions"] = "0",
				["nameplateMinScale"] = "1",
				["nameplateMaxDistance"] = "100",
				["nameplateOtherTopInset"] = "0.085",
				["nameplateSelfScale"] = "1.0",
				["nameplateSelfBottomInset"] = "0.2",
				["nameplateOccludedAlphaMult"] = "1",
				["nameplateShowFriendlyGuardians"] = "0",
				["nameplateSelfAlpha"] = "0.75",
				["NamePlateHorizontalScale"] = "1",
				["nameplateShowAll"] = "1",
				["nameplateShowFriendlyTotems"] = "0",
				["NamePlateVerticalScale"] = "1",
			},
			["login_counter"] = 128,
			["show_health_prediction"] = false,
			["aura_cooldown_show_swipe"] = false,
			["aura_stack_font"] = "Accidental Presidency",
			["patch_version"] = 9,
			["no_spellname_length_limit"] = true,
			["aura_timer_text_size"] = 10,
			["number_region_first_run"] = true,
			["healthbar_framelevel"] = 0,
			["aura_tracker"] = {
				["buff_banned"] = {
					["206150"] = true,
					["61574"] = true,
					["61573"] = true,
				},
				["buff_tracked"] = {
					["209859"] = true,
				},
			},
			["OptionsPanelDB"] = {
				["PlaterOptionsPanelFrame"] = {
					["scale"] = 1,
				},
			},
			["color_override_colors"] = {
				[3] = {
					nil, -- [1]
					0.2784313, -- [2]
					0.2078431, -- [3]
				},
			},
			["aura_cooldown_reverse"] = false,
			["transparency_behavior_use_division"] = true,
			["aggro_modifies"] = {
				["actor_name_color"] = true,
				["border_color"] = true,
			},
			["version"] = 3,
			["cast_statusbar_spark_width"] = 32,
		},
		["MyNewProfile"] = {
			["aura_cooldown_edge_texture"] = "Interface\\GLUES\\loadingOld",
			["script_data"] = {
				{
					["ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --settings (you may need /reload if some configs isn't applied immediately)    \n    --change the nameplate color to this if allowed\n    envTable.CanChangeNameplateColor = false --change to true to change the color\n    envTable.NameplateColor = \"pink\"\n    envTable.NameplateSizeOffset = 6 --increase the nameplate height by this value\n    envTable.GlowAlpha = 0.5 --amount of alpha in the outside glow effect\n    \n    --create a glow effect around the nameplate\n    envTable.glowEffect = envTable.glowEffect or Plater.CreateNameplateGlow (unitFrame.healthBar, envTable.NameplateColor)\n    envTable.glowEffect:SetOffset (-27, 25, 9, -11)\n    --envTable.glowEffect:Show() --envTable.glowEffect:Hide() --\n    \n    --set the glow effect alpha\n    envTable.glowEffect:SetAlpha (envTable.GlowAlpha)\n    \nend\n\n--[=[\nUsing spellIDs for multi-language support\n\n135029 - A Knot of Snakes (Temple of Sethraliss)\n135388 - A Knot of Snakes (Temple of Sethraliss)\n134612 - Grasping Tentacles (Shrine of the Storm)\n133361 - Wasting Servant (Waycrest Manor)\n136330 - Soul Thorns (Waycrest Manor)\n130896 - Blackout Barrel (Freehold)\n129758 - Irontide Grenadier (Freehold)\n131009 - Spirit of Gold (Atal`Dazar)\n--]=]",
					["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.glowEffect:Hide()\n    \n    --restore the nameplate size\n    local nameplateHeight = Plater.db.profile.plate_config.enemynpc.health_incombat [2]\n    unitFrame.healthBar:SetHeight (nameplateHeight)    \n    \nend\n\n\n",
					["ScriptType"] = 3,
					["NpcNames"] = {
						"135029", -- [1]
						"134388", -- [2]
						"134612", -- [3]
						"133361", -- [4]
						"136330", -- [5]
						"130896", -- [6]
						"129758", -- [7]
						"Healing Tide Totem", -- [8]
						"131009", -- [9]
					},
					["Author"] = "Izimode-Azralon",
					["Desc"] = "Highlight a nameplate of an important Add. Add the unit name or NpcID into the trigger box to add more.",
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.glowEffect:Show()\n    \n    --increase the nameplate size\n    local nameplateHeight = Plater.db.profile.plate_config.enemynpc.health_incombat [2]\n    unitFrame.healthBar:SetHeight (nameplateHeight + envTable.NameplateSizeOffset)\n    \nend\n\n\n",
					["Time"] = 1537884697,
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --check if can change the nameplate color\n    if (envTable.CanChangeNameplateColor) then\n        Plater.SetNameplateColor (unitFrame, envTable.NameplateColor)\n    end\n    \nend\n\n\n\n\n",
					["SpellIds"] = {
					},
					["PlaterCore"] = 1,
					["Name"] = "Unit - Important [Plater]",
					["Enabled"] = true,
					["Icon"] = 135996,
					["Revision"] = 156,
				}, -- [1]
				{
					["ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --creates a glow around the icon\n    envTable.buffIconGlow = envTable.buffIconGlow or Plater.CreateIconGlow (self)\n    \nend",
					["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.buffIconGlow:Hide()\n    \nend",
					["ScriptType"] = 1,
					["NpcNames"] = {
					},
					["Author"] = "Tercioo-Sylvanas",
					["Desc"] = "Add the buff name in the trigger box.",
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.buffIconGlow:Show()\n    \nend",
					["Time"] = 1539013601,
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    \n    \n    \nend",
					["SpellIds"] = {
						275826, -- [1]
						272888, -- [2]
						272659, -- [3]
						267901, -- [4]
						267830, -- [5]
						265393, -- [6]
					},
					["PlaterCore"] = 1,
					["Name"] = "Aura - Buff Alert [Plater]",
					["Enabled"] = true,
					["Icon"] = "Interface\\AddOns\\Plater\\images\\icon_aura",
					["Revision"] = 399,
				}, -- [2]
				{
					["ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --settings (you may need /reload if some configs isn't applied immediately)\n    local CONFIG_BACKGROUND_FLASH_DURATION = 0.8 --0.8\n    local CONFIG_BORDER_GLOW_ALPHA = 0.3 --0.3\n    local CONFIG_SHAKE_DURATION = 0.2 --0.2\n    local CONFIG_SHAKE_AMPLITUDE = 5 --5\n    \n    --create a glow effect in the border of the cast bar\n    envTable.glowEffect = envTable.glowEffect or Plater.CreateNameplateGlow (self)\n    envTable.glowEffect:SetOffset (-32, 30, 7, -9)\n    envTable.glowEffect:SetAlpha (CONFIG_BORDER_GLOW_ALPHA)\n    --envTable.glowEffect:Show() --envTable.glowEffect:Hide() \n    \n    --create a texture to use for a flash behind the cast bar\n    local backGroundFlashTexture = Plater:CreateImage (self, [[Interface\\ACHIEVEMENTFRAME\\UI-Achievement-Alert-Glow]], self:GetWidth()+40, self:GetHeight()+20, \"background\", {0, 400/512, 0, 170/256})\n    backGroundFlashTexture:SetBlendMode (\"ADD\")\n    backGroundFlashTexture:SetPoint (\"center\", self, \"center\")\n    backGroundFlashTexture:Hide()\n    \n    --create the animation hub to hold the flash animation sequence\n    envTable.BackgroundFlash = envTable.BackgroundFlash or Plater:CreateAnimationHub (backGroundFlashTexture, \n        function()\n            backGroundFlashTexture:Show()\n        end,\n        function()\n            backGroundFlashTexture:Hide()\n        end\n    )\n    \n    --create the flash animation sequence\n    local fadeIn = Plater:CreateAnimation (envTable.BackgroundFlash, \"ALPHA\", 1, CONFIG_BACKGROUND_FLASH_DURATION/2, 0, 1)\n    local fadeOut = Plater:CreateAnimation (envTable.BackgroundFlash, \"ALPHA\", 2, CONFIG_BACKGROUND_FLASH_DURATION/2, 1, 0)    \n    --envTable.BackgroundFlash:Play() --envTable.BackgroundFlash:Stop()\n    \n    --create a camera shake for the nameplate\n    envTable.FrameShake = Plater:CreateFrameShake (unitFrame, CONFIG_SHAKE_DURATION, CONFIG_SHAKE_AMPLITUDE, 35, false, false, 0, 1, 0.05, 0.1, Plater.GetPoints (unitFrame))    \n    \n    \n    --update the config for the flash here so it wont need a /reload\n    fadeIn:SetDuration (CONFIG_BACKGROUND_FLASH_DURATION/2)\n    fadeOut:SetDuration (CONFIG_BACKGROUND_FLASH_DURATION/2)    \n    \n    --update the config for the skake here so it wont need a /reload\n    envTable.FrameShake.OriginalAmplitude = CONFIG_SHAKE_AMPLITUDE\n    envTable.FrameShake.OriginalDuration = CONFIG_SHAKE_DURATION  \n    \nend",
					["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.glowEffect:Hide()\n    \n    envTable.BackgroundFlash:Stop()\n    \n    unitFrame:StopFrameShake (envTable.FrameShake)    \n    \nend\n\n\n",
					["Temp_OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.glowEffect:Show()\n    \n    envTable.BackgroundFlash:Play()\n    \n    Plater.FlashNameplateBorder (unitFrame, 0.05)   \n    Plater.FlashNameplateBody (unitFrame, \"\", 0.075)\n    \n    self:PlayFrameShake (envTable.FrameShake)\n    \nend\n\n\n",
					["ScriptType"] = 2,
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \nend\n\n\n",
					["Time"] = 1550151794,
					["Temp_ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --settings (you may need /reload if some configs isn't applied immediately)\n    local CONFIG_BACKGROUND_FLASH_DURATION = 0.8 --0.8\n    local CONFIG_BORDER_GLOW_ALPHA = 0.3 --0.3\n    local CONFIG_SHAKE_DURATION = 0.2 --0.2\n    local CONFIG_SHAKE_AMPLITUDE = 5 --5\n    \n    --create a glow effect in the border of the cast bar\n    envTable.glowEffect = envTable.glowEffect or Plater.CreateNameplateGlow (self)\n    envTable.glowEffect:SetOffset (-32, 30, 7, -9)\n    envTable.glowEffect:SetAlpha (CONFIG_BORDER_GLOW_ALPHA)\n    --envTable.glowEffect:Show() --envTable.glowEffect:Hide() \n    \n    --create a texture to use for a flash behind the cast bar\n    local backGroundFlashTexture = Plater:CreateImage (self, [[Interface\\ACHIEVEMENTFRAME\\UI-Achievement-Alert-Glow]], self:GetWidth()+40, self:GetHeight()+20, \"background\", {0, 400/512, 0, 170/256})\n    backGroundFlashTexture:SetBlendMode (\"ADD\")\n    backGroundFlashTexture:SetPoint (\"center\", self, \"center\")\n    backGroundFlashTexture:Hide()\n    \n    --create the animation hub to hold the flash animation sequence\n    envTable.BackgroundFlash = envTable.BackgroundFlash or Plater:CreateAnimationHub (backGroundFlashTexture, \n        function()\n            backGroundFlashTexture:Show()\n        end,\n        function()\n            backGroundFlashTexture:Hide()\n        end\n    )\n    \n    --create the flash animation sequence\n    local fadeIn = Plater:CreateAnimation (envTable.BackgroundFlash, \"ALPHA\", 1, CONFIG_BACKGROUND_FLASH_DURATION/2, 0, 1)\n    local fadeOut = Plater:CreateAnimation (envTable.BackgroundFlash, \"ALPHA\", 2, CONFIG_BACKGROUND_FLASH_DURATION/2, 1, 0)    \n    --envTable.BackgroundFlash:Play() --envTable.BackgroundFlash:Stop()\n    \n    --create a camera shake for the nameplate\n    envTable.FrameShake = Plater:CreateFrameShake (self, CONFIG_SHAKE_DURATION, CONFIG_SHAKE_AMPLITUDE, 35, false, false, 0, 1, 0.05, 0.1, true)    \n    \n    \n    --update the config for the flash here so it wont need a /reload\n    fadeIn:SetDuration (CONFIG_BACKGROUND_FLASH_DURATION/2)\n    fadeOut:SetDuration (CONFIG_BACKGROUND_FLASH_DURATION/2)    \n    \n    --update the config for the skake here so it wont need a /reload\n    envTable.FrameShake.OriginalAmplitude = CONFIG_SHAKE_AMPLITUDE\n    envTable.FrameShake.OriginalDuration = CONFIG_SHAKE_DURATION  \n    \nend",
					["NpcNames"] = {
					},
					["Temp_OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.glowEffect:Hide()\n    \n    envTable.BackgroundFlash:Stop()\n    \n    self:StopFrameShake (envTable.FrameShake)    \n    \nend\n\n\n",
					["Revision"] = 391,
					["Author"] = "Bombad�o-Azralon",
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.glowEffect:Show()\n    \n    envTable.BackgroundFlash:Play()\n    \n    Plater.FlashNameplateBorder (unitFrame, 0.05)   \n    Plater.FlashNameplateBody (unitFrame, \"\", 0.075)\n    \n    unitFrame:PlayFrameShake (envTable.FrameShake)\n    \nend\n\n\n",
					["Temp_UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \nend\n\n\n",
					["Name"] = "Cast - Very Important [Plater]",
					["PlaterCore"] = 1,
					["Icon"] = "Interface\\AddOns\\Plater\\images\\cast_bar",
					["SpellIds"] = {
						257785, -- [1]
						267237, -- [2]
						266951, -- [3]
						267273, -- [4]
						267433, -- [5]
						263066, -- [6]
						255577, -- [7]
						255371, -- [8]
					},
					["Desc"] = "Highlight a very important cast applying several effects into the Cast Bar. Add spell in the Add Trigger field.",
					["Enabled"] = true,
				}, -- [3]
				{
					["ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --settings\n    envTable.NameplateSizeOffset = 3\n    envTable.GlowAlpha = .45\n    envTable.ShowArrow = true\n    envTable.ArrowAlpha = .45    \n    envTable.HealthBarColor = \"orange\"\n    \n    --custom frames\n    envTable.glowEffect = envTable.glowEffect or Plater.CreateNameplateGlow (unitFrame.healthBar)\n    --envTable.glowEffect:Show() --envTable.glowEffect:Hide() \n    envTable.glowEffect:SetOffset (-27, 25, 6, -8)\n    \n    --creates the spark to show the cast progress inside the health bar\n    envTable.overlaySpark = envTable.overlaySpark or Plater:CreateImage (unitFrame.healthBar)\n    envTable.overlaySpark:SetBlendMode (\"ADD\")\n    envTable.overlaySpark.width = 32\n    envTable.overlaySpark.height = 36\n    envTable.overlaySpark.alpha = .9\n    envTable.overlaySpark.texture = [[Interface\\CastingBar\\UI-CastingBar-Spark]]\n    \n    envTable.topArrow = envTable.topArrow or Plater:CreateImage (unitFrame.healthBar)\n    envTable.topArrow:SetBlendMode (\"ADD\")\n    envTable.topArrow.width = 8\n    envTable.topArrow.height = 8\n    envTable.topArrow.alpha = envTable.ArrowAlpha\n    envTable.topArrow.texture = [[Interface\\BUTTONS\\Arrow-Down-Up]]\n    \n    --scale animation\n    envTable.smallScaleAnimation = envTable.smallScaleAnimation or Plater:CreateAnimationHub (unitFrame.healthBar)\n    Plater:CreateAnimation (envTable.smallScaleAnimation, \"SCALE\", 1, 0.075, 1, 1, 1.08, 1.08)\n    Plater:CreateAnimation (envTable.smallScaleAnimation, \"SCALE\", 2, 0.075, 1, 1, 0.95, 0.95)    \n    --envTable.smallScaleAnimation:Play() --envTable.smallScaleAnimation:Stop()\n    \nend\n\n\n\n\n\n\n\n",
					["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.glowEffect:Hide()\n    \n    envTable.overlaySpark:Hide()\n    envTable.topArrow:Hide()\n    \n    Plater.RefreshNameplateColor (unitFrame)\n    \n    envTable.smallScaleAnimation:Stop()\n    \n    --increase the nameplate size\n    local nameplateHeight = Plater.db.profile.plate_config.enemynpc.health_incombat [2]\n    unitFrame.healthBar:SetHeight (nameplateHeight)\nend\n\n\n",
					["ScriptType"] = 2,
					["NpcNames"] = {
					},
					["Author"] = "Bombad�o-Azralon",
					["Desc"] = "Apply several animations when the explosion orb cast starts on a Mythic Dungeon with Explosion Affix",
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.glowEffect:Show()\n    envTable.overlaySpark:Show()\n    \n    if (envTable.ShowArrow) then\n        envTable.topArrow:Show()\n    end\n    \n    Plater.FlashNameplateBorder (unitFrame, 0.05)   \n    Plater.FlashNameplateBody (unitFrame, \"\", 0.075)\n    \n    envTable.smallScaleAnimation:Play()\n    \n    --increase the nameplate size\n    local nameplateHeight = Plater.db.profile.plate_config.enemynpc.health_incombat [2]\n    unitFrame.healthBar:SetHeight (nameplateHeight + envTable.NameplateSizeOffset)\n    \n    envTable.overlaySpark.height = nameplateHeight + 32\n    \n    envTable.glowEffect.Texture:SetAlpha (envTable.GlowAlpha)\n    \n    \nend\n\n\n\n\n\n\n",
					["Time"] = 1540663131,
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --update the percent\n    envTable.overlaySpark:SetPoint (\"left\", unitFrame.healthBar:GetWidth() * (envTable._CastPercent / 100)-16, 0)\n    \n    envTable.topArrow:SetPoint (\"bottomleft\", unitFrame.healthBar, \"topleft\", unitFrame.healthBar:GetWidth() * (envTable._CastPercent / 100) - 4, 2 )\n    \n    --forces the script to update on a 60Hz base\n    self.ThrottleUpdate = 0.016\n    \n    --update the health bar color coloring from yellow to red\n    --Plater.SetNameplateColor (unitFrame, max (envTable._CastPercent/100, .66), abs (envTable._CastPercent/100 - 1), 0, 1)\n    \n    Plater.SetNameplateColor (unitFrame, envTable.HealthBarColor)\n    envTable.glowEffect.Texture:SetAlpha (envTable.GlowAlpha)\n    \nend\n\n\n",
					["SpellIds"] = {
						240446, -- [1]
						273577, -- [2]
					},
					["PlaterCore"] = 1,
					["Name"] = "Explosion Affix M+ [Plater]",
					["Enabled"] = true,
					["Icon"] = 2175503,
					["Revision"] = 324,
				}, -- [4]
				{
					["ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --creates a glow around the icon\n    envTable.debuffIconGlow = envTable.debuffIconGlow or Plater.CreateIconGlow (self)\n    \nend\n\n\n",
					["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.debuffIconGlow:Hide()\n    \nend\n\n\n",
					["ScriptType"] = 1,
					["NpcNames"] = {
					},
					["Author"] = "Tercioo-Sylvanas",
					["Desc"] = "Add the debuff name in the trigger box.",
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.debuffIconGlow:Show()\n    \nend\n\n\n",
					["Time"] = 1538429739,
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \nend\n\n\n",
					["SpellIds"] = {
					},
					["PlaterCore"] = 1,
					["Name"] = "Aura - Debuff Alert [Plater]",
					["Enabled"] = true,
					["Icon"] = "Interface\\AddOns\\Plater\\images\\icon_aura",
					["Revision"] = 232,
				}, -- [5]
				{
					["ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --https://www.wowhead.com/spell=253583/fiery-enchant\n    \n    --settings (you may need /reload if some configs isn't applied immediately)\n    \n    --castbar color (when can be interrupted)\n    envTable.CastbarColor = \"darkorange\"\n    --flash duration\n    local CONFIG_BACKGROUND_FLASH_DURATION = 0.4\n    --add this value to the cast bar height\n    envTable.CastBarHeightAdd = 5\n    \n    \n    \n    --create a fast flash above the cast bar\n    envTable.FullBarFlash = envTable.FullBarFlash or Plater.CreateFlash (self, 0.05, 1, \"white\")\n    \n    --create a camera shake for the nameplate\n    envTable.FrameShake = Plater:CreateFrameShake (unitFrame, 0.2, 5, 35, false, false, 0, 1, 0.05, 0.1, Plater.GetPoints (unitFrame))\n    \n    --create a texture to use for a flash behind the cast bar\n    local backGroundFlashTexture = Plater:CreateImage (self, [[Interface\\ACHIEVEMENTFRAME\\UI-Achievement-Alert-Glow]], self:GetWidth()+60, self:GetHeight()+50, \"background\", {0, 400/512, 0, 170/256})\n    backGroundFlashTexture:SetBlendMode (\"ADD\")\n    backGroundFlashTexture:SetPoint (\"center\", self, \"center\")\n    backGroundFlashTexture:Hide()\n    \n    --create the animation hub to hold the flash animation sequence\n    envTable.BackgroundFlash = envTable.BackgroundFlash or Plater:CreateAnimationHub (backGroundFlashTexture, \n        function()\n            backGroundFlashTexture:Show()\n        end,\n        function()\n            backGroundFlashTexture:Hide()\n        end\n    )\n    \n    --create the flash animation sequence\n    local fadeIn = Plater:CreateAnimation (envTable.BackgroundFlash, \"ALPHA\", 1, CONFIG_BACKGROUND_FLASH_DURATION/2, 0, .75)\n    local fadeOut = Plater:CreateAnimation (envTable.BackgroundFlash, \"ALPHA\", 2, CONFIG_BACKGROUND_FLASH_DURATION/2, 1, 0)    \n    --envTable.BackgroundFlash:Play() --envTable.BackgroundFlash:Stop()        \n    \nend\n\n\n",
					["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --don't execute on battlegrounds and arenas\n    if (Plater.ZoneInstanceType == \"arena\" or Plater.ZoneInstanceType == \"pvp\") then\n        return\n    end    \n    \n    --restore the cast bar to its original height\n    if (envTable.OriginalHeight) then\n        self:SetHeight (envTable.OriginalHeight)\n        envTable.OriginalHeight = nil\n    end\n    \n    --stop the camera shake\n    unitFrame:StopFrameShake (envTable.FrameShake)\n    \n    envTable.FullBarFlash:Stop()\n    envTable.BackgroundFlash:Stop()\n    \nend\n\n\n\n\n\n",
					["Temp_OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --don't execute on battlegrounds and arenas\n    if (Plater.ZoneInstanceType == \"arena\" or Plater.ZoneInstanceType == \"pvp\") then\n        return\n    end\n    \n    --play flash animations\n    envTable.FullBarFlash:Play()\n    \n    --restoring the default size (not required since it already restore in the hide script)\n    if (envTable.OriginalHeight) then\n        self:SetHeight (envTable.OriginalHeight)\n    end\n    \n    --increase the cast bar size\n    local height = self:GetHeight()\n    envTable.OriginalHeight = height\n    \n    self:SetHeight (height + envTable.CastBarHeightAdd)\n    \n    Plater.SetCastBarBorderColor (self, 1, .2, .2, 0.4)\n    \n    self:PlayFrameShake (envTable.FrameShake)\n    \n    --set the color of the cast bar to dark orange (only if can be interrupted)\n    --Plater auto set this color to default when a new cast starts, no need to reset this value at OnHide.    \n    if (envTable._CanInterrupt) then\n        self:SetStatusBarColor (Plater:ParseColors (envTable.CastbarColor))\n    end\n    \n    envTable.BackgroundFlash:Play()\n    \nend\n\n\n\n\n\n\n\n\n",
					["ScriptType"] = 2,
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \nend\n\n\n",
					["Time"] = 1550151761,
					["Temp_ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --https://www.wowhead.com/spell=253583/fiery-enchant\n    \n    --settings (you may need /reload if some configs isn't applied immediately)\n    \n    --castbar color (when can be interrupted)\n    envTable.CastbarColor = \"darkorange\"\n    --flash duration\n    local CONFIG_BACKGROUND_FLASH_DURATION = 0.4\n    --add this value to the cast bar height\n    envTable.CastBarHeightAdd = 5\n    \n    \n    \n    --create a fast flash above the cast bar\n    envTable.FullBarFlash = envTable.FullBarFlash or Plater.CreateFlash (self, 0.05, 1, \"white\")\n    \n    --create a camera shake for the nameplate\n    envTable.FrameShake = Plater:CreateFrameShake (self, 0.2, 5, 35, false, false, 0, 1, 0.05, 0.1, true)\n    \n    --create a texture to use for a flash behind the cast bar\n    local backGroundFlashTexture = Plater:CreateImage (self, [[Interface\\ACHIEVEMENTFRAME\\UI-Achievement-Alert-Glow]], self:GetWidth()+60, self:GetHeight()+50, \"background\", {0, 400/512, 0, 170/256})\n    backGroundFlashTexture:SetBlendMode (\"ADD\")\n    backGroundFlashTexture:SetPoint (\"center\", self, \"center\")\n    backGroundFlashTexture:Hide()\n    \n    --create the animation hub to hold the flash animation sequence\n    envTable.BackgroundFlash = envTable.BackgroundFlash or Plater:CreateAnimationHub (backGroundFlashTexture, \n        function()\n            backGroundFlashTexture:Show()\n        end,\n        function()\n            backGroundFlashTexture:Hide()\n        end\n    )\n    \n    --create the flash animation sequence\n    local fadeIn = Plater:CreateAnimation (envTable.BackgroundFlash, \"ALPHA\", 1, CONFIG_BACKGROUND_FLASH_DURATION/2, 0, .75)\n    local fadeOut = Plater:CreateAnimation (envTable.BackgroundFlash, \"ALPHA\", 2, CONFIG_BACKGROUND_FLASH_DURATION/2, 1, 0)    \n    --envTable.BackgroundFlash:Play() --envTable.BackgroundFlash:Stop()        \n    \nend\n\n\n",
					["NpcNames"] = {
					},
					["Temp_OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --don't execute on battlegrounds and arenas\n    if (Plater.ZoneInstanceType == \"arena\" or Plater.ZoneInstanceType == \"pvp\") then\n        return\n    end    \n    \n    --restore the cast bar to its original height\n    if (envTable.OriginalHeight) then\n        self:SetHeight (envTable.OriginalHeight)\n        envTable.OriginalHeight = nil\n    end\n    \n    --stop the camera shake\n    self:StopFrameShake (envTable.FrameShake)\n    \n    envTable.FullBarFlash:Stop()\n    envTable.BackgroundFlash:Stop()\n    \nend\n\n\n\n\n\n",
					["Revision"] = 570,
					["Author"] = "Tercioo-Sylvanas",
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --don't execute on battlegrounds and arenas\n    if (Plater.ZoneInstanceType == \"arena\" or Plater.ZoneInstanceType == \"pvp\") then\n        return\n    end\n    \n    --play flash animations\n    envTable.FullBarFlash:Play()\n    \n    --restoring the default size (not required since it already restore in the hide script)\n    if (envTable.OriginalHeight) then\n        self:SetHeight (envTable.OriginalHeight)\n    end\n    \n    --increase the cast bar size\n    local height = self:GetHeight()\n    envTable.OriginalHeight = height\n    \n    self:SetHeight (height + envTable.CastBarHeightAdd)\n    \n    Plater.SetCastBarBorderColor (self, 1, .2, .2, 0.4)\n    \n    unitFrame:PlayFrameShake (envTable.FrameShake)\n    \n    --set the color of the cast bar to dark orange (only if can be interrupted)\n    --Plater auto set this color to default when a new cast starts, no need to reset this value at OnHide.    \n    if (envTable._CanInterrupt) then\n        self:SetStatusBarColor (Plater:ParseColors (envTable.CastbarColor))\n    end\n    \n    envTable.BackgroundFlash:Play()\n    \nend\n\n\n\n\n\n\n\n\n",
					["Temp_UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \nend\n\n\n",
					["Name"] = "Cast - Big Alert [Plater]",
					["PlaterCore"] = 1,
					["Icon"] = "Interface\\AddOns\\Plater\\images\\cast_bar",
					["SpellIds"] = {
						258153, -- [1]
						258313, -- [2]
						257069, -- [3]
						274569, -- [4]
						278020, -- [5]
						261635, -- [6]
						272700, -- [7]
						280404, -- [8]
						268030, -- [9]
						265368, -- [10]
						263891, -- [11]
						264520, -- [12]
						265407, -- [13]
						278567, -- [14]
						278602, -- [15]
						258128, -- [16]
						257791, -- [17]
						258938, -- [18]
						265089, -- [19]
						272183, -- [20]
						256060, -- [21]
						257397, -- [22]
						257899, -- [23]
						269972, -- [24]
						270901, -- [25]
						270492, -- [26]
						268129, -- [27]
						268709, -- [28]
						263215, -- [29]
						268797, -- [30]
						262540, -- [31]
						262554, -- [32]
						253517, -- [33]
						255041, -- [34]
						252781, -- [35]
						250368, -- [36]
						258777, -- [37]
					},
					["Desc"] = "Flash, Bounce and Red Color the CastBar border when when an important cast is happening. Add spell in the Add Trigger field.",
					["Enabled"] = true,
				}, -- [6]
				{
					["ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --settings (you may need /reload if some configs isn't applied immediately)\n    \n    --flash duration\n    local CONFIG_FLASH_DURATION = 0.6\n    \n    --manually create a new texture for the flash animation\n    if (not envTable.SmallFlashTexture) then\n        envTable.SmallFlashTexture = envTable.SmallFlashTexture or Plater:CreateImage (unitFrame.castBar)\n        envTable.SmallFlashTexture:SetColorTexture (1, 1, 1)\n        envTable.SmallFlashTexture:SetAllPoints()\n    end\n    \n    --manually create a flash animation using the framework\n    if (not envTable.SmallFlashAnimationHub) then \n        \n        local onPlay = function()\n            envTable.SmallFlashTexture:Show()\n        end\n        \n        local onFinished = function()\n            envTable.SmallFlashTexture:Hide()\n        end\n        \n        local animationHub = Plater:CreateAnimationHub (envTable.SmallFlashTexture, onPlay, onFinished)\n        Plater:CreateAnimation (animationHub, \"Alpha\", 1, CONFIG_FLASH_DURATION/2, 0, .6)\n        Plater:CreateAnimation (animationHub, \"Alpha\", 2, CONFIG_FLASH_DURATION/2, 1, 0)\n        \n        envTable.SmallFlashAnimationHub = animationHub\n    end\n    \n    \n    \nend\n\n\n\n\n\n\n\n",
					["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.SmallFlashAnimationHub:Stop()\n    \nend\n\n\n",
					["Temp_OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.SmallFlashAnimationHub:Play()\n    \nend\n\n\n",
					["ScriptType"] = 2,
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    \n    \nend\n\n\n",
					["Time"] = 1588953598,
					["Temp_ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --settings (you may need /reload if some configs isn't applied immediately)\n    \n    --flash duration\n    local CONFIG_FLASH_DURATION = 0.6\n    \n    --manually create a new texture for the flash animation\n    if (not envTable.SmallFlashTexture) then\n        envTable.SmallFlashTexture = envTable.SmallFlashTexture or Plater:CreateImage (unitFrame.castBar)\n        envTable.SmallFlashTexture:SetColorTexture (1, 1, 1)\n        envTable.SmallFlashTexture:SetAllPoints()\n    end\n    \n    --manually create a flash animation using the framework\n    if (not envTable.SmallFlashAnimationHub) then \n        \n        local onPlay = function()\n            envTable.SmallFlashTexture:Show()\n        end\n        \n        local onFinished = function()\n            envTable.SmallFlashTexture:Hide()\n        end\n        \n        local animationHub = Plater:CreateAnimationHub (envTable.SmallFlashTexture, onPlay, onFinished)\n        Plater:CreateAnimation (animationHub, \"Alpha\", 1, CONFIG_FLASH_DURATION/2, 0, .6)\n        Plater:CreateAnimation (animationHub, \"Alpha\", 2, CONFIG_FLASH_DURATION/2, 1, 0)\n        \n        envTable.SmallFlashAnimationHub = animationHub\n    end\n    \n    \n    \nend\n\n\n\n\n\n\n\n",
					["NpcNames"] = {
					},
					["Temp_OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.SmallFlashAnimationHub:Stop()\n    \nend\n\n\n",
					["Revision"] = 383,
					["Author"] = "Tercioo-Sylvanas",
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.SmallFlashAnimationHub:Play()\n    \nend\n\n\n",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\cast_bar",
					["Prio"] = 99,
					["Name"] = "Cast - Small Alert [Plater]",
					["PlaterCore"] = 1,
					["SpellIds"] = {
						275192, -- [1]
						265912, -- [2]
						274438, -- [3]
						268317, -- [4]
						268375, -- [5]
						276767, -- [6]
						264105, -- [7]
						265876, -- [8]
						270464, -- [9]
						266106, -- [10]
						272180, -- [11]
						278961, -- [12]
						278755, -- [13]
						265468, -- [14]
						256405, -- [15]
						256897, -- [16]
						264101, -- [17]
						280604, -- [18]
						268702, -- [19]
						281621, -- [20]
						262515, -- [21]
						255824, -- [22]
						253583, -- [23]
						250096, -- [24]
					},
					["Desc"] = "Flashes the Cast Bar when a spell in the trigger list is Cast. Add spell in the Add Trigger field.",
					["Enabled"] = true,
					["Temp_UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    \n    \nend\n\n\n",
				}, -- [7]
				{
					["ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --color to set the nameplate\n    envTable.NameplateColor = \"gray\"\n    \nend\n\n\n",
					["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    \nend\n\n\n",
					["Temp_OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \nend\n\n\n",
					["ScriptType"] = 1,
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --only change the nameplate color in combat\n    if (InCombatLockdown()) then\n        Plater.SetNameplateColor (unitFrame, envTable.NameplateColor)\n    end\n    \nend\n\n\n\n\n\n\n",
					["Time"] = 1550151754,
					["Temp_ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --color to set the nameplate\n    envTable.NameplateColor = \"gray\"\n    \nend\n\n\n",
					["NpcNames"] = {
					},
					["Temp_OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    \nend\n\n\n",
					["Revision"] = 107,
					["Author"] = "Izimode-Azralon",
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \nend\n\n\n",
					["Temp_UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --only change the nameplate color in combat\n    if (InCombatLockdown()) then\n        Plater.SetNameplateColor (unitFrame, envTable.NameplateColor)\n    end\n    \nend\n\n\n\n\n\n\n",
					["Name"] = "Aura - Invalidate Unit [Plater]",
					["PlaterCore"] = 1,
					["Icon"] = "Interface\\AddOns\\Plater\\images\\icon_invalid",
					["SpellIds"] = {
						261265, -- [1]
						261266, -- [2]
						271590, -- [3]
					},
					["Desc"] = "When an aura makes the unit invulnarable and you don't want to attack it. Add spell in the Add Trigger field.",
					["Enabled"] = true,
				}, -- [8]
				{
					["ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --settings:\n    do\n        \n        --change the nameplate color to this color\n        --can use color names: \"red\", \"yellow\"\n        --can use color hex: \"#FF0000\", \"#FFFF00\"\n        --con use color table: {1, 0, 0}, {1, 1, 0}\n        \n        envTable.Color = \"green\"\n        \n        --if true, it'll replace the health info with the unit name\n        envTable.ReplaceHealthWithName = false\n        \n        --use flash when the unit is shown in the screen\n        envTable.FlashNameplate = true\n        \n    end\n    \n    --private:\n    do\n        --create a flash for when the unit if shown\n        envTable.smallFlash = envTable.smallFlash or Plater.CreateFlash (unitFrame.healthBar, 0.15, 1, envTable.Color)\n        \n    end\n    \nend\n\n--[=[\n\nNpc IDS:\n\n141851: Spawn of G'Huun on Mythic Dungeons\n\n\n--]=]\n\n\n\n\n",
					["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --make plater refresh the nameplate color\n    Plater.RefreshNameplateColor (unitFrame)\n    \n        envTable.smallFlash:Stop()\n    \nend\n\n\n",
					["ScriptType"] = 3,
					["NpcNames"] = {
						"141851", -- [1]
					},
					["Author"] = "Izimode-Azralon",
					["Desc"] = "Add a unitID or unit name in 'Add Trigger' entry. See the constructor script for options.",
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --check if can flash the nameplate\n    if (envTable.FlashNameplate) then\n        envTable.smallFlash:Play()\n    end\n    \nend\n\n\n\n\n\n\n\n\n",
					["Time"] = 1543253273,
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --adjust the nameplate color\n    Plater.SetNameplateColor (unitFrame, envTable.Color)\n    \n    --check if can replace the health amount with the unit name\n    if (envTable.ReplaceHealthWithName) then\n        \n        local healthPercent = format (\"%.1f\", unitFrame.healthBar.CurrentHealth / unitFrame.healthBar.CurrentHealthMax *100)\n        \n        unitFrame.healthBar.lifePercent:SetText (unitFrame.namePlateUnitName .. \"  (\" .. healthPercent  .. \"%)\")\n        \n    end\n    \nend\n\n\n",
					["SpellIds"] = {
					},
					["PlaterCore"] = 1,
					["Name"] = "Color Change [Plater]",
					["Enabled"] = true,
					["Icon"] = 135024,
					["Revision"] = 59,
				}, -- [9]
				{
					["ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --settings (require a /reload after editing any setting)\n    do\n        --blink and glow\n        envTable.BlinkEnabled = true --set to 'false' to disable blinks\n        envTable.GlowEnabled = true --set to 'false' to disable glows\n        envTable.ChangeNameplateColor = true; --set to 'true' to enable nameplate color change\n        envTable.TimeLeftToBlink = 4.5; --in seconds, affects the blink effect only\n        envTable.BlinkSpeed = 1.0; --time to complete a blink loop\n        envTable.BlinkColor = \"white\"; --color of the blink\n        envTable.BlinkMaxAlpha = 0.50; --max transparency in the animation loop (1.0 is full opaque)\n        envTable.NameplateColor = \"darkred\"; --nameplate color if ChangeNameplateColor is true\n        \n        --text color\n        envTable.TimerColorEnabled = true --set to 'false' to disable changes in the color of the time left text\n        envTable.TimeLeftWarning = 8.0; --in seconds, affects the color of the text\n        envTable.TimeLeftCritical = 3.0; --in seconds, affects the color of the text    \n        envTable.TextColor_Warning = \"yellow\"; --color when the time left entered in a warning zone\n        envTable.TextColor_Critical = \"red\"; --color when the time left is critical\n        \n        --list of spellIDs to ignore\n        envTable.IgnoredSpellID = {\n            [12] = true, --use a simple comma here\n            [13] = true,\n        }\n    end\n    \n    \n    --private\n    do\n        envTable.blinkTexture = Plater:CreateImage (self, \"\", 1, 1, \"overlay\")\n        envTable.blinkTexture:SetPoint ('center', 0, 0)\n        envTable.blinkTexture:Hide()\n        \n        local onPlay = function()\n            envTable.blinkTexture:Show() \n            envTable.blinkTexture.color = envTable.BlinkColor\n        end\n        local onStop = function()\n            envTable.blinkTexture:Hide()  \n        end\n        envTable.blinkAnimation = Plater:CreateAnimationHub (envTable.blinkTexture, onPlay, onStop)\n        Plater:CreateAnimation (envTable.blinkAnimation, \"ALPHA\", 1, envTable.BlinkSpeed / 2, 0, envTable.BlinkMaxAlpha)\n        Plater:CreateAnimation (envTable.blinkAnimation, \"ALPHA\", 2, envTable.BlinkSpeed / 2, envTable.BlinkMaxAlpha, 0)\n        \n        envTable.glowEffect = envTable.glowEffect or Plater.CreateIconGlow (self)\n        --envTable.glowEffect:Show() --envTable.glowEffect:Hide()\n        \n    end\n    \nend\n\n\n\n\n",
					["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.blinkAnimation:Stop()\n    envTable.blinkTexture:Hide()\n    envTable.blinkAnimation:Stop()\n    envTable.glowEffect:Stop()\n    Plater:SetFontColor (self.Cooldown.Timer, Plater.db.profile.aura_timer_text_color)\nend\n\n\n",
					["Temp_OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.blinkTexture:SetSize (self:GetSize())\n    \nend\n\n\n",
					["ScriptType"] = 1,
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    local timeLeft = envTable._RemainingTime\n    \n    --check if the spellID isn't being ignored\n    if (envTable.IgnoredSpellID [envTable._SpellID]) then\n        return\n    end\n    \n    --check the time left and start or stop the blink animation and also check if the time left is > zero\n    if ((envTable.BlinkEnabled or envTable.GlowEnabled) and timeLeft > 0) then\n        if (timeLeft < envTable.TimeLeftToBlink) then\n            --blink effect\n            if (envTable.BlinkEnabled) then\n                if (not envTable.blinkAnimation:IsPlaying()) then\n                    envTable.blinkAnimation:Play()\n                end\n            end\n            --glow effect\n            if (envTable.GlowEnabled) then\n                envTable.glowEffect:Show()\n            end\n            --nameplate color\n            if (envTable.ChangeNameplateColor) then\n                Plater.SetNameplateColor (unitFrame, envTable.NameplateColor)\n            end\n        else\n            --blink effect\n            if (envTable.blinkAnimation:IsPlaying()) then\n                envTable.blinkAnimation:Stop()\n            end\n            --glow effect\n            if (envTable.GlowEnabled and envTable.glowEffect:IsShown()) then\n                envTable.glowEffect:Hide()\n            end\n        end\n    end\n    \n    --timer color\n    if (envTable.TimerColorEnabled and timeLeft > 0) then\n        if (timeLeft < envTable.TimeLeftCritical) then\n            Plater:SetFontColor (self.Cooldown.Timer, envTable.TextColor_Critical)\n        elseif (timeLeft < envTable.TimeLeftWarning) then\n            Plater:SetFontColor (self.Cooldown.Timer, envTable.TextColor_Warning)        \n        else\n            Plater:SetFontColor (self.Cooldown.Timer, Plater.db.profile.aura_timer_text_color)\n        end\n    end\n    \nend",
					["Time"] = 1550156096,
					["Temp_ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --settings (require a /reload after editing any setting)\n    do\n        --blink and glow\n        envTable.BlinkEnabled = true --set to 'false' to disable blinks\n        envTable.GlowEnabled = true --set to 'false' to disable glows\n        envTable.ChangeNameplateColor = true; --set to 'true' to enable nameplate color change\n        envTable.TimeLeftToBlink = 4.5; --in seconds, affects the blink effect only\n        envTable.BlinkSpeed = 1.0; --time to complete a blink loop\n        envTable.BlinkColor = \"white\"; --color of the blink\n        envTable.BlinkMaxAlpha = 0.50; --max transparency in the animation loop (1.0 is full opaque)\n        envTable.NameplateColor = \"darkred\"; --nameplate color if ChangeNameplateColor is true\n        \n        --text color\n        envTable.TimerColorEnabled = true --set to 'false' to disable changes in the color of the time left text\n        envTable.TimeLeftWarning = 8.0; --in seconds, affects the color of the text\n        envTable.TimeLeftCritical = 3.0; --in seconds, affects the color of the text    \n        envTable.TextColor_Warning = \"yellow\"; --color when the time left entered in a warning zone\n        envTable.TextColor_Critical = \"red\"; --color when the time left is critical\n        \n        --list of spellIDs to ignore\n        envTable.IgnoredSpellID = {\n            [12] = true, --use a simple comma here\n            [13] = true,\n        }\n    end\n    \n    \n    --private\n    do\n        envTable.blinkTexture = Plater:CreateImage (self, \"\", 1, 1, \"overlay\")\n        envTable.blinkTexture:SetPoint ('center', 0, 0)\n        envTable.blinkTexture:Hide()\n        \n        local onPlay = function()\n            envTable.blinkTexture:Show() \n            envTable.blinkTexture.color = envTable.BlinkColor\n        end\n        local onStop = function()\n            envTable.blinkTexture:Hide()  \n        end\n        envTable.blinkAnimation = Plater:CreateAnimationHub (envTable.blinkTexture, onPlay, onStop)\n        Plater:CreateAnimation (envTable.blinkAnimation, \"ALPHA\", 1, envTable.BlinkSpeed / 2, 0, envTable.BlinkMaxAlpha)\n        Plater:CreateAnimation (envTable.blinkAnimation, \"ALPHA\", 2, envTable.BlinkSpeed / 2, envTable.BlinkMaxAlpha, 0)\n        \n        envTable.glowEffect = envTable.glowEffect or Plater.CreateIconGlow (self)\n        --envTable.glowEffect:Show() --envTable.glowEffect:Hide()\n        \n    end\n    \nend\n\n\n\n\n",
					["NpcNames"] = {
					},
					["Temp_OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.blinkAnimation:Stop()\n    envTable.blinkTexture:Hide()\n    envTable.blinkAnimation:Stop()\n    envTable.glowEffect:Stop()\n    Plater:SetFontColor (self.Cooldown.Timer, Plater.db.profile.aura_timer_text_color)\nend\n\n\n",
					["Revision"] = 162,
					["Author"] = "Izimode-Azralon",
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.blinkTexture:SetSize (self:GetSize())\n    \nend\n\n\n",
					["Temp_UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    local timeLeft = envTable._RemainingTime\n    \n    --check if the spellID isn't being ignored\n    if (envTable.IgnoredSpellID [envTable._SpellID]) then\n        return\n    end\n    \n    --check the time left and start or stop the blink animation and also check if the time left is > zero\n    if ((envTable.BlinkEnabled or envTable.GlowEnabled) and timeLeft > 0) then\n        if (timeLeft < envTable.TimeLeftToBlink) then\n            --blink effect\n            if (envTable.BlinkEnabled) then\n                if (not envTable.blinkAnimation:IsPlaying()) then\n                    envTable.blinkAnimation:Play()\n                end\n            end\n            --glow effect\n            if (envTable.GlowEnabled) then\n                envTable.glowEffect:Show()\n            end\n            --nameplate color\n            if (envTable.ChangeNameplateColor) then\n                Plater.SetNameplateColor (unitFrame, envTable.NameplateColor)\n            end\n        else\n            --blink effect\n            if (envTable.blinkAnimation:IsPlaying()) then\n                envTable.blinkAnimation:Stop()\n            end\n            --glow effect\n            if (envTable.GlowEnabled and envTable.glowEffect:IsShown()) then\n                envTable.glowEffect:Hide()\n            end\n        end\n    end\n    \n    --timer color\n    if (envTable.TimerColorEnabled and timeLeft > 0) then\n        if (timeLeft < envTable.TimeLeftCritical) then\n            Plater:SetFontColor (self.Cooldown.Timer, envTable.TextColor_Critical)\n        elseif (timeLeft < envTable.TimeLeftWarning) then\n            Plater:SetFontColor (self.Cooldown.Timer, envTable.TextColor_Warning)        \n        else\n            Plater:SetFontColor (self.Cooldown.Timer, Plater.db.profile.aura_timer_text_color)\n        end\n    end\n    \nend",
					["Name"] = "Aura - Blink by Time Left [Plater]",
					["PlaterCore"] = 1,
					["Icon"] = "Interface\\AddOns\\Plater\\images\\icon_aura_blink",
					["SpellIds"] = {
					},
					["Desc"] = "Blink, change the number and nameplate color. Add the debuffs int he trigger box. Set settings on constructor script.",
					["Enabled"] = true,
				}, -- [10]
				{
					["ConstructorCode"] = "--gray lines are comments and doesn't affect the code\n\n--1) add the aura you want by typing its name or spellID into the \"Add Trigger\" and click the \"Add\" button.\n--2) the border will use the default color set below, to a custom color type aura name and the color you want in the BorderColorByAura table.\n\nfunction (self, unitId, unitFrame, envTable)\n    \n    --default color if the aura name isn't found in the Color By Aura table below\n    envTable.DefaultBorderColor = \"orange\"\n    \n    --transparency, affect all borders\n    envTable.BorderAlpha = 1.0\n    \n    --add the aura name and the color, \n    envTable.BorderColorByAura = {\n        \n        --examples:\n        --[\"Aura Name\"] = \"yellow\", --using regular aura name | using the name of the color\n        --[\"aura name\"] = \"#FFFF00\", --using lower case in the aura name |using html #hex for the color\n        --[54214] = {1, 1, 0}, --using the spellID instead of the name | using rgb table (0 to 1) for the color\n        --color table uses zero to one values: 255 = 1.0, 127 = 0.5, orange color = {1, 0.7, 0}\n        \n        --add your custom border colors below:\n        \n        [\"Aura Name\"] = {1, .5, 0}, --example to copy/paste\n        \n    }\n    \n    \nend\n\n\n\n\n",
					["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --reset the border color\n    self:SetBackdropBorderColor (0, 0, 0, 0)\n    \nend\n\n\n",
					["ScriptType"] = 1,
					["NpcNames"] = {
					},
					["Author"] = "Izimode-Azralon",
					["Desc"] = "Add a border to an aura icon. Add the aura into the Add Trigger entry. You can customize the icon color at the constructor script.",
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --get the aura name in lower case\n    local auraLowerName = string.lower (envTable._SpellName)\n    \n    --attempt to get a custom color added by the user in the constructor script\n    local hasCustomBorderColor = envTable.BorderColorByAura [auraLowerName] or envTable.BorderColorByAura [envTable._SpellName] or envTable.BorderColorByAura [envTable._SpellID]\n    \n    --save the custom color\n    envTable.CustomBorderColor = hasCustomBorderColor\n    \nend\n\n\n",
					["Time"] = 1543680853,
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --get the custom color added by the user or the default color\n    local color = envTable.CustomBorderColor or envTable.DefaultBorderColor\n    --parse the color since it can be a color name, hex or color table\n    local r, g, b = DetailsFramework:ParseColors (color)\n    \n    --set the border color\n    self:SetBackdropBorderColor (r, g, b, envTable.BorderAlpha)\n    \nend\n\n\n\n\n",
					["SpellIds"] = {
					},
					["PlaterCore"] = 1,
					["Name"] = "Aura - Border Color [Plater]",
					["Enabled"] = true,
					["Icon"] = 133006,
					["Revision"] = 45,
				}, -- [11]
				{
					["ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.EnergyAmount = Plater:CreateLabel (unitFrame, \"\", 16, \"silver\");\n    envTable.EnergyAmount:SetPoint (\"bottom\", unitFrame, \"top\", 0, 18);\nend\n\n--[=[\n\n\n--]=]",
					["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.EnergyAmount:Hide()\nend\n\n\n",
					["ScriptType"] = 3,
					["NpcNames"] = {
						"Guardian of Yogg-Saron", -- [1]
					},
					["Author"] = "Celian-Sylvanas",
					["Desc"] = "Show the energy amount above the nameplate",
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.EnergyAmount:Show()\nend\n\n\n",
					["Time"] = 1539015649,
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.EnergyAmount.text = \"\" .. UnitPower (unitId);\nend\n\n\n",
					["SpellIds"] = {
					},
					["PlaterCore"] = 1,
					["Name"] = "UnitPower [Plater]",
					["Enabled"] = true,
					["Icon"] = 136048,
					["Revision"] = 131,
				}, -- [12]
				{
					["ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.movingArrow = envTable.movingArrow or Plater:CreateImage (self, [[Interface\\PETBATTLES\\PetBattle-StatIcons]], 16, self:GetHeight(), \"background\", {0, 15/32, 18/32, 30/32})\n    \n    envTable.movingArrow:SetAlpha (0.275)\n    --envTable.movingArrow:SetDesaturated (true)\n    \n    envTable.movingAnimation = envTable.movingAnimation or Plater:CreateAnimationHub (envTable.movingArrow, \n        function() \n            envTable.movingArrow:Show() \n            envTable.movingArrow:SetPoint(\"left\", 0, 0)\n        end, \n        function() envTable.movingArrow:Hide() end)\n    \n    envTable.movingAnimation:SetLooping (\"REPEAT\")\n    \n    local animation = Plater:CreateAnimation (envTable.movingAnimation, \"translation\", 1, 0.2, self:GetWidth()-16, 0)\n    \n    \n    \nend\n\n\n",
					["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.movingAnimation:Stop()\nend\n\n\n",
					["ScriptType"] = 2,
					["NpcNames"] = {
					},
					["Author"] = "Izimode-Azralon",
					["Desc"] = "Does an animation for casts that affect the frontal area of the enemy. Add spell in the Add Trigger field.",
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.movingAnimation:Play()\nend\n\n\n",
					["Time"] = 1539201849,
					["UpdateCode"] = "		function (self, unitId, unitFrame, envTable)\n			\n		end\n	",
					["SpellIds"] = {
						255952, -- [1]
						257426, -- [2]
						274400, -- [3]
						272609, -- [4]
						269843, -- [5]
						269029, -- [6]
						272827, -- [7]
						269266, -- [8]
						263912, -- [9]
						264923, -- [10]
						258864, -- [11]
						256955, -- [12]
						265540, -- [13]
						260793, -- [14]
						270003, -- [15]
						270507, -- [16]
						257337, -- [17]
						268415, -- [18]
						275907, -- [19]
						268865, -- [20]
						260669, -- [21]
						260280, -- [22]
						253239, -- [23]
						265541, -- [24]
						250258, -- [25]
					},
					["PlaterCore"] = 1,
					["Name"] = "Cast - Frontal Cone [Plater]",
					["Enabled"] = true,
					["Icon"] = "Interface\\AddOns\\Plater\\images\\cast_bar",
					["Revision"] = 171,
				}, -- [13]
				{
					["ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.FixateTarget = Plater:CreateLabel (unitFrame);\n    envTable.FixateTarget:SetPoint (\"bottom\", unitFrame.BuffFrame, \"top\", 0, 10);    \n    \n    envTable.FixateIcon = Plater:CreateImage (unitFrame, 236188, 16, 16, \"overlay\");\n    envTable.FixateIcon:SetPoint (\"bottom\", envTable.FixateTarget, \"top\", 0, 4);    \n    \nend\n\n\n\n\n\n\n\n\n",
					["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.FixateTarget:Hide()\n    envTable.FixateIcon:Hide()\nend\n\n\n",
					["ScriptType"] = 1,
					["NpcNames"] = {
					},
					["Author"] = "Celian-Sylvanas",
					["Desc"] = "Show above the nameplate who is the player fixated",
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.FixateTarget:Show();\n    envTable.FixateIcon:Show();\n    \nend\n\n\n",
					["Time"] = 1539187387,
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    local targetName = UnitName (unitId .. \"target\");\n    if (targetName) then\n        local _, class = UnitClass (unitId .. \"target\");\n        targetName = Plater.SetTextColorByClass (unitId .. \"target\", targetName);\n        envTable.FixateTarget.text = targetName;\n    end    \nend\n\n\n",
					["SpellIds"] = {
						272584, -- [1]
						244653, -- [2]
					},
					["PlaterCore"] = 1,
					["Name"] = "Fixate [Plater]",
					["Enabled"] = true,
					["Icon"] = 1029718,
					["Revision"] = 190,
				}, -- [14]
				{
					["ConstructorCode"] = "--todo: add npc ids for multilanguage support\n\nfunction (self, unitId, unitFrame, envTable)\n    \n    --settings\n    envTable.TextAboveNameplate = \"** On You **\"\n    envTable.NameplateColor = \"green\"\n    \n    --label to show the text above the nameplate\n    envTable.FixateTarget = Plater:CreateLabel (unitFrame);\n    envTable.FixateTarget:SetPoint (\"bottom\", unitFrame.healthBar, \"top\", 0, 30);\n    \n    --the spell casted by the npc in the trigger list needs to be in the list below as well\n    local spellList = {\n        [268074] = \"Dark Purpose\", --G'huun Mythic Add\n        [260954] = \"Iron Gaze\", --Sergeant Bainbridge - Siege of Boralus\n        [257739] = \"Blind Rage\", --Blacktooth Scrapper - Freehold\n        [257314] = \"Black Powder Bomb\", --Irontide Grenadier - Freehold\n        [266107] = \"Thirst For Blood\", --Feral Bloodswarmer - The Underrot\n        [257582] = \"Raging Gaze\", --Earthrager - The MOTHERLODE!!\n        [262377] = \"Seek and Destroy\", --Crawler Mine - The MOTHERLODE!!\n        [257407] = \"Pursuit\", --Rezan - Atal'Dazar\n        --[] = \"\" --       \n        \n    }\n    \n    --build the list with localized spell names\n    envTable.FixateDebuffs = {}\n    for spellID, enUSSpellName in pairs (spellList) do\n        local localizedSpellName = GetSpellInfo (spellID)\n        envTable.FixateDebuffs [localizedSpellName or enUSSpellName] = true\n    end\n    \n    --debug - smuggled crawg\n    envTable.FixateDebuffs [\"Jagged Maw\"] = true\n    \nend\n\n--[=[\nNpcIDs:\n136461: Spawn of G'huun (mythic uldir G'huun)\n\n--]=]\n\n\n\n\n",
					["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.FixateTarget:SetText (\"\")\n    envTable.FixateTarget:Hide()\n    \n    envTable.IsFixated = false\n    \n    Plater.RefreshNameplateColor (unitFrame)\nend\n\n\n",
					["ScriptType"] = 3,
					["NpcNames"] = {
						"smuggled crawg", -- [1]
						"sergeant bainbridge", -- [2]
						"blacktooth scrapper", -- [3]
						"irontide grenadier", -- [4]
						"feral bloodswarmer", -- [5]
						"earthrager", -- [6]
						"crawler mine", -- [7]
						"rezan", -- [8]
						"136461", -- [9]
					},
					["Author"] = "Tecno-Azralon",
					["Desc"] = "When an enemy places a debuff and starts to chase you. This script changes the nameplate color and place your name above the nameplate as well.",
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \nend\n\n\n",
					["Time"] = 1543250950,
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --swap this to true when it is fixated\n    local isFixated = false\n    \n    --check the debuffs the player has and see if any of these debuffs has been placed by this unit\n    for debuffId = 1, 40 do\n        local name, texture, count, debuffType, duration, expirationTime, caster = UnitDebuff (\"player\", debuffId)\n        \n        --cancel the loop if there's no more debuffs on the player\n        if (not name) then \n            break \n        end\n        \n        --check if the owner of the debuff is this unit\n        if (envTable.FixateDebuffs [name] and caster and UnitIsUnit (caster, unitId)) then\n            --the debuff the player has, has been placed by this unit, set the name above the unit name\n            envTable.FixateTarget:SetText (envTable.TextAboveNameplate)\n            envTable.FixateTarget:Show()\n            Plater.SetNameplateColor (unitFrame,  envTable.NameplateColor)\n            isFixated = true\n            \n            if (not envTable.IsFixated) then\n                envTable.IsFixated = true\n                Plater.FlashNameplateBody (unitFrame, \"fixate\", .2)\n            end\n        end\n        \n    end\n    \n    --check if the nameplate color is changed but isn't fixated any more\n    if (not isFixated and envTable.IsFixated) then\n        --refresh the nameplate color\n        Plater.RefreshNameplateColor (unitFrame)\n        --reset the text\n        envTable.FixateTarget:SetText (\"\")\n        \n        envTable.IsFixated = false\n    end\n    \nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
					["SpellIds"] = {
						"spawn of g'huun", -- [1]
						"smuggled crawg", -- [2]
						"sergeant bainbridge", -- [3]
						"blacktooth scrapper", -- [4]
						"irontide grenadier", -- [5]
						"feral bloodswarmer", -- [6]
						"earthrager", -- [7]
						"crawler mine", -- [8]
						"rezan", -- [9]
					},
					["PlaterCore"] = 1,
					["Name"] = "Fixate On You [Plater]",
					["Enabled"] = true,
					["Icon"] = 841383,
					["Revision"] = 194,
				}, -- [15]
			},
			["aura_timer_text_color"] = {
				nil, -- [1]
				0.96470588235294, -- [2]
				0.92549019607843, -- [3]
			},
			["pet_height_scale"] = 0.94999998807907,
			["first_run3"] = true,
			["url"] = "https://wago.io/e_OehloIz/3",
			["transparency_behavior"] = 4,
			["show_shield_prediction"] = false,
			["aura_stack_color"] = {
				nil, -- [1]
				0.94509803921569, -- [2]
				0.93725490196078, -- [3]
			},
			["aura_consolidate"] = true,
			["aura_timer_text_anchor"] = {
				["y"] = 7,
				["x"] = -7,
			},
			["castbar_framelevel"] = 0,
			["health_statusbar_bgtexture"] = "PlaterBackground",
			["plate_config"] = {
				["player"] = {
					["actorname_text_font"] = "Accidental Presidency",
					["percent_text_font"] = "Accidental Presidency",
					["spellpercent_text_font"] = "Accidental Presidency",
					["mana_incombat"] = {
						nil, -- [1]
						6, -- [2]
					},
					["power_percent_text_size"] = 8,
					["big_actortitle_text_font"] = "Accidental Presidency",
					["power_percent_text_font"] = "Accidental Presidency",
					["cast"] = {
						nil, -- [1]
						6, -- [2]
					},
					["cast_incombat"] = {
						nil, -- [1]
						6, -- [2]
					},
					["spellname_text_font"] = "Accidental Presidency",
					["spellname_text_anchor"] = {
						["side"] = 3,
					},
					["mana"] = {
						nil, -- [1]
						6, -- [2]
					},
					["big_actorname_text_font"] = "Accidental Presidency",
					["level_text_font"] = "Accidental Presidency",
					["spellpercent_text_anchor"] = {
						["side"] = 5,
						["x"] = 4,
					},
				},
				["friendlyplayer"] = {
					["quest_color_enemy"] = {
						1, -- [1]
						0.369, -- [2]
						0, -- [3]
					},
					["spellpercent_text_font"] = "Accidental Presidency",
					["actorname_friend_color"] = {
						0, -- [1]
						[3] = 0.9294117647058824,
					},
					["level_text_size"] = 8,
					["actorname_use_class_color"] = true,
					["big_actortitle_text_font"] = "Accidental Presidency",
					["cast"] = {
						122, -- [1]
					},
					["spellpercent_text_size"] = 11,
					["big_actortitle_text_size"] = 10,
					["spellpercent_text_anchor"] = {
						["side"] = 5,
						["x"] = 2,
					},
					["level_text_anchor"] = {
						["y"] = 0,
						["x"] = 2,
						["side"] = 10,
					},
					["big_actortitle_text_shadow_color_offset"] = {
						1, -- [1]
						-1, -- [2]
					},
					["cast_incombat"] = {
						122, -- [1]
						8, -- [2]
					},
					["spellname_text_outline"] = "OUTLINE",
					["big_actorname_text_shadow_color"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["spellname_text_anchor"] = {
						["side"] = 3,
					},
					["big_actortitle_text_shadow_color"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["percent_text_anchor"] = {
						["side"] = 11,
					},
					["level_text_font"] = "Accidental Presidency",
					["actorname_text_font"] = "Accidental Presidency",
					["big_actorname_text_outline"] = "OUTLINE",
					["big_actorname_text_shadow_color_offset"] = {
						1, -- [1]
						-1, -- [2]
					},
					["quest_color_neutral"] = {
						1, -- [1]
						0.65, -- [2]
						0, -- [3]
					},
					["mana_incombat"] = {
						nil, -- [1]
						4, -- [2]
					},
					["only_thename"] = true,
					["big_actorname_text_font"] = "Accidental Presidency",
					["spellname_text_font"] = "Accidental Presidency",
					["all_names"] = true,
					["mana"] = {
						nil, -- [1]
						4, -- [2]
					},
					["percent_text_enabled"] = true,
					["big_actorname_text_size"] = 10,
					["actorname_text_outline"] = "NONE",
					["percent_show_health"] = true,
					["spellpercent_text_enabled"] = true,
					["big_actortitle_text_outline"] = "OUTLINE",
					["health_incombat"] = {
						120, -- [1]
						16, -- [2]
					},
					["percent_text_font"] = "Accidental Presidency",
					["buff_frame_y_offset"] = 0,
					["actorname_guild_color"] = {
						0, -- [1]
						[3] = 0.03137254901960784,
					},
					["quest_enabled"] = true,
					["percent_text_size"] = 10,
					["power_percent_text_font"] = "Accidental Presidency",
					["actorname_text_size"] = 11,
					["spellname_text_size"] = 11,
					["health"] = {
						120, -- [1]
						14, -- [2]
					},
					["level_text_alpha"] = 0.5,
					["actorname_text_anchor"] = {
						["side"] = 4,
					},
					["percent_text_ooc"] = true,
					["show_guild_name"] = true,
					["level_text_enabled"] = true,
				},
				["friendlynpc"] = {
					["big_actorname_text_size"] = 10,
					["spellpercent_text_font"] = "Accidental Presidency",
					["level_text_size"] = 8,
					["big_actortitle_text_font"] = "Accidental Presidency",
					["cast"] = {
						122, -- [1]
						8, -- [2]
					},
					["spellpercent_text_size"] = 11,
					["big_actortitle_text_size"] = 10,
					["spellpercent_text_anchor"] = {
						["side"] = 5,
						["x"] = 2,
					},
					["level_text_anchor"] = {
						["y"] = 0,
						["x"] = 2,
						["side"] = 10,
					},
					["cast_incombat"] = {
						122, -- [1]
						8, -- [2]
					},
					["spellname_text_outline"] = "OUTLINE",
					["spellname_text_anchor"] = {
						["side"] = 3,
					},
					["percent_text_anchor"] = {
						["side"] = 11,
					},
					["level_text_font"] = "Accidental Presidency",
					["actorname_text_font"] = "Accidental Presidency",
					["quest_color_neutral"] = {
						1, -- [1]
						0.65, -- [2]
						0, -- [3]
					},
					["actorname_text_size"] = 11,
					["percent_text_enabled"] = true,
					["all_names"] = false,
					["percent_show_health"] = true,
					["percent_text_size"] = 10,
					["percent_text_font"] = "Accidental Presidency",
					["quest_color_enemy"] = {
						1, -- [1]
						0.369, -- [2]
						0, -- [3]
					},
					["spellname_text_font"] = "Accidental Presidency",
					["percent_text_ooc"] = true,
					["actorname_text_anchor"] = {
						["side"] = 4,
					},
					["big_actorname_text_font"] = "Accidental Presidency",
					["relevance_state"] = 3,
					["health"] = {
						120, -- [1]
						14, -- [2]
					},
					["spellname_text_size"] = 11,
					["power_percent_text_font"] = "Accidental Presidency",
					["spellpercent_text_enabled"] = true,
					["level_text_alpha"] = 0.5,
					["level_text_enabled"] = true,
				},
				["enemyplayer"] = {
					["actorname_text_font"] = "Accidental Presidency",
					["quest_color_enemy"] = {
						1, -- [1]
						0.369, -- [2]
						0, -- [3]
					},
					["spellpercent_text_font"] = "Accidental Presidency",
					["show_guild_name"] = true,
					["level_text_size"] = 8,
					["big_actortitle_text_font"] = "Accidental Presidency",
					["cast"] = {
						120, -- [1]
						8, -- [2]
					},
					["all_names"] = true,
					["actorname_text_size"] = 11,
					["big_actortitle_text_size"] = 10,
					["quest_color_neutral"] = {
						1, -- [1]
						0.65, -- [2]
						0, -- [3]
					},
					["level_text_anchor"] = {
						["y"] = 0,
						["x"] = 2,
						["side"] = 10,
					},
					["level_text_alpha"] = 0.5,
					["spellpercent_text_anchor"] = {
						["side"] = 5,
						["x"] = 2,
					},
					["percent_text_size"] = 10,
					["actorname_text_spacing"] = 10,
					["percent_text_font"] = "Accidental Presidency",
					["spellname_text_font"] = "Accidental Presidency",
					["cast_incombat"] = {
						nil, -- [1]
						8, -- [2]
					},
					["quest_enabled"] = true,
					["spellname_text_outline"] = "OUTLINE",
					["spellpercent_text_size"] = 11,
					["big_actorname_text_size"] = 10,
					["spellname_text_size"] = 11,
					["health"] = {
						120, -- [1]
						14, -- [2]
					},
					["spellname_text_anchor"] = {
						["side"] = 3,
					},
					["power_percent_text_font"] = "Accidental Presidency",
					["percent_text_anchor"] = {
						["side"] = 11,
					},
					["level_text_font"] = "Accidental Presidency",
					["big_actorname_text_font"] = "Accidental Presidency",
				},
				["enemynpc"] = {
					["actorname_text_font"] = "Accidental Presidency",
					["spellpercent_text_font"] = "Accidental Presidency",
					["big_actortitle_text_font"] = "Accidental Presidency",
					["cast"] = {
						120, -- [1]
						8, -- [2]
					},
					["level_text_alpha"] = 0.5,
					["spellpercent_text_anchor"] = {
						["side"] = 5,
						["x"] = 0,
					},
					["percent_text_size"] = 10,
					["level_text_anchor"] = {
						["y"] = 0,
						["x"] = 2,
						["side"] = 10,
					},
					["percent_text_font"] = "Accidental Presidency",
					["cast_incombat"] = {
						nil, -- [1]
						8, -- [2]
					},
					["spellname_text_font"] = "Accidental Presidency",
					["spellname_text_size"] = 11,
					["health"] = {
						120, -- [1]
						14, -- [2]
					},
					["spellname_text_anchor"] = {
						["side"] = 3,
					},
					["big_actorname_text_font"] = "Accidental Presidency",
					["percent_text_anchor"] = {
						["side"] = 11,
					},
					["level_text_font"] = "Accidental Presidency",
					["power_percent_text_font"] = "Accidental Presidency",
				},
			},
			["indicator_raidmark_anchor"] = {
				["x"] = -34.02999877929688,
			},
			["use_ui_parent"] = true,
			["aura_show_defensive_cd"] = true,
			["health_statusbar_texture"] = "DGround",
			["hook_auto_imported"] = {
				["Targetting Alpha"] = 3,
				["Dont Have Aura"] = 1,
				["Players Targetting Amount"] = 4,
				["Color Automation"] = 1,
				["Bwonsamdi Reaping"] = 1,
				["Execute Range"] = 1,
				["Blockade Encounter"] = 1,
				["Attacking Specific Unit"] = 1,
				["Reorder Nameplate"] = 3,
				["Hide Neutral Units"] = 1,
				["Combo Points"] = 3,
				["Extra Border"] = 2,
				["Target Color"] = 3,
				["Aura Reorder"] = 1,
				["Jaina Encounter"] = 6,
			},
			["castbar_target_show"] = true,
			["cast_statusbar_bgcolor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				0.79781, -- [4]
			},
			["first_run2"] = true,
			["aura_width_personal"] = 23,
			["color_override_colors"] = {
				[3] = {
					nil, -- [1]
					0.2784313, -- [2]
					0.2078431, -- [3]
				},
			},
			["npc_cache"] = {
				[136181] = {
					"火山", -- [1]
					"Whispering Reef (Islands 10)", -- [2]
				},
				[130639] = {
					"钳颚咀嚼者", -- [1]
					"Whispering Reef (Islands 10)", -- [2]
				},
				[153119] = {
					"小型虚空元素", -- [1]
					"奥格瑞玛的惊魂幻象", -- [2]
				},
				[153065] = {
					"虚缚破坏者", -- [1]
					"奥格瑞玛的惊魂幻象", -- [2]
				},
				[135895] = {
					"灼光火花", -- [1]
					"Whispering Reef (Islands 10)", -- [2]
				},
				[161815] = {
					"克熙尔唤虚者", -- [1]
					"心之秘室", -- [2]
				},
				[156146] = {
					"虚缚持盾卫士", -- [1]
					"奥格瑞玛的惊魂幻象", -- [2]
				},
				[152089] = {
					"萨尔", -- [1]
					"奥格瑞玛的惊魂幻象", -- [2]
				},
				[140792] = {
					"断喙拾骨者", -- [1]
					"Whispering Reef (Islands 10)", -- [2]
				},
				[124581] = {
					"脊壳钳嘴龟", -- [1]
					"Whispering Reef (Islands 10)", -- [2]
				},
				["144942"] = {
					"Spark Bot", -- [1]
					"Battle of Dazar'alor", -- [2]
				},
				[153097] = {
					"虚缚萨满祭司", -- [1]
					"奥格瑞玛的惊魂幻象", -- [2]
				},
				[161812] = {
					"无面毁伤者", -- [1]
					"心之秘室", -- [2]
				},
				[135931] = {
					"灰岩", -- [1]
					"Whispering Reef (Islands 10)", -- [2]
				},
				[147932] = {
					"焦躁的艾泽里特裂片", -- [1]
					"Whispering Reef (Islands 10)", -- [2]
				},
				[135925] = {
					"爆烈之焰", -- [1]
					"Whispering Reef (Islands 10)", -- [2]
				},
				[122266] = {
					"脊壳龟", -- [1]
					"Whispering Reef (Islands 10)", -- [2]
				},
				[145061] = {
					"尖啸的夜翼鸦", -- [1]
					"Whispering Reef (Islands 10)", -- [2]
				},
				[147948] = {
					"凝结的艾泽里特", -- [1]
					"Whispering Reef (Islands 10)", -- [2]
				},
				[135893] = {
					"燃烬卫士", -- [1]
					"Whispering Reef (Islands 10)", -- [2]
				},
				[161813] = {
					"克熙尔刺客", -- [1]
					"心之秘室", -- [2]
				},
				[156268] = {
					"未知目标", -- [1]
					"心之秘室", -- [2]
				},
				[153141] = {
					"未知目标", -- [1]
					"奥格瑞玛的惊魂幻象", -- [2]
				},
				[138428] = {
					"怨鳍侍从", -- [1]
					"Whispering Reef (Islands 10)", -- [2]
				},
				[156406] = {
					"虚缚荣誉卫兵", -- [1]
					"奥格瑞玛的惊魂幻象", -- [2]
				},
				[132755] = {
					"断喙食腐鸟", -- [1]
					"Whispering Reef (Islands 10)", -- [2]
				},
				[152704] = {
					"蠕行腐蚀", -- [1]
					"奥格瑞玛的惊魂幻象", -- [2]
				},
				[135894] = {
					"火元素", -- [1]
					"Whispering Reef (Islands 10)", -- [2]
				},
				[152669] = {
					"虚空液球", -- [1]
					"奥格瑞玛的惊魂幻象", -- [2]
				},
				[161273] = {
					"深渊之嗣", -- [1]
					"心之秘室", -- [2]
				},
			},
			["spell_animation_list"] = {
				["228354"] = {
					["1"] = {
						["scaleY"] = 1,
						["fade_out"] = 0.02,
						["duration"] = 0.12,
						["absolute_sineY"] = false,
						["animation_type"] = "frameshake",
						["scaleX"] = 0.1,
						["absolute_sineX"] = false,
						["amplitude"] = 1,
						["fade_in"] = 0.01,
						["enabled"] = true,
						["cooldown"] = 0.5,
						["frequency"] = 25,
					},
					["info"] = {
						["time"] = 0,
						["class"] = "MAGE",
						["spellid"] = 228354,
						["desc"] = "",
					},
				},
				["30451"] = {
					["1"] = {
						["scaleY"] = 1,
						["fade_out"] = 0.02,
						["duration"] = 0.12,
						["absolute_sineY"] = false,
						["animation_type"] = "frameshake",
						["scaleX"] = 0.1,
						["absolute_sineX"] = false,
						["amplitude"] = 1,
						["fade_in"] = 0.01,
						["enabled"] = true,
						["cooldown"] = 0.5,
						["frequency"] = 25,
					},
					["info"] = {
						["time"] = 0,
						["class"] = "MAGE",
						["spellid"] = 30451,
						["desc"] = "",
					},
				},
				["31935"] = {
					["1"] = {
						["enabled"] = true,
						["scale_upX"] = 1.03,
						["animation_type"] = "scale",
						["scale_downX"] = 0.97,
						["duration"] = 0.05,
						["scale_downY"] = 0.97,
						["cooldown"] = 0.75,
						["scale_upY"] = 1.03,
					},
					["info"] = {
						["time"] = 0,
						["class"] = "PALADIN",
						["spellid"] = 31935,
						["desc"] = "",
					},
					["2"] = {
						["scaleY"] = 1,
						["fade_out"] = 0.09,
						["absolute_sineX"] = true,
						["duration"] = 0.1,
						["absolute_sineY"] = false,
						["animation_type"] = "frameshake",
						["scaleX"] = 1,
						["amplitude"] = 6,
						["critical_scale"] = 1.05,
						["fade_in"] = 0.01,
						["enabled"] = true,
						["cooldown"] = 0.5,
						["frequency"] = 1,
					},
				},
				["31661"] = {
					["1"] = {
						["scaleY"] = 1,
						["fade_out"] = 0.01,
						["duration"] = 0.1,
						["absolute_sineY"] = false,
						["animation_type"] = "frameshake",
						["scaleX"] = 0.2,
						["absolute_sineX"] = false,
						["amplitude"] = 0.75,
						["fade_in"] = 0.01,
						["enabled"] = true,
						["cooldown"] = 0,
						["frequency"] = 200,
					},
					["info"] = {
						["time"] = 0,
						["class"] = "MAGE",
						["spellid"] = 31661,
						["desc"] = "",
					},
				},
				["199552"] = {
					["1"] = {
						["scaleY"] = 0.79999923706055,
						["fade_out"] = 0.099999994039536,
						["absolute_sineX"] = true,
						["duration"] = 0.099999994039536,
						["absolute_sineY"] = false,
						["animation_type"] = "frameshake",
						["scaleX"] = 0.20000076293945,
						["critical_scale"] = 1.05,
						["amplitude"] = 2.5,
						["fade_in"] = 0,
						["enabled"] = true,
						["cooldown"] = 0.5,
						["frequency"] = 1,
					},
					["info"] = {
						["time"] = 1539717392,
						["class"] = "DEMONHUNTER",
						["spellid"] = 199552,
						["desc"] = "",
					},
					["2"] = {
						["scale_upY"] = 1.0299999713898,
						["scale_upX"] = 1.0299999713898,
						["animation_type"] = "scale",
						["scale_downX"] = 0.96999996900559,
						["duration"] = 0.05,
						["scale_downY"] = 0.96999996900559,
						["cooldown"] = 0.75,
						["enabled"] = true,
					},
				},
				["222024"] = {
					["1"] = {
						["enabled"] = true,
						["scale_upX"] = 1.1,
						["animation_type"] = "scale",
						["scale_downX"] = 0.9,
						["duration"] = 0.035,
						["scale_downY"] = 0.9,
						["cooldown"] = 0.75,
						["scale_upY"] = 1.1,
					},
					["info"] = {
						["time"] = 0,
						["class"] = "DEATHKNIGHT",
						["spellid"] = 222024,
						["desc"] = "",
					},
					["2"] = {
						["scaleY"] = -1,
						["fade_out"] = 0.02,
						["absolute_sineX"] = true,
						["duration"] = 0.075,
						["absolute_sineY"] = true,
						["animation_type"] = "frameshake",
						["scaleX"] = 1,
						["amplitude"] = 1.8,
						["critical_scale"] = 2,
						["fade_in"] = 0.01,
						["enabled"] = true,
						["cooldown"] = 0.5,
						["frequency"] = 50,
					},
				},
				["2098"] = {
					["1"] = {
						["enabled"] = true,
						["scale_upX"] = 1.1000000238419,
						["animation_type"] = "scale",
						["scale_downX"] = 0.89999997615814,
						["duration"] = 0.04,
						["scale_downY"] = 0.89999997615814,
						["cooldown"] = 0.75,
						["scale_upY"] = 1.1999999284744,
					},
					["info"] = {
						["time"] = 1539293610,
						["class"] = "ROGUE",
						["spellid"] = 2098,
						["desc"] = "",
					},
					["2"] = {
						["scaleY"] = 1,
						["fade_out"] = 0.079999998211861,
						["duration"] = 0.21999999880791,
						["absolute_sineY"] = true,
						["animation_type"] = "frameshake",
						["scaleX"] = 1,
						["absolute_sineX"] = false,
						["amplitude"] = 1.5,
						["fade_in"] = 0,
						["enabled"] = true,
						["cooldown"] = 0.5,
						["frequency"] = 2.710000038147,
					},
				},
				["44425"] = {
					["1"] = {
						["scaleY"] = 1,
						["fade_out"] = 0.02,
						["duration"] = 0.12,
						["absolute_sineY"] = false,
						["animation_type"] = "frameshake",
						["scaleX"] = 0.1,
						["absolute_sineX"] = false,
						["amplitude"] = 1,
						["fade_in"] = 0.01,
						["enabled"] = true,
						["cooldown"] = 0.5,
						["frequency"] = 25,
					},
					["info"] = {
						["time"] = 0,
						["class"] = "MAGE",
						["spellid"] = 44425,
						["desc"] = "",
					},
				},
				["228600"] = {
					["1"] = {
						["scaleY"] = 1,
						["fade_out"] = 0.09,
						["absolute_sineX"] = false,
						["duration"] = 0.1,
						["absolute_sineY"] = true,
						["animation_type"] = "frameshake",
						["scaleX"] = 0.1,
						["amplitude"] = 10,
						["critical_scale"] = 1.2,
						["fade_in"] = 0.01,
						["enabled"] = true,
						["cooldown"] = 0.5,
						["frequency"] = 1,
					},
					["info"] = {
						["time"] = 0,
						["class"] = "MAGE",
						["spellid"] = 228600,
						["desc"] = "",
					},
				},
				["203782"] = {
					["1"] = {
						["scaleY"] = -1,
						["fade_out"] = 0.089999996125698,
						["absolute_sineX"] = true,
						["duration"] = 0.099999994039536,
						["absolute_sineY"] = false,
						["animation_type"] = "frameshake",
						["scaleX"] = 0,
						["critical_scale"] = 1.05,
						["amplitude"] = 1.5,
						["fade_in"] = 0.0099999997764826,
						["enabled"] = true,
						["cooldown"] = 0.5,
						["frequency"] = 1,
					},
					["info"] = {
						["time"] = 1539716639,
						["class"] = "DEMONHUNTER",
						["spellid"] = 203782,
						["desc"] = "",
					},
				},
				["107270"] = {
					["1"] = {
						["scaleY"] = 1,
						["fade_out"] = 0.089999996125698,
						["absolute_sineX"] = false,
						["duration"] = 0.1499999910593,
						["absolute_sineY"] = false,
						["animation_type"] = "frameshake",
						["scaleX"] = 0.099998474121094,
						["amplitude"] = 0.1499999910593,
						["critical_scale"] = 1.05,
						["fade_in"] = 0.0099999997764826,
						["enabled"] = true,
						["cooldown"] = 0.5,
						["frequency"] = 200,
					},
					["info"] = {
						["time"] = 1539296490,
						["class"] = "MONK",
						["spellid"] = 107270,
						["desc"] = "",
					},
				},
				["205523"] = {
					["1"] = {
						["scaleY"] = 1,
						["fade_out"] = 0.09,
						["absolute_sineX"] = false,
						["duration"] = 0.099999994039536,
						["absolute_sineY"] = false,
						["animation_type"] = "frameshake",
						["scaleX"] = 0.099998474121094,
						["amplitude"] = 3,
						["critical_scale"] = 1.05,
						["fade_in"] = 0.01,
						["enabled"] = true,
						["cooldown"] = 0.5,
						["frequency"] = 1,
					},
					["info"] = {
						["time"] = 1539295885,
						["class"] = "MONK",
						["spellid"] = 205523,
						["desc"] = "",
					},
				},
				["162243"] = {
					["1"] = {
						["scaleY"] = 1,
						["fade_out"] = 0.089999996125698,
						["absolute_sineX"] = false,
						["duration"] = 0.099999994039535,
						["absolute_sineY"] = true,
						["animation_type"] = "frameshake",
						["scaleX"] = 0.099998474121094,
						["critical_scale"] = 1.05,
						["amplitude"] = 1,
						["fade_in"] = 0.0099999997764826,
						["enabled"] = true,
						["cooldown"] = 0.5,
						["frequency"] = 1,
					},
					["info"] = {
						["time"] = 1539717356,
						["class"] = "DEMONHUNTER",
						["spellid"] = 162243,
						["desc"] = "",
					},
				},
				["117418"] = {
					["1"] = {
						["scaleY"] = 1,
						["fade_out"] = 0.1499999910593,
						["duration"] = 0.1799999922514,
						["absolute_sineX"] = false,
						["absolute_sineY"] = false,
						["animation_type"] = "frameshake",
						["scaleX"] = 0.099998474121094,
						["amplitude"] = 0.1499999910593,
						["critical_scale"] = 1.05,
						["fade_in"] = 0.0099999997764826,
						["enabled"] = true,
						["cooldown"] = 0.5,
						["frequency"] = 116.00999450684,
					},
					["info"] = {
						["time"] = 1539296387,
						["class"] = "MONK",
						["spellid"] = 117418,
						["desc"] = "",
					},
				},
				["6343"] = {
					["1"] = {
						["scaleY"] = 1,
						["fade_out"] = 0.01,
						["duration"] = 0.12,
						["absolute_sineY"] = false,
						["animation_type"] = "frameshake",
						["scaleX"] = 0.2,
						["absolute_sineX"] = false,
						["amplitude"] = 0.95,
						["fade_in"] = 0.01,
						["enabled"] = true,
						["cooldown"] = 0.1,
						["frequency"] = 200,
					},
					["info"] = {
						["time"] = 0,
						["class"] = "WARRIOR",
						["spellid"] = 6343,
						["desc"] = "",
					},
				},
				["204157"] = {
					["1"] = {
						["scaleY"] = 1,
						["fade_out"] = 0.089999996125698,
						["absolute_sineX"] = false,
						["duration"] = 0.1,
						["absolute_sineY"] = true,
						["animation_type"] = "frameshake",
						["scaleX"] = 1,
						["critical_scale"] = 1.05,
						["amplitude"] = 6,
						["fade_in"] = 0.0099999997764826,
						["enabled"] = true,
						["cooldown"] = 0.5,
						["frequency"] = 1,
					},
					["info"] = {
						["time"] = 1539716637,
						["class"] = "DEMONHUNTER",
						["spellid"] = 204157,
						["desc"] = "",
					},
					["2"] = {
						["animation_type"] = "scale",
						["scale_upX"] = 1.03,
						["enabled"] = true,
						["scale_downX"] = 0.97,
						["duration"] = 0.05,
						["scale_downY"] = 0.97,
						["cooldown"] = 0.75,
						["scale_upY"] = 1.03,
					},
				},
				["155166"] = {
					["1"] = {
						["scaleY"] = 0.6,
						["fade_out"] = 0.01,
						["duration"] = 0.2,
						["absolute_sineY"] = false,
						["animation_type"] = "frameshake",
						["scaleX"] = 0.2,
						["absolute_sineX"] = false,
						["amplitude"] = 0.45,
						["fade_in"] = 0.01,
						["enabled"] = true,
						["cooldown"] = 0,
						["frequency"] = 200,
					},
					["info"] = {
						["time"] = 0,
						["class"] = "DEATHKNIGHT",
						["spellid"] = 155166,
						["desc"] = "",
					},
				},
				[189112] = {
					{
						["amplitude"] = 1.879999995231628,
						["fade_out"] = 0.3499999940395355,
						["duration"] = 0.4000000059604645,
						["frequency"] = 51.97999954223633,
					}, -- [1]
				},
				["184575"] = {
					["1"] = {
						["enabled"] = true,
						["scale_upX"] = 1.05,
						["animation_type"] = "scale",
						["scale_downX"] = 0.95,
						["duration"] = 0.05,
						["scale_downY"] = 0.95,
						["cooldown"] = 0.75,
						["scale_upY"] = 1.05,
					},
					["info"] = {
						["time"] = 0,
						["class"] = "PALADIN",
						["spellid"] = 184575,
						["desc"] = "",
					},
					["2"] = {
						["scaleY"] = 1,
						["fade_out"] = 0.09,
						["absolute_sineX"] = false,
						["duration"] = 0.1,
						["absolute_sineY"] = true,
						["animation_type"] = "frameshake",
						["scaleX"] = 0.1,
						["amplitude"] = 2,
						["critical_scale"] = 1.2,
						["fade_in"] = 0.01,
						["enabled"] = true,
						["cooldown"] = 0.5,
						["frequency"] = 1,
					},
				},
				["199547"] = {
					["1"] = {
						["scaleY"] = 1,
						["fade_out"] = 0.089999996125698,
						["absolute_sineX"] = false,
						["duration"] = 0.1,
						["absolute_sineY"] = true,
						["animation_type"] = "frameshake",
						["scaleX"] = 0.59999847412109,
						["amplitude"] = 3,
						["critical_scale"] = 1.05,
						["fade_in"] = 0.0099999997764826,
						["enabled"] = true,
						["cooldown"] = 0.5,
						["frequency"] = 1,
					},
					["info"] = {
						["time"] = 1539717795,
						["class"] = "DEMONHUNTER",
						["spellid"] = 199547,
						["desc"] = "",
					},
					["2"] = {
						["scale_upY"] = 1.039999961853,
						["scale_upX"] = 1.039999961853,
						["animation_type"] = "scale",
						["scale_downX"] = 0.96999996900558,
						["duration"] = 0.05,
						["scale_downY"] = 0.96999996900558,
						["cooldown"] = 0.75,
						["enabled"] = true,
					},
				},
				["52174"] = {
					["1"] = {
						["enabled"] = true,
						["scale_upX"] = 1.15,
						["animation_type"] = "scale",
						["scale_downX"] = 0.8,
						["duration"] = 0.075,
						["scale_downY"] = 0.8,
						["cooldown"] = 0.75,
						["scale_upY"] = 1.15,
					},
					["info"] = {
						["time"] = 0,
						["class"] = "WARRIOR",
						["spellid"] = 52174,
						["desc"] = "",
					},
					["2"] = {
						["scaleY"] = 1,
						["fade_out"] = 0.2,
						["absolute_sineX"] = false,
						["duration"] = 0.3,
						["absolute_sineY"] = false,
						["animation_type"] = "frameshake",
						["scaleX"] = 0.15,
						["amplitude"] = 6,
						["critical_scale"] = 1.2,
						["fade_in"] = 0.01,
						["enabled"] = true,
						["cooldown"] = 0.5,
						["frequency"] = 50,
					},
				},
				["27285"] = {
					["1"] = {
						["enabled"] = true,
						["scale_upX"] = 1.1,
						["animation_type"] = "scale",
						["scale_downX"] = 0.9,
						["duration"] = 0.075,
						["scale_downY"] = 0.9,
						["cooldown"] = 0.75,
						["scale_upY"] = 1.1,
					},
					["info"] = {
						["time"] = 0,
						["class"] = "WARLOCK",
						["spellid"] = 27285,
						["desc"] = "",
					},
				},
				["206930"] = {
					["1"] = {
						["enabled"] = true,
						["scale_upX"] = 1.1,
						["animation_type"] = "scale",
						["scale_downX"] = 0.9,
						["duration"] = 0.035,
						["scale_downY"] = 0.9,
						["cooldown"] = 0.75,
						["scale_upY"] = 1.1,
					},
					["info"] = {
						["time"] = 0,
						["class"] = "DEATHKNIGHT",
						["spellid"] = 206930,
						["desc"] = "",
					},
					["2"] = {
						["scaleY"] = 1,
						["fade_out"] = 0.02,
						["absolute_sineX"] = true,
						["duration"] = 0.075,
						["absolute_sineY"] = true,
						["animation_type"] = "frameshake",
						["scaleX"] = -1,
						["amplitude"] = 1.8,
						["critical_scale"] = 2,
						["fade_in"] = 0.01,
						["enabled"] = true,
						["cooldown"] = 0.5,
						["frequency"] = 50,
					},
				},
				["185763"] = {
					["1"] = {
						["scaleY"] = 1,
						["fade_out"] = 0.25999999046326,
						["absolute_sineX"] = false,
						["duration"] = 0.15999999642372,
						["absolute_sineY"] = true,
						["animation_type"] = "frameshake",
						["scaleX"] = 0.099998474121094,
						["amplitude"] = 3.6583230495453,
						["critical_scale"] = 1.05,
						["fade_in"] = 0.0099999997764826,
						["enabled"] = true,
						["cooldown"] = 0.5,
						["frequency"] = 23.525663375854,
					},
					["info"] = {
						["time"] = 1539275610,
						["class"] = "ROGUE",
						["spellid"] = 185763,
						["desc"] = "",
					},
					["2"] = {
						["animation_type"] = "scale",
						["scale_upX"] = 1.0299999713898,
						["scale_upY"] = 1.0299999713898,
						["scale_downX"] = 0.96999996900559,
						["duration"] = 0.05,
						["scale_downY"] = 0.96999996900559,
						["cooldown"] = 0.75,
						["enabled"] = true,
					},
				},
				["264178"] = {
					["1"] = {
						["scaleY"] = 1,
						["fade_out"] = 0.08,
						["duration"] = 0.15,
						["absolute_sineY"] = false,
						["animation_type"] = "frameshake",
						["scaleX"] = 0.2,
						["absolute_sineX"] = false,
						["amplitude"] = 3,
						["fade_in"] = 0.01,
						["enabled"] = true,
						["cooldown"] = 0.25,
						["frequency"] = 25,
					},
					["info"] = {
						["time"] = 0,
						["class"] = "WARLOCK",
						["spellid"] = 264178,
						["desc"] = "",
					},
				},
				["20243"] = {
					["1"] = {
						["scaleY"] = 1,
						["fade_out"] = 0.02,
						["duration"] = 0.12,
						["absolute_sineY"] = false,
						["animation_type"] = "frameshake",
						["scaleX"] = 0.1,
						["absolute_sineX"] = false,
						["amplitude"] = 1,
						["fade_in"] = 0.01,
						["enabled"] = true,
						["cooldown"] = 0.5,
						["frequency"] = 25,
					},
					["info"] = {
						["time"] = 0,
						["class"] = "WARRIOR",
						["spellid"] = 20243,
						["desc"] = "",
					},
				},
				["275779"] = {
					["1"] = {
						["scaleY"] = -1,
						["fade_out"] = 0.02,
						["duration"] = 0.12,
						["absolute_sineY"] = true,
						["animation_type"] = "frameshake",
						["scaleX"] = 0.1,
						["absolute_sineX"] = false,
						["amplitude"] = 1,
						["fade_in"] = 0.01,
						["enabled"] = true,
						["cooldown"] = 0.5,
						["frequency"] = 25,
					},
					["info"] = {
						["time"] = 0,
						["class"] = "PALADIN",
						["spellid"] = 275779,
						["desc"] = "",
					},
				},
				["100784"] = {
					["1"] = {
						["scaleY"] = 1,
						["fade_out"] = 0.09,
						["absolute_sineX"] = false,
						["duration"] = 0.099999994039536,
						["absolute_sineY"] = false,
						["animation_type"] = "frameshake",
						["scaleX"] = 1,
						["amplitude"] = 3,
						["critical_scale"] = 1.05,
						["fade_in"] = 0.01,
						["enabled"] = true,
						["cooldown"] = 0.5,
						["frequency"] = 1,
					},
					["info"] = {
						["time"] = 1539296312,
						["class"] = "MONK",
						["spellid"] = 100784,
						["desc"] = "",
					},
				},
				["116858"] = {
					["1"] = {
						["enabled"] = true,
						["scale_upX"] = 1.075,
						["animation_type"] = "scale",
						["scale_downX"] = 0.915,
						["duration"] = 0.075,
						["scale_downY"] = 0.915,
						["cooldown"] = 0.75,
						["scale_upY"] = 1.075,
					},
					["info"] = {
						["time"] = 0,
						["class"] = "WARLOCK",
						["spellid"] = 116858,
						["desc"] = "",
					},
					["2"] = {
						["scaleY"] = 1,
						["fade_out"] = 0.1,
						["duration"] = 0.15,
						["absolute_sineY"] = false,
						["animation_type"] = "frameshake",
						["scaleX"] = 0.1,
						["absolute_sineX"] = false,
						["amplitude"] = 2,
						["fade_in"] = 0.05,
						["enabled"] = true,
						["cooldown"] = 0.25,
						["frequency"] = 60,
					},
				},
				["228478"] = {
					["1"] = {
						["scaleY"] = 0.79999923706055,
						["fade_out"] = 0.099999994039536,
						["absolute_sineX"] = true,
						["duration"] = 0.099999994039535,
						["absolute_sineY"] = false,
						["animation_type"] = "frameshake",
						["scaleX"] = 0.20000076293945,
						["critical_scale"] = 1.05,
						["amplitude"] = 2.5,
						["fade_in"] = 0,
						["enabled"] = true,
						["cooldown"] = 0.5,
						["frequency"] = 1,
					},
					["info"] = {
						["time"] = 1539716636,
						["class"] = "DEMONHUNTER",
						["spellid"] = 228478,
						["desc"] = "",
					},
					["2"] = {
						["animation_type"] = "scale",
						["scale_upX"] = 1.0299999713898,
						["enabled"] = true,
						["scale_downX"] = 0.96999996900559,
						["duration"] = 0.05,
						["scale_downY"] = 0.96999996900559,
						["cooldown"] = 0.75,
						["scale_upY"] = 1.0299999713898,
					},
				},
				["199804"] = {
					["1"] = {
						["scaleY"] = 0.88999938964844,
						["fade_out"] = 0.09,
						["absolute_sineX"] = false,
						["duration"] = 0.19999998807907,
						["absolute_sineY"] = true,
						["animation_type"] = "frameshake",
						["scaleX"] = 1,
						["amplitude"] = 1.1699999570847,
						["critical_scale"] = 1.05,
						["fade_in"] = 0.0099999997764826,
						["enabled"] = true,
						["cooldown"] = 0.5,
						["frequency"] = 23.525676727295,
					},
					["info"] = {
						["time"] = 1539293872,
						["class"] = "ROGUE",
						["spellid"] = 199804,
						["desc"] = "",
					},
					["2"] = {
						["scale_upY"] = 1.0499999523163,
						["scale_upX"] = 1.0499999523163,
						["animation_type"] = "scale",
						["scale_downX"] = 1,
						["duration"] = 0.050000000745058,
						["scale_downY"] = 1,
						["cooldown"] = 0.75,
						["enabled"] = true,
					},
				},
				["53595"] = {
					["1"] = {
						["enabled"] = true,
						["scale_upX"] = 1.03,
						["animation_type"] = "scale",
						["scale_downX"] = 0.97,
						["duration"] = 0.05,
						["scale_downY"] = 0.97,
						["cooldown"] = 0.75,
						["scale_upY"] = 1.03,
					},
					["info"] = {
						["time"] = 0,
						["class"] = "PALADIN",
						["spellid"] = 53595,
						["desc"] = "",
					},
					["2"] = {
						["scaleY"] = 1,
						["fade_out"] = 0.09,
						["absolute_sineX"] = false,
						["duration"] = 0.1,
						["absolute_sineY"] = true,
						["animation_type"] = "frameshake",
						["scaleX"] = 0.1,
						["amplitude"] = 3,
						["critical_scale"] = 1.05,
						["fade_in"] = 0.01,
						["enabled"] = true,
						["cooldown"] = 0.5,
						["frequency"] = 1,
					},
				},
				["197834"] = {
					["1"] = {
						["scaleY"] = 1,
						["fade_out"] = 0.02,
						["duration"] = 0.12,
						["absolute_sineY"] = false,
						["animation_type"] = "frameshake",
						["scaleX"] = 0.1,
						["absolute_sineX"] = false,
						["amplitude"] = 1,
						["fade_in"] = 0.01,
						["enabled"] = true,
						["cooldown"] = 0.5,
						["frequency"] = 25,
					},
					["info"] = {
						["time"] = 0,
						["class"] = "ROGUE",
						["spellid"] = 197834,
						["desc"] = "",
					},
				},
				["11366"] = {
					["1"] = {
						["enabled"] = true,
						["scale_upX"] = 1.15,
						["animation_type"] = "scale",
						["scale_downX"] = 0.8,
						["duration"] = 0.05,
						["scale_downY"] = 0.8,
						["cooldown"] = 0.75,
						["scale_upY"] = 1.15,
					},
					["info"] = {
						["time"] = 0,
						["class"] = "MAGE",
						["spellid"] = 11366,
						["desc"] = "",
					},
					["2"] = {
						["scaleY"] = 1,
						["fade_out"] = 0.09,
						["absolute_sineX"] = false,
						["duration"] = 0.1,
						["absolute_sineY"] = true,
						["animation_type"] = "frameshake",
						["scaleX"] = 0.1,
						["amplitude"] = 10,
						["critical_scale"] = 1.2,
						["fade_in"] = 0.01,
						["enabled"] = true,
						["cooldown"] = 0.5,
						["frequency"] = 1,
					},
				},
				["5374"] = {
					["1"] = {
						["scaleY"] = 1,
						["fade_out"] = 0.02,
						["duration"] = 0.12,
						["absolute_sineY"] = false,
						["animation_type"] = "frameshake",
						["scaleX"] = 0.1,
						["absolute_sineX"] = false,
						["amplitude"] = 1,
						["fade_in"] = 0.01,
						["enabled"] = true,
						["cooldown"] = 0.5,
						["frequency"] = 25,
					},
					["info"] = {
						["time"] = 0,
						["class"] = "ROGUE",
						["spellid"] = 5374,
						["desc"] = "",
					},
				},
				["185099"] = {
					["1"] = {
						["scaleY"] = 0.84999847412109,
						["fade_out"] = 0.18999999761581,
						["absolute_sineX"] = false,
						["duration"] = 0.19999998807907,
						["absolute_sineY"] = true,
						["animation_type"] = "frameshake",
						["scaleX"] = 0,
						["amplitude"] = 3,
						["critical_scale"] = 1.05,
						["fade_in"] = 0,
						["enabled"] = true,
						["cooldown"] = 0.5,
						["frequency"] = 1,
					},
					["info"] = {
						["time"] = 1539712435,
						["class"] = "MONK",
						["spellid"] = 185099,
						["desc"] = "",
					},
				},
				["228598"] = {
					["1"] = {
						["scaleY"] = 1,
						["fade_out"] = 0.02,
						["duration"] = 0.12,
						["absolute_sineY"] = false,
						["animation_type"] = "frameshake",
						["scaleX"] = 0.1,
						["absolute_sineX"] = false,
						["amplitude"] = 2,
						["fade_in"] = 0.01,
						["enabled"] = true,
						["cooldown"] = 0.5,
						["frequency"] = 25,
					},
					["info"] = {
						["time"] = 0,
						["class"] = "MAGE",
						["spellid"] = 228598,
						["desc"] = "",
					},
				},
				["32645"] = {
					["1"] = {
						["enabled"] = true,
						["scale_upX"] = 1.1,
						["animation_type"] = "scale",
						["scale_downX"] = 0.9,
						["duration"] = 0.04,
						["scale_downY"] = 0.9,
						["cooldown"] = 0.75,
						["scale_upY"] = 1.1,
					},
					["info"] = {
						["time"] = 0,
						["class"] = "ROGUE",
						["spellid"] = 32645,
						["desc"] = "",
					},
					["2"] = {
						["scaleY"] = 1,
						["fade_out"] = 0.18,
						["duration"] = 0.08,
						["absolute_sineY"] = true,
						["animation_type"] = "frameshake",
						["scaleX"] = 1,
						["absolute_sineX"] = false,
						["amplitude"] = 10,
						["fade_in"] = 0.01,
						["enabled"] = true,
						["cooldown"] = 0.5,
						["frequency"] = 4.1,
					},
				},
				["46968"] = {
					["1"] = {
						["scaleY"] = 1,
						["fade_out"] = 0.01,
						["duration"] = 0.1,
						["absolute_sineY"] = false,
						["animation_type"] = "frameshake",
						["scaleX"] = 0.1,
						["absolute_sineX"] = false,
						["amplitude"] = 0.95,
						["fade_in"] = 0.01,
						["enabled"] = true,
						["cooldown"] = 0.1,
						["frequency"] = 120,
					},
					["info"] = {
						["time"] = 0,
						["class"] = "WARRIOR",
						["spellid"] = 46968,
						["desc"] = "",
					},
				},
				["196278"] = {
					["1"] = {
						["scaleY"] = 1,
						["fade_out"] = 0.01,
						["duration"] = 0.05,
						["absolute_sineY"] = false,
						["animation_type"] = "frameshake",
						["scaleX"] = 0.2,
						["absolute_sineX"] = false,
						["amplitude"] = 0.75,
						["fade_in"] = 0.01,
						["enabled"] = true,
						["cooldown"] = 0,
						["frequency"] = 200,
					},
					["info"] = {
						["time"] = 0,
						["class"] = "WARLOCK",
						["spellid"] = 196278,
						["desc"] = "",
					},
				},
				["55090"] = {
					["1"] = {
						["scaleY"] = 1,
						["fade_out"] = 0.18,
						["duration"] = 0.08,
						["absolute_sineY"] = true,
						["animation_type"] = "frameshake",
						["scaleX"] = 1,
						["absolute_sineX"] = false,
						["amplitude"] = 10,
						["fade_in"] = 0.01,
						["enabled"] = true,
						["cooldown"] = 0.5,
						["frequency"] = 4.1,
					},
					["info"] = {
						["time"] = 0,
						["class"] = "DEATHKNIGHT",
						["spellid"] = 55090,
						["desc"] = "",
					},
				},
				["198030"] = {
					["1"] = {
						["scaleY"] = 1,
						["fade_out"] = 0.089999996125698,
						["absolute_sineX"] = false,
						["duration"] = 0.31999999284744,
						["absolute_sineY"] = false,
						["animation_type"] = "frameshake",
						["scaleX"] = 0.099998474121094,
						["critical_scale"] = 1.05,
						["amplitude"] = 0.5,
						["fade_in"] = 0.0099999997764826,
						["enabled"] = true,
						["cooldown"] = 0.5,
						["frequency"] = 200,
					},
					["info"] = {
						["time"] = 1539717136,
						["class"] = "DEMONHUNTER",
						["spellid"] = 198030,
						["desc"] = "",
					},
				},
				["148135"] = {
					["1"] = {
						["scaleY"] = 1,
						["fade_out"] = 0.09,
						["absolute_sineX"] = false,
						["duration"] = 0.099999994039536,
						["absolute_sineY"] = false,
						["animation_type"] = "frameshake",
						["scaleX"] = 1,
						["amplitude"] = 1.75,
						["critical_scale"] = 1.05,
						["fade_in"] = 0.01,
						["enabled"] = true,
						["cooldown"] = 0.5,
						["frequency"] = 60.874122619629,
					},
					["info"] = {
						["time"] = 1539295958,
						["class"] = "MONK",
						["spellid"] = 148135,
						["desc"] = "",
					},
				},
				["196819"] = {
					["1"] = {
						["animation_type"] = "scale",
						["scale_upX"] = 1.1999999284744,
						["scale_upY"] = 1.2999999523163,
						["scale_downX"] = 0.89999997615814,
						["duration"] = 0.04,
						["scale_downY"] = 0.89999997615814,
						["cooldown"] = 0.75,
						["enabled"] = true,
					},
					["info"] = {
						["time"] = 0,
						["class"] = "ROGUE",
						["spellid"] = 196819,
						["desc"] = "",
					},
					["2"] = {
						["scaleY"] = 1,
						["fade_out"] = 0.1799999922514,
						["duration"] = 0.21999999880791,
						["absolute_sineY"] = true,
						["animation_type"] = "frameshake",
						["scaleX"] = 1,
						["absolute_sineX"] = false,
						["amplitude"] = 5,
						["fade_in"] = 0.0099999997764826,
						["enabled"] = true,
						["cooldown"] = 0.5,
						["frequency"] = 3.3099999427795,
					},
				},
				["189112"] = {
					["1"] = {
						["scaleY"] = 1,
						["fade_out"] = 0.34999999403954,
						["absolute_sineX"] = true,
						["duration"] = 0.40000000596046,
						["absolute_sineY"] = true,
						["animation_type"] = "frameshake",
						["scaleX"] = 0,
						["amplitude"] = 1.8799999952316,
						["critical_scale"] = 1.05,
						["fade_in"] = 0,
						["enabled"] = true,
						["cooldown"] = 0.5,
						["frequency"] = 51.979999542236,
					},
					["info"] = {
						["time"] = 1539715467,
						["class"] = "DEMONHUNTER",
						["spellid"] = 189112,
						["desc"] = "",
					},
				},
				["245388"] = {
					["1"] = {
						["enabled"] = true,
						["scale_upX"] = 1.1,
						["animation_type"] = "scale",
						["scale_downX"] = 0.9,
						["duration"] = 0.03,
						["scale_downY"] = 0.9,
						["cooldown"] = 0.75,
						["scale_upY"] = 1.1,
					},
					["info"] = {
						["time"] = 0,
						["class"] = "ROGUE",
						["spellid"] = 245388,
						["desc"] = "",
					},
					["2"] = {
						["scaleY"] = 1,
						["fade_out"] = 0.01,
						["duration"] = 0.06,
						["absolute_sineY"] = false,
						["animation_type"] = "frameshake",
						["scaleX"] = 1,
						["absolute_sineX"] = false,
						["amplitude"] = 5,
						["fade_in"] = 0.01,
						["enabled"] = true,
						["cooldown"] = 0.5,
						["frequency"] = 2,
					},
				},
				["7268"] = {
					["1"] = {
						["scaleY"] = 1,
						["fade_out"] = 0.01,
						["duration"] = 0.1,
						["absolute_sineY"] = false,
						["animation_type"] = "frameshake",
						["scaleX"] = 0.2,
						["absolute_sineX"] = false,
						["amplitude"] = 0.75,
						["fade_in"] = 0.01,
						["enabled"] = true,
						["cooldown"] = 0,
						["frequency"] = 200,
					},
					["info"] = {
						["time"] = 0,
						["class"] = "MAGE",
						["spellid"] = 7268,
						["desc"] = "",
					},
				},
				["85948"] = {
					["1"] = {
						["scaleY"] = 1,
						["fade_out"] = 0.02,
						["duration"] = 0.12,
						["absolute_sineY"] = false,
						["animation_type"] = "frameshake",
						["scaleX"] = 0.1,
						["absolute_sineX"] = false,
						["amplitude"] = 1,
						["fade_in"] = 0.01,
						["enabled"] = true,
						["cooldown"] = 0.5,
						["frequency"] = 25,
					},
					["info"] = {
						["time"] = 0,
						["class"] = "DEATHKNIGHT",
						["spellid"] = 85948,
						["desc"] = "",
					},
				},
				["35395"] = {
					["1"] = {
						["scaleY"] = 1,
						["fade_out"] = 0.02,
						["duration"] = 0.12,
						["absolute_sineY"] = false,
						["animation_type"] = "frameshake",
						["scaleX"] = 0.1,
						["absolute_sineX"] = false,
						["amplitude"] = 1,
						["fade_in"] = 0.01,
						["enabled"] = true,
						["cooldown"] = 0.5,
						["frequency"] = 25,
					},
					["info"] = {
						["time"] = 0,
						["class"] = "PALADIN",
						["spellid"] = 35395,
						["desc"] = "",
					},
				},
				["280720"] = {
					["1"] = {
						["scaleY"] = 1,
						["fade_out"] = 0.089999996125698,
						["absolute_sineX"] = false,
						["duration"] = 0.19999998807907,
						["absolute_sineY"] = false,
						["animation_type"] = "frameshake",
						["scaleX"] = 0.1,
						["amplitude"] = 0.89999997615814,
						["critical_scale"] = 1.05,
						["fade_in"] = 0.0099999997764826,
						["enabled"] = true,
						["cooldown"] = 0.5,
						["frequency"] = 200,
					},
					["info"] = {
						["time"] = 1539292087,
						["class"] = "ROGUE",
						["spellid"] = 280720,
						["desc"] = "",
					},
				},
				[199552] = {
					{
						["scaleY"] = 0.7999992370605469,
						["fade_out"] = 0.09999999403953552,
						["duration"] = 0.09999999403953552,
						["scaleX"] = 0.2000007629394531,
					}, -- [1]
				},
				["100780"] = {
					["1"] = {
						["scaleY"] = 1,
						["fade_out"] = 0.09,
						["absolute_sineX"] = false,
						["duration"] = 0.099999994039536,
						["absolute_sineY"] = false,
						["animation_type"] = "frameshake",
						["scaleX"] = 0.1,
						["amplitude"] = 1,
						["critical_scale"] = 1.05,
						["fade_in"] = 0.01,
						["enabled"] = true,
						["cooldown"] = 0.5,
						["frequency"] = 1,
					},
					["info"] = {
						["time"] = 1539295910,
						["class"] = "MONK",
						["spellid"] = 100780,
						["desc"] = "",
					},
				},
				["86040"] = {
					["1"] = {
						["scaleY"] = 1,
						["fade_out"] = 0.1,
						["duration"] = 0.15,
						["absolute_sineY"] = false,
						["animation_type"] = "frameshake",
						["scaleX"] = 0.1,
						["absolute_sineX"] = false,
						["amplitude"] = 2,
						["fade_in"] = 0.05,
						["enabled"] = true,
						["cooldown"] = 0.25,
						["frequency"] = 20,
					},
					["info"] = {
						["time"] = 0,
						["class"] = "WARLOCK",
						["spellid"] = 86040,
						["desc"] = "",
					},
				},
				["222026"] = {
					["1"] = {
						["enabled"] = true,
						["scale_upX"] = 1.1,
						["animation_type"] = "scale",
						["scale_downX"] = 0.9,
						["duration"] = 0.04,
						["scale_downY"] = 0.9,
						["cooldown"] = 0.75,
						["scale_upY"] = 1.1,
					},
					["info"] = {
						["time"] = 0,
						["class"] = "DEATHKNIGHT",
						["spellid"] = 222026,
						["desc"] = "",
					},
					["2"] = {
						["scaleY"] = -1,
						["fade_out"] = 0.18,
						["duration"] = 0.08,
						["absolute_sineY"] = true,
						["animation_type"] = "frameshake",
						["scaleX"] = 1,
						["absolute_sineX"] = false,
						["amplitude"] = 10,
						["fade_in"] = 0.01,
						["enabled"] = true,
						["cooldown"] = 0.5,
						["frequency"] = 3.1,
					},
				},
				["49998"] = {
					["1"] = {
						["scaleY"] = 1,
						["fade_out"] = 0.02,
						["duration"] = 0.13,
						["absolute_sineY"] = false,
						["animation_type"] = "frameshake",
						["scaleX"] = 0.1,
						["absolute_sineX"] = false,
						["amplitude"] = 1.8,
						["fade_in"] = 0.01,
						["enabled"] = true,
						["cooldown"] = 0.5,
						["frequency"] = 25,
					},
					["info"] = {
						["time"] = 0,
						["class"] = "DEATHKNIGHT",
						["spellid"] = 49998,
						["desc"] = "",
					},
				},
				["108853"] = {
					["1"] = {
						["scaleY"] = 1,
						["fade_out"] = 0.02,
						["duration"] = 0.12,
						["absolute_sineY"] = false,
						["animation_type"] = "frameshake",
						["scaleX"] = 0.1,
						["absolute_sineX"] = false,
						["amplitude"] = 1,
						["fade_in"] = 0.01,
						["enabled"] = true,
						["cooldown"] = 0.5,
						["frequency"] = 25,
					},
					["info"] = {
						["time"] = 0,
						["class"] = "MAGE",
						["spellid"] = 108853,
						["desc"] = "",
					},
				},
				["185438"] = {
					["1"] = {
						["scaleY"] = -1,
						["fade_out"] = 0.19999998807907,
						["absolute_sineX"] = false,
						["duration"] = 0.099999994039536,
						["absolute_sineY"] = true,
						["animation_type"] = "frameshake",
						["scaleX"] = 0.099998474121094,
						["critical_scale"] = 1.05,
						["amplitude"] = 6.460000038147,
						["fade_in"] = 0,
						["enabled"] = true,
						["cooldown"] = 0.5,
						["frequency"] = 25,
					},
					["info"] = {
						["time"] = 1539204014,
						["class"] = "ROGUE",
						["spellid"] = 185438,
						["desc"] = "",
					},
					["2"] = {
						["scale_upY"] = 1.0299999713898,
						["scale_upX"] = 1.0299999713898,
						["animation_type"] = "scale",
						["scale_downX"] = 0.96999996900559,
						["duration"] = 0.05,
						["scale_downY"] = 0.96999996900559,
						["cooldown"] = 0.75,
						["enabled"] = true,
					},
				},
			},
			["aura_cooldown_reverse"] = false,
			["aggro_modifies"] = {
				["actor_name_color"] = true,
				["border_color"] = true,
			},
			["minor_height_scale"] = 0.94999998807907,
			["not_affecting_combat_alpha"] = 0.799999,
			["aura_height"] = 18,
			["cast_statusbar_bgtexture"] = "PlaterBackground",
			["target_indicator"] = "NONE",
			["hook_data"] = {
				{
					["Enabled"] = true,
					["Revision"] = 54,
					["HooksTemp"] = {
						["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    \n    --attempt to get the color from the unit color list\n    local color = envTable.NpcColors [unitFrame.namePlateUnitNameLower] or envTable.NpcColors [unitFrame.namePlateUnitName] or envTable.NpcColors [unitFrame.namePlateNpcId]\n    \n    --if the color exists, set the health bar color\n    if (color) then\n        Plater.SetNameplateColor (unitFrame, color)\n    end\n    \nend\n\n\n\n\n\n\n\n\n\n\n\n",
						["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --list of npcs and their colors, can be inserted:\n    --name of the unit\n    --name of the unit in lower case\n    --npcID of the unit\n    \n    --color can be added as:\n    --color names: \"red\", \"yellow\"\n    --color hex: \"#FF0000\", \"#FFFF00\"\n    --color table: {1, 0, 0}, {1, 1, 0}    \n    \n    envTable.NpcColors = {\n        \n        --examples, using the unit name in lower case, regular unit name and the unitID:\n        \n        [\"Thunderlord Windreader\"] = \"red\", --using regular mob name and color it as red\n        [\"thunderlord crag-leaper\"] = {1, 1, 0}, --using lower case and coloring it yellow\n        [75790] = \"#00FF00\", --using the ID of the unit and using green as color\n        \n        --insert the new mobs here:\n        \n        \n        \n        \n        \n        \n        \n        \n        \n        \n        \n        \n        \n    } --close custom color bracket\n    \nend\n\n\n\n\n",
					},
					["Author"] = "Kastfall-Azralon",
					["Desc"] = "Easy way to change the color of an unit. Open the constructor script and follow the examples.",
					["Hooks"] = {
						["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --list of npcs and their colors, can be inserted:\n    --name of the unit\n    --name of the unit in lower case\n    --npcID of the unit\n    \n    --color can be added as:\n    --color names: \"red\", \"yellow\"\n    --color hex: \"#FF0000\", \"#FFFF00\"\n    --color table: {1, 0, 0}, {1, 1, 0}    \n    \n    envTable.NpcColors = {\n        \n        --examples, using the unit name in lower case, regular unit name and the unitID:\n        \n        [\"Thunderlord Windreader\"] = \"red\", --using regular mob name and color it as red\n        [\"thunderlord crag-leaper\"] = {1, 1, 0}, --using lower case and coloring it yellow\n        [75790] = \"#00FF00\", --using the ID of the unit and using green as color\n        \n        --insert the new mobs here:\n        \n        \n        \n        \n        \n        \n        \n        \n        \n        \n        \n        \n        \n    } --close custom color bracket\n    \nend\n\n\n\n\n",
						["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    \n    --attempt to get the color from the unit color list\n    local color = envTable.NpcColors [unitFrame.namePlateUnitNameLower] or envTable.NpcColors [unitFrame.namePlateUnitName] or envTable.NpcColors [unitFrame.namePlateNpcId]\n    \n    --if the color exists, set the health bar color\n    if (color) then\n        Plater.SetNameplateColor (unitFrame, color)\n    end\n    \nend\n\n\n\n\n\n\n\n\n\n\n\n",
					},
					["Name"] = "Color Automation [Plater]",
					["PlaterCore"] = 1,
					["LoadConditions"] = {
						["talent"] = {
						},
						["group"] = {
						},
						["class"] = {
						},
						["map_ids"] = {
						},
						["role"] = {
						},
						["pvptalent"] = {
						},
						["spec"] = {
						},
						["affix"] = {
						},
						["encounter_ids"] = {
						},
						["race"] = {
						},
					},
					["Time"] = 1550151943,
					["Icon"] = "Interface\\AddOns\\Plater\\images\\color_bar",
					["LastHookEdited"] = "Constructor",
				}, -- [1]
				{
					["Enabled"] = true,
					["Revision"] = 176,
					["HooksTemp"] = {
					},
					["Author"] = "Tecno-Azralon",
					["Desc"] = "Add another border with more customizations. This border can also be manipulated by other scripts.",
					["Hooks"] = {
						["Nameplate Created"] = "function (self, unitId, unitFrame, envTable)\n    \n    --run constructor!\n    \nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
						["Nameplate Added"] = "function (self, unitId, unitFrame, envTable)\n    if (envTable.IsEnabled) then\n        if (unitFrame.IsSelf) then\n            if (envTable.ShowOnPersonalBar) then\n                envTable.BorderFrame:Show()\n            else\n                envTable.BorderFrame:Hide() \n            end\n        else\n            envTable.BorderFrame:Show()\n        end   \n    end\n    \nend   \n\n\n\n",
						["Nameplate Removed"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.BorderFrame:Hide()\n    \nend\n\n\n",
						["Destructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.BorderFrame:Hide()\n    \nend\n\n\n",
						["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --border color\n    local borderColor = \"yellow\"\n    \n    --size of the border\n    local borderSize = 1\n    \n    --transparency\n    local borderAlpha = 1\n    \n    --enabled (set to false it you only want to use the extra border in other scripts)\n    local isEnabled = true\n    \n    --export border (allow the border to be used by other scripts)\n    --other scripts can use:\n    --unitFrame.healthBar.extraBorder:Show()\n    --unitFrame.healthBar.extraBorder:SetVertexColor (r, g, b)\n    --unitFrame.healthBar.extraBorder:SetBorderSizes (borderSize)\n    local canExportBorder = true\n    \n    --do not add the border to personal bar\n    local noPersonalBar = true\n    \n    --private\n    do\n        \n        local newBorder = CreateFrame (\"frame\", nil, unitFrame.healthBar, \"NamePlateFullBorderTemplate\")\n        envTable.BorderFrame = newBorder\n        \n        newBorder:SetBorderSizes (borderSize, borderSize, borderSize, borderSize)\n        newBorder:UpdateSizes()\n        \n        local r, g, b = DetailsFramework:ParseColors (borderColor)\n        newBorder:SetVertexColor (r, g, b, borderAlpha)\n        \n        envTable.ShowOnPersonalBar = not noPersonalBar\n        \n        if (canExportBorder) then\n            unitFrame.healthBar.extraBorder = newBorder\n        end\n        \n        if (not isEnabled) then\n            envTable.IsEnabled = false\n        else\n            envTable.IsEnabled = true\n        end\n    end\n    \nend\n\n\n",
					},
					["Name"] = "Extra Border [Plater]",
					["PlaterCore"] = 1,
					["LoadConditions"] = {
						["talent"] = {
						},
						["group"] = {
						},
						["class"] = {
						},
						["map_ids"] = {
						},
						["role"] = {
						},
						["pvptalent"] = {
						},
						["spec"] = {
						},
						["race"] = {
						},
						["encounter_ids"] = {
						},
						["affix"] = {
						},
					},
					["Time"] = 1547409079,
					["Icon"] = 133689,
					["LastHookEdited"] = "",
				}, -- [2]
				{
					["Enabled"] = true,
					["Revision"] = 59,
					["HooksTemp"] = {
						["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    \n    if (unitFrame.namePlateNpcId == envTable.NpcIDs.TemptingSiren) then\n        \n        if (envTable.Colors.TemptingSiren) then\n            Plater.SetNameplateColor (unitFrame, envTable.Colors.TemptingSiren)\n        end\n        \n    end\n    \n    \nend\n\n\n\n\n\n\n\n\n",
						["Nameplate Added"] = "function (self, unitId, unitFrame, envTable)\n    \n    if (unitFrame.namePlateNpcId == envTable.NpcIDs.TemptingSiren) then\n        \n        if (envTable.NameplateHeight.TemptingSiren) then\n            \n            Plater.SetNameplateSize (unitFrame, nil, envTable.NameplateHeight.TemptingSiren)\n            \n        end\n        \n    end    \n    \nend\n\n\n",
						["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --nameplate colors for unit\n    envTable.Colors = {}\n    envTable.Colors.TemptingSiren = \"orange\"\n    \n    --npcID\n    envTable.NpcIDs = {}\n    envTable.NpcIDs.TemptingSiren = 146436\n    \n    --nameplate height for each unit\n    envTable.NameplateHeight = {}\n    envTable.NameplateHeight.TemptingSiren = 18\n    \n    \n    \nend\n\n\n",
					},
					["Author"] = "Kastfall-Azralon",
					["Desc"] = "Script for Stormwall Blockade encounter on Battle for Dazzar'alor",
					["Hooks"] = {
						["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    \n    if (unitFrame.namePlateNpcId == envTable.NpcIDs.TemptingSiren) then\n        \n        if (envTable.Colors.TemptingSiren) then\n            Plater.SetNameplateColor (unitFrame, envTable.Colors.TemptingSiren)\n        end\n        \n    end\n    \n    \nend\n\n\n\n\n\n\n\n\n",
						["Nameplate Added"] = "function (self, unitId, unitFrame, envTable)\n    \n    if (unitFrame.namePlateNpcId == envTable.NpcIDs.TemptingSiren) then\n        \n        if (envTable.NameplateHeight.TemptingSiren) then\n            \n            Plater.SetNameplateSize (unitFrame, nil, envTable.NameplateHeight.TemptingSiren)\n            \n        end\n        \n    end    \n    \nend\n\n\n",
						["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --nameplate colors for unit\n    envTable.Colors = {}\n    envTable.Colors.TemptingSiren = \"orange\"\n    \n    --npcID\n    envTable.NpcIDs = {}\n    envTable.NpcIDs.TemptingSiren = 146436\n    \n    --nameplate height for each unit\n    envTable.NameplateHeight = {}\n    envTable.NameplateHeight.TemptingSiren = 18\n    \n    \n    \nend\n\n\n",
					},
					["Name"] = "Stormwall Encounter [Plater]",
					["PlaterCore"] = 1,
					["LoadConditions"] = {
						["talent"] = {
						},
						["group"] = {
						},
						["class"] = {
						},
						["map_ids"] = {
						},
						["role"] = {
						},
						["pvptalent"] = {
						},
						["spec"] = {
						},
						["affix"] = {
						},
						["encounter_ids"] = {
							["1"] = 2280,
							["Enabled"] = true,
						},
						["race"] = {
						},
					},
					["Time"] = 1550154976,
					["Icon"] = "Interface\\AddOns\\Plater\\images\\encounter_stormwall_blockade",
					["LastHookEdited"] = "Constructor",
				}, -- [3]
				{
					["Enabled"] = true,
					["Revision"] = 234,
					["HooksTemp"] = {
						["Nameplate Added"] = "function (self, unitId, unitFrame, envTable)\n    \n    --Unexploded Ordinance\n    if (unitFrame.namePlateNpcId == envTable.NpcIDs.UnexplodedOrdinance) then\n        \n        --make the life percent be bigger than the regular size\n        --so it's better to see the health percent of the barrel\n        local currentSize = Plater.db.profile.plate_config.enemynpc.percent_text_size\n        Plater:SetFontSize (unitFrame.healthBar.lifePercent, currentSize + envTable.UnexplodedOrdinanceTextSizeIncrease)\n    end\n    \n    if (envTable.IncreaseSize [unitFrame.namePlateNpcId]) then\n        local currentHeight = unitFrame.healthBar:GetHeight()\n        Plater.SetNameplateSize (unitFrame, nil, currentHeight + envTable.IncreaseSize [unitFrame.namePlateNpcId])\n    end\n    \nend\n\n\n\n\n\n\n",
						["Cast Start"] = "function (self, unitId, unitFrame, envTable)\n    if (envTable.UnexplodedOrdinanceCast and envTable._SpellID == envTable.UnexplodedOrdinanceSpellID) then\n        Plater.SetCastBarSize (unitFrame, nil, envTable.UnexplodedOrdinanceCastBarHeight)\n        Plater:SetFontSize (unitFrame.castBar.percentText, envTable.UnexplodedOrdinanceTimerSize)\n    end\nend\n\n\n",
						["Nameplate Removed"] = "function (self, unitId, unitFrame, envTable)\n    \n    --reset the health percent text size\n    local currentSize = Plater.db.profile.plate_config.enemynpc.percent_text_size\n    Plater:SetFontSize (unitFrame.healthBar.lifePercent, currentSize)    \n    \nend\n\n\n",
						["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    \n    --Override the color\n    if (envTable.Colors [unitFrame.namePlateNpcId]) then\n        Plater.SetNameplateColor (unitFrame, envTable.Colors [unitFrame.namePlateNpcId])\n    end    \n    \n    --Show the name of the unit in the Ice Block nameplate\n    if (unitFrame.namePlateNpcId == envTable.NpcIDs.IceBlock) then\n        --find which player this block are holding\n        for i = 1, GetNumGroupMembers() do\n            local unit = \"raid\" .. i\n            if (UnitExists (unit)) then\n                for debuffId = 1, 40 do\n                    local name, texture, count, debuffType, duration, expirationTime, caster = UnitDebuff (unit, debuffId)\n                    \n                    --cancel the loop if there's no more debuffs on the player\n                    if (not name) then \n                        break \n                    end                    \n                    \n                    --check if who casted this debuff is the unit shown on this nameplate\n                    if (UnitIsUnit (caster or \"\", unitId)) then\n                        local unitName = UnitName (unit)\n                        \n                        --color the text by the class\n                        unitName = Plater.SetTextColorByClass (unit, unitName)\n                        \n                        --add the role icon\n                        if (Details) then\n                            local role = UnitGroupRolesAssigned (unit)\n                            unitName = Details:AddRoleIcon (unitName, role, 12)\n                        end\n                        \n                        unitFrame.unitName:SetText (unitName)\n                        unitFrame.castBar.Text:SetText (unitName)\n                        break\n                    end\n                    \n                end\n            else\n                break\n            end\n        end\n    end\nend",
						["Cast Stop"] = "function (self, unitId, unitFrame, envTable)\n    if (envTable.UnexplodedOrdinanceCast and envTable._SpellID == envTable.UnexplodedOrdinanceSpellID) then\n        Plater.SetCastBarSize (unitFrame)\n        Plater:SetFontSize (unitFrame.castBar.percentText, Plater.db.profile.plate_config.enemynpc.spellpercent_text_size)\n    end\nend\n\n\n",
						["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --nameplate colors for unit\n    envTable.Colors = {}\n    envTable.Colors [148631] = \"orange\" --Unexploded Ordinance\n    envTable.Colors [148522] = \"white\" --Ice Block\n    \n    --increase the nameplate height for these units\n    envTable.IncreaseSize = {}\n    envTable.IncreaseSize [148522] = 4 --Ice Block (increase in 4 pixels)\n    \n    --increase the size of the life percent for the nameplate of the barrel\n    envTable.UnexplodedOrdinanceTextSizeIncrease = 3\n    \n    --increase the castbar size for the unexploded ordinance explosion cast\n    envTable.UnexplodedOrdinanceCast = true\n    envTable.UnexplodedOrdinanceSpellID = 288221 --12058 --(debug)\n    envTable.UnexplodedOrdinanceCastBarHeight = 18\n    envTable.UnexplodedOrdinanceTimerSize = 18\n    \n    --npcIDs\n    envTable.NpcIDs = {}\n    envTable.NpcIDs.UnexplodedOrdinance = 148631\n    envTable.NpcIDs.IceBlock = 148522\nend\n\n--tests 126023 --harbor saurid - dazar'alor harbor\n--tests 3127 venomtail scorpid - durotar\n--tests 12058 dustwind storm witch - durotar\n--Load Condition: EncounterID 2281\n\n\n",
					},
					["Author"] = "Kastfall-Azralon",
					["Desc"] = "Script for the Jaina encounter on Battle for Dazzar'alor",
					["Hooks"] = {
						["Nameplate Added"] = "function (self, unitId, unitFrame, envTable)\n    \n    --Unexploded Ordinance\n    if (unitFrame.namePlateNpcId == envTable.NpcIDs.UnexplodedOrdinance) then\n        \n        --make the life percent be bigger than the regular size\n        --so it's better to see the health percent of the barrel\n        local currentSize = Plater.db.profile.plate_config.enemynpc.percent_text_size\n        Plater:SetFontSize (unitFrame.healthBar.lifePercent, currentSize + envTable.UnexplodedOrdinanceTextSizeIncrease)\n    end\n    \n    if (envTable.IncreaseSize [unitFrame.namePlateNpcId]) then\n        local currentHeight = unitFrame.healthBar:GetHeight()\n        Plater.SetNameplateSize (unitFrame, nil, currentHeight + envTable.IncreaseSize [unitFrame.namePlateNpcId])\n    end\n    \nend\n\n\n\n\n\n\n",
						["Cast Start"] = "function (self, unitId, unitFrame, envTable)\n    if (envTable.UnexplodedOrdinanceCast and envTable._SpellID == envTable.UnexplodedOrdinanceSpellID) then\n        Plater.SetCastBarSize (unitFrame, nil, envTable.UnexplodedOrdinanceCastBarHeight)\n        Plater:SetFontSize (unitFrame.castBar.percentText, envTable.UnexplodedOrdinanceTimerSize)\n    end\nend\n\n\n",
						["Nameplate Removed"] = "function (self, unitId, unitFrame, envTable)\n    \n    --reset the health percent text size\n    local currentSize = Plater.db.profile.plate_config.enemynpc.percent_text_size\n    Plater:SetFontSize (unitFrame.healthBar.lifePercent, currentSize)    \n    \nend\n\n\n",
						["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    \n    --Override the color\n    if (envTable.Colors [unitFrame.namePlateNpcId]) then\n        Plater.SetNameplateColor (unitFrame, envTable.Colors [unitFrame.namePlateNpcId])\n    end    \n    \n    --Show the name of the unit in the Ice Block nameplate\n    if (unitFrame.namePlateNpcId == envTable.NpcIDs.IceBlock) then\n        --find which player this block are holding\n        for i = 1, GetNumGroupMembers() do\n            local unit = \"raid\" .. i\n            if (UnitExists (unit)) then\n                for debuffId = 1, 40 do\n                    local name, texture, count, debuffType, duration, expirationTime, caster = UnitDebuff (unit, debuffId)\n                    \n                    --cancel the loop if there's no more debuffs on the player\n                    if (not name) then \n                        break \n                    end                    \n                    \n                    --check if who casted this debuff is the unit shown on this nameplate\n                    if (UnitIsUnit (caster or \"\", unitId)) then\n                        local unitName = UnitName (unit)\n                        \n                        --color the text by the class\n                        unitName = Plater.SetTextColorByClass (unit, unitName)\n                        \n                        --add the role icon\n                        if (Details) then\n                            local role = UnitGroupRolesAssigned (unit)\n                            unitName = Details:AddRoleIcon (unitName, role, 12)\n                        end\n                        \n                        unitFrame.unitName:SetText (unitName)\n                        unitFrame.castBar.Text:SetText (unitName)\n                        break\n                    end\n                    \n                end\n            else\n                break\n            end\n        end\n    end\nend",
						["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --nameplate colors for unit\n    envTable.Colors = {}\n    envTable.Colors [148631] = \"orange\" --Unexploded Ordinance\n    envTable.Colors [148522] = \"white\" --Ice Block\n    \n    --increase the nameplate height for these units\n    envTable.IncreaseSize = {}\n    envTable.IncreaseSize [148522] = 4 --Ice Block (increase in 4 pixels)\n    \n    --increase the size of the life percent for the nameplate of the barrel\n    envTable.UnexplodedOrdinanceTextSizeIncrease = 3\n    \n    --increase the castbar size for the unexploded ordinance explosion cast\n    envTable.UnexplodedOrdinanceCast = true\n    envTable.UnexplodedOrdinanceSpellID = 288221 --12058 --(debug)\n    envTable.UnexplodedOrdinanceCastBarHeight = 18\n    envTable.UnexplodedOrdinanceTimerSize = 18\n    \n    --npcIDs\n    envTable.NpcIDs = {}\n    envTable.NpcIDs.UnexplodedOrdinance = 148631\n    envTable.NpcIDs.IceBlock = 148522\nend\n\n--tests 126023 --harbor saurid - dazar'alor harbor\n--tests 3127 venomtail scorpid - durotar\n--tests 12058 dustwind storm witch - durotar\n--Load Condition: EncounterID 2281\n\n\n",
						["Cast Stop"] = "function (self, unitId, unitFrame, envTable)\n    if (envTable.UnexplodedOrdinanceCast and envTable._SpellID == envTable.UnexplodedOrdinanceSpellID) then\n        Plater.SetCastBarSize (unitFrame)\n        Plater:SetFontSize (unitFrame.castBar.percentText, Plater.db.profile.plate_config.enemynpc.spellpercent_text_size)\n    end\nend\n\n\n",
					},
					["Name"] = "Jaina Encounter [Plater]",
					["PlaterCore"] = 1,
					["LoadConditions"] = {
						["talent"] = {
						},
						["group"] = {
						},
						["class"] = {
						},
						["map_ids"] = {
						},
						["role"] = {
						},
						["pvptalent"] = {
						},
						["spec"] = {
						},
						["affix"] = {
						},
						["encounter_ids"] = {
							["1"] = 2281,
							["Enabled"] = true,
						},
						["race"] = {
						},
					},
					["Time"] = 1550156266,
					["Icon"] = "Interface\\AddOns\\Plater\\images\\encounter_jaina",
					["LastHookEdited"] = "Constructor",
				}, -- [4]
				{
					["Enabled"] = true,
					["Revision"] = 84,
					["HooksTemp"] = {
					},
					["Author"] = "Ahwa-Azralon",
					["Desc"] = "Add extra effects to execute range. See the constructor script for options.",
					["Hooks"] = {
						["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --execute detection, if true the script will handle the execute percent\n    --while false Plater will automatically trigger the execute range\n    --you only want to set this to true in case of Plater not detecting the execute range correctly\n    envTable.UseCustomExecutePercent = false\n    --execute percent, if not detecting automatic, this is the percent to active the execute range\n    --use from zero to one, 0.20 is equal to 20% of the unit life\n    envTable.ExecutePercent = 0.20\n    \n    --allow this script to change the nameplate color when the unit is in execute range\n    envTable.CanChangeColor = true\n    --change the health bar color to this color when the unit is in execute range\n    --color can be set as:\n    --color names: \"red\", \"yellow\"\n    --color hex: \"#FF0000\", \"#FFFF00\"\n    --color table: {1, 0, 0}, {1, 1, 0}\n    envTable.ExecuteColor = \"green\"\n    \n    --border color\n    envTable.CanChangeBorderColor = false\n    envTable.BorderColor = \"red\"\n    \n    --hide the default health divisor and the health execute indicator\n    envTable.HideHealthDivisor = false\n    --if not hidden, adjust the health divisor settings and the health execute indicator\n    envTable.HealthDivisorAlpha = 0.5\n    envTable.HealthDivisorColor = \"white\"\n    envTable.HealthExecuteIndicatorAlpha = 0.15\n    envTable.HealthExecuteIndicatorColor = \"darkred\"\n    \n    \n    --private (internal functions)\n    do\n        function envTable.UnitInExecuteRange (unitFrame)\n            --check if can change the execute color\n            if (envTable.CanChangeColor) then\n                Plater.SetNameplateColor (unitFrame, envTable.ExecuteColor)\n            end\n            \n            if (envTable.CanChangeBorderColor) then\n                Plater.SetBorderColor (unitFrame, envTable.BorderColor)\n            end\n            \n            if (envTable.HideHealthDivisor) then\n                unitFrame.healthBar.healthCutOff:Hide() \n                unitFrame.healthBar.executeRange:Hide()\n                \n            else\n                envTable.UpdateHealthDivisor (unitFrame)\n                \n            end\n        end\n        \n        function envTable.UpdateHealthDivisor (unitFrame)\n            local healthBar = unitFrame.healthBar\n            \n            healthBar.healthCutOff:Show()\n            healthBar.healthCutOff:SetVertexColor (DetailsFramework:ParseColors (envTable.HealthDivisorColor))\n            healthBar.healthCutOff:SetAlpha (envTable.HealthDivisorAlpha)\n            \n            healthBar.executeRange:Show()\n            healthBar.executeRange:SetVertexColor (DetailsFramework:ParseColors (envTable.HealthExecuteIndicatorColor))\n            healthBar.executeRange:SetAlpha (envTable.HealthExecuteIndicatorAlpha)\n            \n            if (envTable.UseCustomExecutePercent) then\n                healthBar.healthCutOff:ClearAllPoints()\n                healthBar.executeRange:ClearAllPoints()\n                \n                healthBar.healthCutOff:SetSize (healthBar:GetHeight(), healthBar:GetHeight())\n                healthBar.healthCutOff:SetPoint (\"center\", healthBar, \"left\", healthBar:GetWidth() * envTable.ExecutePercent, 0)\n                \n                healthBar.executeRange:SetTexCoord (0, envTable.ExecutePercent, 0, 1)\n                healthBar.executeRange:SetHeight (healthBar:GetHeight())\n                healthBar.executeRange:SetPoint (\"left\", healthBar, \"left\", 0, 0)\n                healthBar.executeRange:SetPoint (\"right\", healthBar.healthCutOff, \"center\")\n            end\n            \n        end\n    end\n    \nend",
						["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    \n    if (envTable.UseCustomExecutePercent) then\n        \n        --manual detection\n        local healthBar = unitFrame.healthBar\n        if (healthBar.CurrentHealth / healthBar.CurrentHealthMax <= envTable.ExecutePercent) then\n            envTable.UnitInExecuteRange (unitFrame)\n        end        \n        \n    else\n        \n        --auto detection\n        if (unitFrame.InExecuteRange) then\n            envTable.UnitInExecuteRange (unitFrame)\n        end\n        \n    end\n    \nend\n\n\n\n\n\n\n\n\n\n\n\n\n",
					},
					["Name"] = "Execute Range [Plater]",
					["PlaterCore"] = 1,
					["LoadConditions"] = {
						["talent"] = {
						},
						["group"] = {
						},
						["class"] = {
						},
						["map_ids"] = {
						},
						["role"] = {
						},
						["pvptalent"] = {
						},
						["spec"] = {
						},
						["affix"] = {
						},
						["encounter_ids"] = {
						},
						["race"] = {
						},
					},
					["Time"] = 1547406548,
					["Icon"] = 135358,
					["LastHookEdited"] = "",
				}, -- [5]
				{
					["Enabled"] = true,
					["Revision"] = 225,
					["HooksTemp"] = {
						["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --list of npcs and their colors, can be inserted:\n    --name of the unit\n    --name of the unit in lower case\n    --npcID of the unit\n    \n    --color can be added as:\n    --color names: \"red\", \"yellow\"\n    --color hex: \"#FF0000\", \"#FFFF00\"\n    --color table: {1, 0, 0}, {1, 1, 0}    \n    \n    envTable.ListOfNpcs = {\n        [61146] = \"olive\", --monk statue npcID\n        [103822] = \"olive\", --druid treant npcID\n        \n    }\n    \n    \nend\n\n\n\n\n",
						["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    \n    --get the GUID of the target of the unit\n    local targetGUID = UnitGUID (unitId .. \"target\")\n    \n    if (targetGUID) then\n        \n        --get the npcID of the target\n        local npcID = Plater.GetNpcIDFromGUID (targetGUID)\n        --check if the npcID of this unit is in the npc list \n        if (envTable.ListOfNpcs [npcID]) then\n            Plater.SetNameplateColor (unitFrame, envTable.ListOfNpcs [npcID])\n            \n        else\n            --check if the name of ths unit is in the list\n            local unitName = UnitName (unitId .. \"target\")\n            if (envTable.ListOfNpcs [unitName]) then\n                Plater.SetNameplateColor (unitFrame, envTable.ListOfNpcs [unitName])\n                \n            else\n                --check if the name of the unit in lower case is in the npc list\n                unitName = string.lower (unitName)\n                if (envTable.ListOfNpcs [unitName]) then\n                    Plater.SetNameplateColor (unitFrame, envTable.ListOfNpcs [unitName])                \n                    \n                end\n            end\n        end\n        \n    end\nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
					},
					["Author"] = "Kastfall-Azralon",
					["Desc"] = "Change the nameplate color if the unit is attacking a specific unit like Monk's Ox Statue or Druid's Treants. You may edit which units it track in the constructor script.",
					["Hooks"] = {
						["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    \n    --get the GUID of the target of the unit\n    local targetGUID = UnitGUID (unitId .. \"target\")\n    \n    if (targetGUID) then\n        \n        --get the npcID of the target\n        local npcID = Plater.GetNpcIDFromGUID (targetGUID)\n        --check if the npcID of this unit is in the npc list \n        if (envTable.ListOfNpcs [npcID]) then\n            Plater.SetNameplateColor (unitFrame, envTable.ListOfNpcs [npcID])\n            \n        else\n            --check if the name of ths unit is in the list\n            local unitName = UnitName (unitId .. \"target\")\n            if (envTable.ListOfNpcs [unitName]) then\n                Plater.SetNameplateColor (unitFrame, envTable.ListOfNpcs [unitName])\n                \n            else\n                --check if the name of the unit in lower case is in the npc list\n                unitName = string.lower (unitName)\n                if (envTable.ListOfNpcs [unitName]) then\n                    Plater.SetNameplateColor (unitFrame, envTable.ListOfNpcs [unitName])                \n                    \n                end\n            end\n        end\n        \n    end\nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
						["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --list of npcs and their colors, can be inserted:\n    --name of the unit\n    --name of the unit in lower case\n    --npcID of the unit\n    \n    --color can be added as:\n    --color names: \"red\", \"yellow\"\n    --color hex: \"#FF0000\", \"#FFFF00\"\n    --color table: {1, 0, 0}, {1, 1, 0}    \n    \n    envTable.ListOfNpcs = {\n        [61146] = \"olive\", --monk statue npcID\n        [103822] = \"olive\", --druid treant npcID\n        \n    }\n    \n    \nend\n\n\n\n\n",
					},
					["Name"] = "Attacking Specific Unit [Plater]",
					["PlaterCore"] = 1,
					["LoadConditions"] = {
						["talent"] = {
						},
						["group"] = {
						},
						["class"] = {
						},
						["map_ids"] = {
						},
						["role"] = {
						},
						["pvptalent"] = {
						},
						["spec"] = {
						},
						["affix"] = {
						},
						["encounter_ids"] = {
						},
						["race"] = {
						},
					},
					["Time"] = 1550154976,
					["Icon"] = "Interface\\AddOns\\Plater\\images\\icon_attacking_unit",
					["LastHookEdited"] = "Constructor",
				}, -- [6]
				{
					["Enabled"] = true,
					["Revision"] = 88,
					["HooksTemp"] = {
					},
					["Author"] = "Kastfall-Azralon",
					["Desc"] = "Function Plater.UpdatePlateSize from Plater.lua exported to scritps.",
					["Hooks"] = {
						["Nameplate Added"] = "\n\n-- exported function Plater.UpdatePlateSize() from Plater.lua\n--this is for advanced users which wants to reorder the nameplate frame at their desire\n\n\n\nfunction (self, unitId, unitFrame, envTable)\n    \n    --check if there's a type of unit on this nameplate\n    local plateFrame = unitFrame:GetParent()\n    if (not plateFrame.actorType) then\n        return\n    end\n    \n    --get all the frames and cache some variables\n    local ACTORTYPE_ENEMY_PLAYER = \"enemyplayer\"\n    local profile = Plater.db.profile\n    local DB_PLATE_CONFIG = profile.plate_config\n    local isInCombat = Plater.IsInCombat()\n    local actorType = plateFrame.actorType\n    \n    local unitFrame = plateFrame.unitFrame\n    local healthBar = unitFrame.healthBar\n    local castBar = unitFrame.castBar\n    local powerBar = unitFrame.powerBar\n    local buffFrame1 = unitFrame.BuffFrame\n    local buffFrame2 = unitFrame.BuffFrame2\n    \n    --use in combat bars when in pvp\n    if (plateFrame.actorType == ACTORTYPE_ENEMY_PLAYER) then\n        if ((Plater.ZoneInstanceType == \"pvp\" or Plater.ZoneInstanceType == \"arena\") and DB_PLATE_CONFIG.player.pvp_always_incombat) then\n            isInCombat = true\n        end\n    end\n    \n    --get the config for this actor type\n    local plateConfigs = DB_PLATE_CONFIG [actorType]\n    --get the config key based if the player is in combat\n    local castBarConfigKey, healthBarConfigKey, manaConfigKey = Plater.GetHashKey (isInCombat)\n    \n    --get the width and height from what the user set in the options panel\n    local healthBarWidth, healthBarHeight = unitFrame.customHealthBarWidth or plateConfigs [healthBarConfigKey][1], unitFrame.customHealthBarHeight or plateConfigs [healthBarConfigKey][2]\n    local castBarWidth, castBarHeight = unitFrame.customCastBarWidth or plateConfigs [castBarConfigKey][1], unitFrame.customCastBarHeight or plateConfigs [castBarConfigKey][2]\n    local powerBarWidth, powerBarHeight = unitFrame.customPowerBarHeight or plateConfigs [manaConfigKey][1], unitFrame.customPowerBarHeight or plateConfigs [manaConfigKey][2]\n    \n    --calculate the offset for the cast bar, this is done due to the cast bar be anchored to topleft and topright\n    local castBarOffSetX = (healthBarWidth - castBarWidth) / 2\n    local castBarOffSetY = plateConfigs.castbar_offset\n    \n    --calculate offsets for the power bar\n    local powerBarOffSetX = (healthBarWidth - powerBarWidth) / 2\n    local powerBarOffSetY = 0\n    \n    --calculate the size deviation for pets\n    local unitType = Plater.GetUnitType (plateFrame)\n    if (unitType == \"pet\") then\n        healthBarHeight = healthBarHeight * Plater.db.profile.pet_height_scale\n        healthBarWidth = healthBarWidth * Plater.db.profile.pet_width_scale\n        \n    elseif (unitType == \"minus\") then\n        healthBarHeight = healthBarHeight * Plater.db.profile.minor_height_scale\n        healthBarWidth = healthBarWidth * Plater.db.profile.minor_width_scale\n    end\n    \n    --unit frame - is set to be the same size as the plateFrame\n    unitFrame:ClearAllPoints()\n    unitFrame:SetAllPoints()\n    \n    --calculates the health bar anchor points\n    --it will always be placed in the center of the nameplate area (where it accepts mouse clicks) \n    local xOffSet = (plateFrame:GetWidth() - healthBarWidth) / 2\n    local yOffSet = (plateFrame:GetHeight() - healthBarHeight) / 2\n    \n    --set the health bar point\n    healthBar:ClearAllPoints()\n    PixelUtil.SetPoint (healthBar, \"topleft\", unitFrame, \"topleft\", xOffSet + profile.global_offset_x, -yOffSet + profile.global_offset_y)\n    PixelUtil.SetPoint (healthBar, \"bottomright\", unitFrame, \"bottomright\", -xOffSet + profile.global_offset_x, yOffSet + profile.global_offset_y)\n    \n    --set the cast bar point and size\n    castBar:ClearAllPoints()\n    PixelUtil.SetPoint (castBar, \"topleft\", healthBar, \"bottomleft\", castBarOffSetX, castBarOffSetY)\n    PixelUtil.SetPoint (castBar, \"topright\", healthBar, \"bottomright\", -castBarOffSetX, castBarOffSetY)\n    PixelUtil.SetHeight (castBar, castBarHeight)\n    PixelUtil.SetSize (castBar.Icon, castBarHeight, castBarHeight)\n    PixelUtil.SetSize (castBar.BorderShield, castBarHeight * 1.4, castBarHeight * 1.4)\n    \n    --set the power bar point and size\n    powerBar:ClearAllPoints()\n    PixelUtil.SetPoint (powerBar, \"topleft\", healthBar, \"bottomleft\", powerBarOffSetX, powerBarOffSetY)\n    PixelUtil.SetPoint (powerBar, \"topright\", healthBar, \"bottomright\", -powerBarOffSetX, powerBarOffSetY)\n    PixelUtil.SetHeight (powerBar, powerBarHeight)\n    \n    --power bar are hidden by default, show it if there's a custom size for it\n    if (unitFrame.customPowerBarWidth and unitFrame.customPowerBarHeight) then\n        powerBar:SetUnit (unitFrame.unit)\n    end\n    \n    --aura frames\n    buffFrame1:ClearAllPoints()\n    PixelUtil.SetPoint (buffFrame1, \"bottom\", unitFrame, \"top\", profile.aura_x_offset,  plateConfigs.buff_frame_y_offset + profile.aura_y_offset)\n    \n    buffFrame2:ClearAllPoints()\n    PixelUtil.SetPoint (buffFrame2, \"bottom\", unitFrame, \"top\", profile.aura2_x_offset,  plateConfigs.buff_frame_y_offset + profile.aura2_y_offset)    \n    \nend\n\n\n",
					},
					["Name"] = "Reorder Nameplate [Plater]",
					["PlaterCore"] = 1,
					["LoadConditions"] = {
						["talent"] = {
						},
						["group"] = {
						},
						["class"] = {
						},
						["map_ids"] = {
						},
						["race"] = {
						},
						["pvptalent"] = {
						},
						["affix"] = {
						},
						["role"] = {
						},
						["encounter_ids"] = {
						},
						["spec"] = {
						},
					},
					["Time"] = 1548077443,
					["Icon"] = 574574,
					["LastHookEdited"] = "",
				}, -- [7]
				{
					["Enabled"] = true,
					["Revision"] = 45,
					["HooksTemp"] = {
						["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    \n    --can detect the reaping souls aggro?\n    if (envTable.detectAggro and Plater.IsInCombat()) then\n        \n        --is this npc a reaping soul?\n        if (envTable.npcIDs [unitFrame.namePlateNpcId]) then\n            \n            --check if the mob is attacking the player\n            if (UnitIsUnit (unitFrame.targetUnitID, \"player\")) then\n                Plater.SetNameplateColor (unitFrame, envTable.NameplateAggroColor)\n                \n            else\n                Plater.SetNameplateColor (unitFrame, envTable.NameplateNoAggroColor)\n            end\n            \n        end\n        \n    end\n    \nend",
						["Nameplate Added"] = "function (self, unitId, unitFrame, envTable)\n    \n    --when the nameplate is added and the npcID matches, cache the color for the nameplate\n    if (envTable.detectAggro) then\n        if (envTable.npcIDs [unitFrame.namePlateNpcId]) then\n            local profile = Plater.db.profile\n            local role = Plater:GetPlayerRole()\n            \n            if (role == \"TANK\") then\n                envTable.NameplateAggroColor = profile.tank.colors.aggro\n                envTable.NameplateNoAggroColor = profile.tank.colors.noaggro\n            else\n                envTable.NameplateAggroColor = profile.dps.colors.aggro\n                envTable.NameplateNoAggroColor = profile.dps.colors.noaggro\n            end\n            \n        end\n    end\n    \n    \nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
						["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --npcs affected by this script\n    \n    envTable.npcIDs = {\n        [148716] = true, --risen soul\n        [148893] = true, --tormented soul\n        [148894] = true, --lost soul\n        \n        [127278] = true, --skittering feeder (tests and debug, also need to disable the load conditions)\n    }\n    \n    --detect aggro, if true it will see which group member the soul is attacking and override the color\n    envTable.detectAggro = true\n    \n    \nend\n\n\n",
					},
					["Author"] = "Izimode-Azralon",
					["Desc"] = "Tint nameplates of Reaping Soul units (Mythic Dungeon Affix) depending on its target and role of the player",
					["Hooks"] = {
						["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    \n    --can detect the reaping souls aggro?\n    if (envTable.detectAggro and Plater.IsInCombat()) then\n        \n        --is this npc a reaping soul?\n        if (envTable.npcIDs [unitFrame.namePlateNpcId]) then\n            \n            --check if the mob is attacking the player\n            if (UnitIsUnit (unitFrame.targetUnitID, \"player\")) then\n                Plater.SetNameplateColor (unitFrame, envTable.NameplateAggroColor)\n                \n            else\n                Plater.SetNameplateColor (unitFrame, envTable.NameplateNoAggroColor)\n            end\n            \n        end\n        \n    end\n    \nend",
						["Nameplate Added"] = "function (self, unitId, unitFrame, envTable)\n    \n    --when the nameplate is added and the npcID matches, cache the color for the nameplate\n    if (envTable.detectAggro) then\n        if (envTable.npcIDs [unitFrame.namePlateNpcId]) then\n            local profile = Plater.db.profile\n            local role = Plater:GetPlayerRole()\n            \n            if (role == \"TANK\") then\n                envTable.NameplateAggroColor = profile.tank.colors.aggro\n                envTable.NameplateNoAggroColor = profile.tank.colors.noaggro\n            else\n                envTable.NameplateAggroColor = profile.dps.colors.aggro\n                envTable.NameplateNoAggroColor = profile.dps.colors.noaggro\n            end\n            \n        end\n    end\n    \n    \nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
						["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --npcs affected by this script\n    \n    envTable.npcIDs = {\n        [148716] = true, --risen soul\n        [148893] = true, --tormented soul\n        [148894] = true, --lost soul\n        \n        [127278] = true, --skittering feeder (tests and debug, also need to disable the load conditions)\n    }\n    \n    --detect aggro, if true it will see which group member the soul is attacking and override the color\n    envTable.detectAggro = true\n    \n    \nend\n\n\n",
					},
					["Name"] = "M+ Bwonsamdi Reaping",
					["PlaterCore"] = 1,
					["LoadConditions"] = {
						["talent"] = {
						},
						["group"] = {
							["Enabled"] = true,
							["party"] = true,
						},
						["class"] = {
						},
						["map_ids"] = {
						},
						["race"] = {
						},
						["pvptalent"] = {
						},
						["affix"] = {
							["Enabled"] = true,
							["117"] = true,
						},
						["role"] = {
						},
						["encounter_ids"] = {
						},
						["spec"] = {
						},
					},
					["Time"] = 1550155776,
					["Icon"] = 2446016,
					["LastHookEdited"] = "Constructor",
				}, -- [8]
				{
					["Enabled"] = true,
					["Revision"] = 189,
					["HooksTemp"] = {
					},
					["Author"] = "Izimode-Azralon",
					["Desc"] = "Show combo points above the nameplate for Druid Feral and Rogues.",
					["Hooks"] = {
						["Nameplate Created"] = "function (self, unitId, unitFrame, envTable)\n    \n    --run constructor!\n    --constructor is executed only once when any script of the hook runs.\n    \nend\n\n\n",
						["Nameplate Added"] = "function (self, unitId, unitFrame, envTable)\n    \n    --check if need update the amount of combo points shown\n    if (envTable.LastPlayerTalentUpdate > envTable.LastUpdate) then\n        envTable.UpdateComboPointAmount()\n    end    \n    \n    if (unitFrame.namePlateIsTarget and not unitFrame.IsSelf) then\n        envTable.ComboPointFrame:Show()\n        envTable.UpdateComboPoints()\n        \n    else\n        envTable.ComboPointFrame:Hide()\n    end    \n    \nend\n\n\n",
						["Target Changed"] = "function (self, unitId, unitFrame, envTable)\n    \n    --check if this nameplate is the current target\n    if (unitFrame.namePlateIsTarget and not unitFrame.IsSelf) then\n        envTable.ComboPointFrame:Show()\n        \n    else\n        envTable.ComboPointFrame:Hide()\n    end\n    \nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
						["Player Power Update"] = "function (self, unitId, unitFrame, envTable)\n    \n    if (unitFrame.namePlateIsTarget and not unitFrame.IsSelf) then\n        envTable.UpdateComboPoints()\n    end\n    \n    \nend\n\n\n\n\n\n\n",
						["Nameplate Removed"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.ComboPointFrame:Hide()\n    \nend\n\n\n",
						["Destructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.ComboPointFrame:Hide()\n    \nend\n\n\n\n\n",
						["Player Talent Update"] = "function (self, unitId, unitFrame, envTable)\n    \n    --update the amount of comboo points shown when the player changes talents or specialization\n    envTable.UpdateComboPointAmount()\n    \n    --save the time of the last talent change\n    envTable.LastPlayerTalentUpdate = GetTime()\n    \n    \nend\n\n\n",
						["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --settings\n    local anchors = {\n        {\"bottom\", unitFrame.healthBar, \"top\", 0, 24},\n    }\n    \n    local sizes = {\n        width = 12,\n        height = 12,\n        scale = 1,\n    }\n    \n    local textures = {\n        backgroundTexture = [[Interface\\PLAYERFRAME\\ClassOverlayComboPoints]],\n        backgroundTexCoords = {78/128, 98/128, 21/64, 41/64},\n        \n        comboPointTexture = [[Interface\\PLAYERFRAME\\ClassOverlayComboPoints]],\n        comboPointTexCoords = {100/128, 120/128, 21/64, 41/64},\n    }\n    \n    local frameLevel = 1000\n    local frameStrata = \"high\"    \n    \n    --private\n    do\n        --store combo points frames on this table\n        envTable.ComboPoints = {}\n        --save when the player changed talents or spec\n        envTable.LastPlayerTalentUpdate = GetTime()\n        --save when this nameplate got a combo point amount and alignment update        \n        \n        --build combo points frame anchor (combo point are anchored to this)\n        if (not unitFrame.PlaterComboPointFrame) then\n            local hostFrame = CreateFrame (\"frame\", nil, unitFrame)\n            hostFrame.ComboPointFramesPool = {}\n            unitFrame.PlaterComboPointFrame = hostFrame\n            envTable.ComboPointFrame = hostFrame\n            \n            --DetailsFramework:ApplyStandardBackdrop (envTable.ComboPointFrame) --debug anchor size\n            \n            --animations\n            local onPlayShowAnimation = function (animation)\n                --stop the hide animation if it's playing\n                if (animation:GetParent():GetParent().HideAnimation:IsPlaying()) then\n                    animation:GetParent():GetParent().HideAnimation:Stop()\n                end\n                \n                animation:GetParent():Show()\n            end\n            \n            local onPlayHideAnimation = function (animation)\n                --stop the show animation if it's playing\n                if (animation:GetParent():GetParent().ShowAnimation:IsPlaying()) then\n                    animation:GetParent():GetParent().ShowAnimation:Stop()\n                end\n            end        \n            local onStopHideAnimation = function (animation)\n                animation:GetParent():Hide()       \n            end\n            \n            local createAnimations = function (comboPoint)\n                --on show\n                comboPoint.ShowAnimation = Plater:CreateAnimationHub (comboPoint.comboPointTexture, onPlayShowAnimation, nil)\n                Plater:CreateAnimation (comboPoint.ShowAnimation, \"scale\", 1, 0.1, 0, 0, 1, 1)\n                Plater:CreateAnimation (comboPoint.ShowAnimation, \"alpha\", 1, 0.1, .5, 1)\n                Plater:CreateAnimation (comboPoint.ShowAnimation, \"scale\", 2, 0.1, 1.2, 1.2, 1, 1)\n                \n                --on hide\n                comboPoint.HideAnimation = Plater:CreateAnimationHub (comboPoint.comboPointTexture, onPlayHideAnimation, onStopHideAnimation)\n                Plater:CreateAnimation (comboPoint.HideAnimation, \"scale\", 1, 0.1, 1, 1, 0, 0)\n                Plater:CreateAnimation (comboPoint.HideAnimation, \"alpha\", 1, 0.1, 1, 0)\n            end\n            \n            --build combo point frame        \n            for i =1, 10 do \n                local f = CreateFrame (\"frame\", nil, envTable.ComboPointFrame)\n                f:SetSize (sizes.width, sizes.height)\n                tinsert (envTable.ComboPoints, f)\n                tinsert (unitFrame.PlaterComboPointFrame.ComboPointFramesPool, f)\n                \n                local backgroundTexture = f:CreateTexture (nil, \"background\")\n                backgroundTexture:SetTexture (textures.backgroundTexture)\n                backgroundTexture:SetTexCoord (unpack (textures.backgroundTexCoords))\n                backgroundTexture:SetSize (sizes.width, sizes.height)\n                backgroundTexture:SetPoint (\"center\")\n                \n                local comboPointTexture = f:CreateTexture (nil, \"artwork\")\n                comboPointTexture:SetTexture (textures.comboPointTexture)\n                comboPointTexture:SetTexCoord (unpack (textures.comboPointTexCoords))\n                \n                comboPointTexture:SetSize (sizes.width, sizes.height)\n                comboPointTexture:SetPoint (\"center\")\n                comboPointTexture:Hide()            \n                \n                f.IsActive = false\n                \n                f.backgroundTexture = backgroundTexture\n                f.comboPointTexture = comboPointTexture\n                \n                createAnimations (f)\n            end\n            \n        else\n            envTable.ComboPointFrame = unitFrame.PlaterComboPointFrame\n            envTable.ComboPointFrame:SetScale (sizes.scale)\n            envTable.ComboPoints = unitFrame.PlaterComboPointFrame.ComboPointFramesPool\n            \n        end            \n        \n        envTable.ComboPointFrame:SetFrameLevel (frameLevel)\n        envTable.ComboPointFrame:SetFrameStrata (frameStrata)\n        \n        function envTable.UpdateComboPoints()\n            local comboPoints = UnitPower (\"player\", Enum.PowerType.ComboPoints)\n            \n            for i = 1, envTable.TotalComboPoints do\n                local thisComboPoint = envTable.ComboPoints [i]\n                \n                if (i <= comboPoints ) then\n                    --combo point enabled\n                    if (not thisComboPoint.IsActive) then\n                        thisComboPoint.ShowAnimation:Play()\n                        thisComboPoint.IsActive = true\n                        \n                    end\n                    \n                else\n                    --combo point disabled\n                    if (thisComboPoint.IsActive) then\n                        thisComboPoint.HideAnimation:Play()\n                        thisComboPoint.IsActive = false\n                        \n                    end\n                end\n            end\n            \n            \n        end\n        \n        function envTable.UpdateComboPointAmount()\n            local namePlateWidth = Plater.db.profile.plate_config.enemynpc.health_incombat[1]\n            local comboPoints = UnitPowerMax (\"player\", Enum.PowerType.ComboPoints)\n            local reservedSpace = namePlateWidth / comboPoints\n            \n            --store the total amount of combo points\n            envTable.TotalComboPoints = comboPoints\n            \n            --update anchor frame\n            envTable.ComboPointFrame:SetWidth (namePlateWidth)\n            envTable.ComboPointFrame:SetHeight (20)\n            envTable.ComboPointFrame:ClearAllPoints()\n            for i = 1, #anchors do\n                local anchor = anchors[i]\n                envTable.ComboPointFrame:SetPoint (unpack (anchor))\n            end        \n            \n            --\n            for i = 1, #envTable.ComboPoints do\n                envTable.ComboPoints[i]:Hide()\n                envTable.ComboPoints[i]:ClearAllPoints()\n            end\n            \n            for i = 1, comboPoints do\n                local comboPoint = envTable.ComboPoints[i]\n                comboPoint:SetPoint (\"left\", envTable.ComboPointFrame, \"left\", reservedSpace * (i-1), 0)\n                comboPoint:Show()\n            end\n            \n            envTable.LastUpdate = GetTime()\n            \n            envTable.UpdateComboPoints()\n        end\n        \n        --initialize\n        envTable.UpdateComboPointAmount()\n        envTable.ComboPointFrame:Hide()\n    end\n    \n    \nend",
					},
					["Name"] = "Combo Points [Plater]",
					["PlaterCore"] = 1,
					["LoadConditions"] = {
						["talent"] = {
						},
						["group"] = {
						},
						["class"] = {
							["Enabled"] = true,
							["DRUID"] = true,
							["ROGUE"] = true,
						},
						["map_ids"] = {
						},
						["role"] = {
						},
						["pvptalent"] = {
						},
						["spec"] = {
							["103"] = true,
							["Enabled"] = true,
						},
						["race"] = {
						},
						["encounter_ids"] = {
						},
						["affix"] = {
						},
					},
					["Time"] = 1548354524,
					["Icon"] = 135426,
					["LastHookEdited"] = "",
				}, -- [9]
				{
					["Enabled"] = true,
					["Revision"] = 182,
					["HooksTemp"] = {
					},
					["Author"] = "Izimode-Azralon",
					["Desc"] = "Show how many raid members are targeting the unit",
					["Hooks"] = {
						["Leave Combat"] = "function (self, unitId, unitFrame, envTable)\n    envTable.CanShow = false;\n    envTable.TargetAmount:SetText (\"\")\nend\n\n\n",
						["Nameplate Added"] = "function (self, unitId, unitFrame, envTable)\n    \n    --when a nameplate is added to the screen check if the player is in combat\n    if (InCombatLockdown()) then\n        --player is in combat, check if can check amount of targets\n        envTable.CanShow = envTable.CanShowTargetAmount();\n        \n    else\n        envTable.CanShow = false; \n    end\n    \n    envTable.TargetAmount:SetText (\"\");\n    \nend",
						["Nameplate Removed"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.TargetAmount:SetText (\"\");\n    envTable.CanShow = false;\n    \nend\n\n\n",
						["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    \n    --if the script is allowed to show the amount of targets\n    --also check if the unit is in combat\n    if (envTable.CanShow and UnitAffectingCombat (unitId)) then\n        \n        --check if can update the amount of targets following the cooldown set in the constructor script\n        --by default Plater updates the nameplate every 250ms, by default the cooldown is 2, so it'll update the amuont of target every 1/2 of a second\n        envTable.UpdateCooldown = envTable.UpdateCooldown + 1\n        if (envTable.UpdateCooldown < envTable.UpdateInterval) then\n            return\n        else\n            \n            --reset the cooldown interval to check the amount of target again\n            envTable.UpdateCooldown = 0\n            \n            --get the amount of targets\n            local amount;\n            if (envTable.InRaid) then\n                amount = envTable.NumTargetsInRaid (unitFrame)      \n                \n            elseif (envTable.InParty) then\n                amount = envTable.NumTargetsInParty (unitFrame)   \n                \n            else\n                envTable.TargetAmount:SetText (\"\")\n                return\n            end\n            \n            --update the amount text\n            if (amount == 0) then\n                envTable.TargetAmount:SetText (\"\")\n            else\n                envTable.TargetAmount:SetText (amount)\n            end\n            \n        end\n    end\nend\n\n\n",
						["Enter Combat"] = "function (self, unitId, unitFrame, envTable)\n    \n    --check if can show the amount of targets\n    envTable.CanShow = envTable.CanShowTargetAmount();\n    \n    if (not envTable.CanShow) then\n        envTable.TargetAmount:SetText (\"\") \n    end\nend\n\n\n\n\n",
						["Constructor"] = "--all gray text like this are comments and do not run as code\n--build the settings and basic functions for the hook\n\nfunction (self, unitId, unitFrame, envTable)\n    \n    --declare setting variables:\n    local textColor = \"orange\";\n    local textSize = 12;\n    \n    local showInRaid = true;\n    local showInDungeon = true;\n    local showInArena = false;\n    local showInBattleground = false;\n    local showInOpenWorld = true;\n    \n    envTable.UpdateInterval = 2; --each 2 updates in the nameplate it'll update the amount of targets\n    \n    local anchor = {\n        side = 6, --1 = topleft 2 = left 3 = bottomleft 4 = bottom 5 = bottom right 6 = right 7 = topright 8 = top\n        x = 4, --x offset\n        y = 0, --y offset\n    };\n    \n    \n    ---------------------------------------------------------------------------------------------------------------------------------------------\n    \n    \n    --frames:\n    \n    --create the text that will show the amount of people targeting the unit\n    if (not  unitFrame.healthBar.TargetAmount) then\n        envTable.TargetAmount = Plater:CreateLabel (unitFrame.healthBar, \"\", textSize, textColor);\n        Plater.SetAnchor (envTable.TargetAmount, anchor);\n        unitFrame.healthBar.TargetAmount = envTable.TargetAmount\n    end\n    \n    --in case Plater wipes the envTable\n    envTable.TargetAmount = unitFrame.healthBar.TargetAmount\n    \n    ---------------------------------------------------------------------------------------------------------------------------------------------           \n    --private variables (they will be used in the other scripts within this hook)\n    envTable.CanShow = false;\n    envTable.UpdateCooldown = 0;\n    envTable.InRaid = false;\n    envTable.InParty = false;\n    \n    ---------------------------------------------------------------------------------------------------------------------------------------------           \n    --functions\n    \n    --update the InRaid or InParty proprieties\n    function envTable.UpdateGroupType()\n        if (IsInRaid()) then\n            envTable.InRaid = true;\n            envTable.InParty = false;     \n            \n        elseif (IsInGroup()) then\n            envTable.InRaid = false;\n            envTable.InParty = true;   \n            \n        else\n            envTable.InRaid = false;            \n            envTable.InParty = false;\n        end\n    end\n    \n    --this function controls if the amount of targets can show following the settings in the top of this script\n    function envTable.CanShowTargetAmount()\n        \n        local _, instanceType, difficultyID, _, _, _, _, instanceMapID, instanceGroupSize = GetInstanceInfo()\n        \n        if (showInRaid and instanceType == \"raid\") then\n            envTable.UpdateGroupType()\n            return true\n        end\n        \n        if (showInDungeon and instanceType == \"party\") then\n            envTable.UpdateGroupType()\n            return true\n        end\n        \n        if (showInArena and instanceType == \"arena\") then\n            envTable.UpdateGroupType()\n            return true\n        end\n        \n        if (showInBattleground and instanceType == \"pvp\") then\n            envTable.UpdateGroupType()\n            return true\n        end\n        \n        if (showInOpenWorld and instanceType == \"none\") then\n            envTable.UpdateGroupType()\n            if (envTable.InRaid or envTable.InParty) then\n                return true\n            end\n        end\n        \n        return false\n    end\n    \n    --get the amount of player targetting the unit in raid or party\n    function envTable.NumTargetsInRaid (unitFrame)\n        local amount = 0\n        for i = 1, GetNumGroupMembers() do\n            local unit = \"raid\" .. i .. \"target\"\n            if (UnitGUID (unit) == unitFrame.namePlateUnitGUID) then\n                amount = amount + 1\n            end\n        end\n        \n        return amount\n    end\n    \n    function envTable.NumTargetsInParty()\n        local amount = 0\n        for i = 1, GetNumGroupMembers() - 1 do\n            local unit = \"party\" .. i .. \"target\"\n            if (UnitGUID (unit) == unitFrame.namePlateUnitGUID) then\n                amount = amount + 1\n            end\n        end\n        \n        local unit = \"playertarget\"\n        if (UnitGUID (unit) == unitFrame.namePlateUnitGUID) then\n            amount = amount + 1\n        end        \n        \n        return amount\n    end\n    \nend",
					},
					["Name"] = "Players Targeting a Target [Plater]",
					["PlaterCore"] = 1,
					["LoadConditions"] = {
						["talent"] = {
						},
						["group"] = {
						},
						["class"] = {
						},
						["map_ids"] = {
						},
						["role"] = {
						},
						["pvptalent"] = {
						},
						["spec"] = {
						},
						["affix"] = {
						},
						["encounter_ids"] = {
						},
						["race"] = {
						},
					},
					["Time"] = 1548278227,
					["Icon"] = 1966587,
					["LastHookEdited"] = "",
				}, -- [10]
				{
					["Enabled"] = true,
					["Revision"] = 93,
					["HooksTemp"] = {
					},
					["Author"] = "Izimode-Azralon",
					["Desc"] = "Changes the target color to the color set in the constructor script.",
					["Hooks"] = {
						["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    envTable.UpdateColor (unitFrame)\nend",
						["Nameplate Added"] = "function (self, unitId, unitFrame, envTable)\n    envTable.UpdateColor (unitFrame)\nend",
						["Target Changed"] = "function (self, unitId, unitFrame, envTable)\n    envTable.UpdateColor (unitFrame)\nend\n\n\n\n\n\n\n\n\n\n\n",
						["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --usage: color name e.g \"red\" \"yellow\"; color table e.g {1, 0, 0} {1, 1, 0}; hex string e.g. \"#FF0000\" \"FFFF00\"\n    \n    envTable.TargetColor = \"purple\"\n    --envTable.TargetColor = \"#FF00FF\"\n    --envTable.TargetColor = {252/255, 0/255, 254/255}\n    \n    function envTable.UpdateColor (unitFrame)\n        --do not change the color of the personal bar\n        if (not unitFrame.IsSelf) then\n            \n            --if this nameplate the current target of the player?\n            if (unitFrame.namePlateIsTarget) then\n                Plater.SetNameplateColor (unitFrame, envTable.TargetColor)  --rgb\n            else\n                --refresh the nameplate color\n                Plater.RefreshNameplateColor (unitFrame)\n            end\n        end\n    end\n    \nend\n\n\n\n\n",
					},
					["Name"] = "Current Target Color [Plater]",
					["LoadConditions"] = {
						["talent"] = {
						},
						["group"] = {
						},
						["class"] = {
						},
						["map_ids"] = {
						},
						["race"] = {
						},
						["pvptalent"] = {
						},
						["affix"] = {
						},
						["role"] = {
						},
						["encounter_ids"] = {
						},
						["spec"] = {
						},
					},
					["PlaterCore"] = 1,
					["Time"] = 1552354619,
					["Icon"] = 878211,
					["LastHookEdited"] = "",
				}, -- [11]
				{
					["Enabled"] = true,
					["Revision"] = 240,
					["HooksTemp"] = {
						["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    \n    local auraContainers = {unitFrame.BuffFrame.PlaterBuffList}\n\n    if (Plater.db.profile.buffs_on_aura2) then\n        auraContainers [2] = unitFrame.BuffFrame2.PlaterBuffList\n    end\n    \n    for containerID = 1, #auraContainers do\n        \n        local auraContainer = auraContainers [containerID]\n        local aurasShown = {}\n        local aurasDuplicated = {}\n        \n        --build the list of auras shown in the buff frame and check for each aura priority\n        --also check if the consolidate (stack) auras with the same name is enabled\n        for index, auraIcon in ipairs (auraContainer) do\n            if (auraIcon:IsShown()) then\n                if (envTable.consolidadeRepeatedAuras) then\n                    --is this aura already shown?\n                    local iconShownIndex = aurasDuplicated [auraIcon.SpellName]\n                    if (iconShownIndex) then\n                        --get the table with information about the shown icon\n                        local auraShownTable = aurasShown [iconShownIndex]\n                        --get the icon already in the table\n                        local icon = auraShownTable[1]\n                        --increase the amount of stacks\n                        auraShownTable[3] = auraShownTable[3] + 1\n                        \n                        --check if the remaining time of the icon already added in the table is lower than the current\n                        if (auraIcon.RemainingTime > icon.RemainingTime) then\n                            --replace the icon for the icon with bigger duration\n                            auraShownTable[1] = auraIcon\n                            icon:Hide()\n                        else\n                            auraIcon:Hide()\n                        end\n                    else    \n                        local priority = envTable.priority[auraIcon.SpellName] or envTable.priority[auraIcon.spellId] or 1\n                        tinsert (aurasShown, {auraIcon, priority, 1}) --icon frame, priority, stack amount\n                        aurasDuplicated [auraIcon.SpellName] = #aurasShown\n                    end\n                else\n                    --not stacking similar auras\n                    local priority = envTable.priority[auraIcon.SpellName] or envTable.priority[auraIcon.spellId] or 1\n                    tinsert (aurasShown, {auraIcon, priority})\n                    \n                end           \n            end\n        end\n        \n        --sort auras by priority\n        table.sort (aurasShown, DetailsFramework.SortOrder2)\n        \n        local growDirection\n        if (containerID == 1) then --debuff container\n            growDirection = Plater.db.profile.aura_grow_direction\n            --force to grow to right if it is anchored to center\n            if (growDirection == 2) then\n                growDirection = 3\n            end\n            -- \"Left\", \"Center\", \"Right\" - 1  2  3\n            \n        elseif (containerID == 2) then --buff container\n            growDirection = Plater.db.profile.aura2_grow_direction\n            --force to grow to left if it is anchored to center\n            if (growDirection == 2) then\n                growDirection = 1\n            end\n            \n        end\n        \n        local padding = envTable.padding\n        local framersPerRow = envTable.maxAurasPerRow + 1\n        \n        --first icon is where the row starts\n        local firstIcon = aurasShown[1] and aurasShown[1][1]\n        \n        if (firstIcon) then\n            local anchorPoint = firstIcon:GetParent() --anchor point is the BuffFrame\n            anchorPoint:SetSize (1, 1)\n            \n            firstIcon:ClearAllPoints()\n            firstIcon:SetPoint (\"center\", anchorPoint, \"center\", 0, 5)\n            \n            --check the consolidaded stacks, this is not the regular buff stacks\n            local firstIconStacks = aurasShown[1][3]\n            if (firstIconStacks and firstIconStacks > 1) then\n                firstIcon.StackText:SetText (firstIconStacks)\n                firstIcon.StackText:Show()\n            end\n            \n            --> left to right\n            if (growDirection == 3) then\n                --> iterate among all aura icons\n                for i = 2, #aurasShown do\n                    local auraIcon = aurasShown [i][1]\n                    auraIcon:ClearAllPoints()\n                    \n                    if (i == framersPerRow) then\n                        auraIcon:SetPoint (\"bottomleft\", firstIcon, \"topleft\", 0, envTable.rowPadding)\n                        framersPerRow = framersPerRow + framersPerRow\n                        \n                    else\n                        auraIcon:SetPoint (\"topleft\", aurasShown [i-1][1], \"topright\", padding, 0)\n                    end\n                    \n                    local stacks = aurasShown[i][3]\n                    if (stacks and stacks > 1) then\n                        auraIcon.StackText:SetText (stacks)\n                        auraIcon.StackText:Show()\n                    end\n                end        \n                \n                --right to left\n            elseif (growDirection == 1) then\n                --> iterate among all aura icons\n                for i = 2, #aurasShown do\n                    local auraIcon = aurasShown [i][1]\n                    auraIcon:ClearAllPoints()\n                    \n                    if (i == framersPerRow) then\n                        auraIcon:SetPoint (\"bottomright\", firstIcon, \"topright\", 0, envTable.rowPadding)\n                        framersPerRow = framersPerRow + framersPerRow\n                        \n                    else\n                        auraIcon:SetPoint (\"topright\", aurasShown [i-1][1], \"topleft\", -padding, 0)\n                    end\n                    \n                    local stacks = aurasShown[i][3]\n                    if (stacks and stacks > 1) then\n                        auraIcon.StackText:SetText (stacks)\n                        auraIcon.StackText:Show()\n                    end\n                    \n                end                    \n            end\n            \n        end\n    end\nend\n\n\n",
						["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --ATTENTION: after enabling this script, you may have to adjust the anchor point at the Buff Settings tab\n    \n    --space between each aura icon\n    envTable.padding = 1\n    \n    --space between each row of icons\n    envTable.rowPadding = 12\n    \n    --amount of icons in the row, it'll breakline and start a new row after reach the threshold\n    envTable.maxAurasPerRow = 5\n    \n    --stack auras of the same name that arent stacked by default from the game\n    envTable.consolidadeRepeatedAuras = true    \n    \n    --auras should grow to right or left?\n    envTable.GrowDirection = \"right\" --insert 'left' to grow to the left side\n    \n    --which auras goes first, assign a value (any number), bigger value goes first\n    envTable.priority = {\n        [\"Vampiric Touch\"] = 50,\n        [\"Shadow Word: Pain\"] = 22,\n        [\"Mind Flay\"] = 5,\n    }\n    \nend \n\n\n\n\n",
					},
					["Author"] = "Ditador-Azralon",
					["Desc"] = "Reorder buffs and debuffs following the settings set in the constructor.",
					["Hooks"] = {
						["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --ATTENTION: after enabling this script, you may have to adjust the anchor point at the Buff Settings tab\n    \n    --space between each aura icon\n    envTable.padding = 1\n    \n    --space between each row of icons\n    envTable.rowPadding = 12\n    \n    --amount of icons in the row, it'll breakline and start a new row after reach the threshold\n    envTable.maxAurasPerRow = 5\n    \n    --stack auras of the same name that arent stacked by default from the game\n    envTable.consolidadeRepeatedAuras = true    \n    \n    --auras should grow to right or left?\n    envTable.GrowDirection = \"right\" --insert 'left' to grow to the left side\n    \n    --which auras goes first, assign a value (any number), bigger value goes first\n    envTable.priority = {\n        [\"Vampiric Touch\"] = 50,\n        [\"Shadow Word: Pain\"] = 22,\n        [\"Mind Flay\"] = 5,\n    }\n    \nend \n\n\n\n\n",
						["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    \n    local auraContainers = {unitFrame.BuffFrame.PlaterBuffList}\n\n    if (Plater.db.profile.buffs_on_aura2) then\n        auraContainers [2] = unitFrame.BuffFrame2.PlaterBuffList\n    end\n    \n    for containerID = 1, #auraContainers do\n        \n        local auraContainer = auraContainers [containerID]\n        local aurasShown = {}\n        local aurasDuplicated = {}\n        \n        --build the list of auras shown in the buff frame and check for each aura priority\n        --also check if the consolidate (stack) auras with the same name is enabled\n        for index, auraIcon in ipairs (auraContainer) do\n            if (auraIcon:IsShown()) then\n                if (envTable.consolidadeRepeatedAuras) then\n                    --is this aura already shown?\n                    local iconShownIndex = aurasDuplicated [auraIcon.SpellName]\n                    if (iconShownIndex) then\n                        --get the table with information about the shown icon\n                        local auraShownTable = aurasShown [iconShownIndex]\n                        --get the icon already in the table\n                        local icon = auraShownTable[1]\n                        --increase the amount of stacks\n                        auraShownTable[3] = auraShownTable[3] + 1\n                        \n                        --check if the remaining time of the icon already added in the table is lower than the current\n                        if (auraIcon.RemainingTime > icon.RemainingTime) then\n                            --replace the icon for the icon with bigger duration\n                            auraShownTable[1] = auraIcon\n                            icon:Hide()\n                        else\n                            auraIcon:Hide()\n                        end\n                    else    \n                        local priority = envTable.priority[auraIcon.SpellName] or envTable.priority[auraIcon.spellId] or 1\n                        tinsert (aurasShown, {auraIcon, priority, 1}) --icon frame, priority, stack amount\n                        aurasDuplicated [auraIcon.SpellName] = #aurasShown\n                    end\n                else\n                    --not stacking similar auras\n                    local priority = envTable.priority[auraIcon.SpellName] or envTable.priority[auraIcon.spellId] or 1\n                    tinsert (aurasShown, {auraIcon, priority})\n                    \n                end           \n            end\n        end\n        \n        --sort auras by priority\n        table.sort (aurasShown, DetailsFramework.SortOrder2)\n        \n        local growDirection\n        if (containerID == 1) then --debuff container\n            growDirection = Plater.db.profile.aura_grow_direction\n            --force to grow to right if it is anchored to center\n            if (growDirection == 2) then\n                growDirection = 3\n            end\n            -- \"Left\", \"Center\", \"Right\" - 1  2  3\n            \n        elseif (containerID == 2) then --buff container\n            growDirection = Plater.db.profile.aura2_grow_direction\n            --force to grow to left if it is anchored to center\n            if (growDirection == 2) then\n                growDirection = 1\n            end\n            \n        end\n        \n        local padding = envTable.padding\n        local framersPerRow = envTable.maxAurasPerRow + 1\n        \n        --first icon is where the row starts\n        local firstIcon = aurasShown[1] and aurasShown[1][1]\n        \n        if (firstIcon) then\n            local anchorPoint = firstIcon:GetParent() --anchor point is the BuffFrame\n            anchorPoint:SetSize (1, 1)\n            \n            firstIcon:ClearAllPoints()\n            firstIcon:SetPoint (\"center\", anchorPoint, \"center\", 0, 5)\n            \n            --check the consolidaded stacks, this is not the regular buff stacks\n            local firstIconStacks = aurasShown[1][3]\n            if (firstIconStacks and firstIconStacks > 1) then\n                firstIcon.StackText:SetText (firstIconStacks)\n                firstIcon.StackText:Show()\n            end\n            \n            --> left to right\n            if (growDirection == 3) then\n                --> iterate among all aura icons\n                for i = 2, #aurasShown do\n                    local auraIcon = aurasShown [i][1]\n                    auraIcon:ClearAllPoints()\n                    \n                    if (i == framersPerRow) then\n                        auraIcon:SetPoint (\"bottomleft\", firstIcon, \"topleft\", 0, envTable.rowPadding)\n                        framersPerRow = framersPerRow + framersPerRow\n                        \n                    else\n                        auraIcon:SetPoint (\"topleft\", aurasShown [i-1][1], \"topright\", padding, 0)\n                    end\n                    \n                    local stacks = aurasShown[i][3]\n                    if (stacks and stacks > 1) then\n                        auraIcon.StackText:SetText (stacks)\n                        auraIcon.StackText:Show()\n                    end\n                end        \n                \n                --right to left\n            elseif (growDirection == 1) then\n                --> iterate among all aura icons\n                for i = 2, #aurasShown do\n                    local auraIcon = aurasShown [i][1]\n                    auraIcon:ClearAllPoints()\n                    \n                    if (i == framersPerRow) then\n                        auraIcon:SetPoint (\"bottomright\", firstIcon, \"topright\", 0, envTable.rowPadding)\n                        framersPerRow = framersPerRow + framersPerRow\n                        \n                    else\n                        auraIcon:SetPoint (\"topright\", aurasShown [i-1][1], \"topleft\", -padding, 0)\n                    end\n                    \n                    local stacks = aurasShown[i][3]\n                    if (stacks and stacks > 1) then\n                        auraIcon.StackText:SetText (stacks)\n                        auraIcon.StackText:Show()\n                    end\n                    \n                end                    \n            end\n            \n        end\n    end\nend\n\n\n",
					},
					["Name"] = "Aura Reorder [Plater]",
					["PlaterCore"] = 1,
					["LoadConditions"] = {
						["talent"] = {
						},
						["group"] = {
						},
						["class"] = {
						},
						["map_ids"] = {
						},
						["race"] = {
						},
						["pvptalent"] = {
						},
						["affix"] = {
						},
						["role"] = {
						},
						["encounter_ids"] = {
						},
						["spec"] = {
						},
					},
					["Time"] = 1550151943,
					["Icon"] = "Interface\\AddOns\\Plater\\images\\icon_aura_reorder",
					["LastHookEdited"] = "Constructor",
				}, -- [12]
				{
					["Enabled"] = true,
					["Revision"] = 22,
					["HooksTemp"] = {
						["Nameplate Created"] = "function (self, unitId, unitFrame, envTable)\n    \n    --added this event just to run the constructor script\n    \nend\n\n\n",
						["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --insert here the font you want to change then /reeload\n    --after the reload, check if the font has changed and disable this script\n    \n    local FONT = \"Accidental Presidency\"\n    \n    local profile = Plater.db.profile\n    local actorTables = profile.plate_config\n    \n    for plateType, plateTable in pairs (actorTables) do\n        \n        plateTable.actorname_text_font = FONT\n        plateTable.spellname_text_font = FONT\n        plateTable.spellpercent_text_font = FONT\n        plateTable.level_text_font = FONT\n        plateTable.percent_text_font = FONT\n        plateTable.big_actortitle_text_font = FONT\n        plateTable.big_actorname_text_font = FONT\n        plateTable.power_percent_text_font = FONT\n        \n    end\n    \n    profile.castbar_target_font = FONT\n    profile.aura_timer_text_font = FONT    \n    profile.aura_stack_font = FONT    \n    \nend\n\n\n",
					},
					["Author"] = "Izimode-Azralon",
					["Desc"] = "Edit the Constructor script setting the font you want in the FONT = \"\", then /reload.",
					["Hooks"] = {
						["Nameplate Created"] = "function (self, unitId, unitFrame, envTable)\n    \n    --added this event just to run the constructor script\n    \nend\n\n\n",
						["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --insert here the font you want to change then /reeload\n    --after the reload, check if the font has changed and disable this script\n    \n    local FONT = \"Accidental Presidency\"\n    \n    local profile = Plater.db.profile\n    local actorTables = profile.plate_config\n    \n    for plateType, plateTable in pairs (actorTables) do\n        \n        plateTable.actorname_text_font = FONT\n        plateTable.spellname_text_font = FONT\n        plateTable.spellpercent_text_font = FONT\n        plateTable.level_text_font = FONT\n        plateTable.percent_text_font = FONT\n        plateTable.big_actortitle_text_font = FONT\n        plateTable.big_actorname_text_font = FONT\n        plateTable.power_percent_text_font = FONT\n        \n    end\n    \n    profile.castbar_target_font = FONT\n    profile.aura_timer_text_font = FONT    \n    profile.aura_stack_font = FONT    \n    \nend\n\n\n",
					},
					["Name"] = "Change All Fonts",
					["LoadConditions"] = {
						["talent"] = {
						},
						["group"] = {
						},
						["class"] = {
						},
						["map_ids"] = {
						},
						["role"] = {
						},
						["pvptalent"] = {
						},
						["spec"] = {
						},
						["affix"] = {
						},
						["encounter_ids"] = {
						},
						["race"] = {
						},
					},
					["PlaterCore"] = 1,
					["Time"] = 1550154977,
					["Icon"] = 134331,
					["LastHookEdited"] = "Constructor",
				}, -- [13]
				{
					["Enabled"] = true,
					["Revision"] = 25,
					["HooksTemp"] = {
						["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --colors for each time bracket\n    envTable.Colors = {\n        critical = \"red\",\n        warning = \"yellow\",\n        okay = \"white\",\n    }\n    \n    --time amount to enter in warning or critical state\n    envTable.Timers = {\n        critical = 4.9,\n        warning = 8,\n    }\n    \nend\n\n\n",
						["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    \n    local auras = unitFrame.BuffFrame.PlaterBuffList\n    \n    for _, auraIcon in ipairs (auras) do\n        if (auraIcon:IsVisible()) then\n            if (auraIcon.RemainingTime < envTable.Timers.critical) then\n                Plater:SetFontColor (auraIcon.TimerText, envTable.Colors.critical)\n                \n            elseif (auraIcon.RemainingTime < envTable.Timers.warning) then\n                Plater:SetFontColor (auraIcon.TimerText, envTable.Colors.warning)\n                \n            else\n                Plater:SetFontColor (auraIcon.TimerText, envTable.Colors.okay)\n            end \n        end\n        \n    end\nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
					},
					["Author"] = "Ditador-Azralon",
					["Desc"] = "Change the color of the aura timer by it's time left",
					["Hooks"] = {
						["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --colors for each time bracket\n    envTable.Colors = {\n        critical = \"red\",\n        warning = \"yellow\",\n        okay = \"white\",\n    }\n    \n    --time amount to enter in warning or critical state\n    envTable.Timers = {\n        critical = 4.9,\n        warning = 8,\n    }\n    \nend\n\n\n",
						["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    \n    local auras = unitFrame.BuffFrame.PlaterBuffList\n    \n    for _, auraIcon in ipairs (auras) do\n        if (auraIcon:IsVisible()) then\n            if (auraIcon.RemainingTime < envTable.Timers.critical) then\n                Plater:SetFontColor (auraIcon.TimerText, envTable.Colors.critical)\n                \n            elseif (auraIcon.RemainingTime < envTable.Timers.warning) then\n                Plater:SetFontColor (auraIcon.TimerText, envTable.Colors.warning)\n                \n            else\n                Plater:SetFontColor (auraIcon.TimerText, envTable.Colors.okay)\n            end \n        end\n        \n    end\nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
					},
					["Name"] = "Paint Aura Timers",
					["PlaterCore"] = 1,
					["LoadConditions"] = {
						["talent"] = {
						},
						["group"] = {
						},
						["class"] = {
						},
						["map_ids"] = {
						},
						["race"] = {
						},
						["pvptalent"] = {
						},
						["affix"] = {
						},
						["role"] = {
						},
						["encounter_ids"] = {
						},
						["spec"] = {
						},
					},
					["Time"] = 1550155776,
					["Icon"] = "Interface\\Timer\\Challenges-Logo",
					["LastHookEdited"] = "Constructor",
				}, -- [14]
				{
					["Enabled"] = true,
					["Revision"] = 113,
					["HooksTemp"] = {
						["Cast Update"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.UpdateIconPosition (unitFrame)\n    self.ThrottleUpdate = -1\n    \nend\n\n\n",
						["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --settings:\n    --show cast icon\n    envTable.ShowIcon = true\n    --anchor icon on what side\n    envTable.IconAnchor = \"left\" --accep 'left' 'right'\n    --fine tune the size of the icon\n    envTable.IconSizeOffset = 1\n    \n    --shield for non interruptible casts\n    envTable.ShowShield = true\n    envTable.ShieldTexture = [[Interface\\GROUPFRAME\\UI-GROUP-MAINTANKICON]]\n    envTable.ShieldDesaturated = true\n    envTable.ShieldColor = {1, 1, 1 ,1}\n    envTable.ShieldSize = {10, 12}\n    \n    --private:\n    function envTable.UpdateIconPosition (unitFrame)\n        local castBar = unitFrame.castBar\n        local icon = castBar.Icon\n        local shield = castBar.BorderShield\n        \n        if (envTable.ShowIcon) then\n            icon:ClearAllPoints()\n            \n            if (envTable.IconAnchor == \"left\") then\n                icon:SetPoint (\"topright\", unitFrame.healthBar, \"topleft\", -1, envTable.IconSizeOffset)\n                icon:SetPoint (\"bottomright\", unitFrame.castBar, \"bottomleft\", -1, 0)    \n                \n            elseif (envTable.IconAnchor == \"right\") then\n                icon:SetPoint (\"topleft\", unitFrame.healthBar, \"topright\", 1, envTable.IconSizeOffset)\n                icon:SetPoint (\"bottomleft\", unitFrame.castBar, \"bottomright\", 1, 0)\n                \n            end\n            \n            icon:SetWidth (icon:GetHeight())\n            icon:Show()\n            \n        else\n            icon:Hide()\n            \n        end\n        \n        if (envTable.ShowShield and not castBar.canInterrupt) then\n            shield:Show()\n            shield:SetAlpha (1)\n            shield:SetTexCoord (0, 1, 0, 1)\n            shield:SetVertexColor (1, 1, 1, 1)\n            \n            shield:SetTexture (envTable.ShieldTexture)\n            shield:SetDesaturated (envTable.ShieldDesaturated)\n            \n            if (not envTable.ShieldDesaturated) then\n                shield:SetVertexColor (DetailsFramework:ParseColors (envTable.ShieldColor))\n            end\n            \n            shield:SetSize (unpack (envTable.ShieldSize))\n            \n            shield:ClearAllPoints()\n            shield:SetPoint (\"center\", castBar, \"left\", 0, 0)\n            \n        else\n            shield:Hide()\n            \n        end\n        \n    end\nend",
						["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    \nend\n\n\n",
						["Cast Start"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.UpdateIconPosition (unitFrame)\n    \nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
						["Cast Stop"] = "function (self, unitId, unitFrame, envTable)\n    \n    \n    \nend\n\n\n",
					},
					["Author"] = "Ditador-Azralon",
					["Desc"] = "Move the icon of the spell cast to the left or right side of the nameplate.",
					["Hooks"] = {
						["Cast Start"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.UpdateIconPosition (unitFrame)\n    \nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
						["Cast Update"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.UpdateIconPosition (unitFrame)\n    self.ThrottleUpdate = -1\n    \nend\n\n\n",
						["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --settings:\n    --show cast icon\n    envTable.ShowIcon = true\n    --anchor icon on what side\n    envTable.IconAnchor = \"left\" --accep 'left' 'right'\n    --fine tune the size of the icon\n    envTable.IconSizeOffset = 1\n    \n    --shield for non interruptible casts\n    envTable.ShowShield = true\n    envTable.ShieldTexture = [[Interface\\GROUPFRAME\\UI-GROUP-MAINTANKICON]]\n    envTable.ShieldDesaturated = true\n    envTable.ShieldColor = {1, 1, 1 ,1}\n    envTable.ShieldSize = {10, 12}\n    \n    --private:\n    function envTable.UpdateIconPosition (unitFrame)\n        local castBar = unitFrame.castBar\n        local icon = castBar.Icon\n        local shield = castBar.BorderShield\n        \n        if (envTable.ShowIcon) then\n            icon:ClearAllPoints()\n            \n            if (envTable.IconAnchor == \"left\") then\n                icon:SetPoint (\"topright\", unitFrame.healthBar, \"topleft\", -1, envTable.IconSizeOffset)\n                icon:SetPoint (\"bottomright\", unitFrame.castBar, \"bottomleft\", -1, 0)    \n                \n            elseif (envTable.IconAnchor == \"right\") then\n                icon:SetPoint (\"topleft\", unitFrame.healthBar, \"topright\", 1, envTable.IconSizeOffset)\n                icon:SetPoint (\"bottomleft\", unitFrame.castBar, \"bottomright\", 1, 0)\n                \n            end\n            \n            icon:SetWidth (icon:GetHeight())\n            icon:Show()\n            \n        else\n            icon:Hide()\n            \n        end\n        \n        if (envTable.ShowShield and not castBar.canInterrupt) then\n            shield:Show()\n            shield:SetAlpha (1)\n            shield:SetTexCoord (0, 1, 0, 1)\n            shield:SetVertexColor (1, 1, 1, 1)\n            \n            shield:SetTexture (envTable.ShieldTexture)\n            shield:SetDesaturated (envTable.ShieldDesaturated)\n            \n            if (not envTable.ShieldDesaturated) then\n                shield:SetVertexColor (DetailsFramework:ParseColors (envTable.ShieldColor))\n            end\n            \n            shield:SetSize (unpack (envTable.ShieldSize))\n            \n            shield:ClearAllPoints()\n            shield:SetPoint (\"center\", castBar, \"left\", 0, 0)\n            \n        else\n            shield:Hide()\n            \n        end\n        \n    end\nend",
					},
					["Name"] = "Cast Icon Anchor",
					["LoadConditions"] = {
						["talent"] = {
						},
						["group"] = {
						},
						["class"] = {
						},
						["map_ids"] = {
						},
						["role"] = {
						},
						["pvptalent"] = {
						},
						["spec"] = {
						},
						["race"] = {
						},
						["encounter_ids"] = {
						},
						["affix"] = {
						},
					},
					["PlaterCore"] = 1,
					["Time"] = 1550156349,
					["Icon"] = "Interface\\Buttons\\UI-Quickslot2",
					["LastHookEdited"] = "Constructor",
				}, -- [15]
			},
			["disable_omnicc_on_auras"] = true,
			["aura_height_personal"] = 19,
			["aura_width"] = 22,
			["aura_show_offensive_cd"] = true,
			["health_statusbar_bgcolor"] = {
				0.47450980392157, -- [1]
				0.47450980392157, -- [2]
				0.47450980392157, -- [3]
				0.79000000655651, -- [4]
			},
			["login_counter"] = 13,
			["version"] = 3,
			["aura_cooldown_show_swipe"] = false,
			["pet_width_scale"] = 0.8999999761581421,
			["range_check_enabled"] = false,
			["quick_hide"] = true,
			["indicator_enemyclass"] = true,
			["hook_data_trash"] = {
				{
					["Enabled"] = false,
					["Revision"] = 73,
					["HooksTemp"] = {
						["Leave Combat"] = "function (self, unitId, unitFrame, envTable)\n    if (unitFrame.namePlateUnitReaction == envTable.REACTION_NEUTRAL) then\n        \n        --plater already handle this\n        if (unitFrame.PlayerCannotAttack) then\n            return\n        end    \n        \n        --check if is only open world\n        if (envTable.OnlyInOpenWorld and Plater.ZoneInstanceType ~= \"none\") then\n            return \n        end\n        \n        --check for only in combat\n        if (envTable.ShowInCombat) then\n            envTable.HideNameplate (unitFrame)\n        end\n    end\nend\n\n\n",
						["Nameplate Added"] = "function (self, unitId, unitFrame, envTable)\n    \n    if (unitFrame.namePlateUnitReaction == envTable.REACTION_NEUTRAL) then\n        \n        --plater already handle this\n        if (unitFrame.PlayerCannotAttack) then\n            return\n        end\n        \n        --check if is only open world\n        if (envTable.OnlyInOpenWorld and Plater.ZoneInstanceType ~= \"none\") then\n            return \n        end\n        \n        --check for only in combat\n        if (envTable.ShowInCombat and InCombatLockdown()) then\n            return\n        end\n        \n        envTable.HideNameplate (unitFrame)\n    end\n    \nend\n\n\n\n\n\n\n",
						["Target Changed"] = "function (self, unitId, unitFrame, envTable)\n    \n    if (unitFrame.namePlateUnitReaction == envTable.REACTION_NEUTRAL) then\n        \n        --plater already handle this\n        if (unitFrame.PlayerCannotAttack) then\n            return\n        end    \n        \n        --check if is only open world\n        if (envTable.OnlyInOpenWorld and Plater.ZoneInstanceType ~= \"none\") then\n            return \n        end\n        \n        --check for only in combat\n        if (envTable.ShowInCombat and InCombatLockdown()) then\n            return\n        end\n        \n        --check the unit reaction\n        if (unitFrame.namePlateIsTarget) then\n            envTable.ShowNameplate (unitFrame)\n            \n        else\n            envTable.HideNameplate (unitFrame)\n            \n        end    \n    end\n    \nend\n\n\n\n\n\n\n",
						["Nameplate Removed"] = "function (self, unitId, unitFrame, envTable)\n    \n    if (unitFrame.namePlateUnitReaction == envTable.REACTION_NEUTRAL) then\n        envTable.ShowNameplate (unitFrame)\n    end\n    \nend\n\n\n\n\n",
						["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    \n    --when plater finishes an update on the nameplate\n    --check within the envTable if the healthBar of this nameplate should be hidden\n    if (envTable.IsHidden) then\n        if (unitFrame.healthBar:IsShown()) then\n            envTable.HideNameplate (unitFrame)\n        end\n    end\n    \nend\n\n\n\n\n",
						["Enter Combat"] = "function (self, unitId, unitFrame, envTable)\n    \n    if (unitFrame.namePlateUnitReaction == envTable.REACTION_NEUTRAL) then\n        \n        --plater already handle this\n        if (unitFrame.PlayerCannotAttack) then\n            return\n        end    \n        \n        --check if is only open world\n        if (envTable.OnlyInOpenWorld and Plater.ZoneInstanceType ~= \"none\") then\n            return \n        end\n        \n        --check for only in combat\n        if (envTable.ShowInCombat) then\n            envTable.ShowNameplate (unitFrame)\n        end\n    end\nend\n\n\n",
						["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --settings\n    envTable.OnlyInOpenWorld = true;\n    envTable.ShowInCombat = true;\n    \n    --consts\n    envTable.REACTION_NEUTRAL = 4;\n    \n    --functions to hide and show the healthBar\n    function envTable.HideNameplate (unitFrame)\n        Plater.HideHealthBar (unitFrame)\n        Plater.DisableHighlight (unitFrame)\n        envTable.IsHidden = true\n    end\n    \n    function envTable.ShowNameplate (unitFrame)\n        Plater.ShowHealthBar (unitFrame)\n        Plater.EnableHighlight (unitFrame)\n        envTable.IsHidden = false\n    end\n    \nend\n\n\n\n\n",
					},
					["Author"] = "Izimode-Azralon",
					["Desc"] = "Hide neutral units, show when selected, see the constructor script for options.",
					["Hooks"] = {
						["Leave Combat"] = "function (self, unitId, unitFrame, envTable)\n    if (unitFrame.namePlateUnitReaction == envTable.REACTION_NEUTRAL) then\n        \n        --plater already handle this\n        if (unitFrame.PlayerCannotAttack) then\n            return\n        end    \n        \n        --check if is only open world\n        if (envTable.OnlyInOpenWorld and Plater.ZoneInstanceType ~= \"none\") then\n            return \n        end\n        \n        --check for only in combat\n        if (envTable.ShowInCombat) then\n            envTable.HideNameplate (unitFrame)\n        end\n    end\nend\n\n\n",
						["Nameplate Added"] = "function (self, unitId, unitFrame, envTable)\n    \n    if (unitFrame.namePlateUnitReaction == envTable.REACTION_NEUTRAL) then\n        \n        --plater already handle this\n        if (unitFrame.PlayerCannotAttack) then\n            return\n        end\n        \n        --check if is only open world\n        if (envTable.OnlyInOpenWorld and Plater.ZoneInstanceType ~= \"none\") then\n            return \n        end\n        \n        --check for only in combat\n        if (envTable.ShowInCombat and InCombatLockdown()) then\n            return\n        end\n        \n        envTable.HideNameplate (unitFrame)\n    end\n    \nend\n\n\n\n\n\n\n",
						["Target Changed"] = "function (self, unitId, unitFrame, envTable)\n    \n    if (unitFrame.namePlateUnitReaction == envTable.REACTION_NEUTRAL) then\n        \n        --plater already handle this\n        if (unitFrame.PlayerCannotAttack) then\n            return\n        end    \n        \n        --check if is only open world\n        if (envTable.OnlyInOpenWorld and Plater.ZoneInstanceType ~= \"none\") then\n            return \n        end\n        \n        --check for only in combat\n        if (envTable.ShowInCombat and InCombatLockdown()) then\n            return\n        end\n        \n        --check the unit reaction\n        if (unitFrame.namePlateIsTarget) then\n            envTable.ShowNameplate (unitFrame)\n            \n        else\n            envTable.HideNameplate (unitFrame)\n            \n        end    \n    end\n    \nend\n\n\n\n\n\n\n",
						["Nameplate Removed"] = "function (self, unitId, unitFrame, envTable)\n    \n    if (unitFrame.namePlateUnitReaction == envTable.REACTION_NEUTRAL) then\n        envTable.ShowNameplate (unitFrame)\n    end\n    \nend\n\n\n\n\n",
						["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    \n    --when plater finishes an update on the nameplate\n    --check within the envTable if the healthBar of this nameplate should be hidden\n    if (envTable.IsHidden) then\n        if (unitFrame.healthBar:IsShown()) then\n            envTable.HideNameplate (unitFrame)\n        end\n    end\n    \nend\n\n\n\n\n",
						["Enter Combat"] = "function (self, unitId, unitFrame, envTable)\n    \n    if (unitFrame.namePlateUnitReaction == envTable.REACTION_NEUTRAL) then\n        \n        --plater already handle this\n        if (unitFrame.PlayerCannotAttack) then\n            return\n        end    \n        \n        --check if is only open world\n        if (envTable.OnlyInOpenWorld and Plater.ZoneInstanceType ~= \"none\") then\n            return \n        end\n        \n        --check for only in combat\n        if (envTable.ShowInCombat) then\n            envTable.ShowNameplate (unitFrame)\n        end\n    end\nend\n\n\n",
						["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --settings\n    envTable.OnlyInOpenWorld = true;\n    envTable.ShowInCombat = true;\n    \n    --consts\n    envTable.REACTION_NEUTRAL = 4;\n    \n    --functions to hide and show the healthBar\n    function envTable.HideNameplate (unitFrame)\n        Plater.HideHealthBar (unitFrame)\n        Plater.DisableHighlight (unitFrame)\n        envTable.IsHidden = true\n    end\n    \n    function envTable.ShowNameplate (unitFrame)\n        Plater.ShowHealthBar (unitFrame)\n        Plater.EnableHighlight (unitFrame)\n        envTable.IsHidden = false\n    end\n    \nend\n\n\n\n\n",
					},
					["__TrashAt"] = 1588953565,
					["Name"] = "Hide Neutral Units [Plater]",
					["PlaterCore"] = 1,
					["LoadConditions"] = {
						["talent"] = {
						},
						["group"] = {
						},
						["class"] = {
						},
						["map_ids"] = {
						},
						["race"] = {
						},
						["pvptalent"] = {
						},
						["affix"] = {
						},
						["role"] = {
						},
						["encounter_ids"] = {
						},
						["spec"] = {
						},
					},
					["Time"] = 1541606242,
					["Icon"] = 1990989,
					["LastHookEdited"] = "Constructor",
				}, -- [1]
				{
					["Enabled"] = false,
					["Revision"] = 46,
					["HooksTemp"] = {
						["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    \n    --do nothing if the player isn't in combat\n    if (not Plater.IsInCombat()) then\n        return \n    end\n    \n    --do nothing if the unit isn't in combat\n    if (not unitFrame.InCombat) then\n        return\n    end\n    \n    --check the auras\n    local hasAura = false\n    \n    for auraName, _ in pairs (envTable.TrackingAuras) do\n        if (Plater.NameplateHasAura (unitFrame, auraName)) then\n            hasAura = true\n            break\n        end\n    end\n    \n    if (not hasAura) then\n        Plater.SetNameplateColor (unitFrame, envTable.NameplateColor)\n    end    \n    \nend\n\n\n\n\n\n\n\n\n\n\n",
						["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    --Important: lines starting with double dashes are comments and are not part of the script\n    \n    --if the unit does not have any of the following auras, it will be painted with the color listed below\n    --list of spells to track, can be the spell name (case-sensitive) or the spellID\n    envTable.TrackingAuras = {\n        --[\"Nightblade\"] = true, --this is an example using the spell name\n        --[195452] = true, --this is an example using the spellID\n        \n    }\n    \n    --which color the nameplate wil be changed\n    --color can be added as:\n    --color names: \"red\", \"yellow\"\n    --color hex: \"#FF0000\", \"#FFFF00\"\n    --color table: {1, 0, 0}, {1, 1, 0}    \n    --you may also use /plater colors\n    envTable.NameplateColor = \"pink\"\n    \nend\n\n\n",
					},
					["Author"] = "Izimode-Azralon",
					["Desc"] = "Change the nameplate color when a nameplate does not have the auras set in the constructor script.",
					["Hooks"] = {
						["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    --Important: lines starting with double dashes are comments and are not part of the script\n    \n    --if the unit does not have any of the following auras, it will be painted with the color listed below\n    --list of spells to track, can be the spell name (case-sensitive) or the spellID\n    envTable.TrackingAuras = {\n        --[\"Nightblade\"] = true, --this is an example using the spell name\n        --[195452] = true, --this is an example using the spellID\n        \n    }\n    \n    --which color the nameplate wil be changed\n    --color can be added as:\n    --color names: \"red\", \"yellow\"\n    --color hex: \"#FF0000\", \"#FFFF00\"\n    --color table: {1, 0, 0}, {1, 1, 0}    \n    --you may also use /plater colors\n    envTable.NameplateColor = \"pink\"\n    \nend\n\n\n",
						["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    \n    --do nothing if the player isn't in combat\n    if (not Plater.IsInCombat()) then\n        return \n    end\n    \n    --do nothing if the unit isn't in combat\n    if (not unitFrame.InCombat) then\n        return\n    end\n    \n    --check the auras\n    local hasAura = false\n    \n    for auraName, _ in pairs (envTable.TrackingAuras) do\n        if (Plater.NameplateHasAura (unitFrame, auraName)) then\n            hasAura = true\n            break\n        end\n    end\n    \n    if (not hasAura) then\n        Plater.SetNameplateColor (unitFrame, envTable.NameplateColor)\n    end    \n    \nend\n\n\n\n\n\n\n\n\n\n\n",
					},
					["__TrashAt"] = 1588953674,
					["Name"] = "Don't Have Aura [Plater]",
					["PlaterCore"] = 1,
					["LoadConditions"] = {
						["talent"] = {
						},
						["group"] = {
						},
						["class"] = {
						},
						["map_ids"] = {
						},
						["role"] = {
						},
						["pvptalent"] = {
						},
						["spec"] = {
						},
						["affix"] = {
						},
						["encounter_ids"] = {
						},
						["race"] = {
						},
					},
					["Time"] = 1550151941,
					["Icon"] = "Interface\\ICONS\\Spell_Shadow_ShadowWordPain",
					["LastHookEdited"] = "Constructor",
				}, -- [2]
			},
			["script_auto_imported"] = {
				["Cast - Small Alert"] = 4,
				["Aura - Invalidate Unit"] = 1,
				["Aura - Buff Alert"] = 4,
				["Aura - Blink Time Left"] = 1,
				["Explosion Affix M+"] = 3,
				["Cast - Very Important"] = 2,
				["Aura Border Color"] = 1,
				["Color Change"] = 1,
				["Unit Power"] = 1,
				["Cast - Frontal Cone"] = 2,
				["Fixate"] = 3,
				["Unit - Important"] = 5,
				["Aura - Debuff Alert"] = 3,
				["Cast - Big Alert"] = 5,
				["Fixate On You"] = 2,
			},
			["target_highlight_color"] = {
				nil, -- [1]
				0.46274509803922, -- [2]
			},
			["ui_parent_scale_tune"] = 1.124999991618097,
			["extra_icon_anchor"] = {
				["y"] = 0,
			},
			["update_throttle"] = 0.24999998509884,
			["minor_width_scale"] = 0.89999997615814,
			["number_region_first_run"] = true,
			["aura_alpha"] = 1,
			["captured_spells"] = {
				[269279] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "猫栗子-冰风岗",
					["npcID"] = 0,
				},
				[316036] = {
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[58875] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "茉娅缇-萨尔",
					["npcID"] = 0,
				},
				[311310] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "蓝卟萬-利刃之拳",
					["npcID"] = 0,
				},
				[198069] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "猫栗子-冰风岗",
					["npcID"] = 0,
				},
				[256451] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "黑山药-自由之风",
					["npcID"] = 0,
				},
				[225919] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "十里扬州路",
					["npcID"] = 0,
				},
				[278736] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "哎呀取啥名-丽丽（四川）",
					["npcID"] = 0,
				},
				[299304] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "溜狗狗的妹妹-鬼雾峰",
					["npcID"] = 0,
				},
				[311185] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "解忧水果铺-利刃之拳",
					["npcID"] = 0,
				},
				[257410] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "小马佩德罗-黑石尖塔",
					["npcID"] = 0,
				},
				[280398] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "蓝蓝之瞳-普罗德摩",
					["npcID"] = 0,
				},
				[275544] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "猫栗子-冰风岗",
					["npcID"] = 0,
				},
				[16591] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "拉轰的小强-甜水绿洲",
					["npcID"] = 0,
				},
				[311187] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "水水-鬼雾峰",
					["npcID"] = 0,
				},
				[264689] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "向叶",
					["npcID"] = 0,
				},
				[259455] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "影魅-索拉丁",
					["npcID"] = 0,
				},
				[280400] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Xiaodouding",
					["npcID"] = 0,
				},
				[315787] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Xiaodouding",
					["npcID"] = 0,
				},
				[225921] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "十里扬州路",
					["npcID"] = 0,
				},
				[317065] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "鱼白影青-冰风岗",
					["npcID"] = 0,
				},
				[319237] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "风起春城暮",
					["npcID"] = 0,
				},
				[224772] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "剩光守护-鬼雾峰",
					["npcID"] = 0,
				},
				[268904] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "鱼白影青-冰风岗",
					["npcID"] = 0,
				},
				[1022] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Xiaodouding",
					["npcID"] = 0,
				},
				[298287] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "楊阳洋-鬼雾峰",
					["npcID"] = 0,
				},
				[298415] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "柠檬小脸-洛萨",
					["npcID"] = 0,
				},
				[294966] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "未知目标",
					["npcID"] = 0,
				},
				[300971] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "月天寒-远古海滩",
					["npcID"] = 0,
				},
				[23881] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "鱼白影青-冰风岗",
					["npcID"] = 0,
				},
				[33917] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "风起春城暮",
					["npcID"] = 0,
				},
				[768] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "尼奥洛鲨鱼-燃烧之刃",
					["npcID"] = 0,
				},
				[307870] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "十里扬州路",
					["npcID"] = 0,
				},
				[273238] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "十里扬州路",
					["npcID"] = 0,
				},
				[296492] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "虚空液球",
					["npcID"] = 152669,
				},
				[280149] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "戦父裂人",
					["npcID"] = 0,
				},
				[277462] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "风投爆破专家",
					["npcID"] = 139806,
				},
				[318219] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "十里扬州路",
					["npcID"] = 0,
				},
				[316814] = {
					["source"] = "渔舟晚-丽丽（四川）",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[271071] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "猫栗子-冰风岗",
					["npcID"] = 0,
				},
				[195072] = {
					["source"] = "大口罩-丽丽（四川）",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[299298] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "十里扬州路",
					["npcID"] = 0,
				},
				[80354] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "落星秋月-永恒之井",
					["npcID"] = 0,
				},
				[257408] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "猫大哈-索拉丁",
					["npcID"] = 0,
				},
				[138927] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "凉城旧梦丶-丽丽（四川）",
					["npcID"] = 0,
				},
				[201334] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "顺德者昌-丽丽（四川）",
					["npcID"] = 0,
				},
				[186258] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "芊山暮雪-雷斧堡垒",
					["npcID"] = 0,
				},
				[290372] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "低眉罂粟-勇士岛",
					["npcID"] = 0,
				},
				[257415] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "猥琐的脆皮-丽丽（四川）",
					["npcID"] = 0,
				},
				[199736] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "丶肉肉大魔王-丽丽（四川）",
					["npcID"] = 0,
				},
				[2580] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "风起春城暮",
					["npcID"] = 0,
				},
				[232698] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "鬼医三十八号-丽丽（四川）",
					["npcID"] = 0,
				},
				[248473] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "鹹濕牌士力架-萨尔",
					["npcID"] = 0,
				},
				[6673] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "鱼白影青-冰风岗",
					["npcID"] = 0,
				},
				[195457] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "丟丟粑粑-雷斧堡垒",
					["npcID"] = 0,
				},
				[190411] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "鱼白影青-冰风岗",
					["npcID"] = 0,
				},
				[196608] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "柏小逗-丽丽（四川）",
					["npcID"] = 0,
				},
				[171186] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "盐目斧喙鸟",
					["npcID"] = 130832,
				},
				[19514] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "碎地者特加",
					["npcID"] = 152200,
				},
				[264314] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "丶丷",
					["npcID"] = 0,
				},
				[299296] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "鬼医三十八号-丽丽（四川）",
					["npcID"] = 0,
				},
				[299318] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "余生残梦-基尔加丹",
					["npcID"] = 0,
				},
				[258822] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "补刀者云翼",
					["npcID"] = 140800,
				},
				[279902] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "猫栗子-冰风岗",
					["npcID"] = 0,
				},
				[226757] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "萝莉丶魔导师-海克泰尔",
					["npcID"] = 0,
				},
				[256459] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "主演-雷斧堡垒",
					["npcID"] = 0,
				},
				[214621] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "猫栗子-冰风岗",
					["npcID"] = 0,
				},
				[5487] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "风起春城暮",
					["npcID"] = 0,
				},
				[134522] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "王启繁-丽丽（四川）",
					["npcID"] = 0,
				},
				[315161] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Xiaodouding",
					["npcID"] = 0,
				},
				[228477] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "十里扬州路",
					["npcID"] = 0,
				},
				[115008] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "牛黑力法法-达隆米尔",
					["npcID"] = 0,
				},
				[186257] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "諾森德的雪-萨尔",
					["npcID"] = 0,
				},
				[299321] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "烟花易凉丶-丽丽（四川）",
					["npcID"] = 0,
				},
				[43308] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "詩雲丶-燃烧之刃",
					["npcID"] = 0,
				},
				[247454] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "十里扬州路",
					["npcID"] = 0,
				},
				[194310] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "坟头冒青烟-白银之手",
					["npcID"] = 0,
				},
				[781] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "伊丽娜丝-冬寒",
					["npcID"] = 0,
				},
				[311203] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "绝对心塞-伊莫塔尔",
					["npcID"] = 0,
				},
				[188370] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Xiaodouding",
					["npcID"] = 0,
				},
				[278244] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "爱如月光-丽丽（四川）",
					["npcID"] = 0,
				},
				[299323] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "擎雨盖-洛萨",
					["npcID"] = 0,
				},
				[298431] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "猫栗子-冰风岗",
					["npcID"] = 0,
				},
				[47540] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "猫栗子-冰风岗",
					["npcID"] = 0,
				},
				[309927] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "达芙妮丶-雷斧堡垒",
					["npcID"] = 0,
				},
				[299324] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "线芯-达文格尔",
					["npcID"] = 0,
				},
				[184092] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Xiaodouding",
					["npcID"] = 0,
				},
				[108366] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "天蝎座的爱-丽丽（四川）",
					["npcID"] = 0,
				},
				[270070] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "冷月-克尔苏加德",
					["npcID"] = 0,
				},
				[204596] = {
					["npcID"] = 0,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "十里扬州路",
					["encounterID"] = 2332,
				},
				[527] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "猫栗子-冰风岗",
					["npcID"] = 0,
				},
				[236645] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "水水-鬼雾峰",
					["npcID"] = 0,
				},
				[204021] = {
					["npcID"] = 0,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "十里扬州路",
					["encounterID"] = 2332,
				},
				[279397] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Xiaodouding",
					["npcID"] = 0,
				},
				[213858] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "鱼白影青-冰风岗",
					["npcID"] = 0,
				},
				[204213] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "猫栗子-冰风岗",
					["npcID"] = 0,
				},
				[271194] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "十里扬州路",
					["npcID"] = 0,
				},
				[259454] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "小拳拳锤你哦-丽丽（四川）",
					["npcID"] = 0,
				},
				[295367] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "十里扬州路",
					["npcID"] = 0,
				},
				[197561] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Xiaodouding",
					["npcID"] = 0,
				},
				[121557] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "买买太冲辣-雷斧堡垒",
					["npcID"] = 0,
				},
				[96231] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Xiaodouding",
					["npcID"] = 0,
				},
				[297412] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "猫栗子-冰风岗",
					["npcID"] = 0,
				},
				[270457] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "怨鳍侍从",
					["npcID"] = 138428,
				},
				[257422] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "插曲灬-丽丽（四川）",
					["npcID"] = 0,
				},
				[315681] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "婀娜-奥拉基尔",
					["npcID"] = 0,
				},
				[304056] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "猫栗子-冰风岗",
					["npcID"] = 0,
				},
				[257103] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "秋香专属-丽丽（四川）",
					["npcID"] = 0,
				},
				[262500] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "拉沙克·铁墙",
					["npcID"] = 133556,
				},
				[204598] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "十里扬州路",
					["npcID"] = 0,
				},
				[26573] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Xiaodouding",
					["npcID"] = 0,
				},
				[280385] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Xiaodouding",
					["npcID"] = 0,
				},
				[235450] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "鉴娚春-丽丽（四川）",
					["npcID"] = 0,
				},
				[202164] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "胡瓜碎颅杀丶-燃烧之刃",
					["npcID"] = 0,
				},
				[2645] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "春妮-埃德萨拉",
					["npcID"] = 0,
				},
				[270460] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "断岳者古鲁",
					["npcID"] = 140768,
				},
				[296138] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "三鹿氖-丽丽（四川）",
					["npcID"] = 0,
				},
				[312107] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "风起春城暮",
					["npcID"] = 0,
				},
				[185245] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "十里扬州路",
					["npcID"] = 0,
				},
				[274426] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "今生为爱狂-雷斧堡垒",
					["npcID"] = 0,
				},
				[2641] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "过河小卒迩-丽丽（四川）",
					["npcID"] = 0,
				},
				[288091] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "鱼白影青-冰风岗",
					["npcID"] = 0,
				},
				[270334] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "灰岩",
					["npcID"] = 135931,
				},
				[297034] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "兜兜德-鬼雾峰",
					["npcID"] = 0,
				},
				[297162] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "鱼白影青-冰风岗",
					["npcID"] = 0,
				},
				[298823] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "欧皇柯基-洛萨",
					["npcID"] = 0,
				},
				[311215] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "司马乄仲达-雷斧堡垒",
					["npcID"] = 0,
				},
				[227723] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "风起春城暮",
					["npcID"] = 0,
				},
				[278767] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "清风池水-基尔加丹",
					["npcID"] = 0,
				},
				[192081] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "风起春城暮",
					["npcID"] = 0,
				},
				[317859] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Xiaodouding",
					["npcID"] = 0,
				},
				[57724] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "小傻满-燃烧之刃",
					["npcID"] = 0,
				},
				[271103] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Xiaodouding",
					["npcID"] = 0,
				},
				[326419] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "蓝眉天使-死亡之翼",
					["npcID"] = 0,
				},
				[303041] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "丢你个柒黒-鬼雾峰",
					["npcID"] = 0,
				},
				[297037] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "未知目标",
					["npcID"] = 0,
				},
				[278769] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "十里扬州路",
					["npcID"] = 0,
				},
				[5308] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "鱼白影青-冰风岗",
					["npcID"] = 0,
				},
				[17] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "猫栗子-冰风岗",
					["npcID"] = 0,
				},
				[204843] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "十里扬州路",
					["npcID"] = 0,
				},
				[23768] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "塞格",
					["npcID"] = 14822,
				},
				[315179] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "四核强能-奥达曼",
					["npcID"] = 0,
				},
				[295378] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "夜幕下的瘋狂-格瑞姆巴托",
					["npcID"] = 0,
				},
				[297039] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "鱼白影青-冰风岗",
					["npcID"] = 0,
				},
				[298700] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "风的姿态-迦顿",
					["npcID"] = 0,
				},
				[257420] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "你偷偷地-洛萨",
					["npcID"] = 0,
				},
				[270058] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "低眉罂粟-勇士岛",
					["npcID"] = 0,
				},
				[297040] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "鬼医三十八号-丽丽（四川）",
					["npcID"] = 0,
				},
				[297168] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "鱼白影青-冰风岗",
					["npcID"] = 0,
				},
				[298829] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "未知目标",
					["npcID"] = 152200,
				},
				[265742] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "小傻满-燃烧之刃",
					["npcID"] = 0,
				},
				[104282] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "估计孤寂-丽丽（四川）",
					["npcID"] = 0,
				},
				[299312] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "鬼魅魔王-萨尔",
					["npcID"] = 0,
				},
				[124275] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "清风池水-基尔加丹",
					["npcID"] = 0,
				},
				[298703] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "蛋糕好好吃-国王之谷",
					["npcID"] = 0,
				},
				[208628] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "錵灬-鬼雾峰",
					["npcID"] = 0,
				},
				[314033] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "克熙尔唤虚者",
					["npcID"] = 161815,
				},
				[194384] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "猫栗子-冰风岗",
					["npcID"] = 0,
				},
				[204157] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "十里扬州路",
					["npcID"] = 0,
				},
				[235313] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "启程狂想-燃烧之刃",
					["npcID"] = 0,
				},
				[53595] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Xiaodouding",
					["npcID"] = 0,
				},
				[102558] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "风起春城暮",
					["npcID"] = 0,
				},
				[291295] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "十里扬州路",
					["npcID"] = 0,
				},
				[212653] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "灰烬冰霜-丽丽（四川）",
					["npcID"] = 0,
				},
				[24450] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "未知目标",
					["npcID"] = 42718,
				},
				[308742] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "倒影流年-丽丽（四川）",
					["npcID"] = 0,
				},
				[220510] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "苔原-埃克索图斯",
					["npcID"] = 0,
				},
				[164812] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "风起春城暮",
					["npcID"] = 0,
				},
				[165961] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "风起春城暮",
					["npcID"] = 0,
				},
				[93985] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "风起春城暮",
					["npcID"] = 0,
				},
				[198793] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "猫咪爱吃鱼-丽丽（四川）",
					["npcID"] = 0,
				},
				[3714] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "锋釰-奥达曼",
					["npcID"] = 0,
				},
				[300693] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "猫栗子-冰风岗",
					["npcID"] = 0,
				},
				[297302] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "无尽饥饿图腾",
					["npcID"] = 153141,
				},
				[297941] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "心胸似海-克尔苏加德",
					["npcID"] = 0,
				},
				[297035] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "低眉罂粟-勇士岛",
					["npcID"] = 0,
				},
				[298197] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "风起春城暮",
					["npcID"] = 0,
				},
				[298836] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "詩雲丶-燃烧之刃",
					["npcID"] = 0,
				},
				[109132] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "熊猫幂幂-达文格尔",
					["npcID"] = 0,
				},
				[295248] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "夏夜的寒风-血牙魔王",
					["npcID"] = 0,
				},
				[52174] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "胡瓜碎颅杀丶-燃烧之刃",
					["npcID"] = 0,
				},
				[298837] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "皮皮猫丶-丽丽（四川）",
					["npcID"] = 0,
				},
				[260881] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "春妮-埃德萨拉",
					["npcID"] = 0,
				},
				[106839] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "风起春城暮",
					["npcID"] = 0,
				},
				[298839] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "寄流年-丽丽（四川）",
					["npcID"] = 0,
				},
				[242551] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "肉串-丽丽（四川）",
					["npcID"] = 0,
				},
				[319919] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "迦罗娜的大牛-丽丽（四川）",
					["npcID"] = 0,
				},
				[281209] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "安心的小猫咪-国王之谷",
					["npcID"] = 0,
				},
				[221886] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "二顺的萨满-黑翼之巢",
					["npcID"] = 0,
				},
				[243955] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "无头騎士-血牙魔王",
					["npcID"] = 0,
				},
				[255070] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "主演-雷斧堡垒",
					["npcID"] = 0,
				},
				[285811] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "塔利·萨普纳波",
					["npcID"] = 133627,
				},
				[77489] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "那妞真靓-自由之风",
					["npcID"] = 0,
				},
				[275779] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Xiaodouding",
					["npcID"] = 0,
				},
				[262687] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "炸弹机器人9000型",
					["npcID"] = 133660,
				},
				[284277] = {
					["source"] = "渔舟晚-丽丽（四川）",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[297822] = {
					["npcID"] = 152089,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "萨尔",
					["encounterID"] = 2332,
				},
				[298841] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Xiaodouding",
					["npcID"] = 0,
				},
				[139] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "那妞真靓-自由之风",
					["npcID"] = 0,
				},
				[31884] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Xiaodouding",
					["npcID"] = 0,
				},
				[295137] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Xiaodouding",
					["npcID"] = 0,
				},
				[192090] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "风起春城暮",
					["npcID"] = 0,
				},
				[267288] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "大地之环萨满",
					["npcID"] = 135671,
				},
				[183752] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "十里扬州路",
					["npcID"] = 0,
				},
				[217832] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "十里扬州路",
					["npcID"] = 0,
				},
				[315195] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "十里扬州路",
					["npcID"] = 0,
				},
				[556] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "龟钢片-勇士岛",
					["npcID"] = 0,
				},
				[313918] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "风雷怒暴-萨格拉斯",
					["npcID"] = 0,
				},
				[184362] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "鱼白影青-冰风岗",
					["npcID"] = 0,
				},
				[313663] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "萝莉丶魔导师-海克泰尔",
					["npcID"] = 0,
				},
				[263642] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "十里扬州路",
					["npcID"] = 0,
				},
				[264352] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "鉴娚春-丽丽（四川）",
					["npcID"] = 0,
				},
				[12472] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "夏夜的寒风-血牙魔王",
					["npcID"] = 0,
				},
				[311216] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "那妞真靓-自由之风",
					["npcID"] = 0,
				},
				[318391] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "彼岸巨虫",
					["npcID"] = 152550,
				},
				[24858] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "镹伍贰柒-丽丽（四川）",
					["npcID"] = 0,
				},
				[259161] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "哎呀取啥名-丽丽（四川）",
					["npcID"] = 0,
				},
				[288882] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "十里扬州路",
					["npcID"] = 0,
				},
				[131347] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "万物咸覩-凤凰之神",
					["npcID"] = 0,
				},
				[268953] = {
					["type"] = "BUFF",
					["source"] = "十里扬州路",
					["npcID"] = 0,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 2332,
				},
				[268954] = {
					["type"] = "BUFF",
					["source"] = "十里扬州路",
					["npcID"] = 0,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 2332,
				},
				[33907] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "布罗尔·熊皮",
					["npcID"] = 142294,
				},
				[203975] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "风起春城暮",
					["npcID"] = 0,
				},
				[45181] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "诺提雷斯-雷斧堡垒",
					["npcID"] = 0,
				},
				[192225] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "恶魔猎杀-冬寒",
					["npcID"] = 0,
				},
				[273298] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "柏小逗-丽丽（四川）",
					["npcID"] = 0,
				},
				[318187] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "鱼白影青-冰风岗",
					["npcID"] = 0,
				},
				[268955] = {
					["type"] = "BUFF",
					["source"] = "十里扬州路",
					["npcID"] = 0,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 2332,
				},
				[289523] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "灰烬冰霜-丽丽（四川）",
					["npcID"] = 0,
				},
				[300893] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "风起春城暮",
					["npcID"] = 0,
				},
				[156132] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "絮雪-丽丽（四川）",
					["npcID"] = 0,
				},
				[268956] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "十里扬州路",
					["npcID"] = 0,
				},
				[268062] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "风起春城暮",
					["npcID"] = 0,
				},
				[307026] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "爱上夜生活-自由之风",
					["npcID"] = 0,
				},
				[273428] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Mowang-鬼雾峰",
					["npcID"] = 0,
				},
				[292463] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "鱼白影青-冰风岗",
					["npcID"] = 0,
				},
				[298601] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "茉娅缇-萨尔",
					["npcID"] = 0,
				},
				[286587] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "柏小逗-丽丽（四川）",
					["npcID"] = 0,
				},
				[207744] = {
					["type"] = "DEBUFF",
					["source"] = "十里扬州路",
					["npcID"] = 0,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 2332,
				},
				[203720] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "十里扬州路",
					["npcID"] = 0,
				},
				[245686] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "剃刀小哥-奥拉基尔",
					["npcID"] = 0,
				},
				[269214] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "风起春城暮",
					["npcID"] = 0,
				},
				[12042] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "大表哥灬大海-萨尔",
					["npcID"] = 0,
				},
				[304606] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "乄西风",
					["npcID"] = 0,
				},
				[72968] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "阿嬭托莉娅-丽丽（四川）",
					["npcID"] = 0,
				},
				[44544] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "夏夜的寒风-血牙魔王",
					["npcID"] = 0,
				},
				[274753] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "怨鳍投叉手",
					["npcID"] = 138427,
				},
				[271559] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "风起春城暮",
					["npcID"] = 0,
				},
				[305369] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "虚缚荣誉卫兵",
					["npcID"] = 156406,
				},
				[298343] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Xiaodouding",
					["npcID"] = 0,
				},
				[207684] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "十里扬州路",
					["npcID"] = 0,
				},
				[121536] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "买买太冲辣-雷斧堡垒",
					["npcID"] = 0,
				},
				[303837] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "兴玲-雷斧堡垒",
					["npcID"] = 0,
				},
				[277904] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "玛蒂达尔-国王之谷",
					["npcID"] = 0,
				},
				[213771] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "风起春城暮",
					["npcID"] = 0,
				},
				[280204] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "鱼白影青-冰风岗",
					["npcID"] = 0,
				},
				[221883] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "月半方知-奥达曼",
					["npcID"] = 0,
				},
				[267685] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "夏夜的寒风-血牙魔王",
					["npcID"] = 0,
				},
				[40120] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "风起春城暮",
					["npcID"] = 0,
				},
				[280205] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "龟钢片-勇士岛",
					["npcID"] = 0,
				},
				[267558] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "浅夏初晴-丽丽（四川）",
					["npcID"] = 0,
				},
				[256739] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Ariel-勇士岛",
					["npcID"] = 0,
				},
				[274968] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "机械警戒犬",
					["npcID"] = 139805,
				},
				[317420] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "风舞凌云-基尔加丹",
					["npcID"] = 0,
				},
				[298606] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "壹叁伍柒玖-索拉丁",
					["npcID"] = 0,
				},
				[93622] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "风起春城暮",
					["npcID"] = 0,
				},
				[289277] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "解忧水果铺-利刃之拳",
					["npcID"] = 0,
				},
				[193759] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "萨菲罗丝-雷斧堡垒",
					["npcID"] = 0,
				},
				[267560] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "浅夏初晴-丽丽（四川）",
					["npcID"] = 0,
				},
				[316744] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "拉你垫背-雷霆之王",
					["npcID"] = 0,
				},
				[308189] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "锦丨鲤-格瑞姆巴托",
					["npcID"] = 0,
				},
				[298604] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "恶魔福缘-丽丽（四川）",
					["npcID"] = 0,
				},
				[222695] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "马里奥扬-萨尔",
					["npcID"] = 0,
				},
				[83244] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "过河小卒迩-丽丽（四川）",
					["npcID"] = 0,
				},
				[294935] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "寒光竹影-血色十字军",
					["npcID"] = 0,
				},
				[298605] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "花寒凛-丽丽（四川）",
					["npcID"] = 0,
				},
				[303345] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "十里扬州路",
					["npcID"] = 0,
				},
				[207685] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "十里扬州路",
					["npcID"] = 0,
				},
				[312794] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "茉莉清丶龙龙-奥拉基尔",
					["npcID"] = 0,
				},
				[223143] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "线芯-达文格尔",
					["npcID"] = 0,
				},
				[285959] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "叮当喵-洛萨",
					["npcID"] = 0,
				},
				[154797] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "迪菲亚之心-普罗德摩",
					["npcID"] = 0,
				},
				[304611] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "乄西风",
					["npcID"] = 0,
				},
				[312915] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "风雷怒暴-萨格拉斯",
					["npcID"] = 0,
				},
				[305378] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "虚缚荣誉卫兵",
					["npcID"] = 156406,
				},
				[279956] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "坟头冒青烟-白银之手",
					["npcID"] = 0,
				},
				[208772] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "猫栗子-冰风岗",
					["npcID"] = 0,
				},
				[215479] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "叮当喵-洛萨",
					["npcID"] = 0,
				},
				[48265] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "戦父裂人",
					["npcID"] = 0,
				},
				[270248] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "燃烬卫士",
					["npcID"] = 135893,
				},
				[297970] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "小汤包-洛萨",
					["npcID"] = 0,
				},
				[298609] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "伊丽娜丝-冬寒",
					["npcID"] = 0,
				},
				[85288] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "鱼白影青-冰风岗",
					["npcID"] = 0,
				},
				[21562] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "猫栗子-冰风岗",
					["npcID"] = 0,
				},
				[300526] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "未知目标",
					["npcID"] = 154524,
				},
				[285835] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "拉沙克·铁墙",
					["npcID"] = 133556,
				},
				[156779] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "黑橙蓝绿紫-雷斧堡垒",
					["npcID"] = 0,
				},
				[65081] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "戏迷-鬼雾峰",
					["npcID"] = 0,
				},
				[203539] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "烈楓-永恒之井",
					["npcID"] = 0,
				},
				[285836] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "艾泽里特提取器",
					["npcID"] = 147188,
				},
				[270661] = {
					["source"] = "天蝎座的爱-丽丽（四川）",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[228128] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "封印小氼-丽丽（四川）",
					["npcID"] = 0,
				},
				[271401] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "补刀者云翼",
					["npcID"] = 140800,
				},
				[285837] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "艾泽里特提取器",
					["npcID"] = 147188,
				},
				[272940] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "寒光竹影-血色十字军",
					["npcID"] = 0,
				},
				[101545] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "封印痴狂-基尔加丹",
					["npcID"] = 0,
				},
				[312793] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "奥蕾丽亚-雷斧堡垒",
					["npcID"] = 0,
				},
				[210320] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "拉你垫背-雷霆之王",
					["npcID"] = 0,
				},
				[203795] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "十里扬州路",
					["npcID"] = 0,
				},
				[212799] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "鉴娚春-丽丽（四川）",
					["npcID"] = 0,
				},
				[299508] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "丷小瓢蟲灬-丽丽（四川）",
					["npcID"] = 0,
				},
				[281240] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "恩利尔-丽丽（四川）",
					["npcID"] = 0,
				},
				[268856] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "鱼白影青-冰风岗",
					["npcID"] = 0,
				},
				[192106] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "小傻满-燃烧之刃",
					["npcID"] = 0,
				},
				[264761] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "慕容紫月-奥拉基尔",
					["npcID"] = 0,
				},
				[292359] = {
					["source"] = "渔舟晚-丽丽（四川）",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[16979] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "风起春城暮",
					["npcID"] = 0,
				},
				[156079] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "小猪妞-艾欧娜尔",
					["npcID"] = 0,
				},
				[167385] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "地下城训练假人",
					["npcID"] = 144078,
				},
				[275110] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "补刀者云翼",
					["npcID"] = 140800,
				},
				[258920] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "鸦眼-丽丽（四川）",
					["npcID"] = 0,
				},
				[118922] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "伊丽娜丝-冬寒",
					["npcID"] = 0,
				},
				[585] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "猫栗子-冰风岗",
					["npcID"] = 0,
				},
				[25771] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Xiaodouding",
					["npcID"] = 0,
				},
				[303344] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Xiaodouding",
					["npcID"] = 0,
				},
				[288146] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "冷月-克尔苏加德",
					["npcID"] = 0,
				},
				[264764] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "慕容紫月-奥拉基尔",
					["npcID"] = 0,
				},
				[298618] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "牛黑力法法-达隆米尔",
					["npcID"] = 0,
				},
				[6201] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "尼古拉斯赵士-索拉丁",
					["npcID"] = 0,
				},
				[260069] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "贡克祭司",
					["npcID"] = 131809,
				},
				[143625] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "詩雲丶-燃烧之刃",
					["npcID"] = 0,
				},
				[31935] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Xiaodouding",
					["npcID"] = 0,
				},
				[292362] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "万般皆下品-红龙军团",
					["npcID"] = 0,
				},
				[115313] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "迦罗娜的大牛-丽丽（四川）",
					["npcID"] = 0,
				},
				[167898] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "猫栗子-冰风岗",
					["npcID"] = 0,
				},
				[270515] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "自由的艾泽里特",
					["npcID"] = 131311,
				},
				[231390] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "狐乱射丶-无尽之海",
					["npcID"] = 0,
				},
				[260070] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "帕库拉祭司",
					["npcID"] = 131834,
				},
				[292361] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "鱼白影青-冰风岗",
					["npcID"] = 0,
				},
				[312677] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "克熙尔唤虚者",
					["npcID"] = 161815,
				},
				[1459] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "蓝眉天使-死亡之翼",
					["npcID"] = 0,
				},
				[269239] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Xiaodouding",
					["npcID"] = 0,
				},
				[299516] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "柠檬小脸-洛萨",
					["npcID"] = 0,
				},
				[270657] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "十里扬州路",
					["npcID"] = 0,
				},
				[297220] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "虚缚萨满祭司",
					["npcID"] = 153097,
				},
				[108446] = {
					["source"] = "利恩阿沙克",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 17252,
				},
				[328136] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Xiaodouding",
					["npcID"] = 0,
				},
				[5217] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "今生为爱狂-雷斧堡垒",
					["npcID"] = 0,
				},
				[288158] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "丿樱灬舞-雷斧堡垒",
					["npcID"] = 0,
				},
				[190831] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Forvoljin-丽丽（四川）",
					["npcID"] = 0,
				},
				[202137] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "十里扬州路",
					["npcID"] = 0,
				},
				[5225] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "今生为爱狂-雷斧堡垒",
					["npcID"] = 0,
				},
				[313571] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "猫栗子-冰风岗",
					["npcID"] = 0,
				},
				[260072] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "帕库拉祭司",
					["npcID"] = 131834,
				},
				[85739] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "鱼白影青-冰风岗",
					["npcID"] = 0,
				},
				[31687] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "娜塔利-奥达曼",
					["npcID"] = 0,
				},
				[8921] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "风起春城暮",
					["npcID"] = 0,
				},
				[273842] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "买买太冲辣-雷斧堡垒",
					["npcID"] = 0,
				},
				[202138] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "十里扬州路",
					["npcID"] = 0,
				},
				[294027] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Xiaodouding",
					["npcID"] = 0,
				},
				[285979] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "寒光竹影-血色十字军",
					["npcID"] = 0,
				},
				[312679] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "克熙尔唤虚者",
					["npcID"] = 161815,
				},
				[278954] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Xiaodouding",
					["npcID"] = 0,
				},
				[264774] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "鉴娚春-丽丽（四川）",
					["npcID"] = 0,
				},
				[131493] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "阿森西奥-达文格尔",
					["npcID"] = 0,
				},
				[316768] = {
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[6788] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "猫栗子-冰风岗",
					["npcID"] = 0,
				},
				[300989] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "明月笃心-萨尔",
					["npcID"] = 0,
				},
				[285981] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "雪月风花丶丶",
					["npcID"] = 0,
				},
				[254474] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "无头騎士-血牙魔王",
					["npcID"] = 0,
				},
				[11426] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "夏夜的寒风-血牙魔王",
					["npcID"] = 0,
				},
				[298419] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "尤物丶-奥拉基尔",
					["npcID"] = 0,
				},
				[295310] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "鱼白影青-冰风岗",
					["npcID"] = 0,
				},
				[2383] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "风起春城暮",
					["npcID"] = 0,
				},
				[299511] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "戏迷-鬼雾峰",
					["npcID"] = 0,
				},
				[203981] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "十里扬州路",
					["npcID"] = 0,
				},
				[3408] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "真的汉子-克尔苏加德",
					["npcID"] = 0,
				},
				[253595] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "赏金骑士-鬼雾峰",
					["npcID"] = 0,
				},
				[167381] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "地下城训练假人",
					["npcID"] = 144078,
				},
				[300802] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "风起春城暮",
					["npcID"] = 0,
				},
				[280177] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "水水-鬼雾峰",
					["npcID"] = 0,
				},
				[96312] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "战神楚留香-雷斧堡垒",
					["npcID"] = 0,
				},
				[252216] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "鸟树熊猫德-丽丽（四川）",
					["npcID"] = 0,
				},
				[67833] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "赏金骑士-鬼雾峰",
					["npcID"] = 0,
				},
				[251836] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "花落乄叶相随-丽丽（四川）",
					["npcID"] = 0,
				},
				[262607] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "塔利·萨普纳波",
					["npcID"] = 133627,
				},
				[44212] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "人死如灯灭-丽丽（四川）",
					["npcID"] = 0,
				},
				[249984] = {
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[287769] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[260843] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "贾登·弗拉",
					["npcID"] = 122704,
				},
				[316767] = {
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[312678] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "十里扬州路",
					["npcID"] = 0,
				},
				[251837] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "拉你垫背-雷霆之王",
					["npcID"] = 0,
				},
				[312687] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "无面毁伤者",
					["npcID"] = 161812,
				},
				[285978] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "詩雲丶-燃烧之刃",
					["npcID"] = 0,
				},
				[12654] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "萝莉丶魔导师-海克泰尔",
					["npcID"] = 0,
				},
				[317020] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "丶肉肉大魔王-丽丽（四川）",
					["npcID"] = 0,
				},
				[281517] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "猫栗子-冰风岗",
					["npcID"] = 0,
				},
				[289298] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "十里扬州路",
					["npcID"] = 0,
				},
				[69070] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "奇奇跳跳糖-鬼雾峰",
					["npcID"] = 0,
				},
				[285719] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "王根基-熊猫酒仙",
					["npcID"] = 0,
				},
				[53600] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Xiaodouding",
					["npcID"] = 0,
				},
				[1719] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "鱼白影青-冰风岗",
					["npcID"] = 0,
				},
				[316522] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Xiaodouding",
					["npcID"] = 0,
				},
				[300809] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "风起春城暮",
					["npcID"] = 0,
				},
				[187827] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "十里扬州路",
					["npcID"] = 0,
				},
				[119085] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "牛黑力法法-达隆米尔",
					["npcID"] = 0,
				},
				[278559] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "狠人是我-达文格尔",
					["npcID"] = 0,
				},
				[77758] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "风起春城暮",
					["npcID"] = 0,
				},
				[203538] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "烈楓-永恒之井",
					["npcID"] = 0,
				},
				[264760] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "丢丢麻麻-雷斧堡垒",
					["npcID"] = 0,
				},
				[268854] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "鱼白影青-冰风岗",
					["npcID"] = 0,
				},
				[148540] = {
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[2823] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "真的汉子-克尔苏加德",
					["npcID"] = 0,
				},
				[287270] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Deam-萨尔",
					["npcID"] = 0,
				},
				[251839] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Evilcjknight-死亡之翼",
					["npcID"] = 0,
				},
				[297746] = {
					["npcID"] = 152089,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "萨尔",
					["encounterID"] = 2332,
				},
				[270246] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "火元素",
					["npcID"] = 135894,
				},
				[289315] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "风起春城暮",
					["npcID"] = 0,
				},
				[313971] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "深渊之嗣",
					["npcID"] = 161273,
				},
				[118000] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "鱼白影青-冰风岗",
					["npcID"] = 0,
				},
				[127230] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "圣埃米克劳斯-鬼雾峰",
					["npcID"] = 0,
				},
				[298512] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "梅塞施密特-熊猫酒仙",
					["npcID"] = 0,
				},
				[299664] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "花落乄叶相随-丽丽（四川）",
					["npcID"] = 0,
				},
				[297237] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "虚缚萨满祭司",
					["npcID"] = 153097,
				},
				[204490] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "十里扬州路",
					["npcID"] = 0,
				},
				[8690] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Cirillaa-雷斧堡垒",
					["npcID"] = 0,
				},
				[270241] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "燃烬卫士",
					["npcID"] = 135893,
				},
				[302348] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "为啥我爱小月-鬼雾峰",
					["npcID"] = 0,
				},
				[184367] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "鱼白影青-冰风岗",
					["npcID"] = 0,
				},
				[279606] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "未知目标",
					["npcID"] = 26125,
				},
				[204255] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "十里扬州路",
					["npcID"] = 0,
				},
				[57723] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "花落乄叶相随-丽丽（四川）",
					["npcID"] = 0,
				},
				[193753] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "半生轻狂客-萨尔",
					["npcID"] = 0,
				},
				[311214] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "夏夜的寒风-血牙魔王",
					["npcID"] = 0,
				},
				[223929] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "坟头冒青烟-白银之手",
					["npcID"] = 0,
				},
				[284275] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Opal-勇士岛",
					["npcID"] = 0,
				},
				[270285] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "灰岩",
					["npcID"] = 135931,
				},
				[299540] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "买买太冲辣-雷斧堡垒",
					["npcID"] = 0,
				},
				[176151] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "神棍大叔-丽丽（四川）",
					["npcID"] = 0,
				},
				[293664] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "买买太冲辣-雷斧堡垒",
					["npcID"] = 0,
				},
				[178740] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "十里扬州路",
					["npcID"] = 0,
				},
				[299541] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "楊阳洋-鬼雾峰",
					["npcID"] = 0,
				},
				[94719] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "德爷德啦-鬼雾峰",
					["npcID"] = 0,
				},
				[90328] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "未知目标",
					["npcID"] = 151096,
				},
				[287916] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "暗淡的遗忘-雷斧堡垒",
					["npcID"] = 0,
				},
				[45334] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "风起春城暮",
					["npcID"] = 0,
				},
				[224186] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "剩光守护-鬼雾峰",
					["npcID"] = 0,
				},
				[281402] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "元素活着-萨尔",
					["npcID"] = 0,
				},
				[275909] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "风起春城暮",
					["npcID"] = 0,
				},
				[287790] = {
					["source"] = "渔舟晚-丽丽（四川）",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[221887] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "奥蕾丽亚-雷斧堡垒",
					["npcID"] = 0,
				},
				[281403] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "魅乄舞-雷斧堡垒",
					["npcID"] = 0,
				},
				[317301] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "克熙尔唤虚者",
					["npcID"] = 161815,
				},
				[289324] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "子曰不要学我-鬼雾峰",
					["npcID"] = 0,
				},
				[1490] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "十里扬州路",
					["npcID"] = 0,
				},
				[68992] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "估计孤寂-丽丽（四川）",
					["npcID"] = 0,
				},
				[287280] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Lastlyze-影之哀伤",
					["npcID"] = 0,
				},
				[108211] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "暴走的鲁鲁-雷斧堡垒",
					["npcID"] = 0,
				},
				[1850] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "茉莉清丶龙龙-奥拉基尔",
					["npcID"] = 0,
				},
				[102417] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "恩利尔-丽丽（四川）",
					["npcID"] = 0,
				},
				[263648] = {
					["type"] = "BUFF",
					["source"] = "十里扬州路",
					["npcID"] = 0,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 2332,
				},
				[2983] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Anicus-雷斧堡垒",
					["npcID"] = 0,
				},
				[268905] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "鱼白影青-冰风岗",
					["npcID"] = 0,
				},
				[203812] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "散华神乐-索拉丁",
					["npcID"] = 0,
				},
				[295842] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "风起春城暮",
					["npcID"] = 0,
				},
				[272126] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Twjshu-丽丽（四川）",
					["npcID"] = 0,
				},
				[311217] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "明月笃心-萨尔",
					["npcID"] = 0,
				},
				[303380] = {
					["type"] = "BUFF",
					["source"] = "十里扬州路",
					["npcID"] = 0,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 2332,
				},
				[313088] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "司马乄仲达-雷斧堡垒",
					["npcID"] = 0,
				},
				[315176] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Xiaodouding",
					["npcID"] = 0,
				},
				[286171] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Evilcjknight-死亡之翼",
					["npcID"] = 0,
				},
				[287062] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "柏小逗-丽丽（四川）",
					["npcID"] = 0,
				},
				[203819] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "十里扬州路",
					["npcID"] = 0,
				},
				[87024] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "殇丨断魂-洛萨",
					["npcID"] = 0,
				},
				[783] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "风起春城暮",
					["npcID"] = 0,
				},
				[247456] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "十里扬州路",
					["npcID"] = 0,
				},
				[296003] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "我是哀木涕-鬼雾峰",
					["npcID"] = 0,
				},
				[204197] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "猫栗子-冰风岗",
					["npcID"] = 0,
				},
				[8220] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "未知目标",
					["npcID"] = 0,
				},
				[203814] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "陈丶冰镇阔落-埃克索图斯",
					["npcID"] = 0,
				},
				[296510] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "蠕行腐蚀",
					["npcID"] = 152704,
				},
				[272979] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Xiaodouding",
					["npcID"] = 0,
				},
				[280772] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "鱼白影青-冰风岗",
					["npcID"] = 0,
				},
				[190784] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "无头騎士-血牙魔王",
					["npcID"] = 0,
				},
				[290121] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "丶丷",
					["npcID"] = 0,
				},
				[126755] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "圣光的师姐-洛萨",
					["npcID"] = 0,
				},
				[280773] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "鱼白影青-冰风岗",
					["npcID"] = 0,
				},
				[68054] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "基维斯",
					["npcID"] = 35642,
				},
				[280412] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "风起春城暮",
					["npcID"] = 0,
				},
				[132403] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Xiaodouding",
					["npcID"] = 0,
				},
				[198837] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "复生的潜伏者",
					["npcID"] = 99541,
				},
				[281413] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "丿大美妞-达文格尔",
					["npcID"] = 0,
				},
				[202602] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "战吊护你一生-格瑞姆巴托",
					["npcID"] = 0,
				},
				[129250] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "猫栗子-冰风岗",
					["npcID"] = 0,
				},
				[305946] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "战神楚留香-雷斧堡垒",
					["npcID"] = 0,
				},
				[32216] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "擎雨盖-洛萨",
					["npcID"] = 0,
				},
				[316801] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Xiaodouding",
					["npcID"] = 0,
				},
				[311308] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "你偷偷地-洛萨",
					["npcID"] = 0,
				},
				[280776] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "鱼白影青-冰风岗",
					["npcID"] = 0,
				},
				[312845] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "克熙尔刺客",
					["npcID"] = 161813,
				},
				[69046] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "元素大腿粗-萨尔",
					["npcID"] = 0,
				},
			},
			["resources"] = {
				["y_offset_target"] = 17.79999542236328,
				["y_offset_target_withauras"] = 36,
			},
			["aura_timer_text_font"] = "Accidental Presidency",
			["extra_icon_auras"] = {
				277242, -- [1]
			},
			["castbar_target_font"] = "Accidental Presidency",
			["OptionsPanelDB"] = {
				["PlaterOptionsPanelFrame"] = {
					["scale"] = 1,
				},
			},
			["semver"] = "1.0.2",
			["range_check_alpha"] = 0.5,
			["aura_tracker"] = {
				["buff_tracked"] = {
					["209859"] = true,
				},
				["buff_banned"] = {
					["206150"] = true,
					["61574"] = true,
					["61573"] = true,
				},
			},
			["transparency_behavior_use_division"] = true,
			["aura_stack_font"] = "Accidental Presidency",
			["patch_version"] = 9,
			["aura_timer_text_size"] = 10,
			["healthbar_framelevel"] = 0,
			["cast_statusbar_texture"] = "PlaterTexture",
			["no_spellname_length_limit"] = true,
			["health_selection_overlay_alpha"] = 0.099999994039535,
			["saved_cvars"] = {
				["ShowClassColorInNameplate"] = "1",
				["nameplateOverlapV"] = "1.1",
				["ShowNamePlateLoseAggroFlash"] = "1",
				["nameplateShowEnemyMinus"] = "1",
				["nameplatePersonalShowAlways"] = "0",
				["nameplateMotionSpeed"] = "0.05",
				["nameplateShowSelf"] = "0",
				["nameplateGlobalScale"] = "1.0",
				["nameplatePersonalHideDelaySeconds"] = "0.2",
				["nameplateShowFriendlyPets"] = "0",
				["nameplateShowFriendlyNPCs"] = "0",
				["nameplateSelectedScale"] = "1.15",
				["nameplatePersonalShowInCombat"] = "1",
				["nameplatePersonalShowWithTarget"] = "0",
				["nameplateShowFriendlyTotems"] = "0",
				["nameplateMinScale"] = "1",
				["nameplateResourceOnTarget"] = "0",
				["nameplateMotion"] = "0",
				["nameplateSelfAlpha"] = "0.75",
				["nameplateShowAll"] = "1",
				["nameplateMaxDistance"] = "100",
				["nameplateOtherTopInset"] = "0.085",
				["nameplateSelfScale"] = "1.0",
				["nameplateSelfBottomInset"] = "0.2",
				["NamePlateHorizontalScale"] = "1",
				["nameplateShowFriendlyGuardians"] = "0",
				["nameplateOccludedAlphaMult"] = "1",
				["nameplateShowFriendlyMinions"] = "0",
				["nameplateSelfTopInset"] = "0.5",
				["nameplateShowEnemyMinions"] = "1",
				["NamePlateVerticalScale"] = "1",
			},
			["cast_statusbar_spark_width"] = 32,
			["show_health_prediction"] = false,
		},
	},
}
