--require "toggles"
lib = 'libil2cpp.so'

--feild patcher--
function O_dinitial_search(class)
  gg.setRanges(gg.REGION_OTHER)
  gg.searchNumber(':' .. class, gg.TYPE_BYTE)
  count = gg.getResultsCount()
  if count == 0 then
  else
    Refiner = gg.getResults(1)
    gg.refineNumber(Refiner[1].value, gg.TYPE_BYTE)
    count = gg.getResultsCount()
    val = gg.getResults(count)
    gg.addListItems(val)
  end
end

function CA_pointer_search()
  gg.clearResults()
  gg.setRanges(gg.REGION_C_ALLOC)
  gg.loadResults(gg.getListItems())
  gg.searchPointer(0)
  count = gg.getResultsCount()
  vel = gg.getResults(count)
  gg.clearList()
  gg.addListItems(vel)
end

function CA_apply_offset()
  tanker = 0xfffffffffffffff0
  local copy = false
  local l = gg.getListItems()
  if not copy then
    gg.removeListItems(l)
  end
  for i, v in ipairs(l) do
    v.address = v.address + tanker
    if copy then
      v.name = v.name .. ' #2'
    end
  end
  gg.addListItems(l)
end

function A_base_value()
  gg.setRanges(gg.REGION_ANONYMOUS)
  gg.loadResults(gg.getListItems())
  gg.clearList()
  gg.searchPointer(0)
  count = gg.getResultsCount()
  tel = gg.getResults(count)
  gg.addListItems(tel)
end

function A_base_accuracy()
  gg.setRanges(gg.REGION_ANONYMOUS | gg.REGION_C_ALLOC)
  gg.loadResults(gg.getListItems())
  gg.clearList()
  gg.searchPointer(0)
  count = gg.getResultsCount()
  kol = gg.getResults(count)
  i = 1
  h = {}
  while (i - 1) < count do
    h[i] = {}
    h[i].address = kol[i].value
    h[i].flags = 32
    i = i + 1
  end
  gg.addListItems(h)
end

function A_user_given_offset(_offset, type)
  local _offset = load('return ' .. _offset)()
  local old_save_list = gg.getListItems()
  for i, v in ipairs(old_save_list) do
    v.address = v.address + _offset
    v.flags = type
  end
  gg.clearResults()
  gg.loadResults(old_save_list)
end

function findClassPointer(class)
  gg.clearResults()
  gg.clearList()
  O_dinitial_search(class)
  CA_pointer_search()
  CA_apply_offset()
  A_base_value()
  A_base_accuracy()
end

function hackOffset(_offset, type, value)
  A_user_given_offset(_offset, type)
  gg.refineNumber('0~40', type)
  gg.getResults(99999999)
  gg.editAll(value, type)
end

--patcher--
function Patch(offset, hex)
  local ms = ''
  if tabl0001 == nil then
    tabl0001 = {}
  end
  local targetAddr = 0
  local hexStrCount = #hex:gsub('%s+', '') --remove spaces between hex
  if hexStrCount % 2 ~= 0 then
    return print('Check your hex again. Something wrong there')
  end --hexs must be even number. not odd.
  local hexCount = hexStrCount / 2
  for i, v in ipairs(gg.getRangesList(lib)) do
    if v.type:sub(3, 3) == 'x' then
      targetAddr = v.start + offset
      break
    end
  end
  local editHex = {}
  local ed = {}
  for i = 1, hexCount do
    editHex[i] = {
      address = targetAddr + (i - 1),
      flags = gg.TYPE_BYTE,
    }
  end
  gg.loadResults(editHex)
  local res = gg.getResults(gg.getResultsCount())
  for i in ipairs(res) do
    ms = string.format('%x', res[i].value)
    ms = string.upper(ms)
    ms = ms:gsub('FFFFFFFFFFFFFF', '')
    if ms == '0' then
      ms = ms:gsub('0', '00')
    end
    if #ms == 1 then
      ms = '0' .. ms
    end
    ed[i] = ms
  end
  ms = table.concat(ed)
  ms = 'h' .. ms
  lob = #tabl0001 + 1
  oft = #tabl0001 + 2
  eiz = #tabl0001 + 3
  tabl0001[lob] = lib
  tabl0001[oft] = offset
  tabl0001[eiz] = ms
  gg.loadResults(editHex)
  gg.getResults(hexCount)
  gg.editAll('h' .. hex, gg.TYPE_BYTE)
  gg.clearResults()
end

------------------------------------------------------------------------------

--revert--
function Restore(offset)
  for i = 1, #tabl0001 do
    if tabl0001[i] == lib and tabl0001[i + 1] == offset then
      edi = tabl0001[i + 2]
      hex = #tabl0001[i + 2] - 1
    end
  end
  for i, v in ipairs(gg.getRangesList()) do
    if v.type:sub(3, 3) == 'x' then
      targetAddr = v.start + offset
      break
    end
  end
  local editHex = {}
  local ed = {}
  hex = hex / 2
  for i = 1, hex do
    editHex[i] = {
      address = targetAddr + (i - 1),
      flags = gg.TYPE_BYTE,
    }
  end
  gg.loadResults(editHex)
  gg.getResults(gg.getResultsCount())
  gg.editAll(edi, 1)
  gg.clearResults()
end

------------------------------------------------------------------------------

--on/off toggle--
function Patch_switch(name, offset, hex, offset2, hex2, offset3, hex3, offset4, hex4)
  if name == OFF then
    if hex2 == nil and hex3 == nil and hex4 == nil then
      Patch(offset, hex)
      name = ON
    elseif hex3 == nil and hex4 == nil then
      Patch(offset, hex)
      Patch(offset2, hex2)
      name = ON
    elseif hex4 == nil then
      Patch(offset, hex)
      Patch(offset2, hex2)
      Patch(offset3, hex3)
      name = ON
    else
      Patch(offset, hex)
      Patch(offset2, hex2)
      Patch(offset3, hex3)
      Patch(offset4, hex4)
      name = ON
    end
  else
    if hex2 == nil and hex3 == nil and hex4 == nil then
      Restore(offset)
      name = OFF
    elseif hex3 == nil and hex4 == nil then
      Restore(offset)
      Restore(offset2)
      name = OFF
    elseif hex4 == nil then
      Restore(offset)
      Restore(offset2)
      Restore(offset3)
      name = OFF
    else
      Restore(offset)
      Restore(offset2)
      Restore(offset3)
      Restore(offset4)
      name = OFF
    end
  end
end

--[[try at fix/simplify]]
--[[
function Switch(name, offsets, hex_values)
    if name == OFF then
        for i, offset in ipairs(offsets) do
            Patch(offset, hex_values[i])
        end
        name = ON
    elseif name == ON then
        for i = #offsets, 1, -1 do
            Restore(offsets[i])
        end
        name = OFF
    end
    return name
end

--example usage--
local patchOffsets = {0x1000, 0x2000, 0x3000},{{A,B,C}}

-- Toggle patches based on the state
Switch(shit, patchOffsets)
]]
------------------------------------------------------------------------------

--hex--
xtrue = '20008052C0035FD6'
xfalse = '00008052C0035FD6'
xret = 'C0035FD6'

--int--
zer = xfalse --0
twf = '401F80D2C0035FD6' --250
fvh = '803E80D2C0035FD6' --500
tho = '007D80D2C0035FD6' --1000
two = '803881D2C0035FD6' --2500
twn = '00E284D2C0035FD6' --10000
fft = '006A98D2C0035FD6' --50000
omi = '0002A0D2C0035FD6' --1m
tbi = 'E07B40B2C0035FD6' --2b
--rarity--
com = '00008052C0035FD6'
uco = '20008052C0035FD6'
ror = '40008052C0035FD6'
epi = '60008052C0035FD6'
leg = '80008052C0035FD6'
myt = 'A0008052C0035FD6'

--offsets
Offset = {}
Offset[1] = 0x4A70BE8 -- clan parts [1]
Offset[2] = 0x4A716D4 -- clan parts [2]
Offset[3] = 0x4A708E0 -- clan energy
Offset[4] = 0x178CE98 -- free lottery
Offset[5] = 0x36CBA44 -- lottocurrency
Offset[6] = 0x2F82230 -- Collectibles
Offset[7] = 0x446653C -- freechestcount
Offset[8] = 0x22B4C08 -- gem clicker
Offset[9] = 0x4930D64 -- taskClicker
Offset[10] = 0x2526FCC -- pixelClicker
Offset[11] = 0x2174A94 -- blackMarketClicker
Offset[12] = 0x28614FC -- gadgetUnlocker
Offset[13] = 0x2F8A5C8 -- %fmodule
Offset[14] = 0x33F6150 -- MaxModules [1]
Offset[15] = 0x33F69E4 -- MaxModules [2]
Offset[16] = 0x2F8A418 -- MaxModules [3]
Offset[17] = 0x2F8ACF8 -- NoPartsModules
Offset[18] = 0x2B4DAD0 -- noGadgetCooldown [1]
Offset[19] = 0x2B4DB4C -- noGadgetCooldown [2]
Offset[20] = 0x20C4BA4 -- xp
Offset[21] = 0x2DA94FC -- lobbybundles
Offset[22] = 0x2602920 -- broken
Offset[23] = 0x2602920 -- broken
Offset[24] = 0x516FA08 -- fire rate
Offset[25] = 0x26E1F40 -- infammo
Offset[26] = 0x18D6F30 -- teamkill[1] [both set to false]
Offset[27] = 0x18D8340 -- teamkill[2]
Offset[28] = 0x2602920 -- broken
Offset[29] = 0x522DDEC-- god[1] [all set to -> C0035FD6]
Offset[30] = 0x44F2B90 -- god[2]
Offset[31] = 0x4FBE7B4 -- god[3]
Offset[32] = 0x4FBDF24 -- god[4]
Offset[33] = 0x2602920 -- broken
Offset[34] = 0x2602920 -- broken
Offset[35] = 0x2602920 -- broken
Offset[36] = 0x2602920 -- broken
Offset[37] = 0x36FB7C8 -- arenascore
Offset[38] = 0x56C679C -- GetFreeCheckpointsCount
Offset[39] = 0x178F524 -- rarity [1]
Offset[40] = 0x2602920 -- broken
Offset[41] = 0x2602920 -- broken
Offset[42] = 0x441B518 -- Rewards Multiplier In a Game (99x MAX)
Offset[43] = 0x5285E74 -- Unlimited Super Clan Chest,
Offset[44] = 0x52865C4 -- Clan Chest Open Price[1]
Offset[45] = 0x528729C -- Clan Chest Open Price[2]
Offset[46] = 0x5287360 -- Super Clan Chest Points Modifier
Offset[47] = 0x4421EE8 -- Egg Reward Modificator[1]
Offset[48] = 0x4424664 -- Egg Reward Modificator[2]
Offset[49] = 0x249874C -- Give all wears/armors/graffiti require parts [1]
Offset[50] = 0x2EAE900 -- Give all wears/armors/graffiti require parts [2]
Offset[51] = 0x56D0234 -- campaign
Offset[52] = 0x5185F80 -- guns [1]
Offset[53] = 0x5189880 -- guns [2]
Offset[54] = 0x5185F80 -- royal [1]
Offset[55] = 0x40AFCC4 -- royal [2]
Offset[56] = 0x40B663C -- wep skins [1]
Offset[57] = 0x440FC30 -- wep skins [2]
Offset[58] = 0x40A3FA4 -- just armor
Offset[59] = 0x20C4AE4 -- set custom level
Offset[60] = 0x37A93E4 -- Show all Deleted/Exclusive Gadgets [1]
Offset[61] = 0x3879E50 -- Show all Deleted/Exclusive Gadgets [2]
Offset[62] = 0x449C348 -- emperor
Offset[63] = 0x441B454 -- inf 2x rew
Offset[64] = 0x2518114 -- max pass[temp]
Offset[65] = 0x25183E4 -- premium pass
Offset[66] = 0x2522A64 -- reset pass
Offset[67] = 0x46DB9A8 -- pet egg cd
Offset[68] = 0x58D8438 -- mobs per wave
Offset[69] = 0x28614FC -- clan gadgets
Offset[70] = 0x2602920 -- broken
Offset[71] = 0x37A8C74 -- unlock unreleased royal and hats
Offset[72] = 0x440FC30 -- wear parts [401F80D2C0035FD6]
Offset[73] = 0x40A3FA4 -- wear [true]
Offset[76] = 0x2527700 -- gift pass offers [1]
Offset[77] = 0x2527774 -- gift pass offers [2]
Offset[78] = 0x25279C0 -- gift pass offers [3]
Offset[79] = 0x537C964 -- clan wear
Offset[80] = 0x255C5C8 -- collectibles v2 [true] combined with vd3
Offset[81] = 0x40A3FA4 -- unreleased royal [false]
Offset[82] = 0x37A9AD4 -- unreleased royal [true]
Offset[83] = 0x178CE98 -- armory price[not weps]

--fields
Field = {}
Field[1] = 0x1BC -- railgun [1]
Field[2] = 0x1C8 -- railgun [2]
Field[3] = 0x2A8 -- dash [1]
Field[4] = 0x2B0 -- dash [2]
Field[5] = 0x1E4 -- charge
Field[6] = 0x1A5 -- explode
Field[7] = 0xC0 -- recoil
Field[8] = 0x128 -- reflect [1]
Field[9] = 0x129 -- reflect [2]
Field[10] = 0x12A -- reflect [3]
Field[11] = 0x1A6 -- shotgun
Field[12] = 0x183 -- range
Field[13] = 0x12B -- bazooka
Field[14] = 0x158 -- grenade
Field[15] = 0x16D -- fan
Field[16] = 0x156 -- ghost
Field[17] = 0x369 -- kill all [1]
Field[18] = 0x36C -- kill all [2]
Field[19] = 0x370 -- kill all [3]
Field[20] = 0x191 -- round melee [1]
Field[21] = 0x192 -- round melee [2]
Field[22] = 0x184 -- round melee [3]
Field[23] = 0x38C -- inf score [1]
Field[24] = 0x398 -- inf score [2]
Field[25] = 0x80 -- critical
Field[26] = 0x381 -- invisible [1]
Field[27] = 0x1E8 -- invisible [2]
Field[28] = 0x37C -- invisible [3]
Field[29] = 0x381 -- invisible [4]
Field[30] = 0x380 -- invisible [5]
Field[31] = 0x384 -- invisible [6]
Field[32] = 0x438 -- isfast [1]
Field[33] = 0x444 -- isfast [2]
Field[34] = 0x43C -- isfast [3]
Field[35] = 0x3BC -- dmg [1]
Field[36] = 0x3C0 -- dmg [2]
Field[37] = 0x3C4 -- dmg [3]
Field[38] = 0x3C8 -- dmg [4]
Field[39] = 0x3CC -- dmg [5]
Field[40] = 0x311 -- godm [1]
Field[41] = 0x1E9 -- godm [2]
Field[42] = 0x1EA -- godm [3]
Field[43] = 0x1EC -- godm [4]
Field[44] = 0x3EC -- godm [5]
Field[45] = 0x3F0 -- godm [6]
Field[46] = 0x3F4 -- godm [7]
Field[47] = 0x20D -- godm [8]
Field[48] = 0x5A4 -- godm [9]
Field[49] = 0x5A5 -- godm [10]
Field[50] = 0x5A8 -- godm [11]
Field[51] = 0x330 -- coin [1]
Field[52] = 0x334 -- coin [2]
Field[53] = 0x24B -- ray [1]
Field[54] = 0x24C -- ray [2]
Field[55] = 0x24D -- ray [4]
Field[56] = 0x25C -- ray [5]
Field[57] = 0xC6 -- ray [6]
Field[58] = 0xC5 -- ray [7]
Field[59] = 0x477 -- double jump
Field[60] = 0x2EC -- polymorph [1]
Field[61] = 0x2F0 -- polymorph [2]
Field[62] = 0x3D8 -- polymorph [3]
Field[63] = 0x2F8 -- polymorph [4]
Field[64] = 0x2B8 -- polymorph [5]
Field[65] = 0x2E0 -- polymorph [6]
Field[66] = 0x2D8 -- polymorph [7]
Field[67] = 0x260 -- bighead [1]
Field[68] = 0x264 -- bighead [2]
Field[69] = 0xC1 -- poison [1]
Field[70] = 0xD8 -- poison [2]
Field[71] = 0x204 -- poison [3]
Field[72] = 0x268 -- blind [1]
Field[73] = 0x270 -- blind [2]
Field[74] = 0x248 -- effect immunity [1]
Field[75] = 0x249 -- effect immunity [2]
Field[76] = 0x24A -- effect immunity [3]
Field[77] = 0x318 -- explode die [1]
Field[78] = 0x324 -- explode die [2]
Field[79] = 0x31C -- explode die [3]
Field[80] = 0x320 -- explode die [4]
Field[81] = 0x274 -- charm [1]
Field[82] = 0x278 -- charm [2]
Field[83] = 0x27C -- weak [1]
Field[84] = 0x280 -- weak [2]
Field[85] = 0xA9 -- shock [1]
Field[86] = 0xAC -- shock [2]
Field[87] = 0xB0 -- shock [3]
Field[88] = 0xC2 -- slow [1]
Field[89] = 0xEC -- slow [2]
Field[90] = 0xF0 -- slow [3]
Field[91] = 0x230 -- slow [4]
Field[92] = 0x214 -- curse [1]
Field[93] = 0x218 -- curse [2]
Field[94] = 0x21C -- curse [3]
Field[95] = 0x20E -- disable jump [1]
Field[96] = 0x210 -- disable jump [2]
Field[97] = 0x1F0 -- gadget [1]
Field[98] = 0x1F4 -- gadget [2]