
BugGrabberDB = {
	["session"] = 104,
	["lastSanitation"] = 3,
	["errors"] = {
		{
			["message"] = "Action[SetPoint] failed because[SetPoint would result in anchor family connection]: attempted from: LevelUpDisplay:SetPoint.",
			["time"] = "2020/05/09 20:56:17",
			["locals"] = "(*temporary) = LevelUpDisplay {\n 0 = <userdata>\n fastHideAnim = <unnamed> {\n }\n challengeModeBits = <unnamed> {\n }\n blackBg = LevelUpDisplayBlackBg {\n }\n currSpell = 0\n challengeModeFrame = LevelUpDisplayChallengeModeFrame {\n }\n scenarioBits = <unnamed> {\n }\n StopBanner = <function> defined @Interface\\FrameXML\\LevelUpDisplay.lua:267\n gLine2 = LevelUpDisplayGLine2 {\n }\n gLine = LevelUpDisplayGLine {\n }\n type = \"scenario\"\n PlayBanner = <function> defined @Interface\\FrameXML\\LevelUpDisplay.lua:262\n spellFrame = LevelUpDisplaySpellFrame {\n }\n SetHeight = <function> defined =[C]:-1\n ResumeBanner = <function> defined @Interface\\FrameXML\\LevelUpDisplay.lua:273\n SetPoint = <function> defined =[C]:-1\n scenarioFrame = LevelUpDisplayScenarioFrame {\n }\n SetWidth = <function> defined =[C]:-1\n moveFrame = LevelUpDisplay {\n }\n SpellBucketFrame = <unnamed> {\n }\n hideAnim = <unnamed> {\n }\n scenarioFiligree = <unnamed> {\n }\n levelFrame = LevelUpDisplayLevelFrame {\n }\n}\n(*temporary) = \"TOP\"\n(*temporary) = 0\n(*temporary) = -250\n",
			["stack"] = "[string \"=[C]\"]: ?\n[string \"=[C]\"]: in function `SetPoint'\n[string \"@Interface\\FrameXML\\LevelUpDisplay.lua\"]:813: in function `LevelUpDisplay_StartDisplay'\n[string \"@Interface\\FrameXML\\LevelUpDisplay.lua\"]:264: in function `PlayBanner'\n[string \"@Interface\\FrameXML\\TopBannerManager.lua\"]:33: in function `TopBannerManager_Show'\n[string \"@Interface\\FrameXML\\LevelUpDisplay.lua\"]:740: in function `LevelUpDisplay_Start'\n[string \"@Interface\\FrameXML\\LevelUpDisplay.lua\"]:728: in function `LevelUpDisplay_Show'\n[string \"@Interface\\FrameXML\\LevelUpDisplay.lua\"]:393: in function `LevelUpDisplay_PlayScenario'\n[string \"@Interface\\AddOns\\Blizzard_ObjectiveTracker\\Blizzard_ScenarioObjectiveTracker.lua\"]:1013: in function <...jectiveTracker\\Blizzard_ScenarioObjectiveTracker.lua:878>\n[string \"@Interface\\AddOns\\!KalielsTracker\\KalielsTracker.lua\"]:1257: in function `Update'\n[string \"@Interface\\AddOns\\Blizzard_ObjectiveTracker\\Blizzard_ObjectiveTracker.lua\"]:1096: in function <...zzard_ObjectiveTracker\\Blizzard_ObjectiveTracker.lua:1055>\n[string \"=[C]\"]: ?\n[string \"@Interface\\AddOns\\!KalielsTracker\\KalielsTracker.lua\"]:522: in function <Interface\\AddOns\\!KalielsTracker\\KalielsTracker.lua:511>\n[string \"=[C]\"]: in function `ObjectiveTracker_Update'\n[string \"@Interface\\AddOns\\Blizzard_ObjectiveTracker\\Blizzard_ObjectiveTracker.lua\"]:747: in function <...zzard_ObjectiveTracker\\Blizzard_ObjectiveTracker.lua:682>\n[string \"=[C]\"]: ?\n[string \"=[C]\"]: ?\n[string \"@Interface\\AddOns\\!KalielsTracker\\Modules\\Filters-过滤器.lua\"]:70: in function <Interface\\AddOns\\!KalielsTracker\\Modules\\Filters.lua:63>",
			["session"] = 99,
			["counter"] = 2,
		}, -- [1]
		{
			["message"] = "...AddOns\\AddOnSkins\\Skins\\Blizzard\\Retail\\WorldMap.lua:385: attempt to call method 'GetText' (a nil value)",
			["time"] = "2020/05/09 21:59:53",
			["locals"] = "(for generator) = <function> defined =[C]:-1\n(for state) = <table> {\n  = true\n  = true\n}\n(for control) = <unnamed> {\n 0 = <userdata>\n Icon = QuestFrameGreetingPanelQuestIcon {\n }\n isActive = 0\n}\nButton = <unnamed> {\n 0 = <userdata>\n Icon = QuestFrameGreetingPanelQuestIcon {\n }\n isActive = 0\n}\nText = \"|cff000000营救抵抗军|r\"\n(*temporary) = <function> defined =[C]:-1\n(*temporary) = nil\n(*temporary) = \"|cff000000营救抵抗军|r\"\n(*temporary) = \"attempt to call method 'GetText' (a nil value)\"\n",
			["stack"] = "[string \"@Interface\\AddOns\\AddOnSkins\\Skins\\Blizzard\\Retail\\WorldMap.lua\"]:385: in function <...AddOns\\AddOnSkins\\Skins\\Blizzard\\Retail\\WorldMap.lua:382>\n[string \"=[C]\"]: ?\n[string \"=[C]\"]: in function `Show'\n[string \"@Interface\\FrameXML\\QuestFrame.lua\"]:36: in function <Interface\\FrameXML\\QuestFrame.lua:22>",
			["session"] = 102,
			["counter"] = 7,
		}, -- [2]
		{
			["message"] = "Couldn't open Interface\\AddOns\\NPCScan\\NPCScan.toc",
			["session"] = 104,
			["time"] = "2020/05/09 22:06:20",
			["counter"] = 4,
		}, -- [3]
	},
}
