--require "toggles"
lib = "libil2cpp.so"

--feild patcher--
function O_dinitial_search(class)
	gg.setRanges(gg.REGION_OTHER)
	gg.searchNumber(":" .. class, gg.TYPE_BYTE)
	count = gg.getResultsCount()
	if (count == 0) then
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
			v.name = v.name .. " #2"
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
	local _offset = load("return " .. _offset)()
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
	gg.refineNumber("0~40", type)
	gg.getResults(99999999)
	gg.editAll(value, type)
end

--patcher--
function Patch(offset, hex)
	local ms = ""
	if tabl0001 == nil then
		tabl0001 = {}
	end
	local targetAddr = 0
	local hexStrCount = #hex:gsub("%s+", "") --remove spaces between hex
	if hexStrCount % 2 ~= 0 then
		return print("Check your hex again. Something wrong there")
	end --hexs must be even number. not odd.
	local hexCount = hexStrCount / 2
	for i, v in ipairs(gg.getRangesList(lib)) do
		if v.type:sub(3, 3) == "x" then
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
		ms = string.format("%x", res[i].value)
		ms = string.upper(ms)
		ms = ms:gsub("FFFFFFFFFFFFFF", "")
		if ms == "0" then
			ms = ms:gsub("0", "00")
		end
		if #ms == 1 then
			ms = "0" .. ms
		end
		ed[i] = ms
	end
	ms = table.concat(ed)
	ms = "h" .. ms
	lob = #tabl0001 + 1
	oft = #tabl0001 + 2
	eiz = #tabl0001 + 3
	tabl0001[lob] = lib
	tabl0001[oft] = offset
	tabl0001[eiz] = ms
	gg.loadResults(editHex)
	gg.getResults(hexCount)
	gg.editAll("h" .. hex, gg.TYPE_BYTE)
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
		if v.type:sub(3, 3) == "x" then
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
function Patch_switch(
name,
	offset,
	hex,
	offset2,
	hex2,
	offset3,
	hex3,
	offset4,
	hex4
)
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

--[[try at fix/simplify]] --[[
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
xtrue = "20008052C0035FD6"
xfalse = "00008052C0035FD6"
xret = "C0035FD6"

--int--
zer = xfalse --0
twf = "401F80D2C0035FD6" --250
fvh = "803E80D2C0035FD6" --500
tho = "007D80D2C0035FD6" --1000
two = "803881D2C0035FD6" --2500
twn = "00E284D2C0035FD6" --10000
fft = "006A98D2C0035FD6" --50000
omi = "0002A0D2C0035FD6" --1m
tbi = "E07B40B2C0035FD6" --2b
--rarity--
com = "00008052C0035FD6"
uco = "20008052C0035FD6"
ror = "40008052C0035FD6"
epi = "60008052C0035FD6"
leg = "80008052C0035FD6"
myt = "A0008052C0035FD6"

--offsets
I = {}
I[1] = 0x491F3B4 -- clan parts 23.8.0 -- {1 below "internal int get_UpgradeTime() { }"} --done
I[2] = 0x491FEA0 -- clan parts second offset 23.8.0-- {1 below "public int get_NextUpPower() { }"} --done
I[3] = 0x491F0AC -- clan energy 23.8.0 -- {just search "internal int get_Energy() { }"} --done
I[4] = 0x17C9190 -- free lottery 23.8.0 -- {search "= "C"" and make sure its case matched, then the offsets the first int in that class} --done
I[5] = 0x2BD4F20 -- &lottocurrency 23.8.0 -- {search "internal GameEventItemType get_Type() { }" and its the int 3 below it(get_count)} --done
I[6] = 0x320F340 -- &Collectibles 23.8.0 -- {search "[Obsolete("legacy parameter")]" and the offsets 14 below(hint* its the bottom of a group of 2 int's and has a void int below)} --done
I[7] = 0x17C9190 -- &freechestcount 23.8.0 -- { search for the feild "public virtual List<GameEventItemContainer> " and the offset is the first int from the bottom of the class} --done
I[8] = 0x2240E5C -- gem clicker 23.8.0 -- {search for a method "List<AlmanachMigrationSettings> " and the bool is 6 below and has a void two above it} --done
I[9] = 0x3ED0EC8 -- &taskClicker 23.8.0 -- {search "CustomFirstAndConstNext = 2;" and its the class 5 below, and the offsets the 2nd bool from the bottom of the class} --done
I[10] = 0x215CBEC -- &pixelClicker 23.8.0 -- {search "PixelPassCurrencyPromotionUI" and the class is 3 above and the offset is 11 up from the bottom of that class(hint* its the 2nd bool from bottom)} --done
I[11] = 0x1E19050 -- &blackMarketClicker 23.8.0 -- {search "internal int CellId; //" and the class is 3 above with the offset 3 down(hint* its the first bool)} --done
I[12] = 0x3393944 -- &gadgetUnlocker 23.8.0 -- {search "internal static Dictionary<GadgetCategory," and its the one with a bool above it(you want the bool)} --done
I[13] = 0x3216E34 -- &%fmodule 23.8.0 --{search for "internal List<ModulePointWithProbability> " that has a module chest feild with it and go 1 class up and the float offset is 8 below the class} --done
I[14] = 0x3954EBC -- &MaxModules 23.8.0 -- {[1] search "internal ModuleData.ModuleRarity Rarity; // " and the offsets 11 up from the bottom of the class above(hint* theres a list 2 below it)} --done
I[15] = 0x3955750 -- &MaxModules 23.8.0 -- {[2] its 3 below the previous offset(one below the list)} --done
I[16] = 0x3216C84 -- &MaxModules 23.8.0 -- {[3] search "private Lazy<ModuleData>", and the int is 6 below methods with a moduledata above it} --done
I[17] = 0x32173EC -- &NoPartsModules 23.8.0 -- {search "internal List<ModulePointWithProbability> " witha module chest above, then go 1 class up and the int is 23 below methods with a bool 2 below it} --done
I[18] = 0x282A3CC -- &noGadgetCooldown 23.8.0 -- {[1], search "private static Action<float, bool>" and its slot5} --done
I[19] = 0x282A448 -- &noGadgetCooldown 23.8.0 -- {[2], 2 below previous(slot 7)} --done
I[20] = 0x20914B4 -- &xpl 23.8.0 {search -- "internal ExperienceController." and its the feilds one, and the int is 9 below methods(a void is below)} --done
I[21] = 0x49665D0 -- &lobbybundles 23.8.0 -- {1 class above "LobbyItemPlayerInfo" and the bool is 15 below methods and has a long above it} --done
I[22] = 0x3EEB14C -- &validatenickname2[both set to true] 23.8.0 -- {search "public bool ValidateNickName(string "} --done
I[23] = 0x3EEB38C -- &validatenickname1 23.8.0 -- {one below this ^^^^} --done
I[24] = 0x5464D40 -- &fire rate 23.8.0 -- {search "internal static List<FilterMaps>" and its the one with an int below(not a float) and then the float is 6 below and is the second too first float] --done
I[25] = 0x26C5FF4 -- &infammo 23.8.0 -- {1 class above "SpeedModifier = 4;" and its the top the group of bools(float above)} --done
I[26] = 0x1915F9C -- &teamkill[1] [both set to false] 23.8.0 -- {its 4 below "	internal static SceneInfo "(the one without a long method string above it)} --done
I[27] = 0x1917360 -- &teamkill[2] 23.8.0 -- {9 below this ^^^^} --done
I[28] = 0x2321090 -- &swearfilter[set to false] 23.8.0 -- {vctor above "ChangeFillAmountOnDamage}" --done
I[29] = 0x551EED8 -- &god[1] 23.8.0 [all set to -> C0035FD6] -- {search "public void  onSyncGadgetReflectorCoeff() { }" then search "Vector3"(hint* its the longer method)} --done
I[30] = 0x2862DBC -- &god[2] 23.8.0 -- {4 classes above "private List<PlayerBotInstance>" and its the second float up from the bottom} --done
I[31] = 0x52AA7E0 -- &god[3] 23.8.0 -- {search "internal CapeAnimationController", then "private void OnTriggerEnter(Collider " --done
I[32] = 0x52A9F50 -- &god[4] 23.8.0 -- {first search the same as above ^^^, then "OnControllerColliderHit(ControllerColliderHit"} --done
I[33] = 0x2602920 -- &turrentgod[1] 23.8.0 [all set to C0035FD6] -- {all the minuslive} --done
I[34] = 0x2607A78 -- &turrentgod[2] 23.8.0 --done
I[35] = 0x59816AC -- &turrentgod[3] 23.8.0 --done
I[36] = 0x48CE438 -- &petrespawn 23.8.0 -- {search "internal float get_RespawnTime() { }"} --done
I[37] = 0x3A0A900 -- &arenascore 23.8.0 -- {3 below this^^} --done
I[38] = 0x597E240 -- &GetFreeCheckpointsCount 23.8.0 -- {GetFreeCheckpointsCount} --done
I[39] = 0x17CB81C -- &rarity 23.8.0 -- {the offsets 1 below "internal virtual ItemRarity get_Rarity() { }"} --done
I[40] = 0x3D36598 -- useless --not needed
I[41] = 0x3D364F8 -- useless --not needed
I[42] = 0x419B848 -- Rewards Multiplier In a Game (99x MAX) -- search for the class "DoubleRewardConnectScene" then go one class up, then the int is 1 above the first "Nullable<DateTime> " --done
I[43] = 0x255F250 -- Unlimited Super Clan Chest, -- search "Range = 3;" and then go 3 classes up and the int is 9 from the top with a static above and below --done
I[44] = 0x255F998 -- Clan Chest Open Price[1] -- 8 below previous offset(to extention) --done
I[45] = 0x2560730 -- Clan Chest Open Price[2] -- int is 3 above prevoius with static above --done
I[46] = 0x2560730 -- Super Clan Chest Points Modifier -- go to the extension below clan chest price[1] --done
I[47] = 0x41A2218 -- Egg Reward Modificator[1] -- search class EggsMigrationView and then go one class up, then go to the top and search "internal List<EggIncubatorProgress> " and the int is one below --done
I[48] = 0x41A2218 -- Egg Reward Modificator[2] its 9 up from the previous offsets class with an item rarity above it --done
I[49] = 0x32F5130 -- [1]Give all wears/armors/graffiti require parts -- search “ItemEquipParams” and its the one with - offset and the go one class up and the bool is 4 from the bottom with a string 2 below it --done
I[50] = 0x32F4EF8 -- [2]10 above this^^, make sure the argument has an int in it, ex: internal int 一丕丄且世丏丄不下 (int 万丆万上丌上丒专上) { } --done
I[51] = 0x5987C7C -- campaign -- Search “private Dictionary<int, ChooseBoxItemOnClick>” and the bool is 7 down with a string above it --done
I[52] = 0x547EB1C -- guns/shovel 2 --done
I[53] = 0x3219554 -- guns/shovel 2 --done
I[54] = 0x547EB1C -- royal -- search "[IteratorStateMachine(typeof(BalanceController." with a void above(not bool) then go up until you find a on destroy, and the bool is 13 above it with a static above and a void below --done
I[55] = 0x43AB748 -- royal -- search for the feild "internal static Dictionary<CategoryNames, string>" then the bool is 30 down, make sure its the bottom 丅且丞丕丑丗丙世丞(CategoryNames 丛七丑丘丑丐一丗七, ItemRecord 业业丕丂丒万专且三, bool 丙东不丞丏丕丛丏七 = True) { } --done
I[56] = 0x43B20C0 -- wep skins -- search "public string weaponViewedId;" and go 1 class down and the bool is 23 up from the bottom with a list item record above --done
I[57] = 0x4549EC0 -- wep skins -- search for "internal static Dictionary<string, Dictionary<string, int>> " where theres only one of that method in that class and the int is two above it --done
I[58] = 0x439FA64 -- just armor -- Search “	internal static readonly Dictionary<CategoryNames, string” and its the one where it has the same field above it, then search “(GameplayLoopType” and the bool is 8 above with a int being 4 above it --done
I[59] = 0x20913F4 -- set custom level --23.8.0 -- search "internal ExperienceController" feild and the int is 7 below methods witha a void above --done
I[60] = 0x52AE22C -- Show all Deleted/Exclusive Gadgets[1] 23.8.0 edit both to true -- go one class up from " string leftWearItem, string rightWearItem) { }" and the bool is 5 from the bottom --done
I[61] = 0x384E100 -- Show all Deleted/Exclusive Gadgets[2] -- search , PropertiesArmoryItemContainer" and make sure its the 9th one and has a false string in the argument, and the bool is 2 above --done
I[62] = 0x2E8C8D8 -- emperor 23.8.0 -- go one class up from "rewardCurrencySingleCountLabel" and the int is one down from methods --done
I[63] = 0x419B784 -- inf 2x rew -- search "class DoubleRewardConnectScene" and go one class up and the bool is 9 from the bottom with a date time above --done
I[64] = 0x2150EA0 -- max pass[temp] -- go to the 6th Namespace: PGCompany.PixelPass [new line] internal sealed class, then search Nullable<long> method and the int is 9 below it --done
I[65] = 0x2157938 -- premium pass -- one above this ^^ --done
I[66] = 0x2153C28 -- reset pass -- its the 2nd date time in the same class as this^^ --done
I[67] = 0x41A5E98 -- pet egg cd -- search public class Nest : MonoBehaviour and thr long is 14 down --done
I[68] = 0x5B6E838 -- mobs per wave -- first int down from public sealed class ZombieCreator --done
I[69] = 0x3393944 -- clan gadgets -- one above "	internal static Dictionary<GadgetCategory, List<string>> " --done
I[70] = 0x229520C -- set clicker --done
I[71] = 0x52ADABC -- unlock unreleased royal and hats -- search "public int currentLevel; //" with multiple feilds and the bool is 6 below methods with an itemrecord x 2 above --done
I[72] = 0x4549EC0 -- wear parts [401F80D2C0035FD6 ]-- search " { get; } [new line] internal static Dictionary<string, Dictionary<string," with a list string above it and go 10 down from methods --done
I[73] = 0x3201B88 -- wear [true] -- go to "(IReadOnlyList" with an int below(also 5th search) and the bool is 6 above --done
I[76] = 0x215D3DC -- gift pass offers 1 -- search "PixelPassLoadingTipsController" and go 3 classes down and the bools 16 down with a string above --done
I[77] = 0x215D450 -- gift pass offers 2 -- 1 below this ^^ --done
I[78] = 0x215D77C -- gift pass offers 3 -- 9 below this^^ --done
I[79] = 0x5617EC0 -- clan wear -- [false] use "BadNetworkBlinkingController" to find class. it is a small class but below is the class for clan Armors. 3rd offset from bottom up, bool --done,
I[80] = 0x24EC370 -- collectibles v2 [true] combined with vd3 -- search "internal DateTime StartBuyProxyDate" and go 3 classes down and the bool is 20 up with an int below it
I[81] = 0x439FA64 -- unreleased royal [false] --done
I[82] = 0x52AE91C --  unreleased royal [true] --done
I[83] = 0x17C9190 -- armory price[not weps] --done