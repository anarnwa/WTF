
WowLua_DB = {
	["currentPage"] = 3,
	["fontSize"] = 14,
	["pages"] = {
		{
			["untitled"] = true,
			["name"] = "Untitled 1",
			["content"] = "--local a,b=298,88\nlocal c,d=804,49\nlocal e,f=36,36\nlocal g,h=30,30\nlocal size=0.7\n--MicroButtonAndBagsBar:SetSize(a*size,b*size)\nMainMenuBarArtFrame:SetSize(c*size,d*size)\n--MainMenuBar:SetSize(a*size,b*size)\nMainMenuBar:SetMovable(true)\nMainMenuBar:EnableMouse(true)\nMainMenuBar:SetScript(\n   'OnMouseDown',\n   function(self)\n      self:StartMoving()\n      self.isMoving = true\n   end\n)\n\nMainMenuBar:SetScript(\n   'OnMouseUp',\n   function(self)\n      if self.isMoving then\n         self:StopMovingOrSizing()\n         self.isMoving = false\n      end\n   end\n)\nfor i=1,12 do\n   _G[\"MultiBarBottomLeftButton\"..i]:SetSize(e*size,f*size)\n   _G[\"MultiBarLeftButton\"..i]:SetSize(e*size,f*size)\n   _G[\"MultiBarRightButton\"..i]:SetSize(e*size,f*size)\n   _G[\"ActionButton\"..i]:SetSize(e*size,f*size)\n   _G[\"MultiBarBottomRightButton\"..i]:SetSize(e*size,f*size)\nend\n--[[\nfor i=0,3 do\n   _G[\"CharacterBag\"..i..\"Slot\"]:SetSize(g*size,h*size)\nend]]",
		}, -- [1]
		{
			["untitled"] = true,
			["name"] = "Untitled 2",
			["content"] = "MainMenuBarArtFrame.RightEndCap:Hide()\nMainMenuBarArtFrame.LeftEndCap:Hide()\nMainMenuBarArtFrameBackground:Hide()\nMainMenuBarArtFrame.PageNumber:Hide()\nActionBarDownButton:Hide()\nActionBarUpButton:Hide()",
		}, -- [2]
		{
			["untitled"] = true,
			["name"] = "Untitled 3",
			["content"] = "UninviteUnit()",
		}, -- [3]
	},
	["untitled"] = 4,
}
