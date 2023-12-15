--require "toggles"
--require "patchers"

--main gameplay--
function yes()
	local gameplay =
		gg.choice(
			{
				"[🎣] • Hooks",
				"[📢] • Non hooks",
				"[🕹️] • Gamemodes",
				"⬅ Back",
			},
			nil,
			"🕹️ • Gameplay"
		)

	--gameplay exits--
	if (gameplay == 4) then
		game = 1
		home()
	end

	if (gameplay == nil) then
		gg.setVisible(false)
		while true do
			if gg.isVisible(true) then
				gg.setVisible(false)
				yes()
			end
		end
	end

	------------------------------------------------------------------------------

	--hooks--
	if (gameplay == 1) then
		findClassPointer("WeaponSounds")
		function Hooky()
			hooks =
				gg.choice(
					{
						"[🔫] • weapon mods",
						"[🛡️] • Utilities",
						"[🔮] • Effects",
						"⬅ Back",
					},
					nil,
					"🎣 • Hooks"
				)

			local bigFloat = "1000000.0"
			local class = "WeaponSounds"
			local scopefast = { { "0xE8", gg.TYPE_BYTE, 100 } }
			local isharpoon =
				{
					{ "0x2B8", gg.TYPE_BYTE, 1 },
					{ "0x2C8", gg.TYPE_FLOAT, 10 },
					{ "0x2D0", gg.TYPE_FLOAT, 15 },
					{ "0x2D4", gg.TYPE_FLOAT, 9 },
				}
			local canbuy =
				{
					{ "0x5D1", gg.TYPE_BYTE, 1 },
					{ "0x81", gg.TYPR_BYTE, 1 },
					{ "0x82", gg.TYPE_BYTE, 1 },
					{ "0x80", gg.TYPE_BYTE, 1 },
					{ "0x83", gg.TYPE_BYTE, 1 },
				}

			function buycan()
				for i, v in ipairs(canbuy) do
					hackOffset(v[1], v[2], v[3])
				end
			end

			function scope()
				for i, v in ipairs(scopefast) do
					hackOffset(v[1], v[2], v[3])
				end
			end

			if (hooks == 1) then
				function weaponmod()
					wep =
						gg.choice(
							{
								"⬅ Back",
								"[🧪] • Lazer shots",
								"[⏭️] • Always dash",
								"[⏳] • No charge time",
								"[💥] • Exploding bullets",
								"[🔄] • No recoil",
								"[↪️] • Ignore reflection",
								"[😲] • Shotgun",
								"[🗡️] • Inf melee range",
								"[🧨️] • Bazooka",
								"[💣️] • Grenade launcher",
								"️[🚬] • Fan rocket",
								"[👻️] • Ghost",
							},
							nil,
							"[🔫] • weapon mods"
						)
					local railgunoffsets =
						{
							{ "0x1BC", gg.TYPE_BYTE, 1 },
							{ "0x1C8", gg.TYPE_FLOAT, 1 },
						}
					function railgun()
						for i, v in ipairs(railgunoffsets) do
							hackOffset(v[1], v[2], v[3])
						end
					end

					if (wep == 2) then
						railgun()
						weaponmod()
					end
					local dashoffset =
						{
							{ "0x2A8", gg.TYPE_BYTE, 1 },
							{ "0x2B0", gg.TYPE_FLOAT, 5 },
						}
					function dash()
						for i, v in ipairs(dashoffset) do
							hackOffset(v[1], v[2], v[3])
						end
					end

					if (wep == 3) then
						dash()
						weaponmod()
					end
					local chargeweptime = { { "0x1E4", gg.TYPE_FLOAT, 0 } }
					function nocharge()
						for i, v in ipairs(chargeweptime) do
							hackOffset(v[1], v[2], v[3])
						end
					end

					if (wep == 4) then
						nocharge()
						weaponmod()
					end
					local bulletexplode = { { "0x1A5", gg.TYPE_BYTE, 1 } }
					function bulletexplodingllet()
						for i, v in ipairs(bulletexplode) do
							hackOffset(v[1], v[2], v[3])
						end
					end

					if (wep == 5) then
						bulletexplodingllet()
						weaponmod()
					end
					local recoil = { { "0xC0", gg.TYPE_FLOAT, 0 } }
					function downrec()
						for i, v in ipairs(recoil) do
							hackOffset(v[1], v[2], v[3])
						end
					end

					if (wep == 6) then
						downrec()
						weaponmod()
					end
					local ignorereflect =
						{
							{ "0x128", gg.TYPE_BYTE, 1 },
							{ "0x129", gg.TYPE_BYTE, 1 },
							{ "0x12A", gg.TYPE_BYTE, 1 },
						}
					function reflect()
						for i, v in ipairs(ignorereflect) do
							hackOffset(v[1], v[2], v[3])
						end
					end

					if (wep == 7) then
						reflect()
						weaponmod()
					end
					local shotgunn = { { "0x1A6", gg.TYPE_BYTE, 1 } }
					function shotguns()
						for i, v in ipairs(shotgunn) do
							hackOffset(v[1], v[2], v[3])
						end
					end

					if (wep == 8) then
						shotguns()
						weaponmod()
					end
					local isrange = { { "0x184", gg.TYPE_FLOAT, bigFloat } }
					function melee()
						for i, v in ipairs(isrange) do
							hackOffset(v[1], v[2], v[3])
						end
					end

					if (wep == 9) then
						melee()
						weaponmod()
					end
					local bazoo = { { "0x12B", gg.TYPE_BYTE, 1 } }
					function booz()
						for i, v in ipairs(bazoo) do
							hackOffset(v[1], v[2], v[3])
						end
					end

					if (wep == 10) then
						booz()
						weaponmod()
					end
					local grenade = { { "0x158", gg.TYPE_BYTE, 1 } }
					function launch()
						for i, v in ipairs(grenade) do
							hackOffset(v[1], v[2], v[3])
						end
					end

					if (wep == 11) then
						launch()
						weaponmod()
					end
					local fan = { { "0x16D", gg.TYPE_BYTE, 1 } }
					function rocketf()
						for i, v in ipairs(fan) do
							hackOffset(v[1], v[2], v[3])
						end
					end

					if (wep == 12) then
						rocketf()
						weaponmod()
					end
					local ghost = { { "0x156", gg.TYPE_BYTE, 1 } }
					function ghosty()
						for i, v in ipairs(ghost) do
							hackOffset(v[1], v[2], v[3])
						end
					end

					if (wep == 13) then
						ghosty()
						weaponmod()
					end
					if (wep == 1) then
						Hooky()
					end
					if (wep == nil) then
						gg.setVisible(false)
						while true do
							if gg.isVisible(true) then
								gg.setVisible(false)
								weaponmod()
							end
						end
					end
				end

				weaponmod()
			end
			if (hooks == 2) then
				function uti()
					uto =
						gg.choice(
							{
								"⬅ Back",
								"[💀] • Kill all",
								"[🩸] • Silent aim",
								"[♾️] • Infinite score",
								"[💯] • Crit",
								"[👻] • Invisible on kill/reload/charge/respawn",
								"[🏃] • Speedboost after kill",
								"[🔰] • 10x dmg",
								"[🧬] • Godmode[test]",
								"[💰] • Coin drop[test]",
								"[👁️] • Xray[test]",
								"[⏫️] • Force double jump",
							},
							nil,
							"[🛡️] • Utilities"
						)
					if (uto == 1) then
						Hooky()
					end
					local killAllActive =
						{
							{ "0x369", gg.TYPE_BYTE, 1 },
							{ "0x36C", gg.TYPE_FLOAT, 5 },
							{ "0x370", gg.TYPE_FLOAT, 99999 },
						}
					function killAll()
						for i, v in ipairs(killAllActive) do
							hackOffset(v[1], v[2], v[3])
						end
					end

					if (uto == 2) then
						killAll()
						uti()
					end
					local roundMelee =
						{
							{ "0x191", gg.TYPE_BYTE, 1 },
							{ "0x192", gg.TYPE_FLOAT, bigFloat },
							{ "0x184", gg.TYPE_FLOAT, bigFloat },
						}
					function silentAim()
						for i, v in ipairs(roundMelee) do
							hackOffset(v[1], v[2], v[3])
						end
					end

					if (uto == 3) then
						silentAim()
						uti()
					end
					local infScoreOffets =
						{
							{ "0x38C", gg.TYPE_BYTE, 1 },
							{ "0x398", gg.TYPE_FLOAT, 99999 },
						}
					function infScore()
						for i, v in ipairs(infScoreOffets) do
							hackOffset(v[1], v[2], v[3])
						end
					end

					if (uto == 4) then
						infScore()
						uti()
					end
					local critoffsets = { { "0x47C", gg.TYPE_DWORD, 99999 } }
					function crit()
						for i, v in ipairs(critoffsets) do
							hackOffset(v[1], v[2], v[3])
						end
					end

					if (uto == 5) then
						crit()
						uti()
					end
					local invbl =
						{
							{ "0x385", gg.TYPE_BYTE, 1 },
							{ "0x1E8", gg.TYPE_BYTE, 1 },
							{ "0x37C", gg.TYPE_BYTE, 1 },
							{ "0x37D", gg.TYPE_BYTE, 1 },
							{ "0x380", gg.TYPE_FLOAT, bigFloat },
							{ "0x388", gg.TYPE_FLOAT, bigFloat },
						}
					function invis()
						for i, v in ipairs(invbl) do
							hackOffset(v[1], v[2], v[3])
						end
					end

					if (uto == 6) then
						invis()
						uti()
					end
					local isfast =
						{
							{ "0x438", gg.TYPE_BYTE, 1 },
							{ "0x444", gg.TYPE_FLOAT, bigFloat },
							{ "0x43C", gg.TYPE_FLOAT, 10 },
						}
					function fastest()
						for i, v in ipairs(isfast) do
							hackOffset(v[1], v[2], v[3])
						end
					end

					if (uto == 7) then
						fastest()
						uti()
					end
					local gundmgoffsets =
						{
							{ "0x3BC", gg.TYPE_BYTE, 1 },
							{ "0x3C0", gg.TYPE_FLOAT, 2.5 },
							{ "0x3C4", gg.TYPE_FLOAT, 5 },
							{ "0x3C8", gg.TYPE_FLOAT, 2.5 },
							{ "0x3CC", gg.TYPE_FLOAT, 50 },
						}
					function dmg()
						for i, v in ipairs(gundmgoffsets) do
							hackOffset(v[1], v[2], v[3])
						end
					end

					if (uto == 8) then
						dmg()
						uti()
					end
					local godm =
						{
							{ "0x311", gg.TYPE_BYTE, 1 },
							{ "0x1E9", gg.TYPE_BYTE, 1 },
							{ "0x1EA", gg.TYPE_BYTE, 1 },
							{ "0x1EC", gg.TYPE_FLOAT, 9999 },
							{ "0x3EC", gg.TYPE_BYTE, 1 },
							{ "0x3F0", gg.TYPE_FLOAT, 100 },
							{ "0x3F4", gg.TYPE_FLOAT, bigFloat },
							{ " 0x20D", gg.TYPE_BYTE, 1 },
							{ "0x5A4", gg.TYPE_BYTE, 1 },
							{ "0x5A5", gg.TYPE_BYTE, 1 },
							{ "0x5A8", gg.TYPE_FLOAT, 9999 },
						}
					function godd()
						for i, v in ipairs(godm) do
							hackOffset(v[1], v[2], v[3])
						end
					end

					if (uto == 9) then
						godd()
						uti()
					end
					local coindrop =
						{
							{ "0x330", gg.TYPE_BYTE, 1 },
							{ "0x334", gg.TYPE_FLOAT, 100 },
						}
					function richasf()
						for i, v in ipairs(coindrop) do
							hackOffset(v[1], v[2], v[3])
						end
					end

					if (uto == 10) then
						richasf()
						uti()
					end
					local rayx =
						{
							{ "0x24B", gg.TYPE_BYTE, 1 },
							{ "0x24C", gg.TYPE_BYTE, 1 },
							{ "0x24D", gg.TYPE_BYTE, 1 },
							{ "0x250", gg.TYPE_FLOAT, 0 },
							{ "0xC6", gg.TYPE_BYTE, 1 },
							{ "0xC5", gg.TYPE_BYTE, 1 },
						}
					function rays()
						for i, v in ipairs(rayx) do
							hackOffset(v[1], v[2], v[3])
						end
					end

					if (uto == 11) then
						rays()
						uti()
					end
					local forcejump = { { "0x477", gg.TYPE_BYTE, 1 } }
					function double()
						for i, v in ipairs(forcejump) do
							hackOffset(v[1], v[2], v[3])
						end
					end

					if (uto == 12) then
						double()
						uti()
					end

					if (uto == nil) then
						gg.setVisible(false)
						while true do
							if gg.isVisible(true) then
								gg.setVisible(false)
								uti()
							end
						end
					end
				end

				uti()
			end
			if (hooks == 3) then
				function effective()
					effecto =
						gg.choice(
							{
								"⬅ Back",
								"[🐜] • Polymorph",
								"[🔎] • Magnify head",
								"[💉] • Poison effect",
								"[👀] • Blindness effect",
								"[🦠] • Immune to effects[not all]",
								"[💣] • Target explode on kill",
								"[💘] • Charm",
								"[💪] • Weakness",
								"[🌩️] • Electric Shock",
								"[⏪] • Slow down",
								"[🔮]• Curse",
								"[🩼] • Disable jump",
								"[🛠️] • Disable gadget",
							},
							nil,
							"[🔮] • Effects"
						)
					if (effecto == 1) then
						Hooky()
					end
					if (effecto == nil) then
						gg.setVisible(false)
						while true do
							if gg.isVisible(true) then
								gg.setVisible(false)
								effective()
							end
						end
					end
					local polymorpherOffsets =
						{
							{ "0x2EC", gg.TYPE_BYTE, 1 },
							{ "0x2F0", gg.TYPE_FLOAT, bigFloat },
							{ "0x3D8", gg.TYPE_DWORD, 0 },
							{ "0x2F8", gg.TYPE_FLOAT, bigFloat },
							{ "0x2B8", gg.TYPE_BYTE, 1 },
							{ "0x2E0", gg.TYPE_FLOAT, bigFloat },
							{ "0x2D8", gg.TYPE_FLOAT, bigFloat },
						}
					function polymorpher()
						for i, v in ipairs(polymorpherOffsets) do
							hackOffset(v[1], v[2], v[3])
						end
					end

					if (effecto == 2) then
						polymorpher()
						effective()
					end
					local bighead =
						{
							{ "0x260", gg.TYPE_BYTE, 1 },
							{ "0x264", gg.TYPE_FLOAT, bigFloat },
						}
					function bigger()
						for i, v in ipairs(bighead) do
							hackOffset(v[1], v[2], v[3])
						end
					end

					if (effecto == 3) then
						bigger()
						effective()
					end
					local poison =
						{
							{ "0x1F8", gg.TYPE_BYTE, 1 },
							{ "0x200", gg.TYPE_FLOAT, bigFloat },
							{ "0x204", gg.TYPE_FLOAT, bigFloat },
						}
					function pois()
						for i, v in ipairs(poison) do
							hackOffset(v[1], v[2], v[3])
						end
					end

					if (effecto == 4) then
						pois()
						effective()
					end
					local blindash =
						{
							{ "0x268", gg.TYPE_BYTE, 1 },
							{ "0x270", gg.TYPE_FLOAT, bigFloat },
						}
					function youcantsee()
						for i, v in ipairs(blindash) do
							hackOffset(v[1], v[2], v[3])
						end
					end

					if (effecto == 5) then
						youcantsee()
						effective()
					end
					local effectim =
						{
							{ "0x248", gg.TYPE_BYTE, 1 },
							{ "0x249", gg.TYPE_BYTE, 1 },
							{ "0x24A", gg.TYPE_BYTE, 1 },
						}
					function immune()
						for i, v in ipairs(effectim) do
							hackOffset(v[1], v[2], v[3])
						end
					end

					if (effecto == 6) then
						effective()
						immune()
					end
					local isexplode =
						{
							{ "0x318", gg.TYPE_BYTE, 1 },
							{ "0x324", gg.TYPE_FLOAT, bigFloat },
							{ "0x31C", gg.TYPE_FLOAT, bigFloat },
							{ "0x320", gg.TYPE_FLOAT, 0 },
						}
					function death()
						for i, v in ipairs(isexplode) do
							hackOffset(v[1], v[2], v[3])
						end
					end

					if (effecto == 7) then
						death()
						effective()
					end
					local charm =
						{
							{ "0x274", gg.TYPE_BYTE, 1 },
							{ "0x278", gg.TYPE_BYTE, 1 },
						}
					function charming()
						for i, v in ipairs(charm) do
							hackOffset(v[1], v[2], v[3])
						end
					end

					if (effecto == 8) then
						charming()
						effective()
					end
					local weak =
						{
							{ "0x27C", gg.TYPE_BYTE, 1 },
							{ "0x280", gg.TYPE_FLOAT, bigFloat },
						}
					function weakash()
						for i, v in ipairs(weak) do
							hackOffset(v[1], v[2], v[3])
						end
					end

					if (effecto == 9) then
						weakash()
						effective()
					end
					local shocker =
						{
							{ "0x42C", gg.TYPE_BYTE, 1 },
							{ "0x430", gg.TYPE_FLOAT, 9999 },
							{ "0x434", gg.TYPE_FLOAT, 9999 },
						}
					function sens()
						for i, v in ipairs(shocker) do
							hackOffset(v[1], v[2], v[3])
						end
					end

					if (effecto == 10) then
						sens()
						effective()
					end
					local slow =
						{
							{ "0x224", gg.TYPE_BYTE, 1 },
							{ "0x228", gg.TYPE_FLOAT, 10 },
							{ "0x22C", gg.TYPE_FLOAT, 9999 },
							{ "0x230", gg.TYPE_BYTE, 1 },
						}
					function slowash()
						for i, v in ipairs(slow) do
							hackOffset(v[1], v[2], v[3])
						end
					end

					if (effecto == 11) then
						slowash()
						effective()
					end
					local curse =
						{
							{ "0x214", gg.TYPE_BYTE, 1 },
							{ "0x218", gg.TYPE_FLOAT, 9999 },
							{ "0x21C", gg.TYPE_FLOAT, 9999 },
						}
					function cursed()
						for i, v in ipairs(curse) do
							hackOffset(v[1], v[2], v[3])
						end
					end

					if (effecto == 12) then
						cursed()
						effective()
					end
					local disablej =
						{
							{ "0x20E", gg.TYPE_BYTE, 1 },
							{ "0x210", gg.TYPE_FLOAT, 9999 },
						}
					function nojump()
						for i, v in ipairs(disablej) do
							hackOffset(v[1], v[2], v[3])
						end
					end

					if (effecto == 12) then
						nojump()
						effective()
					end
					local gadget =
						{
							{ "0x1F0", gg.TYPE_BYTE, 1 },
							{ "0x1F4", gg.TYPE_FLOAT, 9999 },
						}
					function byegad()
						for i, v in ipairs(gadget) do
							hackOffset(v[1], v[2], v[3])
						end
					end

					if (effecto == 13) then
						byegad()
						effective()
					end
				end

				effective()
			end
			if (hooks == 4) then
				yes()
			end
			if (hooks == nil) then
				gg.setVisible(false)
				while true do
					if gg.isVisible(true) then
						gg.setVisible(false)
						Hooky()
					end
				end
			end
		end

		Hooky()
	end

	------------------------------------------------------------------------------

	--nonhooks--
	if (gameplay == 2) then
		function non()
			nonhook =
				gg.choice(
					{
						inf .. "[🎗] • Infinite ammo",
						fir .. "[☄️] • Fire rate",
						rel .. "[🔄] • Reload speed[does not work anymore",
						gcd .. "[⏱️] • No gadget cooldown",
						tem .. "[☠️] • Teamkill",
						swe .. "[🤬] • No swear filter",
						god .. "[💀] • Godmode[test]",
						tgod .. "[🤖] • Turrent godmode[test]",
						petr .. "[🙀] • No pet respawn time[test]",
						rewp .. "[💵] • reward multi(part 1)",
						xrewm .. "[💵] • reward multi [below 65 only] (part 2)",
						xrewm .. "[💵] • reward multi [lvl65 only] (part 2)",
						"⬅ Back",
					},
					nil,
					"[📢] • Non hooks"
				)

			--ammo--
			if nonhook == 1 then
				if inf == OFF then
					Patch(I[28], "20008052C0035FD6")
					inf = ON
				else
					Restore(I[28])
					inf = OFF
					gg.toast("Reverted")
				end
				non()
			end

			--fire rate--
			if nonhook == 2 then
				if fir == OFF then
					Patch(I[24], "E07B40B2C0035FD6")
					fir = ON
				else
					Restore(I[24])
					fir = OFF
					gg.toast("Reverted")
				end
				non()
			end

			--reload speed--
			if nonhook == 3 then
				gg.alert("patched")
				non()
			end

			--gadget cooldown--
			if nonhook == 4 then
				if gcd == OFF then
					Patch(I[18], "20008052C0035FD6")
					Patch(I[19], "20008052C0035FD6")
					gcd = ON
				else
					Restore(I[19])
					Restore(I[18])
					gcd = OFF
					gg.toast("Reverted")
				end
				non()
			end

			--teamkill--
			if nonhook == 5 then
				if tem == OFF then
					o = I[26]
					Patch(I[26], "00008052C0035FD6")
					Patch(I[27], "00008052C0035FD6")
					tem = ON
				else
					Restore(I[26])
					Restore(I[27])
					tem = OFF
					gg.toast("Reverted")
				end
				non()
			end

			--swear filter--
			if nonhook == 6 then
				if swe == OFF then
					Patch(I[28], "00008052C0035FD6")
					swe = ON
				else
					Restore(I[28])
					swe = OFF
					gg.toast("Reverted")
				end
				non()
			end

			--godmode--
			if nonhook == 7 then
				if god == OFF then
					Patch(I[29], "C0035FD6")
					Patch(I[30], "C0035FD6")
					Patch(I[31], "C0035FD6")
					Patch(I[32], "C0035FD6")
					god = ON
				else
					Restore(I[29])
					Restore(I[30])
					Restore(I[31])
					Restore(I[32])
					god = OFF
					gg.toast("Reverted")
				end
				non()
			end

			--turrentgod--
			if nonhook == 8 then
				if tgod == OFF then
					Patch(I[33], "C0035FD6")
					Patch(I[34], "C0035FD6")
					Patch(I[35], "C0035FD6")
					tgod = ON
				else
					Restore(I[33])
					Restore(I[34])
					Restore(I[35])
					tgod = OFF
					gg.toast("Reverted")
				end
				non()
			end

			--petrespawn--
			if nonhook == 9 then
				if petr == OFF then
					Patch(I[36], "00008052C0035FD6")
					petr = ON
				else
					Restore(I[36])
					petr = OFF
					gg.toast("Reverted")
				end
				non()
			end

			--multi part 1
			if (nonhook == 10) then
				Patch(I[63], "20008052C0035FD6")
				is2 = true
				rewp = ON
				non()
			end

			--multi part 2
			if nonhook == 11 then
				if is2 == true then
					gg.alert("you will crash if your level 65")
					if xrewm == OFF then
						Patch(I[42], "600C8052C0035FD6")
						xrewm = ON
					else
						Restore(I[42])
						xrewm = OFF
					end
				else
					gg.alert("do part 1 first")
				end
				non()
			end

			--restricted multi--
			if nonhook == 12 then
				lvlres =
					gg.choice(
						{
							"First place on Score Board[x99]",
							"Middle place on Score Board[x65]",
							"Last place on Score Board",
							"back[x39]",
						},
						nil,
						"lvl 65 restricted multiplyer"
					)
				if lvlres == 1 then
					if xrewm == OFF then
						Patch(I[42], "E0048052C0035FD6")
						xrewm = ON
					else
						Restore(I[42])
						xrewm = OFF
					end
				end

				if lvlres == 2 then
					if xrewm == OFF then
						Patch(I[42], "20088052C0035FD6")
						xrewm = ON
					else
						Restore(I[42])
						xrewm = OFF
					end
				end

				if lvlres == 3 then
					if xrewm == OFF then
						Patch(I[42], "600C8052C0035FD6")
						xrewm = ON
					else
						Restore(I[42])
						xrewm = OFF
					end
				end

				if lvlres == 4 or nil then
					non()
				end
			end

			--exit/loop--
			if nonhook == 13 then
				yes()
			end
			if nonhook == nil then
				gg.setVisible(false)
				while true do
					if gg.isVisible(true) then
						gg.setVisible(false)
						non()
					end
				end
			end
		end

		non()
	end

	------------------------------------------------------------------------------

	--gamemodes--
	if (gameplay == 3) then
		function mode()
			gmode =
				gg.choice(
					{
						"[⚔️️] • Arena",
						"[⏫️️] • Parkour challenge",
						"[📔️] • Campaign",
						"⬅ Back",
					},
					nil,
					"[🕹️] • Gamemodes"
				)

			--arena--
			if gmode == 1 then
				function aren()
					arena =
						gg.choice(
							{
								asc .. "[📶️] • 2b score",
								zomb .. "[🤢️] • max zombies in wave[2b]",
								zomb .. "[🤢️] • min zombies in wave[1]",
								"⬅ Back",
							},
							nil,
							"[⚔️️] • Arena"
						)

					if arena == 1 then
						if asc == OFF then
							Patch(I[37], "E07B40B2C0035FD6")
							asc = ON
						else
							asc = OFF
							gg.toast("Reverted")
						end
						aren()
					end

					if arena == 4 then
						mode()
					end
					if arena == nil then
						gg.setVisible(false)
						while true do
							if gg.isVisible(true) then
								gg.setVisible(false)
								aren()
							end
						end
					end
				end

				aren()
			end

			--parkour--
			if gmode == 2 then
				function runner()
					race =
						gg.choice(
							{
								checkc .. "[✅] • 2b free checkpoints",
								"⬅ Back",
							},
							nil,
							"[⏫️️] • Parkour challenge"
						)
					if race == 1 then
						if checkc == OFF then
							Patch(I[38], "E07B40B2C0035FD6")
							checkc = ON
						else
							Restore(I[38])
							checkc = OFF
							gg.toast("Reverted")
						end
						runner()
					end
				end

				if race == 2 then
					mode()
				end
				if race == nil then
					gg.setVisible(false)
					while true do
						if gg.isVisible(true) then
							gg.setVisible(false)
							runner()
						end
					end
				end
				runner()
			end

			--campaign
			if gmode == 3 then
				pan =
					gg.choice(
						{ "[📔️] • unlock all worlds", "⬅ Back" },
						nil,
						"[📔️] • Campaign"
					)
				if pan == 1 then
					Patch(I[51], "20008052C0035FD6")
				end
				if pan == 2 then
					yes()
				end
				if pan == nil then
					yes()
				end
			end
			if gmode == 4 then
				yes()
			end
			if gmode == nil then
				gg.setVisible(false)
				while true do
					if gg.isVisible(true) then
						gg.setVisible(false)
						mode()
					end
				end
			end
		end

		mode()
	end
end
