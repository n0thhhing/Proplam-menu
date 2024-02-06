--require "toggles"
--require "patchers"

--main gameplay--
function yes()
  local gameplay =
    gg.choice(
      { '[🎣] • Hooks', '[📢] • Non hooks', '[🕹️] • Gamemodes', '⬅ Back' },
      nil,
      '🕹️ • Gameplay'
    )

  --gameplay exits--
  if gameplay == 4 then
    game = 1
    home()
  end

  if gameplay == nil then
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
  if gameplay == 1 then
    findClassPointer('WeaponSounds')
    function Hooky()
      hooks =
        gg.choice(
          { '[🔫] • weapon mods', '[🛡️] • Utilities', '[🔮] • Effects', '⬅ Back' },
          nil,
          '🎣 • Hooks'
        )

      local bigFloat = '1000000.0'
      local class = 'WeaponSounds'
      local scopefast = { { '0xE8', gg.TYPE_BYTE, 100 } }
      local isharpoon =
        {
          { '0x2B8', gg.TYPE_BYTE, 1 },
          { '0x2C8', gg.TYPE_FLOAT, 10 },
          { '0x2D0', gg.TYPE_FLOAT, 15 },
          { '0x2D4', gg.TYPE_FLOAT, 9 },
        }
      local canbuy =
        {
          { '0x5D1', gg.TYPE_BYTE, 1 },
          { '0x81', gg.TYPR_BYTE, 1 },
          { '0x82', gg.TYPE_BYTE, 1 },
          { '0x80', gg.TYPE_BYTE, 1 },
          { '0x83', gg.TYPE_BYTE, 1 },
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

      if hooks == 1 then
        function weaponmod()
          wep =
            gg.choice(
              {
                '⬅ Back',
                '[🧪] • Lazer shots',
                '[⏭️] • Always dash',
                '[⏳] • No charge time',
                '[💥] • Exploding bullets',
                '[🔄] • No recoil',
                '[↪️] • Ignore reflection',
                '[😲] • Shotgun',
                '[🗡️] • Inf melee range',
                '[🧨️] • Bazooka',
                '[💣️] • Grenade launcher',
                '️[🚬] • Fan rocket',
                '[👻️] • Ghost',
              },
              nil,
              '[🔫] • weapon mods'
            )
          local railgunoffsets = { { Field[1], gg.TYPE_BYTE, 1 }, { Field[2], gg.TYPE_FLOAT, 1 } }
          function railgun()
            for i, v in ipairs(railgunoffsets) do
              hackOffset(v[1], v[2], v[3])
            end
          end

          if wep == 2 then
            railgun()
            weaponmod()
          end
          local dashoffset = { { Field[3], gg.TYPE_BYTE, 1 }, { Field[4], gg.TYPE_FLOAT, 5 } }
          function dash()
            for i, v in ipairs(dashoffset) do
              hackOffset(v[1], v[2], v[3])
            end
          end

          if wep == 3 then
            dash()
            weaponmod()
          end
          local chargeweptime = { { Field[5], gg.TYPE_FLOAT, 0 } }
          function nocharge()
            for i, v in ipairs(chargeweptime) do
              hackOffset(v[1], v[2], v[3])
            end
          end

          if wep == 4 then
            nocharge()
            weaponmod()
          end
          local bulletexplode = { { Fieldp[6], gg.TYPE_BYTE, 1 } }
          function bulletexplodingllet()
            for i, v in ipairs(bulletexplode) do
              hackOffset(v[1], v[2], v[3])
            end
          end

          if wep == 5 then
            bulletexplodingllet()
            weaponmod()
          end
          local recoil = { { Field[7], gg.TYPE_FLOAT, 0 } }
          function downrec()
            for i, v in ipairs(recoil) do
              hackOffset(v[1], v[2], v[3])
            end
          end

          if wep == 6 then
            downrec()
            weaponmod()
          end
          local ignorereflect =
            {
              { Field[8], gg.TYPE_BYTE, 1 },
              { Field[9], gg.TYPE_BYTE, 1 },
              { Field[10], gg.TYPE_BYTE, 1 },
            }
          function reflect()
            for i, v in ipairs(ignorereflect) do
              hackOffset(v[1], v[2], v[3])
            end
          end

          if wep == 7 then
            reflect()
            weaponmod()
          end
          local shotgunn = { { Field[11], gg.TYPE_BYTE, 1 } }
          function shotguns()
            for i, v in ipairs(shotgunn) do
              hackOffset(v[1], v[2], v[3])
            end
          end

          if wep == 8 then
            shotguns()
            weaponmod()
          end
          local isrange = { { Field[12], gg.TYPE_FLOAT, bigFloat } }
          function melee()
            for i, v in ipairs(isrange) do
              hackOffset(v[1], v[2], v[3])
            end
          end

          if wep == 9 then
            melee()
            weaponmod()
          end
          local bazoo = { { Field[13], gg.TYPE_BYTE, 1 } }
          function booz()
            for i, v in ipairs(bazoo) do
              hackOffset(v[1], v[2], v[3])
            end
          end

          if wep == 10 then
            booz()
            weaponmod()
          end
          local grenade = { { Field[14], gg.TYPE_BYTE, 1 } }
          function launch()
            for i, v in ipairs(grenade) do
              hackOffset(v[1], v[2], v[3])
            end
          end

          if wep == 11 then
            launch()
            weaponmod()
          end
          local fan = { { Field[15], gg.TYPE_BYTE, 1 } }
          function rocketf()
            for i, v in ipairs(fan) do
              hackOffset(v[1], v[2], v[3])
            end
          end

          if wep == 12 then
            rocketf()
            weaponmod()
          end
          local ghost = { { Field[16], gg.TYPE_BYTE, 1 } }
          function ghosty()
            for i, v in ipairs(ghost) do
              hackOffset(v[1], v[2], v[3])
            end
          end

          if wep == 13 then
            ghosty()
            weaponmod()
          end
          if wep == 1 then
            Hooky()
          end
          if wep == nil then
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
      if hooks == 2 then
        function uti()
          uto =
            gg.choice(
              {
                '⬅ Back',
                '[💀] • Kill all',
                '[🩸] • Silent aim',
                '[♾️] • Infinite score',
                '[💯] • Crit',
                '[👻] • Invisible on kill/reload/charge/respawn',
                '[🏃] • Speedboost after kill',
                '[🔰] • 10x dmg',
                '[🧬] • Godmode[test]',
                '[💰] • Coin drop[test]',
                '[👁️] • Xray[test]',
                '[⏫️] • Force double jump',
              },
              nil,
              '[🛡️] • Utilities'
            )
          if uto == 1 then
            Hooky()
          end
          local killAllActive =
            {
              { Field[17], gg.TYPE_BYTE, 1 },
              { Field[18], gg.TYPE_FLOAT, 5 },
              { Field[19], gg.TYPE_FLOAT, 99999 },
            }
          function killAll()
            for i, v in ipairs(killAllActive) do
              hackOffset(v[1], v[2], v[3])
            end
          end

          if uto == 2 then
            killAll()
            uti()
          end
          local roundMelee =
            {
              { Field[20], gg.TYPE_BYTE, 1 },
              { Field[21], gg.TYPE_FLOAT, bigFloat },
              { Field[22], gg.TYPE_FLOAT, bigFloat },
            }
          function silentAim()
            for i, v in ipairs(roundMelee) do
              hackOffset(v[1], v[2], v[3])
            end
          end

          if uto == 3 then
            silentAim()
            uti()
          end
          local infScoreOffets =
            { { Field[23], gg.TYPE_BYTE, 1 }, { Field[24], gg.TYPE_FLOAT, 99999 } }
          function infScore()
            for i, v in ipairs(infScoreOffets) do
              hackOffset(v[1], v[2], v[3])
            end
          end

          if uto == 4 then
            infScore()
            uti()
          end
          local critoffsets = { { Field[25], gg.TYPE_DWORD, 99999 } }
          function crit()
            for i, v in ipairs(critoffsets) do
              hackOffset(v[1], v[2], v[3])
            end
          end

          if uto == 5 then
            crit()
            uti()
          end
          local invbl =
            {
              { Field[26], gg.TYPE_BYTE, 1 },
              { Field[27], gg.TYPE_BYTE, 1 },
              { Field[28], gg.TYPE_BYTE, 1 },
              { Field[29], gg.TYPE_BYTE, 1 },
              { Field[30], gg.TYPE_FLOAT, bigFloat },
              { Field[31], gg.TYPE_FLOAT, bigFloat },
            }
          function invis()
            for i, v in ipairs(invbl) do
              hackOffset(v[1], v[2], v[3])
            end
          end

          if uto == 6 then
            invis()
            uti()
          end
          local isfast =
            {
              { Field[32], gg.TYPE_BYTE, 1 },
              { Field[33], gg.TYPE_FLOAT, bigFloat },
              { Field[34], gg.TYPE_FLOAT, 10 },
            }
          function fastest()
            for i, v in ipairs(isfast) do
              hackOffset(v[1], v[2], v[3])
            end
          end

          if uto == 7 then
            fastest()
            uti()
          end
          local gundmgoffsets =
            {
              { Field[35], gg.TYPE_BYTE, 1 },
              { Field[36], gg.TYPE_FLOAT, 2.5 },
              { Field[37], gg.TYPE_FLOAT, 5 },
              { Field[38], gg.TYPE_FLOAT, 2.5 },
              { Field[39], gg.TYPE_FLOAT, 50 },
            }
          function dmg()
            for i, v in ipairs(gundmgoffsets) do
              hackOffset(v[1], v[2], v[3])
            end
          end

          if uto == 8 then
            dmg()
            uti()
          end
          local godm =
            {
              { Field[40], gg.TYPE_BYTE, 1 },
              { Field[41], gg.TYPE_BYTE, 1 },
              { Field[42], gg.TYPE_BYTE, 1 },
              { Field[43], gg.TYPE_FLOAT, 9999 },
              { Field[44], gg.TYPE_BYTE, 1 },
              { Field[45], gg.TYPE_FLOAT, 100 },
              { Field[46], gg.TYPE_FLOAT, bigFloat },
              { Field[47], gg.TYPE_BYTE, 1 },
              { Field[48], gg.TYPE_BYTE, 1 },
              { Field[49], gg.TYPE_BYTE, 1 },
              { Field[50], gg.TYPE_FLOAT, 9999 },
            }
          function godd()
            for i, v in ipairs(godm) do
              hackOffset(v[1], v[2], v[3])
            end
          end

          if uto == 9 then
            godd()
            uti()
          end
          local coindrop = { { Field[51], gg.TYPE_BYTE, 1 }, { Field[52], gg.TYPE_FLOAT, 100 } }
          function richasf()
            for i, v in ipairs(coindrop) do
              hackOffset(v[1], v[2], v[3])
            end
          end

          if uto == 10 then
            richasf()
            uti()
          end
          local rayx =
            {
              { Field[53], gg.TYPE_BYTE, 1 },
              { Field[54], gg.TYPE_BYTE, 1 },
              { Field[55], gg.TYPE_BYTE, 1 },
              { Field[56], gg.TYPE_FLOAT, 0 },
              { Field[57], gg.TYPE_BYTE, 1 },
              { Field[58], gg.TYPE_BYTE, 1 },
            }
          function rays()
            for i, v in ipairs(rayx) do
              hackOffset(v[1], v[2], v[3])
            end
          end

          if uto == 11 then
            rays()
            uti()
          end
          local forcejump = { { Field[59], gg.TYPE_BYTE, 1 } }
          function double()
            for i, v in ipairs(forcejump) do
              hackOffset(v[1], v[2], v[3])
            end
          end

          if uto == 12 then
            double()
            uti()
          end

          if uto == nil then
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
      if hooks == 3 then
        function effective()
          effecto =
            gg.choice(
              {
                '⬅ Back',
                '[🐜] • Polymorph',
                '[🔎] • Magnify head',
                '[💉] • Poison effect',
                '[👀] • Blindness effect',
                '[🦠] • Immune to effects[not all]',
                '[💣] • Target explode on kill',
                '[💘] • Charm',
                '[💪] • Weakness',
                '[🌩️] • Electric Shock',
                '[⏪] • Slow down',
                '[🔮]• Curse',
                '[🩼] • Disable jump',
                '[🛠️] • Disable gadget',
              },
              nil,
              '[🔮] • Effects'
            )
          if effecto == 1 then
            Hooky()
          end
          if effecto == nil then
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
              { Field[60], gg.TYPE_BYTE, 1 },
              { Field[61], gg.TYPE_FLOAT, bigFloat },
              { Field[62], gg.TYPE_DWORD, 0 },
              { Field[63], gg.TYPE_FLOAT, bigFloat },
              { Field[64], gg.TYPE_BYTE, 1 },
              { Field[65], gg.TYPE_FLOAT, bigFloat },
              { Field[66], gg.TYPE_FLOAT, bigFloat },
            }
          function polymorpher()
            for i, v in ipairs(polymorpherOffsets) do
              hackOffset(v[1], v[2], v[3])
            end
          end

          if effecto == 2 then
            polymorpher()
            effective()
          end
          local bighead = { { Field[67], gg.TYPE_BYTE, 1 }, { Field[68], gg.TYPE_FLOAT, bigFloat } }
          function bigger()
            for i, v in ipairs(bighead) do
              hackOffset(v[1], v[2], v[3])
            end
          end

          if effecto == 3 then
            bigger()
            effective()
          end
          local poison =
            {
              { Field[69], gg.TYPE_BYTE, 1 },
              { Field[70], gg.TYPE_FLOAT, bigFloat },
              { Field[71], gg.TYPE_FLOAT, bigFloat },
            }
          function pois()
            for i, v in ipairs(poison) do
              hackOffset(v[1], v[2], v[3])
            end
          end

          if effecto == 4 then
            pois()
            effective()
          end
          local blindash =
            { { Field[72], gg.TYPE_BYTE, 1 }, { Field[73], gg.TYPE_FLOAT, bigFloat } }
          function youcantsee()
            for i, v in ipairs(blindash) do
              hackOffset(v[1], v[2], v[3])
            end
          end

          if effecto == 5 then
            youcantsee()
            effective()
          end
          local effectim =
            {
              { Field[74], gg.TYPE_BYTE, 1 },
              { Field[75], gg.TYPE_BYTE, 1 },
              { Field[76], gg.TYPE_BYTE, 1 },
            }
          function immune()
            for i, v in ipairs(effectim) do
              hackOffset(v[1], v[2], v[3])
            end
          end

          if effecto == 6 then
            effective()
            immune()
          end
          local isexplode =
            {
              { Field[77], gg.TYPE_BYTE, 1 },
              { Field[78], gg.TYPE_FLOAT, bigFloat },
              { Field[79], gg.TYPE_FLOAT, bigFloat },
              { Field[80], gg.TYPE_FLOAT, 0 },
            }
          function death()
            for i, v in ipairs(isexplode) do
              hackOffset(v[1], v[2], v[3])
            end
          end

          if effecto == 7 then
            death()
            effective()
          end
          local charm = { { Field[81], gg.TYPE_BYTE, 1 }, { Field[82], gg.TYPE_BYTE, 1 } }
          function charming()
            for i, v in ipairs(charm) do
              hackOffset(v[1], v[2], v[3])
            end
          end

          if effecto == 8 then
            charming()
            effective()
          end
          local weak = { { Field[83], gg.TYPE_BYTE, 1 }, { Field[84], gg.TYPE_FLOAT, bigFloat } }
          function weakash()
            for i, v in ipairs(weak) do
              hackOffset(v[1], v[2], v[3])
            end
          end

          if effecto == 9 then
            weakash()
            effective()
          end
          local shocker =
            {
              { Field[85], gg.TYPE_BYTE, 1 },
              { Field[86], gg.TYPE_FLOAT, 9999 },
              { Field[87], gg.TYPE_FLOAT, 9999 },
            }
          function sens()
            for i, v in ipairs(shocker) do
              hackOffset(v[1], v[2], v[3])
            end
          end

          if effecto == 10 then
            sens()
            effective()
          end
          local slow =
            {
              { Field[88], gg.TYPE_BYTE, 1 },
              { Field[89], gg.TYPE_FLOAT, 10 },
              { Field[90], gg.TYPE_FLOAT, 9999 },
              { Field[91], gg.TYPE_BYTE, 1 },
            }
          function slowash()
            for i, v in ipairs(slow) do
              hackOffset(v[1], v[2], v[3])
            end
          end

          if effecto == 11 then
            slowash()
            effective()
          end
          local curse =
            {
              { Field[92], gg.TYPE_BYTE, 1 },
              { Field[93], gg.TYPE_FLOAT, 9999 },
              { Field[94], gg.TYPE_FLOAT, 9999 },
            }
          function cursed()
            for i, v in ipairs(curse) do
              hackOffset(v[1], v[2], v[3])
            end
          end

          if effecto == 12 then
            cursed()
            effective()
          end
          local disablej = { { Field[95], gg.TYPE_BYTE, 1 }, { Field[96], gg.TYPE_FLOAT, 9999 } }
          function nojump()
            for i, v in ipairs(disablej) do
              hackOffset(v[1], v[2], v[3])
            end
          end

          if effecto == 12 then
            nojump()
            effective()
          end
          local gadget = { { Field[97], gg.TYPE_BYTE, 1 }, { Field[98], gg.TYPE_FLOAT, 9999 } }
          function byegad()
            for i, v in ipairs(gadget) do
              hackOffset(v[1], v[2], v[3])
            end
          end

          if effecto == 13 then
            byegad()
            effective()
          end
        end

        effective()
      end
      if hooks == 4 then
        yes()
      end
      if hooks == nil then
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
  if gameplay == 2 then
    function non()
      nonhook =
        gg.choice(
          {
            inf .. '[🎗] • Infinite ammo',
            fir .. '[☄️] • Fire rate',
            rel .. '[🔄] • Reload speed[does not work anymore',
            gcd .. '[⏱️] • No gadget cooldown',
            tem .. '[☠️] • Teamkill',
            swe .. '[🤬] • No swear filter',
            god .. '[💀] • Godmode[test]',
            tgod .. '[🤖] • Turrent godmode[test]',
            petr .. '[🙀] • No pet respawn time[test]',
            rewp .. '[💵] • reward multi(part 1)',
            xrewm .. '[💵] • reward multi [below 65 only] (part 2)',
            xrewm .. '[💵] • reward multi [lvl65 only] (part 2)',
            '⬅ Back',
          },
          nil,
          '[📢] • Non hooks'
        )

      --ammo--
      if nonhook == 1 then
        if inf == OFF then
          Patch(Offset[28], '20008052C0035FD6')
          inf = ON
        else
          Restore(Offset[28])
          inf = OFF
          gg.toast('Reverted')
        end
        non()
      end

      --fire rate--
      if nonhook == 2 then
        if fir == OFF then
          Patch(Offset[24], 'E07B40B2C0035FD6')
          fir = ON
        else
          Restore(Offset[24])
          fir = OFF
          gg.toast('Reverted')
        end
        non()
      end

      --reload speed--
      if nonhook == 3 then
        gg.alert('patched')
        non()
      end

      --gadget cooldown--
      if nonhook == 4 then
        if gcd == OFF then
          Patch(Offset[18], '20008052C0035FD6')
          Patch(Offset[19], '20008052C0035FD6')
          gcd = ON
        else
          Restore(Offset[19])
          Restore(Offset[18])
          gcd = OFF
          gg.toast('Reverted')
        end
        non()
      end

      --teamkill--
      if nonhook == 5 then
        if tem == OFF then
          o = Offset[26]
          Patch(Offset[26], '00008052C0035FD6')
          Patch(Offset[27], '00008052C0035FD6')
          tem = ON
        else
          Restore(Offset[26])
          Restore(Offset[27])
          tem = OFF
          gg.toast('Reverted')
        end
        non()
      end

      --swear filter--
      if nonhook == 6 then
        if swe == OFF then
          Patch(Offset[28], '00008052C0035FD6')
          swe = ON
        else
          Restore(Offset[28])
          swe = OFF
          gg.toast('Reverted')
        end
        non()
      end

      --godmode--
      if nonhook == 7 then
        if god == OFF then
          Patch(Offset[29], 'C0035FD6')
          Patch(Offset[30], 'C0035FD6')
          Patch(Offset[31], 'C0035FD6')
          Patch(Offset[32], 'C0035FD6')
          god = ON
        else
          Restore(Offset[29])
          Restore(Offset[30])
          Restore(Offset[31])
          Restore(Offset[32])
          god = OFF
          gg.toast('Reverted')
        end
        non()
      end

      --turrentgod--
      if nonhook == 8 then
        if tgod == OFF then
          Patch(Offset[33], 'C0035FD6')
          Patch(Offset[34], 'C0035FD6')
          Patch(Offset[35], 'C0035FD6')
          tgod = ON
        else
          Restore(Offset[33])
          Restore(Offset[34])
          Restore(Offset[35])
          tgod = OFF
          gg.toast('Reverted')
        end
        non()
      end

      --petrespawn--
      if nonhook == 9 then
        if petr == OFF then
          Patch(Offset[36], '00008052C0035FD6')
          petr = ON
        else
          Restore(Offset[36])
          petr = OFF
          gg.toast('Reverted')
        end
        non()
      end

      --multi part 1
      if nonhook == 10 then
        Patch(Offset[63], '20008052C0035FD6')
        is2 = true
        rewp = ON
        non()
      end

      --multi part 2
      if nonhook == 11 then
        if is2 == true then
          gg.alert('you will crash if your level 65')
          if xrewm == OFF then
            Patch(Offset[42], '600C8052C0035FD6')
            xrewm = ON
          else
            Restore(Offset[42])
            xrewm = OFF
          end
        else
          gg.alert('do part 1 first')
        end
        non()
      end

      --restricted multi--
      if nonhook == 12 then
        lvlres =
          gg.choice(
            {
              'First place on Score Board[x99]',
              'Middle place on Score Board[x65]',
              'Last place on Score Board',
              'back[x39]',
            },
            nil,
            'lvl 65 restricted multiplyer'
          )
        if lvlres == 1 then
          if xrewm == OFF then
            Patch(Offset[42], 'E0048052C0035FD6')
            xrewm = ON
          else
            Restore(Offset[42])
            xrewm = OFF
          end
        end

        if lvlres == 2 then
          if xrewm == OFF then
            Patch(Offset[42], '20088052C0035FD6')
            xrewm = ON
          else
            Restore(Offset[42])
            xrewm = OFF
          end
        end

        if lvlres == 3 then
          if xrewm == OFF then
            Patch(Offset[42], '600C8052C0035FD6')
            xrewm = ON
          else
            Restore(Offset[42])
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
  if gameplay == 3 then
    function mode()
      gmode =
        gg.choice(
          { '[⚔️️] • Arena', '[⏫️️] • Parkour challenge', '[📔️] • Campaign', '⬅ Back' },
          nil,
          '[🕹️] • Gamemodes'
        )

      --arena--
      if gmode == 1 then
        function aren()
          arena =
            gg.choice(
              {
                asc .. '[📶️] • 2b score',
                zomb .. '[🤢️] • max zombies in wave[2b]',
                zomb .. '[🤢️] • min zombies in wave[1]',
                '⬅ Back',
              },
              nil,
              '[⚔️️] • Arena'
            )

          if arena == 1 then
            if asc == OFF then
              Patch(Offset[37], 'E07B40B2C0035FD6')
              asc = ON
            else
              asc = OFF
              gg.toast('Reverted')
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
              { checkc .. '[✅] • 2b free checkpoints', '⬅ Back' },
              nil,
              '[⏫️️] • Parkour challenge'
            )
          if race == 1 then
            if checkc == OFF then
              Patch(Offset[38], 'E07B40B2C0035FD6')
              checkc = ON
            else
              Restore(Offset[38])
              checkc = OFF
              gg.toast('Reverted')
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
        pan = gg.choice({ '[📔️] • unlock all worlds', '⬅ Back' }, nil, '[📔️] • Campaign')
        if pan == 1 then
          Patch(Offset[51], '20008052C0035FD6')
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
