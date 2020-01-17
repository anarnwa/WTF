
RematchSaved = {
}
RematchSettings = {
	["ScriptFilters"] = {
		{
			"未命名的宠物", -- [1]
			"-- 收集的宠物中，仍然是原始名字的宠物。\n\nreturn owned and not customName", -- [2]
		}, -- [1]
		{
			"未完成升级的宠物", -- [1]
			"-- 在对战中获得过经验，但是没有完成升级的宠物。\n\nreturn xp and xp>0", -- [2]
		}, -- [2]
		{
			"独特技能", -- [1]
			"-- 拥有其它宠物所没有的技能的宠物。\n\nif not count then\n  -- create count of each ability per species\n  count = {}\n  for speciesID in AllSpeciesIDs() do\n    for abilityID in AllAbilities(speciesID) do\n      if not count[abilityID] then\n        count[abilityID] = 0\n      end\n      count[abilityID] = count[abilityID] + 1\n    end\n  end\nend\n\nfor _,abilityID in ipairs(abilityList) do\n  if count[abilityID]==1 then\n    return true\n  end\nend", -- [2]
		}, -- [3]
		{
			"非精良属性", -- [1]
			"-- 收集的宠物中，不是精良属性的宠物。\n\nif not rares then\n  rares = {}\n  for petID in AllPetIDs() do\n    if select(5,C_PetJournal.GetPetStats(petID))==4 then\n      rares[C_PetJournal.GetPetInfoByPetID(petID)]=true\n    end\n  end\nend\n\nif canBattle and owned and not rares[speciesID] then\n  return true\nend", -- [2]
		}, -- [4]
		{
			"混合技能", -- [1]
			"-- 拥有三个或以上非自身宠物类型的攻击型技能的宠物。\n\nlocal count = 0\nfor _,abilityID in ipairs(abilityList) do\n  local abilityType,noHints = select(7, C_PetBattles.GetAbilityInfoByID(abilityID) )\n  if not noHints and abilityType~=petType then\n    count = count + 1\n  end\nend\n\nreturn count>=3\n", -- [2]
		}, -- [5]
	},
	["QueueSortOrder"] = 1,
	["XPos"] = 482.9999694824219,
	["AutoLoad"] = false,
	["FavoriteFilters"] = {
	},
	["Sort"] = {
		["Order"] = 1,
		["FavoritesFirst"] = true,
	},
	["AllowHiddenPetsDefaulted"] = true,
	["alpt"] = {
	},
	["TeamGroups"] = {
		{
			"综合", -- [1]
			"Interface\\Icons\\PetJournalPortrait", -- [2]
		}, -- [1]
	},
	["Filters"] = {
		["Other"] = {
		},
		["Script"] = {
		},
		["Types"] = {
		},
		["Favorite"] = {
		},
		["Collected"] = {
		},
		["Strong"] = {
		},
		["Sources"] = {
		},
		["Breed"] = {
		},
		["Rarity"] = {
		},
		["Similar"] = {
		},
		["Level"] = {
		},
		["Tough"] = {
		},
		["Moveset"] = {
		},
	},
	["JournalPanel"] = 1,
	["alptconfig"] = {
		["rematchEx"] = {
			["useGroupMenu"] = true,
			["useRigthCage"] = true,
			["showSetButton"] = 1,
			["fillSaveAsTeamName"] = true,
			["useTeamMenu"] = true,
		},
		["forceLoadWhenHealOk"] = true,
		["enable"] = true,
		["showTeamMessage"] = true,
		["petGroups"] = {
		},
		["showTeamCount"] = {
			true, -- [1]
			true, -- [2]
			true, -- [3]
		},
		["enableXpLog"] = false,
		["logToFile"] = false,
		["mode"] = 1,
		["selectWhenTarget"] = true,
		["enableBattleTimer"] = true,
		["debug"] = false,
		["loadRetries"] = 50,
		["showOptionButton"] = true,
		["alternates"] = "毛绒雷象",
		["loadAfterBattle"] = 0.04,
		["useRematchLoadingDone"] = false,
		["loadRetryInteval"] = 0.004,
		["macros"] = {
			["ALPTButton2"] = {
				["selectGossip"] = true,
				["waitTeam"] = true,
				["useTdScript"] = false,
				["waitTimeout"] = 10,
				["healPet"] = true,
				["target"] = true,
				["autoConfirm"] = true,
				["useBandage"] = true,
				["autointeract"] = false,
			},
			["ALPTButton4"] = {
				["selectGossip"] = true,
				["waitTeam"] = true,
				["useTdScript"] = false,
				["waitTimeout"] = 10,
				["healPet"] = true,
				["target"] = true,
				["autoConfirm"] = true,
				["useBandage"] = true,
				["autointeract"] = false,
			},
			["ALPTButton1"] = {
				["selectGossip"] = true,
				["waitTeam"] = true,
				["useTdScript"] = false,
				["waitTimeout"] = 10,
				["healPet"] = true,
				["name"] = "普通劳模",
				["target"] = true,
				["autoConfirm"] = true,
				["useBandage"] = true,
				["autointeract"] = false,
			},
			["ALPTButton3"] = {
				["selectGossip"] = true,
				["waitTeam"] = true,
				["useTdScript"] = false,
				["waitTimeout"] = 10,
				["healPet"] = true,
				["target"] = true,
				["autoConfirm"] = true,
				["useBandage"] = true,
				["autointeract"] = false,
			},
			["ALPTButton5"] = {
				["selectGossip"] = true,
				["waitTeam"] = true,
				["useTdScript"] = false,
				["waitTimeout"] = 10,
				["healPet"] = true,
				["target"] = true,
				["autoConfirm"] = true,
				["useBandage"] = true,
				["autointeract"] = false,
			},
		},
		["selectAfterBattle"] = true,
		["defaultTeam"] = {
		},
	},
	["CollapsedOptHeaders"] = {
	},
	["LevelingQueue"] = {
	},
	["PreferredMode"] = 1,
	["ActivePanel"] = 1,
	["Sanctuary"] = {
	},
	["SpecialSlots"] = {
	},
	["CornerPos"] = "BOTTOMLEFT",
	["QueueSanctuary"] = {
	},
	["CustomScaleValue"] = 100,
	["YPos"] = 129.9999694824219,
	["SelectedTab"] = 1,
	["PetNotes"] = {
	},
}
