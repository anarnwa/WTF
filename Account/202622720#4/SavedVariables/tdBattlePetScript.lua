
TD_DB_BATTLEPETSCRIPT_GLOBAL = {
	["profileKeys"] = {
		["维维尔 - 亡语者"] = "Default",
		["坎坎坷坷 - 亡语者"] = "Default",
		["在哪 - 亚雷戈斯"] = "Default",
		["Ouse - 亡语者"] = "Default",
		["白白净净啥 - 古尔丹"] = "Default",
		["落月复西斜 - 亡语者"] = "Default",
		["我会消失 - 亡语者"] = "Default",
		["我的小胖狗 - 亡语者"] = "Default",
		["弄妆梳洗迟 - 亡语者"] = "Default",
		["我会飞你会吗 - 亡语者"] = "Default",
		["Mubbh - 亡语者"] = "Default",
		["朝飞暮卷 - 亡语者"] = "Default",
		["斜月藏海雾 - 亡语者"] = "Default",
		["弄妆梳洗迟 - 古尔丹"] = "Default",
		["唧唧叫 - 古尔丹"] = "Default",
		["风起春城暮 - 亡语者"] = "Default",
		["Funerals - 亡语者"] = "Default",
		["我找不到了 - 亡语者"] = "Default",
		["高楼鼓角悲 - 亡语者"] = "Default",
		["Cleaner - 亡语者"] = "Default",
		["我会招宝宝 - 亡语者"] = "Default",
		["呜呜哇哇 - 古尔丹"] = "Default",
		["她的眼眶里 - 古尔丹"] = "Default",
		["我会招恶魔 - 亡语者"] = "Default",
		["Weeping - 亡语者"] = "Default",
		["弄妆梳洗迟 - 死亡之翼"] = "Default",
		["Dremel - 亡语者"] = "Default",
		["向我撒花 - 亡语者"] = "Default",
		["我喝了假酒 - 亡语者"] = "Default",
		["十里扬州路 - 亡语者"] = "Default",
		["回首见旌旗 - 亡语者"] = "Default",
		["生灵俱灭 - 死亡之翼"] = "Default",
		["十里扬州路 - 古尔丹"] = "Default",
		["我会变成狼 - 亡语者"] = "Default",
		["我会大跳你呢 - 亡语者"] = "Default",
		["Believer - 古尔丹"] = "Default",
		["不不尾王 - 古尔丹"] = "Default",
		["懒起画蛾眉 - 古尔丹"] = "Default",
		["十里扬州路 - 安苏"] = "Default",
		["Believe - 古尔丹"] = "Default",
	},
	["global"] = {
		["version"] = 80100.01,
		["scripts"] = {
			["Rematch"] = {
				[150922] = {
					["name"] = "淤泥喷射者",
					["code"] = "ability(躲闪:312)\nability(奔踏:163) [!enemy.aura(破碎防御).exists]\nability(乱舞:360) [enemy.aura(破碎防御:542).exists]\nability(#3)\nability(#1)",
				},
				[66553] = {
					["author"] = "弄妆梳洗迟-古尔丹",
					["name"] = "莫勒鲁长老",
					["code"] = "--1雷霆之箭，2-5吐息；对方二号上，6吐息，7自爆，8换步行雷区，9猛击；对方三号上，10自爆\nability(自爆:282) [enemy(格纳什:960).active & self(机械熊猫人幼龙:844).aura(机械:244).exists & self(机械熊猫人幼龙:844).active]\nability(雷霆之箭:779)\nability(吐息:115) \nchange(步行炸弹:85)\nability(自爆:282) [enemy(岩喉:959).hp<650]\nability(雷区:634) [enemy(格纳什:960).active]\nability(猛击:455)",
				},
				[66824] = {
					["author"] = "弄妆梳洗迟-古尔丹",
					["name"] = "奥巴里斯",
					["code"] = "--飞艇：1-2飞弹，3诱饵，4自爆；敌方二号上场，5换小宠，直接换翡翠始祖龙宝宝,6翡翠灵气，下面步骤由于对方技能随机，我方保持好灵气和血线即可；敌方三号上场，我方保持灵气，如果上场血少于2/3，推荐睡觉一轮保险。",
				},
				[85519] = {
					["author"] = "弄妆梳洗迟-古尔丹",
					["name"] = "克里斯托弗·冯·费舍尔",
					["code"] = "ability(原始嗥叫:920)\nability(狩猎小队:921) [enemy.aura(黑爪:918).exists]\nability(黑爪:919)\nchange(步行炸弹:85) [self(赞达拉撕踝者:1211).dead]\nability(雷区:634) [enemy.aura(雷区:635).duration<1 & enemy(尖头先生:1476).active]\nability(自爆:282) [enemy(奥图:1475).hp<650]\nability(猛击:455)",
				},
				[150923] = {
					["name"] = "碎泥",
					["code"] = "ability(吐息:115) [enemy.type = 魔法]\nchange(春兔:200) [enemy.type = 亡灵]\nability(躲闪:312)\nability(乱舞:360)\nchange(next) [self.dead]\nability(#3)\nability(#1)\nability(#2)",
				},
				[72291] = {
					["author"] = "懒起画蛾眉-古尔丹",
					["name"] = "玉兰，玉珑的子嗣",
					["code"] = "ability(躲闪:312) [enemy.aura(飞行:341).exists]\nability(旋风击:1052)\nability(贯日突:219)",
				},
				[98572] = {
					["author"] = "懒起画蛾眉-古尔丹",
					["name"] = "罗克",
					["code"] = "ability(太阳光:404)\nchange(#2)\nability(自爆:282)\nchange(#3)",
				},
				[105250] = {
					["author"] = "懒起画蛾眉-古尔丹",
					["name"] = "奥利尔",
					["code"] = "change(克洛玛尼斯:1152) [self(#2).active]\nability(月火术:595) [round=1]\nability(生命交换:277) [enemy(定罪之眼:1858).active]\nability(月火术:595) [self(虚空精灵龙:557).aura(湍流旋涡:512).duration=2]\nability(奥术冲击:421)\nability(能量涌动:593)\nchange(#2) [self(虚空精灵龙:557).dead]",
				},
				[68562] = {
					["author"] = "弄妆梳洗迟-古尔丹",
					["name"] = "云游者啼乌",
					["code"] = "change(next) [self.dead]\nability(群殴:581) [enemy(云游者啼乌:1191).aura(黑爪:918).exists]\nability(黑爪:919)\nability(掠食之击:518) \nchange(next)",
				},
				[128009] = {
					["author"] = "弄妆梳洗迟-古尔丹",
					["name"] = "毒光鳐",
					["code"] = "ability(灵魂奔袭:752)\nability(奥术冲击:421)\nability(奥术风暴:589)\nability(法力澎湃:489)\nchange(next)",
				},
				[99210] = {
					["author"] = "弄妆梳洗迟-古尔丹",
					["name"] = "博迪·日轨",
					["code"] = "--4奥冲+月火术敌挂，鸟上场。生命交换+2个奥冲，敌挂，鱼人上场。2个奥冲后待命自杀，换小宠，不必点技能，直接换3号宠，亡灵技秒敌(幽魂之咬最好)\nchange(凋零雄鹰:456) [self(#3).active]\nability(月火术:595) [round=5]\nability(生命交换:277) [enemy(咸鸡:1801).active]\nability(奥术冲击:421)\nability(幽魂之咬:654) [enemy(格罗米特:1799).hp<850]\nability(染疫之爪:117)\nchange(#3) [self(虚空精灵龙:557).dead]",
				},
				[98270] = {
					["author"] = "弄妆梳洗迟-古尔丹",
					["name"] = "罗伯特·克雷格",
					["code"] = "--奥术风暴+3个魔爆术+能量涌动，牺牲后上小宠，不必点技能，换防御者，反射盾，敌挂。2轮猛击，敌挂。离子炮，10轮结束\nchange(德莱尼微型防御者:1450) [self(#3).active]\nability(奥术风暴:589) [round=1]\nability(能量涌动:593) [self.ability(奥术风暴:589).duration=0]\nability(魔爆术:299)\nability(反射护盾:1105) [enemy(暴牙:1770).active]\nability(离子炮:209) [enemy(贝罗斯:1771).active & enemy(贝罗斯:1771).hp<1158]\nability(猛击:455)\nquit [self(德莱尼微型防御者:1450).dead]\nchange(#3) [self(强化的嗜魔者:1766).dead]",
				},
				[150925] = {
					["name"] = "讯问者莉兹",
					["code"] = "ability(照亮:460)\nability(自爆:282)\nchange(next)",
				},
				[142096] = {
					["author"] = "弄妆梳洗迟-古尔丹",
					["name"] = "卡拉加",
					["code"] = "ability(增压:208) [self.aura(旋紧发条:458).exists]\nability(旋紧发条:459)\nability(奥术风暴:589)\nability(法力澎湃:489)\nability(扫尾:122)\nchange(next)",
				},
				[66730] = {
					["author"] = "弄妆梳洗迟-古尔丹",
					["name"] = "圣地的俞娜",
					["code"] = "ability(翡翠灵气:597) [round=1]\nability(原始之击:612) [round=6]\nability(翡翠之咬:525) \nability(群殴:581) [enemy.aura(黑爪:918).exists]\nability(黑爪:919)\nchange(伊奇:1532) [self(#3).active]\nchange(#3) [self(翡翠始祖龙宝宝:1167).dead]\nstandby [enemy(铁壁龟:992).active]",
				},
				[79751] = {
					["author"] = "弄妆梳洗迟-古尔丹",
					["name"] = "埃利亚诺",
					["code"] = "ability(潜水:564) [enemy.ability(死亡哀号:1381).duration=8]\nability(吸血:1043) [self.hp<800]\nability(吸收:449)",
				},
				[106542] = {
					["author"] = "弄妆梳洗迟-古尔丹",
					["name"] = "受伤的蓝翼雏龙",
					["code"] = "ability(奥术风暴:589)\nability(法力澎湃:489)\nability(扫尾:122)\nchange(赞达拉撕踝者:1211) [self(节点雏龙:1165).dead]\nability(狩猎小队:921) [enemy.aura(黑爪:918).exists]\nability(黑爪:919)",
				},
				[68563] = {
					["author"] = "弄妆梳洗迟-古尔丹",
					["name"] = "咖菲",
					["code"] = "ability(增压:208) [self.aura(旋紧发条:458).exists]\nability(旋紧发条:459)\nchange(next) [self.dead]\nquit [self.aura(昏迷:927).exists]",
				},
				["阿玛利亚01"] = {
					["name"] = "阿玛利亚01",
					["code"] = "quit [self(#2).type=水栖 &round=1] \nchange(next) [self.dead] \nchange(#3) [enemy(#1).dead &enemy(#2).dead &round<=5] \nchange(#2) [enemy(#1).dead &enemy(#2).active &round<=5] \nif [self(#1).active &enemy(#1).active] \nability(#2) \nability(#3) \nendif \nability(#3) [self(#2).active &enemy(#3).active ] \nif [self(#2).active &enemy(#2).active] \nability(#2) [self.round=1] \nability(#1) \nendif \nability(#1) [self(#3).active &enemy(#2).active ] \nif [self(#3).active] \nability(#1) [enemy(#3).active & enemy.hp<=329 &!enemy(#3).aura(无法攻击:1358).exists ] \nability(#2) [enemy(#3).active &self.hp<1200 & enemy.aura(无法攻击).duration = 2] \nability(#3) [enemy(#3).active &self.aura(抽水).exists ] \nability(#3) [enemy(#3).active &enemy.aura(无法攻击).duration =1 ] \nability(#1) [!enemy(#3).aura(无法攻击:1358).exists] \nstandby \nendif",
				},
				[128010] = {
					["author"] = "弄妆梳洗迟-古尔丹",
					["name"] = "小脏",
					["code"] = "ability(群殴:581) [enemy(小脏:2098).aura(黑爪:918).exists]\nability(黑爪:919)",
				},
				[94637] = {
					["author"] = "Believer-古尔丹",
					["name"] = "腐化的雷尾淡水兽",
					["code"] = "ability(发射火箭:293) [round=1]\nability(自我复制:1002) [round=2]\nability(发射火箭:293)",
				},
				["阿玛利亚保底"] = {
					["name"] = "阿玛利亚02",
					["code"] = "quit [self(#2).hpp<100 &round=1] \nchange(next) [self.dead] \nchange(#3) [enemy(#1).dead &enemy(#2).dead &round<=5] \nchange(#2) [enemy(#1).dead &enemy(#2).active &round<=5] \nif [self(#1).active &enemy(#1).active] \nability(#2) \nability(#3) \nendif \nif [self(#2).active] \nability(#2) [enemy(#2).active] \nability(#3) [!self.aura(抽水).exists] \nability(#1) [enemy(#3).active & enemy.hp<=351 &!enemy(#3).aura(无法攻击:1358).exists ] \nability(#3) [enemy(#3).active &self.aura(抽水).exists &!enemy(#3).aura(无法攻击:1358).exists ] \nability(#1) [enemy(#2).active] \nstandby \nendif \nability(#1) [self(#3).active &enemy(#2).active ] \nif [self(#3).active] \nability(#1) [enemy(#3).active & enemy.hp<=329 &!enemy(#3).aura(无法攻击:1358).exists ] \nability(#2) [enemy(#3).active &self.hp<1200 & enemy.aura(无法攻击).duration = 2] \nability(#3) [enemy(#3).active &self.aura(抽水).exists ] \nability(#3) [enemy(#3).active &enemy.aura(无法攻击).duration =1 ] \nability(#1) [!enemy(#3).aura(无法攻击:1358).exists] \nstandby \nendif",
				},
				[66635] = {
					["author"] = "弄妆梳洗迟-古尔丹",
					["name"] = "毕格·爆索",
					["code"] = "standby [self(节点雏龙:1165).active & enemy(啾啾:965).active & enemy(啾啾:965).hp<560]\nability(奥术风暴:589)\nability(法力澎湃:489)\nability(扫尾:122)",
				},
				[141046] = {
					["name"] = "莉娜·暗风",
					["code"] = "change(赞达拉撕踝者:1211) [self(锦绣阔步者:383).dead]\nability(水流喷射:118) [round=2]\nability(抽水:297) \nability(原始嗥叫:920) [enemy(小型扭曲涡流:2225).active]\nability(狩猎小队:921) [enemy.aura(黑爪:918).exists]\nability(黑爪:919)\nability(乱舞:360)",
				},
				[141588] = {
					["name"] = "血牙",
					["code"] = "ability(旋紧发条:459) [round=1]\nability(增压:208) [round=2]\nability(旋紧发条:459) [round=3]\nability(毒烟:640) [round=4]",
				},
				[68564] = {
					["author"] = "弄妆梳洗迟-古尔丹",
					["name"] = "多斯里加",
					["code"] = "ability(黑爪:919) [ round =1]\nability(群殴:581) [round = 2]\nchange(利爪雏龙:1976) [round =5]\nability(掠食之击:518) [round = 6]\nchange(next) [self.dead]\nability(掠食之击:518)",
				},
				[128011] = {
					["author"] = "弄妆梳洗迟-古尔丹",
					["name"] = "死亡之啸",
					["code"] = "ability(奥术风暴:589)\nability(法力澎湃:489)\nability(扫尾:122)\nchange(next)",
				},
				[71927] = {
					["author"] = "懒起画蛾眉-古尔丹",
					["name"] = "陈·风暴烈酒",
					["code"] = "--牛上来，兔子钻地。第3轮躲闪。第4轮换飞艇，诱饵，飞弹到敌挂\n--虫上来，换兔子吃催眠。次轮钻地。注意看敌人的虫群风暴CD，一到就用钻地或躲闪来躲，平时乱舞\n--酒灵上来，兔子乱舞。次轮乱舞，敌蓄力。第3轮躲闪，第4轮乱舞，第5轮钻地，然后乱舞到死(不死也要待命自杀)。换飞艇，诱饵+飞弹，敌血低于615时自爆，结束",
				},
				[105093] = {
					["author"] = "弄妆梳洗迟-古尔丹",
					["name"] = "烈焰碎片",
					["code"] = "--抽水+净化之雨，水流喷射杀敌。敌2号上场，水流喷射+抽水1300敌挂。敌3号上场，水流喷射到牺牲，上小宠，不必点技能，直接上我方2号，抽水+水流喷射，敌护甲消失时抽水杀敌。1级小宠3625经验值 \n\n\n\n\nability(抽水:297) [round=1]\nability(净化之雨:230) [round=2]\nability(水流喷射:118) [enemy(欢笑火苗:1851).active]\nability(抽水:297) [enemy(吞噬烈焰:1852).active & self(泉眼水黾:1739).active]\nability(抽水:297)\nchange(#3) [self(泉眼水黾:1739).dead]\nchange(锦绣阔步者:383) [self(#3).active]",
				},
				[145988] = {
					["name"] = "粉碎机器人Mk6001型",
					["code"] = "use(群殴:581) \nuse(闪电之盾:906) \nstandby",
				},
				[66636] = {
					["author"] = "弄妆梳洗迟-古尔丹",
					["name"] = "差点没头的雅各布",
					["code"] = "ability(隐没:440) [round=1]\nability(隐没:440) [round=7]\nability(月火术:595) [round=2]\nability(月火术:595) [round=11]\nability(奥术冲击:421)\nability(躲闪:312) [round=12]\nability(躲闪:312) [round=17]\nability(钻地:159) [round=15]\nability(钻地:159) [round=21]\nability(乱舞:360)\nchange(虚空精灵龙:557)\nchange(烟灰野兔:1778) [self(虚空精灵龙:557).dead]",
				},
				[150929] = {
					["name"] = "恶毒的泰利",
					["code"] = "ability(严寒:786) [round = 1]\nability(砍劈:943) [round =2]\nchange(伊奇:1532)\nability(黑爪:919) [!enemy(恶毒的泰利:2613).aura(黑爪:918).exists]\nability(群殴:581)\nchange(next) [self.dead]\nability(#2)\nability(#3)\nability(#1)",
				},
				[79179] = {
					["author"] = "弄妆梳洗迟-古尔丹",
					["name"] = "斯奎特",
					["code"] = "change(next) [ self.dead ] \nquit [ self(碎骨).dead & round=1 ] \nquit [ self(魔法扫帚).dead ] \nability(#2) [ round=1 ] \nchange(next) [ round=2 ] \nchange(next) [ round=3 ] \nability(#1) [ round=4 ] \nability(#2) [ round=5 ] \nability(#3) [ round=6 ] \nchange(#1) [ round=7 & self(#3).active ] \nstandby [ round=7 ] \nability(#3) [ round=8 ] \nability(#3) [ round=9 ] \nability(#1)",
				},
				[140315] = {
					["author"] = "弄妆梳洗迟-古尔丹",
					["name"] = "艾迪·快手",
					["code"] = "ability(巨石奔袭:621) [self.hp<178]\nability(火花:617) [enemy.hpp<50]\nability(水晶过载:263)\nability(巨石奔袭:621)\nchange(next)",
				},
				[124617] = {
					["name"] = "环境学者伯特",
					["code"] = "change(next) [ self.dead ] \nchange(#3) [round=4]\nability(#2) [round=2]\nability(#3) [!self(#3).active]\nability(#2) [self(#3).active & !self.aura(石肤术).exists ]\nability(#3) [!enemy.aura(烈焰喷射).exists ]\nability(#1)",
				},
				[154914] = {
					["name"] = "珠躯爬蟹",
					["code"] = "ability(照亮:460)\nability(自爆:282)\nchange(next)",
				},
				[105779] = {
					["author"] = "弄妆梳洗迟-古尔丹",
					["name"] = "邪魂先知",
					["code"] = "ability(诱饵:334)\nability(雷霆之箭:779)\nability(吐息:115)\nchange(next)",
				},
				[85650] = {
					["author"] = "弄妆梳洗迟-古尔丹",
					["name"] = "圣光精华",
					["code"] = "ability(奥术风暴:589)\nability(法力澎湃:489)\nability(扫尾:122)\nchange(next)",
				},
				[128012] = {
					["author"] = "弄妆梳洗迟-古尔丹",
					["name"] = "小牙",
					["code"] = "ability(狩猎小队:921) [enemy.aura(黑爪:918).exists]\nability(跳跃:364) [enemy.aura(黑爪:918).exists]\nability(跳跃:364) [enemy.aura(破碎防御:542).exists]\nability(黑爪:919)",
				},
				[141814] = {
					["name"] = "考瓦尔·暗须",
					["code"] = "ability(潜行:536) [round=1]\nability(月火术:595) [round=2]\nability(撕咬:110) [enemy.hp<195]\nability(月火术:595) [enemy(布莱特:2344).active]\nability(撕咬:110) [enemy.type=小动物]\nability(幽灵爪:974)\nability(能量涌动:593) [enemy(布莱特:2344).active&enemy(布莱特:2344).hp<1110]\nability(嚎叫:362)\nability(能量涌动:593)\nability(撕咬:110)\nability(奥术风暴:589)\nability(法力澎湃:489)\nability(扫尾:122)\nchange(next)",
				},
				[94639] = {
					["author"] = "弄妆梳洗迟-古尔丹",
					["name"] = "诅咒之魂",
					["code"] = "ability(狩猎小队:921) [enemy.aura(黑爪:918).exists]\nability(原始嗥叫:920) [enemy.aura(破碎防御:542).exists]\nability(黑爪:919)",
				},
				[67370] = {
					["author"] = "弄妆梳洗迟-古尔丹",
					["name"] = "杰里米·费舍尔",
					["code"] = "ability(诱饵:334) [enemy(叮当坦克:1067).active]\nability(雷霆之箭:779) [enemy(叮当坦克:1067).active]\nability(吐息:115)\nchange(步行炸弹:85) [self(机械熊猫人幼龙:844).dead]\nability(雷区:634) [enemy(叮当坦克:1067).active]\nability(自爆:282) [enemy(菲兹维克:1066).hp<651]\nability(猛击:455)\nstandby",
				},
				[106417] = {
					["author"] = "弄妆梳洗迟-古尔丹",
					["name"] = "维努",
					["code"] = "ability(群殴:581) [enemy.aura(黑爪:918).exists]\nability(飞羽:184) [enemy.aura(黑爪:918).exists]\nability(飞羽:184) [enemy.aura(破碎防御:542).exists]\nability(狩猎小队:921) [enemy.aura(黑爪:918).exists]\nability(黑爪:919) \nchange(next) [self.dead]",
				},
				[146182] = {
					["name"] = "活体淤泥",
					["code"] = "ability(甲壳护盾:310) [self.aura(甲壳护盾:309).duration<2]\nability(沐血:423) [enemy.aura(流血:491).exists]\nability(割裂:803)",
				},
				[66733] = {
					["author"] = "弄妆梳洗迟-古尔丹",
					["name"] = "莫鲁克",
					["code"] = "change(节点雏龙:1165) [enemy(光之行者:1000).active]\nchange(机械斧喙鸟:1403) [self(#3).active]\nability(鹰眼:521) [enemy.aura(遁地:340).exists]\nability(错乱:916)\nability(诱饵:334)\nability(空袭:504)\nability(奥术风暴:589)\nability(法力澎湃:489) [enemy(光之行者:1000).hp<800]\nability(扫尾:122)\nchange(#3) [self(节点雏龙:1165).dead]",
				},
				[99150] = {
					["author"] = "弄妆梳洗迟-古尔丹",
					["name"] = "格里克斯·微泡",
					["code"] = "ability(#1) [round=1]\nchange(利爪雏龙:1976) [round=2]\nability(隼龙围攻！:1773) [enemy.aura(流血:491).exists]\nability(割裂:803) [enemy(超级蛋蛋:1793).active]\nability(掠食之击:518) [enemy.aura(破碎防御:542).exists]\nability(隼龙围攻！:1773)\nability(巨石奔袭:621) [enemy(红线:1794).active]\nability(火花:617)\nchange(源质晶簇:293)",
				},
				[68566] = {
					["author"] = "弄妆梳洗迟-古尔丹",
					["name"] = "飞掠者溪雅",
					["code"] = "ability(群殴:581) [enemy.aura(黑爪:918).exists]\nability(黑爪:919)\nchange(利爪雏龙:1976) [self.dead]\nability(掠食之击:518) [enemy.aura(破碎防御:542).exists]",
				},
				[99182] = {
					["name"] = "加尔维斯顿先生01",
					["code"] = "quit [self(碾压者).active & round=1 ]\nquit [self(无面者爪牙).active & round=1]\nquit [self(霜狼幼崽).active & round=1 ]\nability(#3) [round=1]\nchange(#3) [round=6 & enemy(#1).active]\nchange(#3) [self.dead]\nif [self(#1).active & enemy(#2).active]\nability(#2) [enemy.round=1]\nendif\nif [self(#2).active]\nability(抱摔:532)\nendif\nif [self(#3).active]\nability(#2)\nchange(#2) [enemy(#1).hp=0]\nability(#3)\nendif\nability(#1)\nquit",
				},
				[128013] = {
					["author"] = "弄妆梳洗迟-古尔丹",
					["name"] = "巴基",
					["code"] = "standby [round =1]\nability(铁拳:384) [enemy.ability(虚空之门:1967).duration>0]\nability(自爆:282)\nchange(德莱尼微型防御者:1450) [self(钢铁星弹:1387).dead]\nability(离子炮:209)",
				},
				[71929] = {
					["author"] = "懒起画蛾眉-古尔丹",
					["name"] = "“腌菜”苏利·麦克莱利",
					["code"] = "ability(旋紧发条:459) [round=1]\nability(增压:208) [round=2]\nability(旋紧发条:459) [round =3]\nability(旋紧发条:459) [round=4]\nability(强力球:566) [round =5]\nability(增压:208) [round=6]\nability(旋紧发条:459) [round=7]\nability(强力球:566)\nability(群殴:581) [enemy.aura(黑爪:918).exists]\nability(黑爪:919)\nchange(#3) [self(钢铁星弹:1387).dead]\nchange(伊奇:1532) [self(#3).active]",
				},
				[94640] = {
					["author"] = "弄妆梳洗迟-古尔丹",
					["name"] = "邪火虫",
					["code"] = "ability(奥术风暴:589)\nability(法力澎湃:489)\nability(冰霜吐息:782)",
				},
				[119407] = {
					["author"] = "弄妆梳洗迟-古尔丹",
					["name"] = "曲奇的剩菜",
					["code"] = "change(伊奇:1532) [enemy(曲奇的剩菜:2032).aura(严寒:785).exists]\nchange(血眼雏龙:1977) [self(伊奇:1532).dead]\nability(隼龙围攻！:1773)\nability(群殴:581) [enemy(曲奇的剩菜:2032).aura(黑爪:918).exists]\nability(黑爪:919)\nability(严寒:786) [enemy(曲奇的剩菜:2032).aura(严寒:785).duration=0]\nstandby",
				},
				[66638] = {
					["author"] = "弄妆梳洗迟-古尔丹",
					["name"] = "奥克鲁特·荒龙",
					["code"] = "change(烟灰野兔:1778) [self(#3).active]\nability(偏斜:490) [self.aura(寒冰之墓:623).exists]\nability(躲闪:312)\nability(脚踢:307) \nability(钻地:159) [enemy(洛特:971).aura(亡灵:242).exists]\nability(乱舞:360)\nability(迅猛突袭:713)\nchange(#3) [self(剥石者幼崽:514).dead]\nstandby",
				},
				[72009] = {
					["author"] = "懒起画蛾眉-古尔丹",
					["name"] = "雪福，雪怒的幼崽",
					["code"] = "--速度300+赞达拉袭胫者或撕踝者(黑爪+狩猎小队)、第3轮小布(金币雨+自我复制)或锯齿迅猛龙(猛击)，共4轮结束\nability(狩猎小队:921) [enemy.aura(黑爪:918).exists]\nability(黑爪:919) \nability(金币雨:985)\nability(自我复制:1002)\nchange(小布:1320) [self(赞达拉撕踝者:1211).dead]",
				},
				[66734] = {
					["author"] = "弄妆梳洗迟-古尔丹",
					["name"] = "农夫倪石",
					["code"] = "ability(致盲粉:1015) [round=1]\nchange(锦绣阔步者:383) [round=2]\nability(净化之雨:230) [round=3]\nability(净化之雨:230) [round=9]\nability(水流喷射:118) [round=7]\nability(水流喷射:118) [round=11]\nchange(#3) [round =13]\nchange(#1) [round=14]\nability(抽水:297)\nability(致盲粉:1015) [round=15]\nability(蠕行真菌:743) [round=16]\nability(自爆:282) [round=17]\nchange(赤红孢子:1537) [self(锦绣阔步者:383).dead]",
				},
				[141945] = {
					["author"] = "弄妆梳洗迟-古尔丹",
					["name"] = "希兹克",
					["code"] = "ability(奥术风暴:589) [weather(奥术之风:590).duration<3]\nability(法力澎湃:489)\nability(扫尾:122)\nchange(next)",
				},
				[119344] = {
					["author"] = "弄妆梳洗迟-古尔丹",
					["name"] = "克鲁兹的战禽",
					["code"] = "change(next) [ self.dead ] \nability(#3) [ round=1 ] \nability(#2) [ round=2 ] \nability(#3) [ round=5 ] \nability(#2) [ round=8 ] \nability(#1)",
				},
				[71930] = {
					["author"] = "懒起画蛾眉-古尔丹",
					["name"] = "匿踪大师琪麟",
					["code"] = "change(伊奇:1532) [self(#3).active]\nability(群殴:581) [enemy(夏天:1286).active & enemy(夏天:1286).aura(黑爪:918).exists]\nability(黑爪:919) [enemy(夏天:1286).active]\nability(群殴:581) [enemy(奈恩:1288).active & enemy(奈恩:1288).aura(黑爪:918).exists]\nability(黑爪:919) [enemy(奈恩:1288).active]\nability(严寒:786) [enemy(风暴:1287).ability(召唤闪电:204).duration=3]\nability(严寒:786) [enemy(夏天:1286).aura(潜行:543).duration=2]\nability(铁木树皮:962) [enemy(风暴:1287).active]\nability(铁木树皮:962) [enemy(夏天:1286).active]\nchange(疯狂的萝卜:1396) [enemy(奈恩:1288).dead]\nchange(#3) [self(疯狂的萝卜:1396).dead]",
				},
				[94641] = {
					["author"] = "Believer-古尔丹",
					["name"] = "污秽巨螯蟹",
					["code"] = "ability(群殴:581) [enemy.aura(黑爪:918).exists]\nability(飞羽:184) [enemy.aura(破碎防御:542).exists]\nability(黑爪:919)",
				},
				[66352] = {
					["author"] = "弄妆梳洗迟-古尔丹",
					["name"] = "叛徒格鲁克",
					["code"] = "ability(狩猎小队:921) [enemy.aura(黑爪:918).exists]\nability(跳跃:364) [enemy.aura(黑爪:918).exists]\nability(黑爪:919)\nchange(节点雏龙:1165) [enemy(阿灭:2370).active]\nability(奥术风暴:589)\nability(法力澎湃:489)\nability(冰霜吐息:782)",
				},
				[119408] = {
					["name"] = "“船长”克鲁兹",
					["code"] = "change(伊奇:1532) [self(虚空深渊魔:1228).dead]\nability(自爆:282)\nability(群殴:581) [enemy.aura(黑爪:918).exists]\nability(黑爪:919)",
				},
				[66639] = {
					["author"] = "弄妆梳洗迟-古尔丹",
					["name"] = "格特瑞奇",
					["code"] = "ability(奥术风暴:589)\nability(法力澎湃:489)\nability(扫尾:122)\nability(自爆:282) [enemy(凋零鼠:974).active & enemy(凋零鼠:974).hp<560]\nability(雷霆之箭:779)\nability(吐息:115)\nchange(next) [self.dead]",
				},
				[154919] = {
					["name"] = "电压吞噬者",
					["code"] = "ability(灵魂结界:751)\nability(照亮:460)\nstandby [enemy.aura(潜水:830).exists]\nability(自爆:282)\nchange(next)",
				},
				["三伊奇"] = {
					["name"] = "三伊奇",
					["code"] = "ability(飞羽:184) [enemy.aura(破碎防御:542).exists]\nability(群殴:581) [enemy.aura(黑爪:918).exists]\nability(黑爪:919)\nchange(next)",
				},
				["加尔维斯顿先生02"] = {
					["name"] = "加尔维斯顿先生03",
					["code"] = "quit [self(节节点雏龙).active & round=1] \nquit [self(风裔龙宝宝).active & round=1] \nchange(next) [self.dead] \nability(#2) [round=1] \nstandby [round=3] \nability(#3) \nability(#2) \nability(#1)",
				},
				["奥多格01"] = {
					["name"] = "奥多格01",
					["code"] = "quit [ self.level<25 & round=1 ] \nchange(next) [self.dead] \nstandby [enemy.aura(潜水).exists] \nif [self(#1).active] \nstandby [enemy(#3).hp<=650] \nability(#1) [enemy(#2).hp<=427] \nability(#2) [!enemy(#3).active] \nability(#3) \nability(#1) \nendif \nif [self(#2).active] \nability(自爆) [ enemy(#3).hp<=650 ] \nability(#1) \nability(#1) \nendif \nstandby",
				},
				[85634] = {
					["name"] = "挑战木桩",
					["code"] = "ability(灼燃大地:172)\nability(烈焰吐息:501)\nability(焚烧:179)\nability(吐息:115)\nability(灵火之箭:1066)\nchange(next)",
				},
				[85630] = {
					["author"] = "弄妆梳洗迟-古尔丹",
					["name"] = "挑战木桩",
					["code"] = "ability(抽水:297)\nchange(next) [self.dead]\nability(暗影震击:422) [enemy(嚼石:1502).active & enemy(嚼石:1502).hp<400]\nability(厄运诅咒:218)\nability(鬼影缠身:652)\nability(痛苦:468) [enemy.aura(痛苦:469).duration=0]\nability(死亡之握:780)\nability(吞食:538)",
				},
				["奥多格02"] = {
					["name"] = "奥多格02",
					["code"] = "quit [self(雪福，雪怒的幼崽:1266).dead] \nchange(#2) [self(#3).dead] \nchange(#3) [enemy(#3).active & enemy.round=3] \nstandby [round=1] \nchange(#2) [round=2] \nif [self(#2).active] \nability(#3) [!enemy(#3).active] \nability(#2) \nability(#1) \nendif \nif [self(#3).active] \nability(#3) [enemy.hp<=501] \nability(#1) [enemy.hp<=501] \nability(#2) [self.round=1] \nability(#3) \nability(#1) \nendif \nstandby",
				},
				[106476] = {
					["author"] = "弄妆梳洗迟-古尔丹",
					["name"] = "迷醉宝珠",
					["code"] = "ability(嚎叫:362)\nchange(幽灵老鼠:1741) [enemy.aura(嚎叫:1725).exists]\nability(幽魂之咬:654)\nchange(#3) [enemy(#3).active]\nchange(幼狐:278) [self(#3).active]\nchange(幼狐:278) [self.aura(昏迷:174).exists]",
				},
				[142234] = {
					["name"] = "祖加伊",
					["code"] = "ability(月火术:595) [round=1]\nability(潜行:536) [round=2]\nability(幽灵爪:974) [round=3]\nchange(#2) [round=4]\nchange(#3) [round=5]\nability(奥术冲击:421) [enemy(阿灭:2370).active]\nability(生命交换:277)\nability(月火术:595)\nability(奥术冲击:421)\nstandby",
				},
				[68465] = {
					["author"] = "弄妆梳洗迟-古尔丹",
					["name"] = "熊猫人雷霆之灵",
					["code"] = "ability(躲闪:312) [round=2]\nability(奔踏:163) [round=3]\nability(乱舞:360) [enemy(熊猫人地灵:1141).active]\nability(躲闪:312) [enemy(泥团:1134).active]\nability(乱舞:360) [self(小野兔:479).hp<150]\nability(奔踏:163) [enemy(泥团:1134).active]\nchange(暗月飞艇:339) [self(#1).dead]\nability(自爆:282) [enemy(钻地鼠达纳克:1137).hp<620]\nability(诱饵:334) [enemy(钻地鼠达纳克:1137).active & enemy(钻地鼠达纳克:1137).aura(石肤术:435).exists]\nability(飞弹:777)",
				},
				[128015] = {
					["author"] = "懒起画蛾眉-古尔丹",
					["name"] = "烁光之翼",
					["code"] = "--待命，被换节点龙。法力澎湃，中虚空门牺牲，被换精灵龙，月火术+生命交换+奥术冲击，被换克洛玛尼斯，嚎叫+能量涌动，敌挂。9轮结束\nstandby [round=1]\nability(法力澎湃:489) [round=2]\nability(月火术:595)\nability(生命交换:277)\nability(奥术冲击:421)\nability(嚎叫:362)\nability(能量涌动:593)",
				},
				[71931] = {
					["author"] = "懒起画蛾眉-古尔丹",
					["name"] = "祝踏岚",
					["code"] = "--小丹上场。座狼先缭乱之舞，再嚎叫。换魅影精灵“幽魂之咬”一口秒。\n--小杰上场。换座狼嚎叫，换魅影精灵“幽魂之咬”一口秒。\n--小龙上场。换座狼嚎叫，换魅影精灵“幽魂之咬”一口秒。11-14轮快速解决\n--如果要带小宠，注意算血量，狼/狐的最后一击要死前放嚎叫。嚎叫完狼/狐死，换小宠，不点技能，换魅影“幽魂之咬”。12-15轮快速解决",
				},
				[105352] = {
					["author"] = "弄妆梳洗迟-古尔丹",
					["name"] = "法力泉涌水晶",
					["code"] = "ability(诱饵:334)\nability(吐息:115) [enemy.aura(躲闪:311).exists]\nability(雷霆之箭:779)\nability(吐息:115)",
				},
				[116794] = {
					["name"] = "滋生软浆怪",
					["code"] = "change(next) [ self.dead ]\nability(#3) [ self(#1).active&self.aura(244).exists ]\nability(#1) [ enemy(#1).hp>503 ]\nability(#3) [ enemy(#1).hp<503 ]\nability(#3) [ self(#2).active ]\nability(#3)\nability(#1)",
				},
				[119409] = {
					["author"] = "弄妆梳洗迟-古尔丹",
					["name"] = "灭敌死神50型",
					["code"] = "change(next) [ self.dead ] \nability(#1) [ round=1 ] \nability(#2) [ round=2 ] \nability(#2) [!enemy.aura(机械:244).exists&self(#3).active]\nability(#3)",
				},
				[128008] = {
					["author"] = "弄妆梳洗迟-古尔丹",
					["name"] = "污染之爪",
					["code"] = "ability(狩猎小队:921) [enemy.aura(黑爪:918).exists]\nability(跳跃:364) [enemy.aura(黑爪:918).exists]\nability(掠食之击:518) [enemy.hp<463]\nability(隼龙围攻！:1773)\nability(黑爪:919)\nchange(next)",
				},
				[141215] = {
					["name"] = "其塔拉",
					["code"] = "ability(火焰之盾:1754)\nability(闪电之盾:906)\nstandby",
				},
				[116790] = {
					["name"] = "毒牙",
					["code"] = "ability(增压:208) [self.aura(旋紧发条:458).exists&!self.aura(机械:244).exists]\nability(旋紧发条:459) [self.aura(旋紧发条:458).exists]\nability(强力球:566) [enemy.hp<243]\nability(强力球:566) [self.aura(机械:244).exists]\nability(旋紧发条:459)\nability(灵火之箭:1066) [enemy(变异飞蛇:1987).active]\nability(灼燃大地:172)\nability(#3)\nability(灵火之箭:1066)\nability(燃烧:113)\nchange(next)",
				},
				[116791] = {
					["name"] = "恐蛇",
					["code"] = "ability(旋紧发条:459) [enemy(变异小爪迅猛龙:1989).active]\nability(增压:208) [self.aura(旋紧发条:458).exists&!self.aura(机械:244).exists]\nability(旋紧发条:459) [self.aura(旋紧发条:458).exists]\nability(强力球:566) [enemy.hp<243]\nability(强力球:566) [self.aura(机械:244).exists]\nability(旋紧发条:459)\nability(灵火之箭:1066) [enemy(变异飞蛇:1987).active]\nability(灼燃大地:172)\nability(焚烧:179)\nability(灵火之箭:1066)\nchange(next) [self.dead]",
				},
				[104553] = {
					["name"] = "奥多格00",
					["code"] = "quit [ self.level<25 & round=1 ] \nchange(next) [self.dead] \nstandby [enemy.aura(潜水).exists] \nif [self(#1).active] \nstandby [enemy(#3).hp<=650] \nability(#1) [enemy(#2).hp<=427] \nability(#2) [!enemy(#3).active] \nability(#3) \nability(#1) \nendif \nif [self(#2).active] \nability(自爆) [ enemy(#3).hp<=650 ] \nability(#2) [ enemy.hp<=1071]\nability(#1) \nendif \nstandby",
				},
				[104970] = {
					["author"] = "弄妆梳洗迟-古尔丹",
					["name"] = "索瓦斯克",
					["code"] = "--小宠普攻，被换扭扭先生。蜷伏+疾病之咬杀敌。液体上场，扭扭拼到死，上兔子，躲闪+奔踏+乱舞杀敌。梦魇幼苗上场，躲闪+奔踏+乱舞杀敌。",
				},
				[155145] = {
					["name"] = "染疫小动物",
					["code"] = "ability(信息素:1063)\nability(硬壳护甲:1380)\nability(剧毒长牙:152) [!enemy.aura(中毒:379).exists]\nchange(#2)\nability(末日决战:1025)\nchange(暮光龙宝宝:2677)\nability(黑焰:792)\nability(暮光陨星:1960)\nability(#1)",
				},
				[83837] = {
					["author"] = "弄妆梳洗迟-古尔丹",
					["name"] = "凯米尔·辉刃",
					["code"] = "ability(雷霆之箭:779) [round=1]\nchange(#3) [round=2]\nchange(恶魔小鬼:1229) [round =3]\nability(燃烧:113) [round =4]\nability(虚空之门:466) [round=5]\nability(自燃:409) [round=6]\nchange(机械熊猫人幼龙:844) [round=7]\nability(吐息:115) [enemy(许愿灯:1444).active]\nability(雷霆之箭:779)\nability(自爆:282)\nchange(恶魔小鬼:1229) [self(机械熊猫人幼龙:844).dead]\nability(虚空之门:466) [enemy(凋零人偶:1443).active]\nability(燃烧:113)",
				},
				[141879] = {
					["name"] = "基约",
					["code"] = "use(奥术风暴:589)\nuse(法力澎湃:489)\nability(扫尾:122)\nchange(钢铁星弹:1387)\nability(旋紧发条:459)\nchange(赞达拉袭胫者:1180)\nability(狩猎小队:921) [enemy.aura(黑爪:918).exists]\nability(黑爪:919)",
				},
				[71932] = {
					["author"] = "懒起画蛾眉-古尔丹",
					["name"] = "贤者马里",
					["code"] = "--小溪上场，首轮涡流旋涡，我雷霆之箭。次轮我待命，敌潜水。第3轮吐息，中潜水+旋涡。第4轮吐息，敌抽水。第5轮敌涡流旋涡，我自爆。\nability(奥术风暴:589) [enemy(神仙鱼:1296).active]\nability(法力澎湃:489) [enemy(神仙鱼:1296).active]\nability(扫尾:122) [enemy(思络:1298).active]\nability(自爆:282) [enemy(小溪:1297).hp<560 & enemy(小溪:1297).ability(潜水:564).duration>0]\nability(雷霆之箭:779) [enemy(小溪:1297).active]\nability(吐息:115) \nchange(机械熊猫人幼龙:844) [self(节点雏龙:1165).dead]",
				},
				[139987] = {
					["author"] = "弄妆梳洗迟-古尔丹",
					["name"] = "刺脊",
					["code"] = "ability(强力球:566) [self.aura(机械:244).exists]\nability(增压:208) [self.aura(旋紧发条:458).exists]\nability(旋紧发条:459)\nability(奥术风暴:589)\nchange(next)",
				},
				[119346] = {
					["author"] = "弄妆梳洗迟-古尔丹",
					["name"] = "倒霉的迪菲亚强盗",
					["code"] = "ability(狩猎小队:921) [enemy.aura(黑爪:918).exists]\nability(跳跃:364) [enemy.aura(破碎防御:542).exists]\nability(跳跃:364) [enemy.aura(黑爪:918).exists]\nability(黑爪:919)\nchange(翡翠始祖龙宝宝:1167) [self(赞达拉撕踝者:1211).dead]\nability(翡翠之咬:525)",
				},
				["海难俘虏02"] = {
					["name"] = "海难俘虏03",
					["code"] = "quit [round = 1 & self.hpp < 100 ]\nchange(next) [self.dead]\nability(诡雷陷阱) [enemy.aura(亡灵).exists]\nability(心碎) [round = 1 ]\nability(发脾气)\nchange(#2) [round = 5 ]\nability(眩光) [enemy(#1).dead & enemy(#2).hp>901]\nability(末日决战)\nability(格林奇的礼物)\nstandby",
				},
				[94643] = {
					["author"] = "Believer-古尔丹",
					["name"] = "泥蛙",
					["code"] = "ability(掠食之击:518) [enemy.aura(破碎防御:542).exists]\nability(狂风:514) [enemy.aura(破碎防御:542).exists]\nability(隼龙围攻！:1773)\nquit [self.aura(被变形:822).exists & enemy(泥蛙:1679).active]\nstandby",
				},
				[141529] = {
					["name"] = "罗祖",
					["code"] = "change(虚空精灵龙:557) [self(#3).active]\nability(蜷伏:165) [enemy.aura(丝茧:505).exists]\nability(掠食之击:518) [enemy.aura(破碎防御:542).exists]\nability(隼龙围攻！:1773)\nability(生命交换:277) [enemy(钟摆:2336).active && enemy(钟摆:2336).ability(茧缚之击:506).weak]\nability(月火术:595) [enemy(莫拉泽:2335).active] \nability(奥术冲击:421)\nchange(雪羽雏龙:1974)",
				},
				[116792] = {
					["name"] = "菲西亚",
					["code"] = "ability(增压:208) [self.aura(旋紧发条:458).exists]\nability(旋紧发条:459) [self.aura(旋紧发条:458).exists]\nability(强力球:566) [enemy.hp<486]\nability(旋紧发条:459)",
				},
				[99035] = {
					["author"] = "弄妆梳洗迟-古尔丹",
					["name"] = "杜里安·强果",
					["code"] = "ability(#1) [round=1]\nchange(#3) [round =2]\nability(群殴:581) [enemy.aura(黑爪:918).exists]\nability(黑爪:919) \nchange(哨兵之友:1567) [self(#3).dead]\nability(虚无之界:998) [enemy.aura(飞行:341).exists]\nability(灵魂奔袭:752) [self.ability(虚无之界:998).duration>2]\nability(黑暗利爪:1233)",
				},
				[141969] = {
					["name"] = "刺叶",
					["code"] = "ability(群殴:581) [enemy.aura(黑爪:918).exists]\nability(黑爪:919)",
				},
				[105842] = {
					["author"] = "弄妆梳洗迟-古尔丹",
					["name"] = "克洛玛顿",
					["code"] = "ability(严寒:786) [enemy.aura(严寒:785).duration<1]\nability(恶兆诅咒:1068) [enemy.aura(恶兆诅咒:1067).duration<1]\nability(召唤闪电:204)\nability(切削之风:420) [enemy.aura(防御削弱:516).exists]\nability(飞越:515)\nchange(小旋风:445) [enemy.aura(恶兆诅咒:1067).exists] \nchange(不祥焰灵:1335) [enemy.aura(严寒:785).exists]",
				},
				[107489] = {
					["author"] = "弄妆梳洗迟-古尔丹",
					["name"] = "阿玛利亚",
					["code"] = "quit [self(#2).hpp<100 &round=1] \nquit [self(#3).dead]\nchange(next) [self.dead] \nchange(#3) [enemy(#1).dead &enemy(#2).dead &round<=5] \nchange(#2) [enemy(#1).dead &enemy(#2).active &round<=5] \nif [self(#1).active &enemy(#1).active] \nability(#2) \nability(#3) \nendif \nif [self(#2).active] \nability(#3) [!self.aura(抽水).exists] \nability(#1) [enemy(#3).active & enemy.hp<=351 &!enemy(#3).aura(无法攻击:1358).exists ] \nability(#3) [enemy(#3).active &self.aura(抽水).exists &!enemy(#3).aura(无法攻击:1358).exists ] \nability(#1) [enemy(#2).active] \nstandby \nendif \nability(#1) [self(#3).active &enemy(#2).active ] \nif [self(#3).active] \nability(#1) [enemy(#3).active & enemy.hp<=329 &!enemy(#3).aura(无法攻击:1358).exists ] \nability(#2) [enemy(#3).active &self.hp<1200 & enemy.aura(无法攻击).duration = 2] \nability(#3) [enemy(#3).active &self.aura(抽水).exists ] \nability(#3) [enemy(#3).active &enemy.aura(无法攻击).duration = 1 ] \nability(#1) [!enemy(#3).aura(无法攻击:1358).exists] \nstandby \nendif",
				},
				[68565] = {
					["author"] = "弄妆梳洗迟-古尔丹",
					["name"] = "尼顿",
					["code"] = "change(next) [self.dead]\nability(群殴:581) [enemy.aura(黑爪:918).exists]\nability(黑爪:919)",
				},
				[66466] = {
					["author"] = "弄妆梳洗迟-古尔丹",
					["name"] = "“冷血”崔克斯",
					["code"] = "--步骤：机械龙，1雷霆，2-4吐息(或5)；对方二号上场，5吐息，6自爆，7换步行炸弹，雷区，8猛击；对方三号上场，9自爆。\nability(雷霆之箭:779)\nability(自爆:282) [enemy(霜喉:928).hp<900 & enemy(霜喉:928).hp>560 & self(机械熊猫人幼龙:844).active]\nability(吐息:115)\nchange(步行炸弹:85) [self(机械熊猫人幼龙:844).dead]\nability(雷区:634)\nability(自爆:282) [enemy(眩光:927).active]\nability(猛击:455)",
				},
				[117950] = {
					["author"] = "弄妆梳洗迟-古尔丹",
					["name"] = "薇希萨夫人",
					["code"] = "ability(蠕行真菌:743) [round=1]\nability(奥术风暴:589) \nability(扫尾:122) [round=3]\nability(法力澎湃:489) [round=4]\nstandby [enemy(诱惑:2013).hp<690 & self(节点雏龙:1165).active]\nability(扫尾:122)\nchange(赤红孢子:1537) [self(节点雏龙:1165).dead]\nability(自爆:282)",
				},
				[154924] = {
					["name"] = "金机XD",
					["code"] = "ability(毒蛰:2113) [round=1]\nability(假死:568) [round=2]\nability(火焰之盾:1754)\nability(闪电之盾:906)\nability(烈焰喷射:503)",
				},
				[117934] = {
					["author"] = "弄妆梳洗迟-古尔丹",
					["name"] = "希丝克斯",
					["code"] = "ability(隐没:440) [round=1]\nability(月火术:595) [round =2]\nability(奥术冲击:421) [round =3]\nability(奥术冲击:421) [round =4]\nability(奥术冲击:421) [round =5]\nability(隐没:440) [round =6]\nability(奥术冲击:421) [round =7]\nability(奥术冲击:421) [round =8]\nability(奥术冲击:421) [round =9]\nability(奥术冲击:421) [round=10]\nability(隐没:440) [round =11]\nability(月火术:595) [round =12]\nability(奥术冲击:421)\nchange(钢铁星弹:1387) [self(虚空精灵龙:557).dead]\nability(自爆:282) [enemy.hp<690]\nability(强力球:566)\nstandby",
				},
				[139489] = {
					["author"] = "弄妆梳洗迟-古尔丹",
					["name"] = "赫尔墨斯船长",
					["code"] = "ability(铁皮:1758)\nability(掠食之击:518) [enemy.aura(破碎防御:542).exists]\nability(隼龙围攻！:1773)\nchange(next)",
				},
				[116788] = {
					["author"] = "弄妆梳洗迟-古尔丹",
					["name"] = "变异利齿鳄",
					["code"] = "ability(奥术风暴:589)\nability(法力澎湃:489) [enemy(变异飞蛇:1987).active]\nability(扫尾:122) [self.speed <220]\nability(法力澎湃:489) [weather(奥术之风:590).duration>0]\nability(扫尾:122)\nchange(next)",
				},
				[128017] = {
					["author"] = "弄妆梳洗迟-古尔丹",
					["name"] = "阿古斯的腐化之血",
					["code"] = "--待命。萝卜上场，严寒+铁木树皮。被换不祥焰灵，恶兆诅咒+灼燃大地+灵火之箭，被换小旋风。召唤闪电，敌挂，8轮敌挂\nstandby [round=1]\nability(铁木树皮:962) [enemy.aura(严寒:785).exists]\nability(严寒:786)\nability(灵火之箭:1066) [weather(灼燃大地:171).duration>0]\nability(灼燃大地:172) [enemy.aura(恶兆诅咒:1067).exists]\nability(恶兆诅咒:1068)\nability(切削之风:420) [weather(闪电风暴).duration>0]\nability(召唤闪电:204)",
				},
				[71933] = {
					["author"] = "懒起画蛾眉-古尔丹",
					["name"] = "布林顿4000",
					["code"] = "ability(致盲剧毒:1049) [round=2]\nability(致盲剧毒:1049) [enemy(存钱罐:1279).active]\nability(穿刺创伤:1050) [enemy.aura(致盲剧毒:1048).exists]\nability(毒牙:156) \nability(喷泉:418) [enemy(小布:1277).hp>500 ]\nability(冰枪术:413) [enemy.aura(冰霜震击:415).exists]\nability(冰霜震击:416)\nchange(#3) [self(致死小蝰蛇:1330).dead]\nchange(小水花:535) [self(#3).active]",
				},
				[94644] = {
					["author"] = "Believer-古尔丹",
					["name"] = "黑暗魔眼",
					["code"] = "ability(原始嗥叫:920) [round=1]\nability(黑爪:919) [round=2]\nability(狩猎小队:921) [round=3]\nability(原始嗥叫:920)\nability(黑爪:919)",
				},
				[91361] = {
					["author"] = "弄妆梳洗迟-古尔丹",
					["name"] = "库拉·雷蹄",
					["code"] = "ability(群殴:581) [enemy.aura(黑爪:918).exists]\nability(飞羽:184) [enemy.aura(黑爪:918).exists]\nability(飞羽:184) [enemy.aura(破碎防御:542).exists]\nability(黑爪:919)\nchange(next) [self.dead]",
				},
				[105386] = {
					["name"] = "瑞迪尔62",
					["code"] = "quit [ self(德莱尼微型防御者).active & round=1 ] \nchange(德莱尼微型防御者) [enemy.aura(嚎叫).exists] \nchange(next) [self.dead] \nability(嚎叫) \nability(离子炮) \nquit",
				},
				["海难俘虏保底"] = {
					["name"] = "海难俘虏03",
					["code"] = "change(#1) [self.dead]\nchange(#3) [self.dead]\nstandby [round = 4]\nchange(#2) [round = 3]\nchange(#3) [enemy.aura(亡灵).exists]\nability(诡雷陷阱) \nability(格林奇的礼物) \nability(烈焰喷射) [enemy.hp=864]\nability(末日决战) [enemy.hp<362]\nability(能量涌动) [enemy(#3).active]\nability(#1)\nstandby",
				},
				["加尔维斯顿先生03"] = {
					["name"] = "加尔维斯顿先生02",
					["code"] = "quit [self.count<3] \nquit [self(#3).active & enemy(#3).active] \nchange(#2) [self(#1).dead] \nability(#3) [round=6] \nability(#3) [self(#2).active] \nability(#2) [self(#2).active] \nability(#1)",
				},
				[66815] = {
					["author"] = "弄妆梳洗迟-古尔丹",
					["name"] = "鲍丁·固拳",
					["code"] = "ability(甲壳护盾:310) [self.aura(甲壳护盾:309).duration<1]\nability(治疗波:123) \nability(汹涌:509)\nchange(机械熊猫人幼龙:844) [self(君王蟹:746).dead & enemy(脆脆:983).active]\nability(自爆:282) [enemy(脆脆:983).hp<560]\nability(雷霆之箭:779)\nability(吐息:115)\nstandby\nquit",
				},
				[97709] = {
					["author"] = "弄妆梳洗迟-古尔丹",
					["name"] = "驯宠大师弗鲁莫斯",
					["code"] = "quit [ self.level<25  & round=1 ] \nchange(next) [ self.dead ] \nability(黑爪) [ !enemy.aura(黑爪).exists & self(#2).active ] \nability(#2) [self(#1).active] \nability(#1) [round=2] \nability(#3)",
				},
				[105387] = {
					["author"] = "弄妆梳洗迟-古尔丹",
					["name"] = "安杜斯",
					["code"] = "ability(#1) [round=1]\nchange(伊奇:1532) [round=2]\nability(群殴:581) [enemy.aura(黑爪:918).exists]\nability(黑爪:919)",
				},
				[87122] = {
					["author"] = "弄妆梳洗迟-古尔丹",
					["name"] = "加戈拉",
					["code"] = "ability(雷区:634) [round =1]\nability(猛击:455) [enemy(沃夫斯:1550).active]\nability(自爆:282) [enemy(范拉:1552).active]\nability(震慑:646)\nability(离子炮:209) [enemy(沃夫加:1553).hp<1050]\nchange(#3) [self(步行炸弹:85).dead]\nchange(展览馆管理员:1227) [self(#3).active]",
				},
				[66738] = {
					["author"] = "弄妆梳洗迟-古尔丹",
					["name"] = "勇敢的尹勇",
					["code"] = "quit [self.count<3]\nstandby [self(翡翠始祖龙宝宝:1167).active & enemy(咩咩:1001).active & enemy(咩咩:1001).hp<600]\nability(翡翠灵气:597) [round=2]\nability(原始之击:612) [enemy(兔兔:1002).aura(肾上腺素:161).exists & enemy(兔兔:1002).active]\nability(翡翠灵气:597) [self.aura(翡翠灵气:823).duration<2 & enemy(兔兔:1002).active]\nability(翡翠之咬:525)\nability(离子炮:209) [enemy(咩咩:1001).hp<1050]\nability(震慑:646)\nchange(#3) [self(翡翠始祖龙宝宝:1167).dead]\nchange(展览馆管理员:1227) [self(#3).active]",
				},
				[146001] = {
					["name"] = "吵吵机器人原型机",
					["code"] = "ability(灼燃大地:172) [enemy.ability(吵吵护盾:2225).duration=0]\nability(灼燃大地:172) [enemy.aura(吵吵护盾:2226).exists]\nstandby [enemy.ability(吵吵护盾:2225).duration=0]\nstandby [enemy.aura(吵吵护盾:2226).exists]\nability(焚烧:179)\nability(燃烧:113)\nchange(next)",
				},
				[68555] = {
					["author"] = "弄妆梳洗迟-古尔丹",
					["name"] = "贪吃的卡瓦",
					["code"] = "ability(狩猎小队:921) [enemy.aura(黑爪:918).exists]\nability(跳跃:364) [enemy.aura(黑爪:918).exists]\nability(黑爪:919)",
				},
				[128022] = {
					["author"] = "弄妆梳洗迟-古尔丹",
					["name"] = "小贼",
					["code"] = "change(next) [self.dead]\nability(群殴:581) [enemy.aura(黑爪:918).exists]\nability(飞羽:184) [enemy.aura(黑爪:918).exists]\nability(飞羽:184) [enemy.aura(破碎防御:542).exists]\nability(黑爪:919)",
				},
				[66551] = {
					["author"] = "弄妆梳洗迟-古尔丹",
					["name"] = "拉斯安",
					["code"] = "--1雷霆之箭，2-5吐息到对方死； 对方二号上， 6吐息，7自爆，8换步行炸弹，雷区，9猛击； 对方三号上， 10猛击，11自爆。",
				},
				[105323] = {
					["author"] = "弄妆梳洗迟-古尔丹",
					["name"] = "远古墓穴蛛卵",
					["code"] = "ability(强力球:566) [self.aura(致盲剧毒:1048).exists & self.aura(旋紧发条:458).exists]\nability(旋紧发条:459)\nchange(节点雏龙:1165) [self.dead & enemy(墓穴蝙蝠:1861).active]\nability(奥术风暴:589)\nability(法力澎湃:489)\nability(冰霜吐息:782)\nchange(next) [self.dead]",
				},
				[71934] = {
					["author"] = "懒起画蛾眉-古尔丹",
					["name"] = "艾恩·戈德布鲁姆博士",
					["code"] = "--混沌上场，换机械龙。次轮放诱饵。第3轮换小宠。第4轮换回机械龙。之后击中3次吐息(可能需补个雷霆之箭)，结束\nchange(机械熊猫人幼龙:844) [self(#3).active]\nability(诱饵:334) \nchange(虚空精灵龙:557) [round=2]\nability(月火术:595) [round=3]\nability(生命交换:277) [enemy(三角小龙:1268).active & enemy(三角小龙:1268).aura(肾上腺素:161).exists]\nchange(机械熊猫人幼龙:844) [enemy(混沌:1271).active]\nability(奥术冲击:421)\nchange(#3) [self.aura(诱饵:333).exists]\nability(吐息:115)",
				},
				[94645] = {
					["author"] = "弄妆梳洗迟-古尔丹",
					["name"] = "荒爪",
					["code"] = "ability(喷泉:418) [round =1]\nchange(伊奇:1532) [round =2 ]\nability(群殴:581) [enemy.aura(黑爪:918).exists]\nability(飞羽:184) [enemy.aura(破碎防御:542).exists]\nability(黑爪:919)",
				},
				[91362] = {
					["author"] = "弄妆梳洗迟-古尔丹",
					["name"] = "库拉·雷蹄",
					["code"] = "ability(雷霆之箭:779)\nability(法力澎湃:489)\nability(扫尾:122)\nchange(next) [self.dead]",
				},
				[146002] = {
					["name"] = "诺莫瑞根护卫狼",
					["code"] = "ability(灼燃大地:172)\nability(焚烧:179)\nability(燃烧:113)",
				},
				[105674] = {
					["author"] = "弄妆梳洗迟-古尔丹",
					["name"] = "维雷尼",
					["code"] = "--暴风雪+诡雷陷阱+冰枪术，牺牲，上霍格斯，奔踏杀敌。老鼠上场中陷阱，奔踏完后恶意切割，敌挂。奔踏+迎头冲撞，敌挂\nability(召唤暴风雪:206)\nability(诡雷陷阱:1080)\nability(冰枪术:413)\nability(奔踏:163) [enemy.aura(破碎防御:542).duration=0]\nability(奔踏:163) [enemy.aura(生存:284).exists]\nability(迎头冲撞:376) [enemy(迪娜:1875).active]\nability(恶意切割:1223)\nchange(霍格斯:1384) [self(腐化的小助手:1349).dead]\nstandby",
				},
				[150911] = {
					["name"] = "地穴恶魔",
					["code"] = "change(剥石者幼崽:514) [enemy.type= 龙类]\nability(困惑之刺:632) [!enemy(地穴恶魔:2597).aura(困惑之刺:633).exists]\nability(蜂拥:706) [!enemy(#2)).aura(破碎防御:542).exists]\nability(抓挠:119)\nif [self(兴奋的萤火虫:747).active & !enemy(痛苦的灵魂:2611).aura(破碎防御:542).exists]\nability(蜂拥:706)\nendif\nchange(next) [self.dead]\nability(躲闪:312) [self(复活节兔宝宝:1943).hpp < 33 ]\nability(钻地:159) [enemy.aura(亡灵:242).exists]\nability(乱舞:360)\nability(脚踢:307)\nability(迅猛突袭:713)\nability(偏斜:490)",
				},
				[72285] = {
					["author"] = "懒起画蛾眉-古尔丹",
					["name"] = "赤芝，赤精的雏鸟",
					["code"] = "--首轮小鬼自燃。次轮狂野魔法。第3轮换软泥。第4轮酸蚀粘液。第5轮腐蚀。第6轮吸收。7轮结束。\nability(自燃:409) [round=1]\nability(狂野魔法:592) [round=2]\nchange(翡翠软泥怪:446) [round=3]\nability(酸蚀粘液:369) [round=4]\nability(腐蚀:447) [round=5]\nability(净除:450) [enemy.ability(虚无之界:998).duration>0]\nability(吸收:449) \nchange(变异软泥怪:1920) [self(翡翠软泥怪:446).dead]",
				},
				[66739] = {
					["name"] = "废土行者苏游",
					["code"] = "change(next) [self.dead]\nquit [self(#2).dead & enemy(#1).active]\nquit [self(#2).active & enemy(#2).active]\nquit [self(#1).dead & enemy(#2).active]\nstandby [round = 1]\nstandby [enemy(#1).active & enemy.hp<=342 & enemy.round = 7]\nuse(122) [self(#3).active &enemy(#1).active]\nuse(279) [self(#2).active & self.round = 1]\nchange(#2) [self(#1).active]\nuse(589) [!weather(590)]\nuse(387)\nuse(116)\nuse(489)\nuse(122)",
				},
				[85625] = {
					["author"] = "弄妆梳洗迟-古尔丹",
					["name"] = "挑战木桩",
					["code"] = "change(幼年瓦格里:1238) [self(吓人的箱子:321).dead]\nability(厄运诅咒:218)\nability(鬼影缠身:652)\nability(死亡之握:780) [enemy.aura(痛苦:469).exists]\nability(吞食:538) [enemy.aura(痛苦:469).exists]\nability(痛苦:468)\nability(幽魂之咬:654) [enemy.hp<710]\nability(吞噬:160)\nability(狂乱之击:666)\nchange(next) [self.dead]",
				},
				[87123] = {
					["author"] = "弄妆梳洗迟-古尔丹",
					["name"] = "维沙尔",
					["code"] = "--步骤：1小宠，待命，2换永恒雏龙，3先发优势，4虚弱，5扫尾，6扫尾；7敌人机械卫士上，先发优势，对方复生。8待命阵亡，9换节点雏龙奥术风暴324,10-11法力澎湃结束。\nstandby [round=1]\nchange(永恒雏龙:1161) [round=2]\nability(先发优势:405) [round=3]\nability(虚弱:471) [round=4]\nability(先发优势:405) [enemy(埃匹希斯卫士:1559).active]\nability(奥术风暴:589)\nability(法力澎湃:489)\nability(扫尾:122) \nchange(节点雏龙:1165) [self(永恒雏龙:1161).dead]",
				},
				[145971] = {
					["name"] = "蟑螂",
					["code"] = "--伴生换宠 \nchange(next) [enemy.ability(震荡干涉:938).usable & !weather(奥术之风:590)] \nchange(next) [enemy.ability(铁钻冲锋:1921).usable & self.hp <= 325 & self.type != 元素] \nchange(next) [enemy.ability(铁钻冲锋:1921).usable & self.hp <= 217 & self.type = 元素] \nchange(#1) [self.dead] \nchange(#2) [self.dead] \nchange(#3) [self.dead] \n----------------------- \nstandby [enemy.aura(躲闪:2060).exists] \nuse(奥术风暴:589) \nuse(法力澎湃:489) [enemy.type != 机械] \nuse(雷霆之箭:779) [enemy.type = 机械] \nuse(扫尾:122) [self.speed.slow] \nuse(法力澎湃:489) \nuse(扫尾:122)",
				},
				[146003] = {
					["name"] = "诺莫瑞根护卫虎",
					["code"] = "ability(寒冰之墓:624)\nability(召唤暴风雪:206)\nability(冰枪术:413)",
				},
				[128016] = {
					["author"] = "弄妆梳洗迟-古尔丹",
					["name"] = "曳影兽",
					["code"] = "ability(虚无之界:998)\nability(太阳光:404)\nability(自爆:282)\nchange(#2)\nchange(#3)",
				},
				[104782] = {
					["author"] = "弄妆梳洗迟-古尔丹",
					["name"] = "饥饿的冰牙",
					["code"] = "ability(增压:208) [self.aura(旋紧发条:458).exists]\nability(旋紧发条:459)",
				},
				[140813] = {
					["author"] = "弄妆梳洗迟-古尔丹",
					["name"] = "菲基·闪哨",
					["code"] = "ability(潜水:564)\nability(净化之雨:230) [weather(净化之雨:229).duration<1]\nability(抽水:297) [self.aura(抽水:296).exists]\nability(抽水:297) [enemy.hp>549&self.hp>770]\nability(水流喷射:118)\nchange(next)",
				},
				[128019] = {
					["author"] = "弄妆梳洗迟-古尔丹",
					["name"] = "凝视者",
					["code"] = "change(next) [self.dead]\nability(狩猎小队:921) [enemy.aura(黑爪:918).exists]\nability(跳跃:364) [enemy.aura(黑爪:918).exists]\nability(黑爪:919)",
				},
				[94642] = {
					["author"] = "Believer-古尔丹",
					["name"] = "灾火",
					["code"] = "ability(喷泉:418) [round=1]\nchange(被感染的松鼠:627)\nability(奔踏:163) [enemy.aura(狂犬病:807).exists]\nability(狂乱之击:666)",
				},
				[94646] = {
					["author"] = "Believer-古尔丹",
					["name"] = "德拉诺污血怪",
					["code"] = "ability(狩猎小队:921) [enemy.aura(黑爪:918).exists]\nability(黑爪:919)\nchange(永茂小孔雀:1566) [self.dead]\nability(飞羽:184)",
				},
				[146004] = {
					["name"] = "诺莫瑞根护卫机械陆行鸟",
					["code"] = "ability(寒冰之墓:624) [enemy.hp>740]\nability(召唤暴风雪:206)\nability(冰枪术:413)\nability(焚烧:179) [enemy.aura(献祭:177).exists &&!enemy.aura(亡灵:242).exists]\nability(燃烧:113) [enemy.aura(献祭:177).exists]\nability(献祭:178)\nchange(next)",
				},
				[91363] = {
					["author"] = "弄妆梳洗迟-古尔丹",
					["name"] = "库拉·雷蹄",
					["code"] = "ability(抽水:297) [self.aura(抽水:296).exists]\nability(水流喷射:118) [self.hp<450]\nability(水流喷射:118) [self.aura(致盲剧毒:1048).exists]\nability(水流喷射:118) [enemy.hp<439]\nability(净化之雨:230) [weather(泥石流:718).duration>0]\nability(抽水:297)\nchange(next) [self.dead]\nability(飞羽:184) [enemy.aura(破碎防御:542).exists]\nability(群殴:581) [enemy.aura(黑爪:918).exists]\nability(黑爪:919)",
				},
				[128024] = {
					["author"] = "弄妆梳洗迟-古尔丹",
					["name"] = "小乌",
					["code"] = "ability(躲闪:312) [enemy.ability(安塔恩火炮:1968).duration=0]\nability(抓挠:119) [enemy.aura(破碎防御:542).exists]\nability(跳跃:364) [enemy.aura(破碎防御:542).exists]\nability(咀嚼:541)\nability(蜂拥:706)\nability(奔踏:163)\nchange(next)",
				},
				[66822] = {
					["author"] = "弄妆梳洗迟-古尔丹",
					["name"] = "高兹·怨怒",
					["code"] = "--1旋涡,2治疗波,3-4汹涌； 敌人二号上场, 5旋涡，6治疗波，7-8汹涌，9旋涡，10-11汹涌，12步行雷区，13震击； 对方三号上，14震击，15自爆。",
				},
				[116787] = {
					["author"] = "弄妆梳洗迟-古尔丹",
					["name"] = "变异飞蛇",
					["code"] = "ability(奥术风暴:589)\nability(法力澎湃:489) [enemy(变异飞蛇:1987).active]\nability(扫尾:122) [self.speed <220]\nability(法力澎湃:489) [weather(奥术之风:590).duration>0]\nability(扫尾:122)",
				},
				[99077] = {
					["author"] = "弄妆梳洗迟-古尔丹",
					["name"] = "布蕾达·柔鬃",
					["code"] = "ability(咀嚼:541)\nability(钻地:159) [enemy.aura(破碎防御:542).duration>1]\nability(蜂拥:706)\nchange(赞达拉撕踝者:1211)\nability(狩猎小队:921) [enemy.aura(黑爪:918).exists]\nability(黑爪:919)\nchange(节点雏龙:1165)\nability(奥术风暴:589)\nability(法力澎湃:489)",
				},
				[142151] = {
					["name"] = "碎击龙",
					["code"] = "ability(黑爪:919) [round=1]\nability(狩猎小队:921) [round=2]\nability(血牙:917)\nability(离子炮:209)\nstandby",
				},
				[87124] = {
					["author"] = "弄妆梳洗迟-古尔丹",
					["name"] = "阿什雷",
					["code"] = "ability(雷区:634) [round=1]\nability(猛击:455) [enemy(精铃:1547).active]\nability(自爆:282) [enemy(多多:1548).hp<650 & enemy(多多:1548).active]\nability(雷区:634) [enemy(多多:1548).active]\nability(猛击:455)",
				},
				[150914] = {
					["name"] = "游荡幻影",
					["code"] = "change(next) [self.dead]\nability(困惑之刺:632) [!enemy(#1).aura(困惑之刺:633).exists]\nability(蜂拥:706)\nability(钻地:159) [enemy.aura(亡灵:242).exists]\nif [self(春兔:200).hpp < 33]\nability(躲闪:312)\nendif\nability(乱舞:360)\nability(#2) [enemy(溃烂食腐者:2598).aura(亡灵:242).exists]\nability(#3)\nability(#1)",
				},
				[146005] = {
					["name"] = "浮肿的麻风鼠",
					["code"] = "ability(吸血:1043)\nchange(next)",
				},
				[106552] = {
					["author"] = "我会招恶魔-亡语者",
					["name"] = "守夜人梅瑞尔",
					["code"] = "--黑爪+群殴杀敌。黑爪+群殴，与幽灵同归于尽。上小宠，不必点技能，直接换虚空龙，不管是否被催眠，待命到中“法术反制”后放“生命交换”，月火+奥冲杀敌\nchange(虚空精灵龙:557) [self(#3).active]\nability(群殴:581) [enemy.aura(黑爪:918).exists]\nability(黑爪:919)\nstandby [enemy(优美的飞蛾:1899).ability(法术反制:308).duration=0 & self(虚空精灵龙:557).ability(生命交换:277).duration=0]\nability(生命交换:277)\nability(月火术:595)\nability(奥术冲击:421)\nchange(#3) [self(伊奇:1532).dead]",
				},
				[141479] = {
					["name"] = "布尔利",
					["code"] = "ability(幽魂之咬:654) [self.aura(亡灵:242).exists]\nability(吞噬魔法:1231) [enemy(蒂姆波:2330).aura(亡灵:242).exists]\nability(鬼影缠身:652) [enemy(波奇:2332).active&enemy(波奇:2332).hpp<100]\nability(幽魂之咬:654) [enemy.hp<690 &enemy(小布尔利:2333).active]\nability(重蹄:493)\nability(幽冥之声:1397) [enemy.aura(亡灵:242).exists]\nability(抓挠:119) \nchange(霜狼幽灵幼崽:1530) [self(#1).dead]\nchange(#3) [self(霜狼幽灵幼崽:1530).dead]\nstandby",
				},
				[85632] = {
					["author"] = "弄妆梳洗迟-古尔丹",
					["name"] = "挑战木桩",
					["code"] = "change(next) [self.dead]\nability(狂暴:124)\nability(痛殴:350)\nability(跳跃:364)\nability(尖网:382) [enemy.aura(尖网:381).duration<2]\nability(汲取生命:383)\nability(飞掠:626)",
				},
				[128020] = {
					["author"] = "弄妆梳洗迟-古尔丹",
					["name"] = "小胖",
					["code"] = "ability(狩猎小队:921) [enemy.aura(黑爪:918).exists]\nability(血牙:917) [enemy.aura(黑爪:918).exists]\nability(血牙:917) [enemy.aura(破碎防御:542).exists]\nability(黑爪:919)\nchange(next) [self.dead]",
				},
				[115286] = {
					["author"] = "弄妆梳洗迟-古尔丹",
					["name"] = "克丽萨",
					["code"] = "change(next) [self.dead]\nability(月火术:595) [round =1]\nability(生命交换:277) [enemy(飞飞:1981).active]\nstandby [enemy(嗡嗡:1982).hp<690 & self(虚空精灵龙:557).active]\nstandby [self(钢铁星弹:1387).active & enemy(嗡嗡:1982).aura(飞行:341).exists]\nability(奥术冲击:421) \nability(自爆:282) [enemy.hp< 690 & enemy(嗡嗡:1982).ability(离地升空:170).duration>0 & enemy(嗡嗡:1982).aura(飞行:341).duration=0 & enemy(嗡嗡:1982).ability(洋洋自得:1545).duration>0]\nability(强力球:566)\nstandby",
				},
				[85622] = {
					["author"] = "弄妆梳洗迟-古尔丹",
					["name"] = "挑战木桩",
					["code"] = "ability(群殴:581) [enemy.aura(黑爪:918).exists]\nability(黑爪:919)\nchange(next)",
				},
				[141002] = {
					["name"] = "艾丽·维恩",
					["code"] = "ability(奔踏:163) [enemy.aura(亡灵:242).exists]\nability(抓挠:119)\nability(吐息:115) [enemy.aura(破碎防御:542).exists]\nability(诱饵:334)\nability(吐息:115)\nchange(next)",
				},
				[91364] = {
					["author"] = "弄妆梳洗迟-古尔丹",
					["name"] = "库拉·雷蹄",
					["code"] = "ability(狩猎小队:921) [enemy.aura(黑爪:918).exists]\nability(跳跃:364) [enemy.aura(黑爪:918).exists]\nability(跳跃:364) [enemy.aura(破碎防御:542).exists]\nability(黑爪:919)\nchange(next)",
				},
				[140461] = {
					["name"] = "呆伯特·麦克林特",
					["code"] = "ability(强力球:566) [enemy.hp<243]\nability(增压:208) [self.aura(旋紧发条:458).exists]\nability(旋紧发条:459)\nchange(next)",
				},
				[142054] = {
					["name"] = "库萨",
					["code"] = "ability(狂暴:124)\nchange(next)",
				},
				[68462] = {
					["author"] = "弄妆梳洗迟-古尔丹",
					["name"] = "熊猫人流水之灵",
					["code"] = "ability(躲闪:312) [round=3]\nability(自然守护:574) [round=11]\nability(空袭:504)\nability(自爆:282) [enemy(熊猫人水灵:1138).hp<690]\nability(致盲粉:1015)\nability(蠕行真菌:743)\nchange(赤红孢子:1537) [self(恐爪鸟幼崽:1416).dead]",
				},
				[141799] = {
					["name"] = "格雷迪·普雷特",
					["code"] = "ability(增压:208) [self.aura(旋紧发条:458).exists]\nability(旋紧发条:459) [self.aura(旋紧发条:458).exists]\nability(强力球:566) [self.aura(机械:244).exists]\nability(旋紧发条:459)\nability(躲闪:312)\nability(乱舞:360)\nchange(next)",
				},
				[66741] = {
					["author"] = "弄妆梳洗迟-古尔丹",
					["name"] = "天选者亚济",
					["code"] = "standby [round=1]\nchange(#3) [round=2]\nability(黑爪:919) [round=3]\nability(原始嗥叫:920) [round=4]\nability(狩猎小队:921) [round=5]\nability(抱摔:532) [round=7]\nability(抱摔:532) [round=9]\nability(抱摔:532) [round=11]\nability(喷泉:418) [round=8]\nability(抓握:249)\nchange(踏浪者:1230) [self(赞达拉撕踝者:1211).dead]",
				},
				[87125] = {
					["author"] = "弄妆梳洗迟-古尔丹",
					["name"] = "塔拉鲁恩",
					["code"] = "standby [round=1]\nability(奥术风暴:589) [round=2]\nability(法力澎湃:489) [round=3]\nability(月火术:595)\nability(生命交换:277) [enemy(阿托蒙特:1562).active]\nability(奥术冲击:421) \nchange(#3) [self(节点雏龙:1165).dead]\nchange(虚空精灵龙:557) [self(#3).active]\nstandby",
				},
				[73626] = {
					["author"] = "懒起画蛾眉-古尔丹",
					["name"] = "新手小汤米",
					["code"] = "ability(建造炮塔:710)\nability(狩猎小队:921) [enemy.aura(黑爪:918).exists]\nability(黑爪:919)\nchange(发条侏儒:277) [self(#3).active]\nchange(#3)",
				},
				[85627] = {
					["author"] = "弄妆梳洗迟-古尔丹",
					["name"] = "挑战木桩",
					["code"] = "ability(奥术风暴:589)\nability(法力澎湃:489)\nchange(next)",
				},
				[68558] = {
					["author"] = "弄妆梳洗迟-古尔丹",
					["name"] = "血刺",
					["code"] = "ability(增压:208) [self.aura(旋紧发条:458).exists]\nability(旋紧发条:459)\nchange(next) [self.dead]",
				},
				[85659] = {
					["author"] = "弄妆梳洗迟-古尔丹",
					["name"] = "大嘴鸟",
					["code"] = "ability(奥术风暴:589)\nability(法力澎湃:489)",
				},
				[66550] = {
					["author"] = "弄妆梳洗迟-古尔丹",
					["name"] = "尼基·微技",
					["code"] = "--1雷霆之箭，2-6吐息； 对方二号上，7雷霆，8自爆(对方复生)，9我方雷区，10猛击；对方三号上场被雷区，11猛击(对方复生)，12自爆。(附注：自爆别打在2号飞天上)",
				},
				[128021] = {
					["author"] = "弄妆梳洗迟-古尔丹",
					["name"] = "啮耳者",
					["code"] = "ability(奥术风暴:589)\nability(法力澎湃:489)\nchange(next)",
				},
				[146932] = {
					["name"] = "大门控制台",
					["code"] = "ability(沐血:423) [enemy.aura(流血:491).exists]\nability(汹涌:509) [enemy.aura(流血:491).exists]\nability(割裂:803)\nchange(next)",
				},
				[94648] = {
					["name"] = "灵拳",
					["code"] = "ability(喷泉:418)\nchange(伊奇:1532)\nability(群殴:581) [enemy.aura(黑爪:918).exists]\nability(黑爪:919)",
				},
				[98489] = {
					["name"] = "海南俘虏01",
					["code"] = "quit [round = 1 & self.hpp < 100] \nchange(next) [self.dead] \nchange(#3) [enemy.aura(亡灵).exists] \nstandby [self(#3).active & enemy.aura(亡灵).exists] \nability(原始嗥叫) [round = 1] \nability(黑爪) [round = 2] \nchange(#2) [round = 3] \nability(奔踏) [round = 4] \nability(卷土重来) [self(#2).active] \nability(潜行)\nability(喂食)\nquit",
				},
				[66552] = {
					["author"] = "弄妆梳洗迟-古尔丹",
					["name"] = "纳洛克",
					["code"] = "--1雷霆之箭，2-5吐息；对方二号上，6吐息，7自爆，8换步行雷区，9猛击；对方三号上，10自爆",
				},
				[105840] = {
					["author"] = "弄妆梳洗迟-古尔丹",
					["name"] = "缝合三世",
					["code"] = "--341攻虚空精灵龙，先无意义奥冲，等他狂暴放月光，我方残血时生命交换，然后奥冲等下次狂暴他就死了。by 百度贴吧 惩戒面团\nability(月火术:595) [enemy(缝合三世:1880).aura(激怒:1391).exists]\nability(生命交换:277) [self(虚空精灵龙:557).hp<400]\nability(奥术冲击:421)",
				},
				[150917] = {
					["name"] = "驼背者",
					["code"] = "ability(困惑之刺:632)\nability(奔踏:163) [!enemy(驼背者:2602).aura(破碎防御:542).exists]\nability(卷土重来:253)\nability(#1)\nchange(next)",
				},
				[68463] = {
					["author"] = "弄妆梳洗迟-古尔丹",
					["name"] = "熊猫人烈焰之灵",
					["code"] = "change(next) [self.dead]\nuse(513) [enemy(#2).active & self(#3).active & self.round = 1]\nuse(593) [enemy(#3).active & enemy.round = 3]\nstandby [self(#1).active & enemy(#2).active]\nchange(#3) [self(#2).active]\nuse(456) [round = 1]\nuse(906)\nuse(1085)\nuse(297)",
				},
				[97804] = {
					["author"] = "弄妆梳洗迟-死亡之翼",
					["name"] = "蒂梵妮·尼尔森",
					["code"] = "ability(强力球:566) [round=1] \nability(灵魂尖刺:914) [round =2]\nability(强力球:566) [round=3]\nchange(灵猫魔宠:319) [round =4]\nability(石肤术:436) [round =5]\nability(潜行:536) [round =6]\nability(玛瑙之咬:437) \nability(复仇:997)\nability(强力球:566)\nchange(#3) [self(灵猫魔宠:319).dead]\nchange(暴怒小箭猪:1344) [self(#3).active]",
				},
				[87110] = {
					["author"] = "弄妆梳洗迟-古尔丹",
					["name"] = "可怕的塔尔",
					["code"] = "--步骤:1白骨蜘蛛,黏性之网，2汲取生命，3-5噬骨； 敌人二号上，6-7噬骨，我方昏迷，8待命。9噬骨(我方亡灵特效)，10噬骨，同归于尽；11敌人三号上，我方换小宠换满凋零雄鹰，12待命，13-14染疫之爪，15幽魂之咬，结束。\nability(粘性之网:339) [round=1]\nability(汲取生命:383) [round=2]\nability(噬骨:648)\nability(幽魂之咬:654) [enemy(角斗士莫叽姆斯:1556).hp<888]\nability(染疫之爪:117)\nstandby [self.aura(昏迷:927).exists]\nchange(#3) [self(巨型白骨蜘蛛:1143).dead]\nchange(凋零雄鹰:456) [self(#3).active]",
				},
				[66819] = {
					["author"] = "弄妆梳洗迟-古尔丹",
					["name"] = "布洛克",
					["code"] = "--：1斧喙鸟诱饵，2-3错乱，4-5空袭；敌人二号上场，6空袭，7-8错乱，9等死。10换步行炸弹雷区，11猛击一次；敌人三号上场，12-13猛击，14血低于650自爆。",
				},
				[104992] = {
					["author"] = "弄妆梳洗迟-古尔丹",
					["name"] = "恶魔之喉",
					["code"] = "ability(狩猎小队:921) [enemy.aura(黑爪:918).exists]\nability(跳跃:364) [enemy.aura(破碎防御:542).exists]\nability(跳跃:364) [enemy.aura(黑爪:918).exists]\nability(黑爪:919)\nchange(next) [self.dead]",
				},
				[142114] = {
					["name"] = "泰莉亚·火眉",
					["code"] = "change(节点雏龙:1165) [enemy(涡轮:2365).dead]\nability(奥术风暴:589)\nability(法力澎湃:489)\nability(扫尾:122)\nability(原始嗥叫:920) [round=1]\nability(狩猎小队:921) [enemy.aura(黑爪:918).exists]\nability(黑爪:919)\nchange(next)",
				},
				[68559] = {
					["author"] = "弄妆梳洗迟-古尔丹",
					["name"] = "诺诺",
					["code"] = "change(next) [self.dead]\nability(群殴:581) [enemy.aura(黑爪:918).exists]\nability(飞羽:184) [enemy.aura(破碎防御:542).exists]\nability(黑爪:919)\nability(掠食之击:518) [enemy.aura(破碎防御:542).exists]\nability(隼龙围攻！:1773)",
				},
				[150918] = {
					["name"] = "残忍的托米",
					["code"] = "ability(困惑之刺:632) [round = 1]\nability(蜂拥:706) [!enemy(残忍的托米:2603).aura(破碎防御:542).exists]\nability(抓挠:119)",
				},
				[116786] = {
					["author"] = "弄妆梳洗迟-古尔丹",
					["name"] = "变异小爪迅猛龙",
					["code"] = "ability(奥术风暴:589) [weather(奥术之风:590).duration<4]\nability(法力澎湃:489) [enemy(变异飞蛇:1987).active]\nability(扫尾:122) [self.speed <220]\nability(法力澎湃:489) [weather(奥术之风:590).duration>0]\nchange(next)",
				},
				[141292] = {
					["name"] = "德莉亚·哈那科",
					["code"] = "ability(飞羽:184) [enemy.aura(破碎防御:542).exists]\nability(群殴:581) [enemy.aura(黑爪:918).exists]\nability(黑爪:919)\nchange(next)",
				},
				[154926] = {
					["name"] = "CK-9型微型压制单位",
					["code"] = "ability(严寒:786) [round=1]\nchange(#3) [round=2]\nchange(#1) [self(#3).active]\nability(骨头风暴:1762)\nability(砍劈:943)\nability(群殴:581) [enemy.aura(黑爪:918).exists]\nability(黑爪:919)\nchange(#2)",
				},
				[94649] = {
					["author"] = "Believer-古尔丹",
					["name"] = "斯格里克斯",
					["code"] = "ability(鬼影缠身:652)\nchange(雪羽雏龙:1974)\nability(掠食之击:518) [enemy.aura(破碎防御:542).exists]\nability(隼龙围攻！:1773)",
				},
				[116789] = {
					["author"] = "懒起画蛾眉-古尔丹",
					["name"] = "斯卡姆之子",
					["code"] = "ability(灵火之箭:1066) [enemy.type=飞行]\nability(群殴:581) [enemy.aura(黑爪:918).exists]\nability(黑爪:919) \nability(灼燃大地:172)\nability(焚烧:179)\nability(灵火之箭:1066)\nchange(next)",
				},
				[154925] = {
					["name"] = "吱铛",
					["code"] = "ability(飞越:515) [round=1]\nability(雷霆之箭:779)\nability(自爆:282)\nability(焚烧:179) [enemy.aura(献祭:177).exists]\nability(献祭:178)\nchange(next)",
				},
				[85517] = {
					["author"] = "弄妆梳洗迟-古尔丹",
					["name"] = "挑战木桩",
					["code"] = "ability(湍流旋涡:513) [round=1]\nability(治疗波:123) [enemy(大眼萝卜:1484).active]\nability(汹涌:509)\nability(扫尾:122)\nchange(next)",
				},
				[66918] = {
					["author"] = "弄妆梳洗迟-古尔丹",
					["name"] = "探索者祖什",
					["code"] = "ability(湍流旋涡:513) [round=1]\nability(湍流旋涡:513) [round=6]\nability(猛咬:356) \nability(诱饵:334) [round=9]\nability(空袭:504)\nstandby [self.aura(昏睡).exists]\nchange(#3) [self(君王蟹:746).dead]\nchange(机械斧喙鸟:1403) [self(#3).active]",
				},
				[68464] = {
					["author"] = "弄妆梳洗迟-古尔丹",
					["name"] = "熊猫人微风之灵",
					["code"] = "ability(月火术:595) [round=1]\nability(生命交换:277) [enemy(哨尾:1136).active]\nability(奥术风暴:589)\nability(法力澎湃:489)\nability(冰霜吐息:782)\nchange(#3) [enemy(熊猫人风灵:1140).active]\nchange(节点雏龙:1165) [self(#3).active]\nability(奥术冲击:421)\nquit",
				},
				[105455] = {
					["author"] = "弄妆梳洗迟-古尔丹",
					["name"] = "诱捕者贾伦",
					["code"] = "--月火术，一直奥冲杀敌，敌复活后补月火术，剩余10血。龙虾人上场，生命交换+2个奥冲，敌复活后补月火术。恶魔犬上场奥冲后牺牲，后2只龙收尾",
				},
				[99742] = {
					["author"] = "弄妆梳洗迟-古尔丹",
					["name"] = "赫里奥苏斯",
					["code"] = "ability(群殴:581) [enemy.aura(黑爪:918).exists]\nability(黑爪:919)\nchange(next)",
				},
				["加尔维斯顿先生保底"] = {
					["name"] = "加尔维斯顿先生01",
					["code"] = "quit [self(阳焰瓦格里).active & round=1] \nquit [self.hp<1401 & round=1] \nchange(next) [self.dead] \nability(#2) [round=1] \nability(#3) [round=2] \nability(#1) [self(#3).active &enemy(#3).active &enemy.hp<=369] \nability(#3) [self.round=1 &!enemy(#1).active] \nability(#2) \nability(#1)",
				},
				[146183] = {
					["name"] = "活体汽油弹",
					["code"] = "ability(多刺甲壳:1073) [!self.aura(多刺甲壳:1074).exists]\nability(沐血:423) [enemy.aura(流血:491).exists]\nability(割裂:803)",
				},
				[85629] = {
					["author"] = "弄妆梳洗迟-古尔丹",
					["name"] = "挑战木桩",
					["code"] = "ability(抽水:297) [self.aura(抽水:296).exists]\nability(净化之雨:230) [self.aura(抽水:296).exists & weather(净化之雨:229).duration<1]\nability(水流喷射:118) [self.hp<500]\nability(水流喷射:118) [enemy.hp<420]\nability(抽水:297)\nchange(next)",
				},
				[68560] = {
					["author"] = "弄妆梳洗迟-古尔丹",
					["name"] = "灰蹄",
					["code"] = "ability(增压:208) [self.aura(旋紧发条:458).exists]\nability(旋紧发条:459) [self.hp>300]\nability(毒烟:640)\nchange(next) [self.dead]",
				},
				[71924] = {
					["author"] = "懒起画蛾眉-古尔丹",
					["name"] = "拉希奥",
					["code"] = "--阿莱克丝上场，我换回兔子，阿莱克丝放上古赐福。次轮兔子开躲闪躲掉烈焰喷射。第3、4、5轮奔踏，第6轮抓挠，第7轮奔踏，兔子阵亡，上剥石者。第8、9轮迅猛突袭，敌挂\n--小死上场，首轮迅猛突袭，小死放源质箭。次轮迅猛突袭，小死放翻滚。第3轮开偏斜躲源质箭。第4轮迅猛突袭，被打到半血以下，小死出龙类+50%效果。第5轮脚踢。第6轮迅猛突袭，结束\nchange(烟灰野兔:1778) [self(#3).active]\nability(躲闪:312) [self.aura(寒冰之墓:623).exists]\nchange(#3) [enemy(辛迪:1299).aura(亡灵:242).exists]\nability(抓挠:119) [enemy(辛迪:1299).active]\nability(抓挠:119) [enemy.aura(破碎防御:542).duration=2]\nability(奔踏:163) [enemy(阿莱克丝:1301).active]\nchange(剥石者幼崽:514)\nability(偏斜:490) [self.aura(源质箭:605).duration=1]\nability(脚踢:307) [enemy.aura(龙类:245).exists]\nability(迅猛突袭:713)",
				},
				[128007] = {
					["author"] = "弄妆梳洗迟-古尔丹",
					["name"] = "毁灭之蹄",
					["code"] = "ability(自我复制:1002) [self.aura(强化护甲:391).exists]\nability(金币雨:985)\nability(强化护甲:392)\nchange(next)",
				},
				[128023] = {
					["author"] = "弄妆梳洗迟-古尔丹",
					["name"] = "小型克西斯号",
					["code"] = "ability(狩猎小队:921) [enemy.aura(黑爪:918).exists]\nability(原始嗥叫:920) [enemy.aura(黑爪:918).exists]\nability(黑爪:919)\nchange(next)",
				},
				[116793] = {
					["name"] = "嘶嘶",
					["code"] = "ability(群殴:581) [enemy.aura(黑爪:918).exists]\nability(黑爪:919)\nability(灵火之箭:1066) [enemy(变异飞蛇:1987).active]\nability(灼燃大地:172)\nability(焚烧:179)\nability(燃烧:113)\nability(灵火之箭:1066)\nchange(不祥焰灵:1335) [enemy(变异飞蛇:1987).active]\nchange(next)",
				},
				[94650] = {
					["author"] = "Believer-古尔丹",
					["name"] = "亵渎之土",
					["code"] = "ability(喷泉:418)\nchange(伊奇:1532)\nability(群殴:581) [enemy.aura(黑爪:918).exists]\nability(黑爪:919)\nchange(翡翠始祖龙宝宝:1167)",
				},
				[140880] = {
					["author"] = "弄妆梳洗迟-古尔丹",
					["name"] = "迈克尔·斯卡恩",
					["code"] = "standby\nchange(next)",
				},
				[146181] = {
					["name"] = "活体永冻之霜",
					["code"] = "ability(喷泉:418)\nability(囫囵吞食:276) [enemy.hpp<25]\nability(甩尾拍击:424)",
				},
				[141077] = {
					["name"] = "昆特",
					["code"] = "ability(奥术风暴:589)\nability(法力澎湃:489)\nability(扫尾:122)\nchange(next)",
				},
				[116795] = {
					["name"] = "萌芽的永生孢子",
					["code"] = "ability(水流喷射:118) [round=2]\nability(抽水:297) [enemy(萌芽的永生孢子:1996).active]\nability(水流喷射:118) [enemy.hp<293]\nability(抽水:297) [self.aura(抽水:296).exists]\nability(净化之雨:230)\nability(水流喷射:118) [self.hpp<20]\nability(抽水:297)",
				},
				[72290] = {
					["author"] = "懒起画蛾眉-古尔丹",
					["name"] = "皂皂，砮皂的幼犊",
					["code"] = "ability(照亮:460) [round=1]\nchange(步行炸弹:85) [round=2]\nability(自爆:282)\nchange(赤红孢子:1537) [self(步行炸弹:85).dead]",
				},
				[117951] = {
					["author"] = "弄妆梳洗迟-古尔丹",
					["name"] = "无名秘术师",
					["code"] = "ability(诱饵:334) [round=7]\nability(雷霆之箭:779) [enemy(闪烁的邪火苗:2010).active]\nability(自爆:282) [enemy(闪烁的邪火苗:2010).hp<560]\nability(吐息:115)\nchange(#2)",
				},
				[66557] = {
					["author"] = "弄妆梳洗迟-古尔丹",
					["name"] = "血骑士安塔里",
					["code"] = "--机械幼龙1雷霆之箭, 2待命，3-6吐息； 敌人二号上场，7我方雷霆之箭，8自爆，我方死，9换步行炸弹雷区 ，10-12猛击；敌人三号上场，13我方先手自爆，结束。",
				},
				[99878] = {
					["author"] = "弄妆梳洗迟-古尔丹",
					["name"] = "全能金刚防御系统",
					["code"] = "ability(灼燃大地:172) [round =1]\nability(灼燃大地:172) [round =5]\nability(焚烧:179) [enemy(迷你电荷金刚:1818).active]\nability(烈焰吐息:501)\nchange(#3) [self(仲夏之魂:128).dead]\nchange(邪焰:519) [self(#3).active]",
				},
				["海难俘虏01"] = {
					["name"] = "海难俘虏02",
					["code"] = "quit [round = 1 & self(#2).hpp < 100]\nquit [self.dead & !enemy(#1).dead]\nchange(next) [self.dead]\nchange(#3) [enemy.aura(亡灵).exists & enemy(#3).hp<794]\nstandby [self(#3).active & enemy.aura(亡灵).exists]\nability(信息素) [round = 1]\nability(剧毒长牙) [round = 2]\nability(穿刺创伤) [round = 3]\nchange(#2) [round = 4]\nability(血牙) [round = 5 & self.hp<899]\nability(血牙) [round = 5 & enemy.hp<452]\nability(原始嗥叫) [round = 5] \nability(原始嗥叫) [enemy.hp<96]\nability(原始嗥叫) [enemy.hp<118 & self.hpp<50]\nability(侧击) [enemy(#2).active]\nability(血牙)\nability(抓挠) [enemy(#2).active]\nstandby [self.speed.slow & !enemy.aura(遁地).exists]\nability(迎头冲撞)\nquit",
				},
				[150858] = {
					["name"] = "黑鬃",
					["code"] = "ability(严寒:786)\nability(砍劈:943) [!enemy(黑鬃:2592).aura(流血:491).exists]\nchange(伊奇:1532)\nability(黑爪:919) [!enemy(黑鬃:2592).aura(黑爪:918).exists]\nability(群殴:581)\nchange(next) [self.dead]\nability(#3)\nability(#1)",
				},
				[68561] = {
					["author"] = "弄妆梳洗迟-古尔丹",
					["name"] = "幸运的小艺",
					["code"] = "ability(狩猎小队:921) [enemy.aura(黑爪:918).exists]\nability(跳跃:364) [enemy.aura(黑爪:918).exists]\nability(黑爪:919)",
				},
				[155267] = {
					["name"] = "复活的卫兵",
					["code"] = "ability(剧毒长牙:152) [!enemy(复活的卫兵:2751).aura(中毒:379).exists]\nability(躲闪:312) [enemy.aura(亡灵:242).exists]\nability(奔踏:163) [!enemy.aura(破碎防御:542).exists]\nability(卷土重来:253)\nability(乱舞:360)\nchange(next) [self.dead]\nability(#2)\nability(狩猎小队:921)\nability(#3)",
				},
			},
			["FirstEnemy"] = {
			},
			["Base"] = {
			},
			["AllInOne"] = {
			},
		},
	},
	["profiles"] = {
		["Default"] = {
			["pluginDisabled"] = {
				["Base"] = true,
			},
			["settings"] = {
				["noWaitDeleteScript"] = true,
				["autoButtonHotKey"] = "MOUSEWHEELDOWN",
			},
			["position"] = {
				["y"] = 0.4741897583007813,
				["x"] = -270.8323974609375,
				["point"] = "RIGHT",
				["scale"] = 1,
				["height"] = 450.000061035156,
				["width"] = 350.000091552734,
			},
			["pluginOrders"] = {
				"Rematch", -- [1]
				"FirstEnemy", -- [2]
				"Base", -- [3]
				"AllInOne", -- [4]
			},
		},
	},
}
