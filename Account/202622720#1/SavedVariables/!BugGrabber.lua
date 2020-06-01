
BugGrabberDB = {
	["lastSanitation"] = 3,
	["session"] = 3,
	["errors"] = {
		{
			["message"] = "Interface\\AddOns\\ExplorerCoords\\ExplorerCoords-1.7.11.lua:147: table index is nil",
			["time"] = "2020/05/16 11:14:48",
			["locals"] = "(for generator) = <function> defined =[C]:-1\n(for state) = <table> {\n 8935 = <table> {\n }\n 43 = <table> {\n }\n 4868 = <table> {\n }\n 6974 = <table> {\n }\n 45 = <table> {\n }\n 44 = <table> {\n }\n 42 = <table> {\n }\n 11188 = <table> {\n }\n 12988 = <table> {\n }\n}\n(for control) = 8935\nindex = 8935\nvalue = <table> {\n 8941 = <table> {\n }\n 8938 = <table> {\n }\n 8942 = <table> {\n }\n 8939 = <table> {\n }\n 8940 = <table> {\n }\n 8937 = <table> {\n }\n}\n(for generator) = <function> defined =[C]:-1\n(for state) = <table> {\n 8941 = <table> {\n }\n 8938 = <table> {\n }\n 8942 = <table> {\n }\n 8939 = <table> {\n }\n 8940 = <table> {\n }\n 8937 = <table> {\n }\n}\n(for control) = 8941\nindex2 = 8941\nvalue2 = <table> {\n 3652 = <table> {\n }\n 3654 = <table> {\n }\n 3656 = <table> {\n }\n 3658 = <table> {\n }\n 3660 = <table> {\n }\n 3662 = <table> {\n }\n 3664 = <table> {\n }\n 3666 = <table> {\n }\n 3668 = <table> {\n }\n 3653 = <table> {\n }\n 3655 = <table> {\n }\n 3657 = <table> {\n }\n 3659 = <table> {\n }\n 3661 = <table> {\n }\n 3663 = <table> {\n }\n 3665 = <table> {\n }\n 3667 = <table> {\n }\n}\n(for generator) = <function> defined =[C]:-1\n(for state) = <table> {\n 3652 = <table> {\n }\n 3654 = <table> {\n }\n 3656 = <table> {\n }\n 3658 = <table> {\n }\n 3660 = <table> {\n }\n 3662 = <table> {\n }\n 3664 = <table> {\n }\n 3666 = <table> {\n }\n 3668 = <table> {\n }\n 3653 = <table> {\n }\n 3655 = <table> {\n }\n 3657 = <table> {\n }\n 3659 = <table> {\n }\n 3661 = <table> {\n }\n 3663 = <table> {\n }\n 3665 = <table> {\n }\n 3667 = <table> {\n }\n}\n(for control) = 3652\nindex3 = 3652\nvalue3 = <table> {\n y = 0.276078\n x = 0.445618\n}\n(*temporary) = <table> {\n catid = 8941\n}\n(*temporary) = nil\n(*temporary) = <table> {\n}\n(*temporary) = 0\n(*temporary) = \"table index is nil\"\n",
			["stack"] = "[string \"@Interface\\AddOns\\ExplorerCoords\\ExplorerCoords-1.7.11.lua\"]:147: in function `ExplorerCoords_Init'\n[string \"@Interface\\AddOns\\ExplorerCoords\\ExplorerCoords-1.7.11.lua\"]:324: in function `ExplorerCoords_OnEvent'\n[string \"*:OnEvent\"]:1: in function <[string \"*:OnEvent\"]:1>",
			["session"] = 3,
			["counter"] = 2,
		}, -- [1]
		{
			["message"] = "Interface\\AddOns\\ExplorerCoords\\ExplorerCoords-1.7.11.lua:334: attempt to index global 'ExplorerCoords_Config' (a nil value)",
			["time"] = "2020/05/10 15:04:49",
			["locals"] = "self = ExplorerCoordsFrame {\n 0 = <userdata>\n}\nevent = \"ADDON_LOADED\"\narg1 = \"Blizzard_AchievementUI\"\n(*temporary) = nil\n(*temporary) = nil\n(*temporary) = nil\n(*temporary) = \"attempt to index global 'ExplorerCoords_Config' (a nil value)\"\naddonloaded = false\ntimerachlist = true\ntimeractive = false\nplayerentered = true\n",
			["stack"] = "[string \"@Interface\\AddOns\\ExplorerCoords\\ExplorerCoords-1.7.11.lua\"]:334: in function `ExplorerCoords_OnEvent'\n[string \"*:OnEvent\"]:1: in function <[string \"*:OnEvent\"]:1>\n[string \"=[C]\"]: in function `LoadAddOn'\n[string \"@Interface\\FrameXML\\UIParent.lua\"]:457: in function `UIParentLoadAddOn'\n[string \"@Interface\\FrameXML\\UIParent.lua\"]:576: in function `AchievementFrame_LoadUI'\n[string \"@Interface\\FrameXML\\AlertFrames.lua\"]:469: in function <Interface\\FrameXML\\AlertFrames.lua:460>",
			["session"] = 3,
			["counter"] = 44,
		}, -- [2]
		{
			["message"] = "[ADDON_ACTION_BLOCKED] 插件 'WowLua' 尝试调用保护功能 'UninviteUnit()'。",
			["time"] = "2020/05/29 19:35:32",
			["stack"] = "[string \"@Interface\\AddOns\\!BugGrabber\\BugGrabber.lua\"]:519: in function <Interface\\AddOns\\!BugGrabber\\BugGrabber.lua:519>\n[string \"=[C]\"]: in function `UninviteUnit'\n[string \"WowLua\"]:7: in function <[string \"WowLua\"]:4>",
			["session"] = 3,
			["counter"] = 1,
		}, -- [3]
	},
}
