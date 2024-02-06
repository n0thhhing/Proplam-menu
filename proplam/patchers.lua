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
Offset[1] = 0x491F3B4 -- clan parts 23.8.0 -- {1 below "internal int get_UpgradeTime() { }"} --done
Offset[2] = 0x491FEA0 -- clan parts second offset 23.8.0-- {1 below "public int get_NextUpPower() { }"} --done
Offset[3] = 0x491F0AC -- clan energy 23.8.0 -- {just search "internal int get_Energy() { }"} --done
Offset[4] = 0x17C9190 -- free lottery 23.8.0 -- {search "= "C"" and make sure its case matched, then the offsets the first int in that class} --done
Offset[5] = 0x2BD4F20 -- &lottocurrency 23.8.0 -- {search "internal GameEventItemType get_Type() { }" and its the int 3 below it(get_count)} --done
Offset[6] = 0x320F340 -- &Collectibles 23.8.0 -- {search "[Obsolete("legacy parameter")]" and the offsets 14 below(hint* its the bottom of a group of 2 int's and has a void int below)} --done
Offset[7] = 0x17C9190 -- &freechestcount 23.8.0 -- { search for the feild "public virtual List<GameEventItemContainer> " and the offset is the first int from the bottom of the class} --done
Offset[8] = 0x2240E5C -- gem clicker 23.8.0 -- {search for a method "List<AlmanachMigrationSettings> " and the bool is 6 below and has a void two above it} --done
Offset[9] = 0x3ED0EC8 -- &taskClicker 23.8.0 -- {search "CustomFirstAndConstNext = 2;" and its the class 5 below, and the offsets the 2nd bool from the bottom of the class} --done
Offset[10] = 0x215CBEC -- &pixelClicker 23.8.0 -- {search "PixelPassCurrencyPromotionUI" and the class is 3 above and the offset is 11 up from the bottom of that class(hint* its the 2nd bool from bottom)} --done
Offset[11] = 0x1E19050 -- &blackMarketClicker 23.8.0 -- {search "internal int CellId; //" and the class is 3 above with the offset 3 down(hint* its the first bool)} --done
Offset[12] = 0x3393944 -- &gadgetUnlocker 23.8.0 -- {search "internal static Dictionary<GadgetCategory," and its the one with a bool above it(you want the bool)} --done
Offset[13] = 0x3216E34 -- &%fmodule 23.8.0 --{search for "internal List<ModulePointWithProbability> " that has a module chest feild with it and go 1 class up and the float offset is 8 below the class} --done
Offset[14] = 0x3954EBC -- &MaxModules 23.8.0 -- {[1] search "internal ModuleData.ModuleRarity Rarity; // " and the offsets 11 up from the bottom of the class above(hint* theres a list 2 below it)} --done
Offset[15] = 0x3955750 -- &MaxModules 23.8.0 -- {[2] its 3 below the previous offset(one below the list)} --done
Offset[16] = 0x3216C84 -- &MaxModules 23.8.0 -- {[3] search "private Lazy<ModuleData>", and the int is 6 below methods with a moduledata above it} --done
Offset[17] = 0x32173EC -- &NoPartsModules 23.8.0 -- {search "internal List<ModulePointWithProbability> " witha module chest above, then go 1 class up and the int is 23 below methods with a bool 2 below it} --done
Offset[18] = 0x282A3CC -- &noGadgetCooldown 23.8.0 -- {[1], search "private static Action<float, bool>" and its slot5} --done
Offset[19] = 0x282A448 -- &noGadgetCooldown 23.8.0 -- {[2], 2 below previous(slot 7)} --done
Offset[20] = 0x20914B4 -- &xpl 23.8.0 {search -- "internal ExperienceController." and its the feilds one, and the int is 9 below methods(a void is below)} --done
Offset[21] = 0x49665D0 -- &lobbybundles 23.8.0 -- {1 class above "LobbyItemPlayerInfo" and the bool is 15 below methods and has a long above it} --done
Offset[22] = 0x3EEB14C -- &validatenickname2[both set to true] 23.8.0 -- {search "public bool ValidateNickName(string "} --done
Offset[23] = 0x3EEB38C -- &validatenickname1 23.8.0 -- {one below this ^^^^} --done
Offset[24] = 0x5464D40 -- &fire rate 23.8.0 -- {search "internal static List<FilterMaps>" and its the one with an int below(not a float) and then the float is 6 below and is the second too first float] --done
Offset[25] = 0x26C5FF4 -- &infammo 23.8.0 -- {1 class above "SpeedModifier = 4;" and its the top the group of bools(float above)} --done
Offset[26] = 0x1915F9C -- &teamkill[1] [both set to false] 23.8.0 -- {its 4 below "	internal static SceneInfo "(the one without a long method string above it)} --done
Offset[27] = 0x1917360 -- &teamkill[2] 23.8.0 -- {9 below this ^^^^} --done
Offset[28] = 0x2321090 -- &swearfilter[set to false] 23.8.0 -- {vctor above "ChangeFillAmountOnDamage}" --done
Offset[29] = 0x551EED8 -- &god[1] 23.8.0 [all set to -> C0035FD6] -- {search "public void  onSyncGadgetReflectorCoeff() { }" then search "Vector3"(hint* its the longer method)} --done
Offset[30] = 0x2862DBC -- &god[2] 23.8.0 -- {4 classes above "private List<PlayerBotInstance>" and its the second float up from the bottom} --done
Offset[31] = 0x52AA7E0 -- &god[3] 23.8.0 -- {search "internal CapeAnimationController", then "private void OnTriggerEnter(Collider " --done
Offset[32] = 0x52A9F50 -- &god[4] 23.8.0 -- {first search the same as above ^^^, then "OnControllerColliderHit(ControllerColliderHit"} --done
Offset[33] = 0x2602920 -- &turrentgod[1] 23.8.0 [all set to C0035FD6] -- {all the minuslive} --done
Offset[34] = 0x2607A78 -- &turrentgod[2] 23.8.0 --done
Offset[35] = 0x59816AC -- &turrentgod[3] 23.8.0 --done
Offset[36] = 0x48CE438 -- &petrespawn 23.8.0 -- {search "internal float get_RespawnTime() { }"} --done
Offset[37] = 0x3A0A900 -- &arenascore 23.8.0 -- {3 below this^^} --done
Offset[38] = 0x597E240 -- &GetFreeCheckpointsCount 23.8.0 -- {GetFreeCheckpointsCount} --done
Offset[39] = 0x17CB81C -- &rarity 23.8.0 -- {the offsets 1 below "internal virtual ItemRarity get_Rarity() { }"} --done
Offset[40] = 0x3D36598 -- useless --not needed
Offset[41] = 0x3D364F8 -- useless --not needed
Offset[42] = 0x419B848 -- Rewards Multiplier In a Game (99x MAX) -- search for the class "DoubleRewardConnectScene" then go one class up, then the int is 1 above the first "Nullable<DateTime> " --done
Offset[43] = 0x255F250 -- Unlimited Super Clan Chest, -- search "Range = 3;" and then go 3 classes up and the int is 9 from the top with a static above and below --done
Offset[44] = 0x255F998 -- Clan Chest Open Price[1] -- 8 below previous offset(to extention) --done
Offset[45] = 0x2560730 -- Clan Chest Open Price[2] -- int is 3 above prevoius with static above --done
Offset[46] = 0x2560730 -- Super Clan Chest Points Modifier -- go to the extension below clan chest price[1] --done
Offset[47] = 0x41A2218 -- Egg Reward Modificator[1] -- search class EggsMigrationView and then go one class up, then go to the top and search "internal List<EggIncubatorProgress> " and the int is one below --done
Offset[48] = 0x41A2218 -- Egg Reward Modificator[2] its 9 up from the previous offsets class with an item rarity above it --done
Offset[49] = 0x32F5130 -- [1]Give all wears/armors/graffiti require parts -- search “ItemEquipParams” and its the one with - offset and the go one class up and the bool is 4 from the bottom with a string 2 below it --done
Offset[50] = 0x32F4EF8 -- [2]10 above this^^, make sure the argument has an int in it, ex: internal int 一丕丄且世丏丄不下 (int 万丆万上丌上丒专上) { } --done
Offset[51] = 0x5987C7C -- campaign -- Search “private Dictionary<int, ChooseBoxItemOnClick>” and the bool is 7 down with a string above it --done
Offset[52] = 0x547EB1C -- guns/shovel 2 --done
Offset[53] = 0x3219554 -- guns/shovel 2 --done
Offset[54] = 0x547EB1C -- royal -- search "[IteratorStateMachine(typeof(BalanceController." with a void above(not bool) then go up until you find a on destroy, and the bool is 13 above it with a static above and a void below --done
Offset[55] = 0x43AB748 -- royal -- search for the feild "internal static Dictionary<CategoryNames, string>" then the bool is 30 down, make sure its the bottom 丅且丞丕丑丗丙世丞(CategoryNames 丛七丑丘丑丐一丗七, ItemRecord 业业丕丂丒万专且三, bool 丙东不丞丏丕丛丏七 = True) { } --done
Offset[56] = 0x43B20C0 -- wep skins -- search "public string weaponViewedId;" and go 1 class down and the bool is 23 up from the bottom with a list item record above --done
Offset[57] = 0x4549EC0 -- wep skins -- search for "internal static Dictionary<string, Dictionary<string, int>> " where theres only one of that method in that class and the int is two above it --done
Offset[58] = 0x439FA64 -- just armor -- Search “	internal static readonly Dictionary<CategoryNames, string” and its the one where it has the same field above it, then search “(GameplayLoopType” and the bool is 8 above with a int being 4 above it --done
Offset[59] = 0x20913F4 -- set custom level --23.8.0 -- search "internal ExperienceController" feild and the int is 7 below methods witha a void above --done
Offset[60] = 0x52AE22C -- Show all Deleted/Exclusive Gadgets[1] 23.8.0 edit both to true -- go one class up from " string leftWearItem, string rightWearItem) { }" and the bool is 5 from the bottom --done
Offset[61] = 0x384E100 -- Show all Deleted/Exclusive Gadgets[2] -- search , PropertiesArmoryItemContainer" and make sure its the 9th one and has a false string in the argument, and the bool is 2 above --done
Offset[62] = 0x2E8C8D8 -- emperor 23.8.0 -- go one class up from "rewardCurrencySingleCountLabel" and the int is one down from methods --done
Offset[63] = 0x419B784 -- inf 2x rew -- search "class DoubleRewardConnectScene" and go one class up and the bool is 9 from the bottom with a date time above --done
Offset[64] = 0x2150EA0 -- max pass[temp] -- go to the 6th Namespace: PGCompany.PixelPass [new line] internal sealed class, then search Nullable<long> method and the int is 9 below it --done
Offset[65] = 0x2157938 -- premium pass -- one above this ^^ --done
Offset[66] = 0x2153C28 -- reset pass -- its the 2nd date time in the same class as this^^ --done
Offset[67] = 0x41A5E98 -- pet egg cd -- search public class Nest : MonoBehaviour and thr long is 14 down --done
Offset[68] = 0x5B6E838 -- mobs per wave -- first int down from public sealed class ZombieCreator --done
Offset[69] = 0x3393944 -- clan gadgets -- one above "	internal static Dictionary<GadgetCategory, List<string>> " --done
Offset[70] = 0x229520C -- set clicker --done
Offset[71] = 0x52ADABC -- unlock unreleased royal and hats -- search "public int currentLevel; //" with multiple feilds and the bool is 6 below methods with an itemrecord x 2 above --done
Offset[72] = 0x4549EC0 -- wear parts [401F80D2C0035FD6 ]-- search " { get; } [new line] internal static Dictionary<string, Dictionary<string," with a list string above it and go 10 down from methods --done
Offset[73] = 0x3201B88 -- wear [true] -- go to "(IReadOnlyList" with an int below(also 5th search) and the bool is 6 above --done
Offset[76] = 0x215D3DC -- gift pass offers 1 -- search "PixelPassLoadingTipsController" and go 3 classes down and the bools 16 down with a string above --done
Offset[77] = 0x215D450 -- gift pass offers 2 -- 1 below this ^^ --done
Offset[78] = 0x215D77C -- gift pass offers 3 -- 9 below this^^ --done
Offset[79] = 0x5617EC0 -- clan wear -- [false] use "BadNetworkBlinkingController" to find class. it is a small class but below is the class for clan Armors. 3rd offset from bottom up, bool --done,
Offset[80] = 0x24EC370 -- collectibles v2 [true] combined with vd3 -- search "internal DateTime StartBuyProxyDate" and go 3 classes down and the bool is 20 up with an int below it
Offset[81] = 0x439FA64 -- unreleased royal [false] --done
Offset[82] = 0x52AE91C --  unreleased royal [true] --done
Offset[83] = 0x17C9190 -- armory price[not weps] --done
--fields
Field = {}
Field[1] = '0x1BC'
Field[2] = '0x1C8'
Field[3] = '0x2A8'
Field[4] = '0x2B0'
Field[5] = '0x1E4'
Field[6] = '0x1A5'
Field[7] = '0xC0'
Field[8] = '0x128'
Field[9] = '0x129'
Field[10] = '0x12A'
Field[11] = '0x1A6'
Field[12] = '0x184'
Field[13] = '0x12B'
Field[14] = '0x158'
Field[15] = '0x16D'
Field[16] = '0x156'
Field[17] = '0x369'
Field[18] = '0x36C'
Field[19] = '0x370'
Field[20] = '0x191'
Field[21] = '0x192'
Field[22] = '0x184'
Field[23] = '0x38C'
Field[24] = '0x398'
Field[25] = '0x47C'
Field[26] = '0x385'
Field[27] = '0x1E8'
Field[28] = '0x37C'
Field[29] = '0x37D'
Field[30] = '0x380'
Field[31] = '0x388'
Field[32] = '0x438'
Field[33] = '0x444'
Field[34] = '0x43C'
Field[35] = '0x3BC'
Field[36] = '0x3C0'
Field[37] = '0x3C4'
Field[38] = '0x3C8'
Field[39] = '0x3CC'
Field[40] = '0x311'
Field[41] = '0x1E9'
Field[42] = '0x1EA'
Field[43] = '0x1EC'
Field[44] = '0x3EC'
Field[45] = '0x3F0'
Field[46] = '0x3F4'
Field[47] = '0x20D'
Field[48] = '0x5A4'
Field[49] = '0x5A5'
Field[50] = '0x5A8'
Field[51] = '0x330'
Field[52] = '0x334'
Field[53] = '0x24B'
Field[54] = '0x24C'
Field[55] = '0x24D'
Field[56] = '0x250'
Field[57] = '0xC6'
Field[58] = '0xC5'
Field[59] = '0x477'
Field[60] = '0x2EC'
Field[61] = '0x2F0'
Field[62] = '0x3D8'
Field[63] = '0x2F8'
Field[64] = '0x2B8'
Field[65] = '0x2E0'
Field[66] = '0x2D8'
Field[67] = '0x260'
Field[68] = '0x264'
Field[69] = '0x1F8'
Field[70] = '0x200'
Field[71] = '0x204'
Field[72] = '0x268'
Field[73] = '0x270'
Field[74] = '0x248'
Field[75] = '0x249'
Field[76] = '0x24A'
Field[77] = '0x318'
Field[78] = '0x324'
Field[79] = '0x31C'
Field[80] = '0x320'
Field[81] = '0x274'
Field[82] = '0x278'
Field[83] = '0x27C'
Field[84] = '0x280'
Field[85] = '0x42C'
Field[86] = '0x430'
Field[87] = '0x434'
Field[88] = '0x224'
Field[89] = '0x228'
Field[90] = '0x22C'
Field[91] = '0x230'
Field[92] = '0x214'
Field[93] = '0x218'
Field[94] = '0x21C'
Field[95] = '0x20E'
Field[96] = '0x210'
Field[97] = '0x1F0'
Field[98] = '0x1F4'
