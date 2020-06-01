
WowLua_DB = {
	["currentPage"] = 1,
	["fontSize"] = 14,
	["pages"] = {
		{
			["untitled"] = true,
			["name"] = "Untitled 1",
			["content"] = "local K,F=\"1\",F or CreateFrame(\"Frame\")\nF:RegisterEvent(\"CHAT_MSG_WHISPER\") \nprint(\"已开启,KeyWord=\"..K) \nI=function(_,_,m,s)\n   if m==K then \n      print(\"1\")\n      UninviteUnit(s)\n   end \nend  \nF:SetScript(\"OnEvent\",I)",
		}, -- [1]
	},
	["untitled"] = 2,
}
