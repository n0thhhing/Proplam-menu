require('account')
require('config')
require('gameplay')
require('patchers')
require('rewards')
require('clickers')
require('misk')
require('toggles')

local version = '24.4.1'

local function main()
  local mainMenu =
    gg.choice(
      {
        '[👥] • Account',
        '[🛡️] • Armory',
        '[💰] • Rewards',
        '[☝️] • Clickers',
        '[🕹️] • Gameplay',
        '[❓] • Misc',
        '[⚙️] • Config',
        '[❔] • TOS',
        '[❌] • Exit',
      },
      nil,
      'PG3D menu by Her[x] ' .. '[' .. version .. ']'
    )

  local function processExit()
    gg.processResume()
    gg.getListItems()
    gg.clearList()
    gg.clearResults()
    gg.toast('[EXIT]')
    gg.setVisible(true)
    print('[Pressed Exit Button]')
    return os.exit()
  end
  if mainMenu == 1 then
    accountMenu()
  end
  if mainMenu == 2 then
    armoryMenu()
  end
  if mainMenu == 3 then
    rewardsMenu()
  end
  if mainMenu == 4 then
    clickerMenu()
  end
  if mainMenu == 5 then
    gameplayMenu()
  end
  if mainMenu == 6 then
    miskMenu()
  end
  if mainMenu == 7 then
    configure(main)
  end
  if mainMenu == 8 then
    gg.alert(
      'By accessing and using this OPEN SOURCE menu, you agree to the following terms:' .. '\nUsage Rights: You are granted the right to use, modify, repurpose, fork, and clone the menu for personal or commercial purposes.' .. '\nRestriction on Sale: You shall not sell, sublicense, or otherwise distribute the menu or any derivative works thereof, whether modified or unmodified, in any form.' .. '\nAttribution: While not mandatory, attribution to myself or any associated developers is appreciated but not required, although any modifications, repurposes, forks ect should have the link to this one with the terms stated in #4.' .. '\nLink to Repository: Any usage of the menu must include a prominent link to the repository where it is hosted.' .. '\nNo Warranty: The menu is provided "as is" without any warranty, express or implied. I shall not be liable for any damages arising from the use or inability to use the menu.' .. '\nModification: I reserve the right to modify these terms at any time without prior notice.'
    )
  end
  if mainMenu == 9 then
    processExit()
  end
end

local isVisible = 0
while true do
  if gg.isVisible(true) then
    isVisible = 1
    gg.setVisible(false)
  end
  gg.clearResults()
  if isVisible == 1 then
    main()
  end
end
