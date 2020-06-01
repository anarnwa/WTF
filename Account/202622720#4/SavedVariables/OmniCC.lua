
OmniCCDB = {
	["global"] = {
		["addonVersion"] = "8.3.5",
		["dbVersion"] = 5,
	},
	["profileKeys"] = {
		["我会消失 - 亡语者"] = "默认",
		["我会招宝宝 - 亡语者"] = "默认",
		["弄妆梳洗迟 - 亡语者"] = "默认",
		["我会飞你会吗 - 亡语者"] = "默认",
		["十里扬州路 - 亡语者"] = "默认",
		["懒起画蛾眉 - 古尔丹"] = "默认",
		["风起春城暮 - 亡语者"] = "默认",
	},
	["profiles"] = {
		["默认"] = {
			["rules"] = {
				{
					["patterns"] = {
						"PlaterMainAuraIcon", -- [1]
						"PlaterSecondaryAuraIcon", -- [2]
						"ExtraIconRowIcon", -- [3]
					},
					["id"] = "Plater Nameplates Rule",
					["priority"] = 1,
					["theme"] = "Plater Nameplates Theme",
				}, -- [1]
			},
			["themes"] = {
				["Plater Nameplates Theme"] = {
					["textStyles"] = {
						["seconds"] = {
						},
						["soon"] = {
						},
						["minutes"] = {
						},
					},
					["enableText"] = false,
				},
				["默认"] = {
					["textStyles"] = {
						["seconds"] = {
						},
						["soon"] = {
						},
						["minutes"] = {
						},
					},
					["fontSize"] = 25,
					["minSize"] = 0.55,
					["spiralOpacity"] = 1.00999997742474,
					["minEffectDuration"] = 0,
				},
			},
		},
	},
}
OmniCC4Config = {
	["groupSettings"] = {
		["base"] = {
			["styles"] = {
				["seconds"] = {
					["scale"] = 1,
				},
				["minutes"] = {
					["scale"] = 1,
				},
				["soon"] = {
					["scale"] = 1.5,
				},
				["hours"] = {
					["scale"] = 0.75,
				},
				["charging"] = {
					["scale"] = 0.75,
				},
				["controlled"] = {
					["scale"] = 1.5,
				},
			},
			["effect"] = "pulse",
			["scaleText"] = true,
			["yOff"] = 0,
			["spiralOpacity"] = 1.00999997742474,
			["minDuration"] = 2,
			["xOff"] = 0,
			["tenthsDuration"] = 0,
			["fontOutline"] = "OUTLINE",
			["minSize"] = 0.55,
			["minEffectDuration"] = 0,
			["mmSSDuration"] = 0,
			["fontSize"] = 25,
		},
	},
	["groups"] = {
	},
	["version"] = "8.2.5",
}
