
EncounterDetailsDB = {
	["emotes"] = {
		{
			["boss"] = "拉格纳罗斯",
		}, -- [1]
		{
			{
				0.2150000000001455, -- [1]
				"可笑的凡人！在烈焰之子面前灰飞烟灭吧！", -- [2]
				"管理者埃克索图斯", -- [3]
				7, -- [4]
			}, -- [1]
			{
				2.103000000000066, -- [1]
				"你以为你赢了？可能你需要另一堂痛苦的课程！", -- [2]
				"管理者埃克索图斯", -- [3]
				7, -- [4]
			}, -- [2]
			["boss"] = "管理者埃克索图斯",
		}, -- [2]
		{
			["boss"] = "萨弗隆先驱者",
		}, -- [3]
	},
	["encounter_spells"] = {
		[19516] = {
			["school"] = 1,
			["type"] = "BUFF",
			["token"] = {
				["SPELL_AURA_APPLIED"] = true,
				["SPELL_CAST_SUCCESS"] = true,
			},
			["source"] = "加尔",
		},
		[19391] = {
			["school"] = 4,
			["token"] = {
				["SPELL_CAST_START"] = true,
			},
			["source"] = "熔岩爪牙",
		},
		[19785] = {
			["school"] = 1,
			["token"] = {
				["SPELL_CAST_SUCCESS"] = true,
				["SPELL_CAST_START"] = true,
			},
			["source"] = "萨弗隆先驱者",
		},
		[20620] = {
			["school"] = 32,
			["type"] = "BUFF",
			["token"] = {
				["SPELL_AURA_APPLIED"] = true,
				["SPELL_CAST_SUCCESS"] = true,
				["SPELL_HEAL"] = true,
			},
			["source"] = "管理者埃克索图斯",
		},
		[20565] = {
			["school"] = 4,
			["token"] = {
				["SPELL_CAST_SUCCESS"] = true,
				["SPELL_CAST_START"] = true,
			},
			["source"] = "拉格纳罗斯",
		},
	},
}
