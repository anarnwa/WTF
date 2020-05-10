
GlobalIgnoreDB = {
	["filterCount"] = {
		0, -- [1]
		0, -- [2]
		0, -- [3]
		0, -- [4]
		0, -- [5]
		0, -- [6]
		0, -- [7]
		0, -- [8]
		0, -- [9]
		0, -- [10]
	},
	["typeList"] = {
	},
	["revision"] = 1,
	["openWithFriends"] = true,
	["skipPrivate"] = true,
	["asknote"] = true,
	["delList"] = {
	},
	["autoCount"] = 3,
	["skipParty"] = false,
	["ignoreList"] = {
	},
	["trackChanges"] = true,
	["autoIgnore"] = true,
	["factionList"] = {
	},
	["filterList"] = {
		"([word=anal] or [contains=analan]) and ([link] or [words=2])", -- [1]
		"[item=19019]", -- [2]
		"([contains=.c0m] or [contains=.c.0.m] or [contains=,com] or ([contains=.com] and ([contains=code] or [contains=usd] or [contains=+15]))", -- [3]
		"([contains=░] or [contains=▒] or [contains=▓] or [contains=█]) and ([contains=wts] or [contains=sell] or [contains=gold] or [contains=share]))", -- [4]
		"([contains=deliver] or [contains=delivery] or [contains=gold] or [contains=delievery] or [contains=sale]) and ([contains=.com] or [contains=,com] or [contains=c0m])", -- [5]
		"([contains=wts] or [contains=sell]) and [contains=share] and ([contains=account] or [contains=acc]))", -- [6]
		"(([contains=<] and [contains=>]) or ([contains=\\[] and [contains=\\]]) or ([contains=\\(] and [contains=\\)])) and ([contains=recruit] or [contains=progress] or [contains=raid] or [contains=guild] or [contains=seek] or [contains=mythic])", -- [7]
		"[community]", -- [8]
		"[contains=WTS] or [contains=WTB]", -- [9]
		"[nonlatin]", -- [10]
	},
	["sameserver"] = true,
	["attachFriends"] = true,
	["notes"] = {
	},
	["expList"] = {
	},
	["skipGuild"] = true,
	["chatmsg"] = true,
	["filterTotal"] = 0,
	["defexpire"] = 0,
	["filterDesc"] = {
		"Filter \"Anal\" Spammers", -- [1]
		"Filter Thunderfury linking", -- [2]
		"Filter Gold Spam #1", -- [3]
		"Filter Gold Spam #2", -- [4]
		"Filter Gold Spam #3", -- [5]
		"Filter Gold Spam #4", -- [6]
		"Filter Guild Recruitment", -- [7]
		"Filter Community Recruitment", -- [8]
		"Filter WTS", -- [9]
		"Filter Chinese/Korean/Japanese", -- [10]
	},
	["syncInfo"] = {
	},
	["filterActive"] = {
		true, -- [1]
		true, -- [2]
		true, -- [3]
		true, -- [4]
		true, -- [5]
		true, -- [6]
		false, -- [7]
		false, -- [8]
		false, -- [9]
		false, -- [10]
	},
	["spamFilter"] = true,
	["dateList"] = {
	},
	["autoTime"] = 600,
	["autoUpdate"] = true,
	["samefaction"] = true,
	["invertSpam"] = false,
}
