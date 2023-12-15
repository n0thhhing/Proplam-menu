gg = require"gg"
require"game"
require"patchers" -- for offset patches
require"toggles" -- for on/off functions
require"webhook"
version = "23.7.2"



------------------------------------------------------------------------------

--main--
function home()
	main =
		gg.choice(
			{
				"[👥] • Account",
				"[🛡️] • Armory",
				"[💰] • Rewards",
				"[☝️] • Clickers",
				"[🕹️] • Gameplay",
				"[❓] • Misc",
				"[📑] • Report problems/questions",
				"[❌] • Exit",
			},
			nil,
			"PG3D menu by her[x] " .. "[" .. version .. "]"
		)

	--exit--
	function exi()
		gg.processResume()
		gg.getListItems()
		gg.clearList()
		gg.clearResults()
		gg.toast("[EXIT]")
		gg.setVisible(true)
		print("[Pressed Exit Button]")
		return os.exit()
	end

	--account--
	function acc()
		account = gg.choice(
			{
				le .. "Level 65", --1
				lb .. "Lobby bundles", --2
				cp .. "Clan parts", --3
				ce .. "Clan energy", --4
				ie .. "Instant emperor", --5
				"back", --6
			},
			nil,
			"[👥] • Account"
		)

		--exits--
		if account == 6 or nil then
			home()
		end

		--level65--
		if account == 1 then
			if le == OFF then
				Patch(I[63], "20008052C0035FD6")
				Patch(I[42], "00328052C0035FD6")
				le = ON
			else
				Restore(I[63])
				Restore(I[42])
				le = OFF
			end
			acc()
		end

		--lobby bundles--
		if account == 2 then
			if lb == OFF then
				lb = ON
			else
				lb = OFF
			end
			acc()
		end

		--clan parts--
		if account == 3 then
			if cp == OFF then
				Patch(I[1], "00008052C0035FD6")
				Patch(I[2], "00008052C0035FD6")
				cp = ON
			else
				Restore(I[1])
				Restore(I[2])
				cp = OFF
				gg.toast("Reverted")
			end
			acc()
		end

		--clan energy--
		if account == 4 then
			if ce == OFF then
				Patch(I[3], "00008052C0035FD6")
				ce = ON
			else
				Restore(I[3])
				ce = OFF
			end
			acc()
		end

		--emp--
		if account == 7 then
			if ie == OFF then
				Patch(I[62], "E01B1632C0035FD6")
				ie = ON
			else
				Restore(I[62])
				ie = OFF
			end
			rew()
		end
	end

	--armory--
	function arm()
		armor = gg.choice(
			{
				pm .. "Armory Price Modifer[not weapons]", --1
				ug .. "Unlock Guns & Shovels", --2
				uh .. "Unlock all Holiday Event Armors", --3
				uc .. "Unlock All Clan Armors", --4
				fc .. "Free Craft all Wears/Armors/Graffitis", --5
				ur .. "Unlock royal skins", --6
				ah .. "Unlock all Hidden Royale/Avatars", --7
				su .. "Show All Unrealeased Royale Hats/Vehicles", --8
				uw .. "Unlock weapon skins", --9
				ua .. "Unlock gadgets", --10
				sd .. "Show all Deleted/Exclusive Gadgets", --11
				uu .. "Unlock all clan gadgets", --12
				pa .. "0 Parts modules", --13
				xm .. "X modules", --14
				mp .. "Modules 100%", --15
				ra .. "Change rarity", --16
				"   ↳" .. colorr .. " Selected rarity = [" .. raree .. "]", --17
				"⬅  Back", --18
			},
			nil,
			"[🛡️] • Armory"
		)

		--exits--
		if armor == 18 or nil then
			home()
		end

		--armor price--
		if armor == 1 then
			if pm == OFF then
				Patch(I[83], xtrue)
				pm = ON
			else
				Restore(I[84])
				pm = OFF
			end
			arm()
		end

		--unlock guns and shovels--
		if armor == 2 then
			if ug == OFF then
				Patch(I[52], "00008052C0035FD6")
				Patch(I[53], "00008052C0035FD6")
				ug = ON
			else
				Restore(I[52])
				Restore(I[53])
				ug = OFF
			end
			arm()
		end

		--unlock holiday wear--
		if armor == 3 then
			if uh == OFF then
				Patch(I[72], "401F80D2C0035FD6")
				Patch(I[73], "20008052C0035FD6")
				uh = ON
			else
				Restore(I[72])
				Restore(I[73])
				uh = OFF
			end
			arm()
		end

		--unlock clan armor--
		if armor == 4 then
			if uc == OFF then
				Patch(I[79], "00008052C0035FD6")
				uc = ON
			else
				Restore(I[79])
				uc = OFF
			end
			arm()
		end

		--free craft--
		if armor == 5 then
			if fc == OFF then
				Patch(I[49], "20008052C0035FD6")
				Patch(I[50], "E07C8052C0035FD6")
				fc = ON
			else
				Restore(I[49])
				Restore(I[50])
				fc = OFF
			end
			arm()
		end

		--unlock royal skins--
		if armor == 6 then
			if ur == OFF then
				Patch(I[54], "E0031F2AC0035FD6")
				Patch(I[55], "20008052C0035FD6")
				Patch(I[71], "20008052C0035FD6")
				ur = ON
			else
				Restore(I[54])
				Restore(I[55])
				Restore(I[71])
				ur = OFF
			end
			arm()
		end

		--unlock hidden royal--
		if armor == 7 then
			if ah == OFF then
				Patch(I[81], "00008052C0035FD6")
				Patch(I[82], "20008052C0035FD6")
				ah = ON
			else
				Restore(I[81])
				Restore(I[82])
				ah = OFF
			end
			arm()
		end

		--show unreleased hats/vehicles--
		if armor == 8 then
			if su == OFF then
				Patch(I[71], "20008052C0035FD6")
				su = ON
			else
				Restore(I[71])
				su = OFF
			end
			arm()
		end

		--unlock wep skins--
		if armor == 9 then
			if uw == OFF then
				Patch(I[56], "20008052C0035FD6")
				Patch(I[57], "00008052C0035FD6")
				uw = ON
			else
				Restore(I[56])
				Restore(I[57])
				uw = OFF
			end
			arm()
		end

		--unlock gadgets--
		if armor == 10 then
			if ua == OFF then
				Patch(I[12], "20008052C0035FD6")
				ua = ON
			else
				Restore(I[12])
				ua = OFF
			end
			arm()
		end

		--show deleted/exclusive gadgets--
		if armor == 11 then
			if sd == OFF then
				Patch(I[60], "20008052C0035FD6")
				Patch(I[61], "20008052C0035FD6")
				sd = ON
			else
				Restore(I[60])
				Restore(I[61])
				sd = OFF
			end
			arm()
		end

		--unlock clan gadgets--
		if armor == 12 then
			if uu == OFF then
				Patch(I[69], "20008052C0035FD6")
				uu = ON
			else
				Restore(I[69])
				uu = OFF
			end
			arm()
		end

		--0 parts modules--
		if armor == 13 then
			if pa == OFF then
				Patch(I[17], "00008052C0035FD6")
				pa = ON
			else
				Restore(I[17])
				pa = OFF
			end
			arm()
		end

		--x modules--
		if armor == 14 then
			if xm == OFF then
				Patch(I[14], "C0035FD6F55301A9")
				Patch(I[15], "20008052C0035FD6")
				Patch(I[16], "40018052C0035FD6")
				xm = ON
			else
				Restore(I[14])
				Restore(I[15])
				Restore(I[16])
				xm = OFF
			end
			arm()
		end

		--modules %--
		if armor == 15 then
			if mp == OFF then
				Patch(I[13], "00008052C0035FD6")
				mp = ON
			else
				Restore(I[13])
				mp = OFF
			end
			arm()
		end

		--chaneg to selcected rarityt
		if armor == 16 then
			if ra == OFF then
				Patch(I[39], selr)
				ra = ON
			else
				Restore(I[39])
				ra = OFF
			end
			arm()()
		end

		--rarity selection--
		if armor == 17 then
			rarity =
				gg.choice(
					{
						"⚪ • Common",
						"🟢 • Uncommon",
						"🔵 • Rare",
						"🟡 • Epic",
						"🔴 • Legendary",
						"🟣 • Mythical",
						"⬅  Back",
					},
					nil,
					"Rarity selection"
				)

			--common--
			if rarity == 1 then
				selr = com
				raree = "Common"
				colorr = "⚪"
				arm()
			end

			--uncommon--
			if rarity == 2 then
				selr = uco
				raree = "Uncommon"
				color = "🟢"
				arm()
			end

			--rare--
			if rarity == 3 then
				selr = ror
				raree = "Rare"
				colorr = "🔵"
				arm()
			end

			--epic--
			if rarity == 4 then
				selr = epi
				raree = "Epic"
				colorr = "🟡"
				arm()
			end

			--legendary--
			if rarity == 5 then
				selr = leg
				raree = "Legendary"
				colorr = "🔴"
				arm()
			end

			--mythical--
			if rarity == 6 then
				selr = myt
				raree = "Mythical"
				colorr = "🟣"
				arm()
			end

			--rarity exits
			if rarity == 7 then
				arm()
			end

			if rarity == nil then
				arm()
			end
		end
	end

	--rewards--
	function rew()
		rewards = gg.choice(
			{
				co .. "Collectible menu[somewhat patched]", --1
				"   ↳💴 Collection value = [" .. cvalue .. "]", --2
				lo .. "Lottery collectibles modifier", --3
				"   ↳🎫 Lottery value = [" .. value .. "]", --4
				cracked .. "Cracked collectbles[loading screen]", --5
				ff .. "Free lottery", --6
				fl .. "Free clan chest", --7
				fa .. "2b free chests[patched]", --8
				sp .. "Super chest collection points", --9
				uc .. "Unlimited clan super chests", --10
				eg .. "Egg reward mod", --11
				pp .. "Premium pass[temp]", --12
				ma .. "Max pass[temp]", --13
				rp .. "Reset pass[loading screen]", --14
				eh .. "No egg hatch cooldown[loading screen]", --15
				ga .. "Gift all pass offers[have to fix]", --16
				"⬅  Back", --17
			}, --16
			nil,
			"[💰] • Rewards"
		)

		--exit--
		if rewards == 17 or nil then
			home()
		end

		--collectible patch--
		if rewards == 1 then
			if co == OFF then
				Patch(I[6], coval)
				co = ON
			else
				Restore(I[6])
				co = OFF
				gg.toast("Reverted")
			end
			rew()
		end

		--collectible value selection--
		if rewards == 2 then
			cool =
				gg.choice(
					{
						"$ • 0",
						"$ • 250",
						"$ •️ 500",
						"$ • 1000",
						"$ • 2500",
						"$ • 10000",
						"$ • 50000",
						"$ • 1M",
						"$ • 2B",
						"⬅  Back",
					},
					nil,
					"Collectible value selector"
				)

			--collectible exits--
			if cool == 10 then
				rew()
			end

			if cool == nil then
				rew()
			end

			if cool == 1 then
				coval = zer
				cvalue = "0"
				rew()
			end
			if cool == 2 then
				coval = twf
				cvalue = "250"
				rew()
			end
			if cool == 3 then
				coval = fvh
				cval = "500"
				rew()
			end
			if cool == 4 then
				coval = tho
				cvalue = "1000"
				rew()
			end
			if cool == 5 then
				coval = two
				cvalue = "2500"
				rew()
			end
			if cool == 6 then
				coval = twn
				cvalue = "10000"
				rew()
			end
			if cool == 7 then
				coval = fft
				cvalue = "50000"
				rew()
			end
			if cool == 8 then
				coval = omi
				cvalue = "1m"
				rew()
			end
			if cool == 9 then
				coval = tbi
				cvalue = "2b"
				rew()
			end
		end

		if rewards == 3 then
			if lo == OFF then
				Patch(I[5], lotval)
				lo = ON
			else
				Restore(I[5])
				lo = OFF
			end
			rew()
		end

		--choose value-
		if rewards == 4 then
			cool =
				gg.choice(
					{
						"💾️ • 0",
						"💾️ • 250",
						"💾️ •️ 500",
						"💾️ • 1000",
						"💾️ • 2500",
						"💾 • 10000",
						"💾️ • 50000",
						"💾️ • 1M",
						"💾️ • 2B",
						"⬅  Back",
					},
					nil,
					"Lottery collectibles modifier"
				)

			--collectible exits--
			if cool == 10 then
				rew()
			end

			if cool == nil then
				rew()
			end
			--0--
			if cool == 1 then
				lotval = zer
				value = "0"
				rew()
			end
			--250--
			if cool == 2 then
				lotval = twf
				value = "250"
				rew()
			end
			--500--
			if cool == 3 then
				lotval = fvh
				value = "500"
				rew()
			end
			--1000--
			if cool == 4 then
				lotval = tho
				value = "1000"
				rew()
			end
			--2500--
			if cool == 5 then
				lotval = two
				value = "2500"
				rew()
			end
			--10000--
			if cool == 6 then
				lotval = twn
				value = "10000"
				rew()
			end
			--50000--
			if cool == 7 then
				lotval = fft
				value = "50000"
				rew()
			end
			--1m--
			if cool == 8 then
				lotval = omi
				value = "1m"
				rew()
			end
			--2b--
			if cool == 9 then
				lotval = tbi
				value = "2b"
				rew()
			end
		end

		--cracked collectibles--
		if rewards == 5 then
			if cracked == OFF then
				if crack ~= true then
					gg.choice({
						"⚠️ WARNING ⚠️",
						"There is a few steps required to do before running this.",
						"Step 1:",
						"You must buy or obtain a chest but dont open it. You can use Clan Super Chest, just click buy or click the chest but dont click 'Open Chest'",
						"Step 2: Relog",
						"Step 3: run this again before 75% in loading scene",
						"Step 4: Open chests",
						"(The first time it may freeze for like 20 seconds but then unfreeze and will work and run a loop.)",
						"Step 5: Enjoy! ❤️🙏🏽",
					})
				end
				zz =
					gg.choice(
						{
							"500",
							"1000",
							"2500",
							"5000[max or ban]",
							"⬅  Back",
						},
						"cracked collectibles"
					)
				if zz == 1 then
				elseif zz == 2 then
					Patch(I[6], "803E8052C0035FD6")
					Patch(I[80], "20008052C0035FD6")
					crack = true
					cracked = ON
				elseif zz == 2 then
					Patch(I[6], "007D8052C0035FD6")
					Patch(I[80], "20008052C0035FD6")
					crack = true
					cracked = ON
				elseif zz == 3 then
					Patch(I[6], "80388152C0035FD6")
					Patch(I[80], "20008052C0035FD6")
					crack = true
					cracked = ON
				elseif zz == 4 then
					Patch(I[6], "00718252C0035FD6")
					Patch(I[80], "20008052C0035FD6")
					crack = true
					cracked = ON
				elseif zz == 5 or zz == nil then
					rew()
				end
			else
				Restore(I[6])
				Restore(I[80])
				cracked = OFF
			end
			rew()
		end

		--free lottery--
		if rewards == 6 then
			if ff == OFF then
				Patch(I[4], "E0E18412C0035FD6")
				ff = ON
			else
				Restore(I[4])
				ff = OFF
				gg.toast("Reverted")
			end
			rew()
		end

		--free clan chests--
		if rewards == 7 then
			if fl == OFF then
				Patch(I[44], "00008052C0035FD6")
				Patch(I[45], "00008052C0035FD6")
				fl = ON
			else
				Restore(I[44])
				Restore(I[45])
				fl = OFF
			end
			rew()
		end

		--free chest count--
		if rewards == 8 then
			if fa == OFF then
				Patch(I[7], "E07B40B2C0035FD6")
				fa = ON
			else
				Restore(I[7])
				fa = OFF
			end
			rew()
		end

		--super chest collection points--
		if rewards == 9 then
			if sp == OFF then
				Patch(I[46], "80388152C0035FD6")
				sp = ON
			else
				Restore(I[46])
				sp = OFF
			end
			rew()
		end

		--unlimited super chests--
		if rewards == 10 then
			if uc == OFF then
				Patch(I[43], "00008052C0035FD6")
				uc = ON
			else
				Restore(I[43])
				uc = OFF
			end
			rew()
		end

		--egg reward mod--
		if rewards == 11 then
			if eg == OFF then
				Patch(I[48], "E07C8052C0035FD6")
				eg = ON
			else
				Restore(I[48])
				eg = OFF
			end
			rew()
		end

		--premium pass--
		if rewards == 12 then
			if pp == OFF then
				Patch(I[65], "20008052C0035FD6")
				pp = ON
			else
				Restore(I[65])
				pp = OFF
			end
			rew()
		end

		--max pass--
		if rewards == 13 then
			if ma == OFF then
				Patch(I[64], "00A68E52C0035FD6")
				ma = ON
			else
				Restore(I[64])
				ma = OFF
			end
			rew()
		end

		--reset pass--
		if rewards == 14 then
			if rp == OFF then
				Patch(I[66], "20008052C0035FD6")
				rp = ON
			else
				Restore(I[66])
				rp = OFF
			end
			rew()
		end

		--no egg cd--
		if rewards == 15 then
			if eh == OFF then
				Patch(I[67], "20008052C0035FD6")
				eh = ON
			else
				Restore(I[68])
				eh = OFF
			end
			rew()
		end

		--gift pass offers--
		if rewards == 16 then
			if ga == OFF then
				Patch(I[76], "200080D2C0035FD6")
				Patch(I[77], "200080D2C0035FD6")
				Patch(I[78], "200080D2C0035FD6")
				ga = ON
			else
				Restore(I[76])
				Restore(I[77])
				Restore(I[78])
				ga = OFF
			end
			rew()
		end
	end

	--clickers--
	function cli()
		clickers =
			gg.choice(
				{
					"⬅  Back",
					task .. " • Task clicker",
					pass .. " • Pass reward clicker",
					gemc .. " • Gem clicker[gallery]",
					bmcl .. " • Black market clicker",
				},
				nil,
				"[☝️] • Clickers"
			)

		--exits--
		if clickers == nil then
			home()
		end
		if clickers == 1 then
			home()
		end

		--task clicker--
		if clickers == 2 then
			if task == OFF then
				Patch(I[9], "20008052C0035FD6")
				task = ON
			else
				Restore(I[9])
				task = OFF
			end
			cli()
		end

		--pass reward clicker--
		if clickers == 3 then
			if pass == OFF then
				Patch(I[10], "00008052C0035FD6")
				pass = ON
			else
				Restore(I[10])
				pass = OFF
			end
			cli()
		end

		--gallery clicker--
		if clickers == 4 then
			if gemc == OFF then
				Patch(I[8], "200080D2C0035FD6")
				gemc = ON
			else
				Restore(I[8])
				gemc = OFF
			end
			cli()
		end

		--black market clicker--
		if clickers == 5 then
			if bmcl == OFF then
				Patch(I[11], "00008052C0035FD6")
				bmcl = ON
			else
				Restore(I[11])
				bmcl = OFF
			end
			cli()
		end
	end

	--gameplay--
	function gam()
		yes()
	end

	--misc--
	function mis()
		local misc =
			gg.choice(
				{
					"⬅  Back",
					"[💨] • Update bypass[you dont actually need this]",
					"[🏃️] • Game speed",
					"[🆔] • id spoof",
					"[🤡] • Everyone fall through map",
					"[☠️] • Ban[yourself]",
				},
				nil,
				"[❓] • Misc"
			)

		--exits--
		if misc == 1 then
			home()
		end

		if misc == nil then
			home()
		end

		--update bypass--
		if misc == 2 then
			function updater()
				gg.alert("make sure search helper is off")
				gg.alert(
					"pause the game using game guardian at 50-75% then you are good to use update bypass"
				)
				version =
					gg.choice(
						{ "🔄 • edit version" },
						nil,
						"💨 • Update bypass[you dont actually need this]"
					)
				if version == 1 then
					prompt =
						gg.prompt(
							{ "current version", "latest version" },
							{ "23.3.2", "23.7.2" },
							{ "text" }
						)

					if prompt ~= nil then
						gg.clearResults()
						gg.setRanges(gg.REGION_ANONYMOUS)
						gg.searchNumber(";" .. prompt[1], gg.TYPE_WORD)
						gg.getResults(gg.getResultCount())
						gg.editAll(";" .. prompt[2], gg.TYPE_WORD)
						gg.clearResults()
					end
				end
				if version == nil then
					mis()
				end
			end

			updater()
		end

		--gamespeed--
		if misc == 3 then
			prompt =
				gg.prompt({ "Put the speed you want" }, { "2" }, { "number" })

			gg.setVisible(false)
			gg.setRanges(gg.REGION_ANONYMOUS | gg.REGION_C_ALLOC)
			gg.clearResults()
			gg.searchNumber(
				"0000803FrD;ABAAAA3ErD;8FC2F53CrD::9",
				gg.TYPE_DWORD
			)
			gg.refineNumber("1065353216", gg.TYPE_DWORD)
			values = gg.getResults(gg.getResultsCount())
			gg.editAll("1,065,353,216", gg.TYPE_DWORD)

			t = {}
			t[1] = {}
			t[1].address = values[1].address + 0
			t[1].flags = gg.TYPE_FLOAT
			t[1].value = prompt[1]
			t[1].freeze = false
			gg.setValues(t)
			gg.setVisible(false)

			if gg.getResultsCount(values) ~= 0 then
				gg.clearResults()

				gg.toast("Speedheck Activated!")
			end
			return
		end

		--id spoof--
		if misc == 4 then
			function bypass()
				gg.setVisible(false)
				gg.clearResults()
				gg.sleep(300)
				eval = gg.choice({ "spoof id" }, nil, "🆔 • id spoof")
				if eval == 1 then
					spoof_id()
				end
				gg.alert("you have to be out of the game")
				gg.clearResults()
				gg.setRanges(gg.REGION_CODE_APP)
				gg.searchNumber(
					"h F4 0F 1E F8 F3 7B 01 A9 93 79 02 F0 14 54 02 B0 68 32 63 39 94 9A 43 F9 C8 00 00 37 00 54 02 B0 00 98 43 F9 76 03 D9 97 28 00 80 52 68 32 23 39 80 02 40 F9 08 E0 40 B9 48 00 00 35 AC 03 D9 97",
					gg.TYPE_BYTE
				)
				gg.getResults(gg.getResultCount())
				gg.editAll("E0018052C0035FD6", gg.TYPE_BYTE)
				gg.clearResults()
				gg.sleep(500)
				gg.processResume()

				spoof_id()
			end

			function spoof_id()
				gg.setVisible(false)
				gg.alert("Press GG Icon when u copied ID and ready to spoof ID")
				while gg.isVisible() == false do
					--wait
				end
				local var = 0
				local spoofed = 999999999
				gg.setVisible(false)
				gg.clearResults()
				local uid = gg.prompt({ "Paste ur ID" }, nil, { "number" })
				if uid == nil then
					print("ID spoof cancelled")
					return
				end
				for i = 1, 10 do
					gg.setRanges(gg.REGION_ANONYMOUS)
					gg.searchNumber(";" .. uid[1], gg.TYPE_WORD)
					gg.getResults(1000)
					if gg.getResultsCount() == 0 then
						break
					end
					gg.editAll(";" .. spoofed, gg.TYPE_WORD)
					gg.clearResults()
				end
				print("Done")
			end

			bypass()
			gg.setVisible(false)
			print("Script finished!")
		end

		--map fall--
		if misc == 5 then
			gg.clearResults()
			gg.searchNumber("-1,055,066,685", gg.TYPE_DWORD)
			gg.getResults(100000)
			gg.editAll("-2", gg.TYPE_DWORD)
			gg.clearResults()
		end

		--ban--
		if misc == 6 then
			ban =
				gg.choice(
					{ "😲 | ban me", "😢 | no I dont want to be banned" },
					nil,
					"☠️ • Ban[yourself]"
				)
			if ban == 1 then
				gg.alert(
					"After use, close the game and restart. Now you should be banned."
				)

				gg.setRanges(gg.REGION_ANONYMOUS)
				gg.searchNumber("280", gg.TYPE_FLOAT)
				gg.getResults(32)
				gg.editAll("1", gg.TYPE_FLOAT)
			end

			if ban == nil then
				mis()
			end
			if ban == 2 then
				mis()
			end
		end
	end

	--info--
	function fni()
		gg.alert("broke this")
		--userReport()
	end

	--calls--
	if main == nil then
		gg.setVisible(false)
		while true do
			if gg.isVisible(true) then
				gg.setVisible(false)
				home()
			end
		end
	end

	if main == 1 then
		acc()
	end
	if main == 2 then
		arm()
	end
	if main == 3 then
		rew()
	end
	if main == 4 then
		cli()
	end
	if main == 5 then
		gam()
	end
	if main == 6 then
		mis()
	end
	if main == 7 then
		fni()
	end
	if main == 8 then
		exi()
	end
end

------------------------------------------------------------------------------

--loop--
proplam = "proplam"
while true do
	if gg.isVisible(true) then
		skid = 1
		gg.setVisible(false)
	end
	gg.clearResults()
	if skid == 1 then
		home()
	end
end
