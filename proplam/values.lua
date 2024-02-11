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
Offset[1] = 0x4A625A0 -- clan parts [1]
Offset[2] = 0x4A6308C -- clan parts [2]
Offset[3] = 0x4A62298 -- clan energy
Offset[4] = 0x1787F38 -- free lottery
Offset[5] = 0x36C4208 -- lottocurrency
Offset[6] = 0x2F80908 -- Collectibles
Offset[7] = 0x4458B10 -- freechestcount
Offset[8] = 0x22B0458 -- gem clicker
Offset[9] = 0x4925524 -- taskClicker
Offset[10] = 0x251FDE0 -- pixelClicker
Offset[11] = 0x21712D0 -- blackMarketClicker
Offset[12] = 0x285759C -- gadgetUnlocker
Offset[13] = 0x2F88CA0 -- %fmodule
Offset[14] = 0x33F2914 -- MaxModules [1]
Offset[15] = 0x33F31A8 -- MaxModules [2]
Offset[16] = 0x2F88AF0 -- MaxModules [3]
Offset[17] = 0x2F893D0 -- NoPartsModules
Offset[18] = 0x2B42B68 -- noGadgetCooldown [1]
Offset[19] = 0x2B42BE4 -- noGadgetCooldown [2]
Offset[20] = 0x20C23E0 -- xp
Offset[21] = 0x2DA2594 -- lobbybundles
Offset[22] = 0x2602920 -- broken
Offset[23] = 0x2602920 -- broken
Offset[24] = 0x5155CB4 -- fire rate
Offset[25] = 0x26DAFE0 -- infammo
Offset[26] = 0x18D1FD0 -- teamkill[1] [both set to false]
Offset[27] = 0x18D33E0 -- teamkill[2]
Offset[28] = 0x2602920 -- broken
Offset[29] = 0x5214098 -- god[1] [all set to -> C0035FD6]
Offset[30] = 0x44E52A8 -- god[2]
Offset[31] = 0x4FA79E4 -- god[3]
Offset[32] = 0x4FA7154 -- god[4]
Offset[33] = 0x2602920 -- broken
Offset[34] = 0x2602920 -- broken
Offset[35] = 0x2602920 -- broken
Offset[36] = 0x2602920 -- broken
Offset[37] = 0x36F3F8C -- arenascore
Offset[38] = 0x56AA6C8 -- GetFreeCheckpointsCount
Offset[39] = 0x178A5C4 -- rarity [1]
Offset[40] = 0x2602920 -- broken
Offset[41] = 0x2602920 -- broken
Offset[42] = 0x440EAEC -- Rewards Multiplier In a Game (99x MAX)
Offset[43] = 0x526C118 -- Unlimited Super Clan Chest,
Offset[44] = 0x526C868 -- Clan Chest Open Price[1]
Offset[45] = 0x526D540 -- Clan Chest Open Price[2]
Offset[46] = 0x526D604 -- Super Clan Chest Points Modifier
Offset[47] = 0x44154BC -- Egg Reward Modificator[1]
Offset[48] = 0x4417C38 -- Egg Reward Modificator[2]
Offset[49] = 0x2490560 -- Give all wears/armors/graffiti require parts [1]
Offset[50] = 0x2EB0FD8 -- Give all wears/armors/graffiti require parts [2]
Offset[51] = 0x56B4160 -- campaign
Offset[52] = 0x516C22C -- guns [1]
Offset[53] = 0x516FB2C -- guns [2]
Offset[54] = 0x516C22C -- royal [1]
Offset[55] = 0x40A2284 -- royal [2]
Offset[56] = 0x40A8BFC -- wep skins [1]
Offset[57] = 0x4403204 -- wep skins [2]
Offset[58] = 0x4096564 -- just armor
Offset[59] = 0x20C2320 -- set custom level
Offset[60] = 0x37A1BA8 -- Show all Deleted/Exclusive Gadgets [1]
Offset[61] = 0x3875614 -- Show all Deleted/Exclusive Gadgets [2]
Offset[62] = 0x448FA60 -- emperor
Offset[63] = 0x440EA28 -- inf 2x rew
Offset[64] = 0x2510F28 -- max pass[temp]
Offset[65] = 0x25111F8 -- premium pass
Offset[66] = 0x251B878 -- reset pass
Offset[67] = 0x46CD0C0 -- pet egg cd
Offset[68] = 0x58BB364 -- mobs per wave
Offset[69] = 0x285759C -- clan gadgets
Offset[70] = 0x2602920 -- broken
Offset[71] = 0x37A1438 -- unlock unreleased royal and hats
Offset[72] = 0x4403204 -- wear parts [401F80D2C0035FD6]
Offset[73] = 0x4096564 -- wear [true]
Offset[76] = 0x2520514 -- gift pass offers [1]
Offset[77] = 0x2520588 -- gift pass offers [2]
Offset[78] = 0x25207D4 -- gift pass offers [3]
Offset[79] = 0x5361C08 -- clan wear
Offset[80] = 0x25553DC -- collectibles v2 [true] combined with vd3
Offset[81] = 0x4096564 -- unreleased royal [false]
Offset[82] = 0x37A2298 -- unreleased royal [true]
Offset[83] = 0x1787F38 -- armory price[not weps]
--fields
Field = {}
Field[1] = '0x1BC' -- railgun [1]
Field[2] = '0x1C8' -- railgun [2]
Field[3] = '0x2A8' -- dash [1]
Field[4] = '0x2B0' -- dash [2]
Field[5] = '0x1E4' -- charge
Field[6] = '0x1A5' -- explode
Field[7] = '0xC0' -- recoil
Field[8] = '0x128' -- reflect [1]
Field[9] = '0x129' -- reflect [2]
Field[10] = '0x12A' -- reflect [3]
Field[11] = '0x1A6' -- shotgun
Field[12] = '0x183' -- range
Field[13] = '0x12B' -- bazooka
Field[14] = '0x158' -- grenade
Field[15] = '0x16D' -- fan
Field[16] = '0x156' -- ghost
Field[17] = '0x369' -- kill all [1]
Field[18] = '0x36C' -- kill all [2]
Field[19] = '0x370' -- kill all [3]
Field[20] = '0x191' -- round melee [1]
Field[21] = '0x192' -- round melee [2]
Field[22] = '0x184' -- round melee [3]
Field[23] = '0x38C' -- inf score [1]
Field[24] = '0x398' -- inf score [2]
Field[25] = '0x80' -- critical
Field[26] = '0x381' -- invisible [1]
Field[27] = '0x1E8' -- invisible [2]
Field[28] = '0x37C' -- invisible [3]
Field[29] = '0x381' -- invisible [4]
Field[30] = '0x380' -- invisible [5]
Field[31] = '0x384' -- invisible [6]
Field[32] = '0x438' -- isfast [1]
Field[33] = '0x444' -- isfast [2]
Field[34] = '0x43C' -- isfast [3]
Field[35] = '0x3BC' -- dmg [1]
Field[36] = '0x3C0' -- dmg [2]
Field[37] = '0x3C4' -- dmg [3]
Field[38] = '0x3C8' -- dmg [4]
Field[39] = '0x3CC' -- dmg [5]
Field[40] = '0x311' -- godm [1]
Field[41] = '0x1E9' -- godm [2]
Field[42] = '0x1EA' -- godm [3]
Field[43] = '0x1EC' -- godm [4]
Field[44] = '0x3EC' -- godm [5]
Field[45] = '0x3F0' -- godm [6]
Field[46] = '0x3F4' -- godm [7]
Field[47] = '0x20D' -- godm [8]
Field[48] = '0x5A4' -- godm [9]
Field[49] = '0x5A5' -- godm [10]
Field[50] = '0x5A8' -- godm [11]
Field[51] = '0x330' -- coin [1]
Field[52] = '0x334' -- coin [2]
Field[53] = '0x24B' -- ray [1]
Field[54] = '0x24C' -- ray [2]
Field[55] = '0x24D' -- ray [4]
Field[56] = '0x25C' -- ray [5]
Field[57] = '0xC6' -- ray [6]
Field[58] = '0xC5' -- ray [7]
Field[59] = '0x477' -- double jump
Field[60] = '0x2EC' -- polymorph [1]
Field[61] = '0x2F0' -- polymorph [2]
Field[62] = '0x3D8' -- polymorph [3]
Field[63] = '0x2F8' -- polymorph [4]
Field[64] = '0x2B8' -- polymorph [5]
Field[65] = '0x2E0' -- polymorph [6]
Field[66] = '0x2D8' -- polymorph [7]
Field[67] = '0x260' -- bighead [1]
Field[68] = '0x264' -- bighead [2]
Field[69] = '0xC1' -- poison [1]
Field[70] = '0xD8' -- poison [2]
Field[71] = '0x204' -- poison [3]
Field[72] = '0x268' -- blind [1]
Field[73] = '0x270' -- blind [2]
Field[74] = '0x248' -- effect immunity [1]
Field[75] = '0x249' -- effect immunity [2]
Field[76] = '0x24A' -- effect immunity [3]
Field[77] = '0x318' -- explode die [1]
Field[78] = '0x324' -- explode die [2]
Field[79] = '0x31C' -- explode die [3]
Field[80] = '0x320' -- explode die [4]
Field[81] = '0x274' -- charm [1]
Field[82] = '0x278' -- charm [2]
Field[83] = '0x27C' -- weak [1]
Field[84] = '0x280' -- weak [2]
Field[85] = '0xA9' -- shock [1]
Field[86] = '0xAC' -- shock [2]
Field[87] = '0xB0' -- shock [3]
Field[88] = '0xC2' -- slow [1]
Field[89] = '0xEC' -- slow [2]
Field[90] = '0xF0' -- slow [3]
Field[91] = '0x230' -- slow [4]
Field[92] = '0x214' -- curse [1]
Field[93] = '0x218' -- curse [2]
Field[94] = '0x21C' -- curse [3]
Field[95] = '0x20E' -- disable jump [1]
Field[96] = '0x210' -- disable jump [2]
Field[97] = '0x1F0' -- gadget [1]
Field[98] = '0x1F4' -- gadget [2]
Hex = {}
Hex[1] =
  'f553bea9f37b01a9759e0190a8264039f303012af40300aa28010037e073019000f442f9fc713097e07301b000b846f9f971309728008052a8260039e00314aa' -- clan parts [1]
Hex[2] =
  'f553bea9f37b01a9559e01f0a8524039f303012af40300aae8010037a07601f0006841f9416f3097c07401b000e047f93e6f3097c07301f000f442f93b6f3097' -- clan parts [2]
Hex[3] =
  'fe0f1ff8c7feff97a00000b400a00191e1031faafe0741f8f4a1e21706733097fe0f1ff895ffff97800000b4000840f9fe0741f8c0035fd6ff723097f40f1ef8' -- clan energy
Hex[4] =
  'fe0f1ff8080840f9e0230091e1031faae80700f9cd0aae94fe0741f8c0035fd6000c40f9c0035fd6018c01f87fdbfb17f60f1df8f55301a9f37b02a9953403b0' -- free lottery
Hex[5] =
  'ffc300d1f55301a9f37b02a9143b029088625e39f30300aa280100370011029000c845f9e2ea7e9780130290007040f9dfea7e972800805288621e39ff0700f9' -- lottocurrency
Hex[6] =
  '00600091e1031faa5c284e14ff8304d1fc7300f9f75b0fa9f55310a9f37b11a9177502b0d64c02d0f30308aae81e6339d6c242f9f403012af503002ac8000037' -- Collectibles
Hex[7] =
  'f553bea9f37b01a995ce01f0a81e4439f30301aaf40300aac8000037e0a30190009840f9a098489728008052a81e0439880e40f9c80100b4e9a30190299940f9' -- freechestcount
Hex[8] =
  'ff4304d1fc6300f9f9630da9f75b0ea9f5530fa9f37b10a975db029094ae0290a8725e3994f242f9f30300aac803003780ae029000f042f9493acf9740b302f0' -- gem clicker
Hex[9] =
  'f37bbfa9f30300aae7ffff97e0000036602a40f9600100b4080040f9098559a920013fd680000036e0031f2af37bc1a8c0035fd6e00313aaf37bc1a8c0ffff17' -- taskClicker
Hex[10] =
  'f553bea9f37b01a9f5c702d0a8d26539f303012af40300aac8000037409e02b0009841f9ec7bc59728008052a8d22539943a40f9e003132ae1031faa30ac7794' -- pixelClicker
Hex[11] =
  'f37bbfa9f30300aae0e6ff97800000b461aa40b9f37bc1a875f5ff17f836d497f37bbfa9f30300aad8e6ff97000100b461aa40b99cf3ff97a00000b400900091' -- blackMarketClicker
Hex[12] =
  'f40f1ef8f37b01a934ae02f088c66a39f30300aa88010037608702d0000843f9fe9db897c08402f0006044f9fb9db897808602b0003c47f9f89db89728008052' -- gadgetUnlocker
Hex[13] =
  'f37bbfa9f30300aa92ffff97e103002ae00313aa84010094800000b4001040bdf37bc1a8c0035fd681d89b97f37bbfa9f30300aa87ffff97e103002ae00313aa' -- %fmodule
Hex[14] =
  'f60f1df8f55301a9f37b02a9945102b0562302f088ba5f39d61243f9f30300aae8010037602302b000b443f91d318a97602b02f0009043f91a318a97002902b0' -- MaxModules [1]
Hex[15] =
  'fe0f1ff8fcfeff971f000071e0179f1afe0741f8c0035fd6f60f1df8f55301a9f37b02a996510290c8c65f39f503022af30301aaf40300aac8000037402a02b0' -- MaxModules [2]
Hex[16] =
  'f40f1ef8f37b01a9d47402b0885a6239f30300aac8000037404b02d0006044f9a9d89b9728008052885a2239e00313aa160000941f040071eb010054484b02d0' -- MaxModules [3]
Hex[17] =
  'f60f1df8f55301a9f37b02a9d674029095460290c87a6239b5da45f9f303012af40300aac80000378046029000d845f96dd69b9728008052c87a2239a00240f9' -- NoPartsModules
Hex[18] =
  'f37bbfa9f30300aa000840f9e00100b4e1031faa73462e940820201e01010054600e40f9200100b4e1031faa6d462e940820201ee0179f1a02000014e0031f2a' -- noGadgetCooldown [1]
Hex[19] =
  'fe0f1ff8081040f9a80000b4e00308aae1031faafe0741f853462e14080040f909855ca920013fd6800000b4e1031faafe0741f80194f417acf0ac97f40f1ef8' -- noGadgetCooldown [2]
Hex[20] =
  'f553bea9f37b01a9d3ea02b0d4c102f068366739949245f9e801003780be02b0007c41f96cf2d69760c202d000ec43f969f2d697c0c102f0009045f966f2d697' -- xp
Hex[21] =
  'f60f1df8f55301a9f37b02a9f48302d0883e6639f30300aae8010037405502f0004044f9ff71a397205802f0002447f9fc71a397e05802d0008442f9f971a397' -- lobbybundles
Hex[22] = 'broken'
Hex[23] = 'broken'
Hex[24] =
  'ffc300d1f55301a9f37b02a9f56601b0343e01f0a8427439944642f9f303002a68030037403b019000a446f935a41497403a01f0007044f932a41497403801d0' -- fire rate
Hex[25] =
  'f40f1ef8f37b01a934ba0290f38b0290882e4639731e44f928010037808e02f0008844f96c8fbe97c08b02f0001c44f9698fbe9728008052882e0639600240f9' -- infammo
Hex[26] =
  '1fa0007168010054e803002a290080522821c89a890680d26901a2f24922c0f21f0109ea6000005420008052c0035fd61f9c0071e8179f1a1fb00071e9179f1a' -- teamkill[1] [both set to false]
Hex[27] =
  'f40f1ef8f37b01a9342a03b0b3fc02b088e66239733e45f928010037400203b0004442f96caef697a0fc02b0003c45f969aef6972800805288e62239600240f9' -- teamkill[2]
Hex[28] = 'broken'
Hex[29] =
  'ff8303d1ef3b046ded33056deb2b066de923076dfc6f08a9fa6709a9f85f0aa9f6570ba9f44f0ca9fd7b0da9f66001f055380190c8de4339b54642f9f403062a' -- god[1] [all set to -> C0035FD6]
Hex[30] =
  'e923bc6df60b00f9f55302a9f37b03a934ca01d0d6a201b088ee5639d6ae45f9f30300aa28010037a0a101f0004442f9b7664697c0a201b000ac45f9b4664697' -- god[2]
Hex[31] =
  'f80f1cf8f75b01a9f55302a9f37b03a9557401f0a8864139f40301aaf30300aae8040037a04b01b0004442f9e95c1b97404d01b0009842f9e65c1b97204d0190' -- god[3]
Hex[32] =
  'ee0f19fcedb3006debab016de9a3026df81f00f9f75b04a9f55305a9f37b06a9557401f0a87e4139f40301aaf30300aaa8050037a04a01d0003046f9095f1b97' -- god[4]
Hex[33] = 'broken'
Hex[34] = 'broken'
Hex[35] = 'broken'
Hex[36] = 'broken'
Hex[37] =
  'f40f1ef8f37b01a9943902b0730e029088c66539731e44f9c8000037600e0290001c44f9812b7e972800805288c62539600240f908e040b968000035b82b7e97' -- arenascore
Hex[38] =
  'f553bea9f37b01a9543c01f0951301d088fa6a39b54642f9f30300aae8010037801301d0004442f9b151ff96001101b0002043f9ae51ff9640120190006044f9' -- GetFreeCheckpointsCount
Hex[39] =
  'f40f1ef8f37b01a9743403d088064c39f30300aa28010037800c03d0004442f9f4d1fb97400b0390006044f9f1d1fb972800805288060c39e00313aa21000094' -- rarity [1]
Hex[40] = 'broken'
Hex[41] = 'broken'
Hex[42] =
  'f553bea9f37b01a9f5d00190a82e7c39f403012af30300aac800003740a701f0003842f9a9c0499728008052a82e3c39600a40f9c00100b448a701f0083942f9' -- Rewards Multiplier In a Game (99x MAX)
Hex[43] =
  'ff8300d1f37b01a9335e01f0682a553928010037003301b0006042f9204b1097803001f0003847f91d4b109728008052682a15394cfbff97a00200b46bfbff97' -- Unlimited Super Clan Chest,
Hex[44] =
  'ff0301d1f75b01a9f55302a9f37b03a9375e01f0d63401b0e84a5539d60243f9f403022af503012af30300aa680300372033019000c843f945491097a0330190' -- Clan Chest Open Price[1]
Hex[45] =
  'f60f1df8f55301a9f37b02a9365e01d015350190c83e5539b5ea44f9f303012af403002a880100370035019000e844f911461097a03401b000a847f90e461097' -- Clan Chest Open Price[2]
Hex[46] =
  'ff0301d1f75b01a9f55302a9f37b03a9375e01d0563401b0e84e5539d6fa40f9f403022af503012af30300aa68030037003301f000c843f9de451097803301f0' -- Super Clan Chest Points Modifier
Hex[47] =
  'f75bbda9f55301a9f37b02a9b5d001b094a201f0a8267d39943e45f9f30300aae8010037a0a901f000e442f933a64997e0a60190001840f930a6499780a201f0' -- Egg Reward Modificator[1]
Hex[48] =
  'f40f1ef8f37b01a9000200b4f30300aa00500091e1031faa8ccbfb97147ca00a60720091e1031faa88cbfb97f37b41a9087ca00a01050011e003142ae2031faa' -- Egg Reward Modificator[2]
Hex[49] =
  'f75bbda9f55301a9f37b02a977cc02b0e84a5239f303032af403022af603012af50300aa8801003780a002d000a440f909bac797e0a502f0006c45f906bac797' -- Give all wears/armors/graffiti require parts [1]
Hex[50] =
  'ff8304d1fc5310a9f37b11a900e4006fe8030391f303012af40300aae00307ade00306ad8b010094e00314aae103132ae3ffff97a0030036e0030391e1031faa' -- Give all wears/armors/graffiti require parts [2]
Hex[51] =
  'f553bea9f37b01a9153c01b0b40f01d0a82a6c39940246f9f30300aac8000037a00f01d0000046f90b2bff9628008052a82a2c39e00313aadfffff97880240f9' -- campaign
Hex[52] =
  'f553bea9f37b01a9356601d0943a01b0a8ea753994a646f9f303002a88010037803a01b000a446f9d84a1497003f01d000c042f9d54a1497403701b000d445f9' -- guns [1]
Hex[53] =
  'ff8302d1f44300f9f37b09a9146601f088e67539f30300aa88010037603a01d000a446f9993c1497203701d000d445f9963c1497003701d000c441f9933c1497' -- guns [2]
Hex[54] =
  'f553bea9f37b01a9356601d0943a01b0a8ea753994a646f9f303002a88010037803a01b000a446f9d84a1497003f01d000c042f9d54a1497403701b000d445f9' -- royal [1]
Hex[55] =
  'fb6bbba9f96301a9f75b02a9f55303a9f37b04a933ec01f0f7c4019068266739f75a47f9f503022af60301aaf403002a0806003700bf0190001843f9bd725797' -- royal [2]
Hex[56] =
  'ffc305d1fca300f9f55315a9f37b16a915ec01b054be0190a82a6839944245f9f30300aae8010037a0c001b000a446f962585797e0c001d0004443f95f585797' -- wep skins [1]
Hex[57] =
  'f553bea9f37b01a934d101f0d5a3019088ba7a39b53647f9f30300aa28010037c0a30190003447f9e2ee499760a701f0006044f9dfee49972800805288ba3a39' -- wep skins [2]
Hex[58] =
  'e80193524800a0721f00086b6d010054080293524800a0721f00086be001005408e497524800a0721f00086b6001005408c69c520600001408d984524800a072' -- just armor
Hex[59] =
  'f40f1ef8f37b01a9d3ea02b094c10290682e6739946244f9c800003780c10290006044f99cf2d69728008052682e2739800240f908e040b948000035d3f2d697' -- set custom level
Hex[60] =
  'f553bea9f37b01a9153402f0a8267c39f30301aaf40300aac8000037000a02f0003447f97a747b9728008052a8263c39330500b4686240b9891240b91f01096b' -- Show all Deleted/Exclusive Gadgets [1]
Hex[61] =
  'f60f1df8f55301a9f37b02a9942d0290882a5839f30300aaa8020037200702b000f443f9df257897200702d0005446f9dc257897200002d0003447f9d9257897' -- Show all Deleted/Exclusive Gadgets [2]
Hex[62] =
  'f40f1ef8f37b01a9f3cc019014a301f068764a39946244f9c800003700a301f0006044f9ccbc47972800805268760a39800240f908e040b94800003503bd4797' -- emperor
Hex[63] =
  'ff0301d1f60b00f9f55302a9f37b03a9f6d00190b5a201d0c83e7c39b55643f9f303012af40300aa88010037a0a201d0005443f9d6c0499700a501b0000c46f9' -- inf 2x rew
Hex[64] =
  'fe0f1ff8871d0094a00000b400c00091e1031faafe0741f8d0e67714fe0741f8c0035fd6ff4305d1fc6f0fa9fa6710a9f85f11a9f65712a9f44f13a9fd7b14a9' -- max pass[temp]
Hex[65] =
  'fe0f1ff8d31c0094600000b4fe0741f88c2c0014fe0741f8c0035fd6f40f1ef8f37b01a974c80290885a6439f30300aa2801003720a202f0003c43f9e0b6c597' -- premium pass
Hex[66] =
  'ffc300d1f40b00f9f37b02a914c802d0882e6439f30300aa2801003700a202b0008041f9468dc597c0a102d0009c47f9438dc59728008052882e2439680a40f9' -- reset pass
Hex[67] =
  'f60f1df8f55301a9f37b02a9f5ba01f0748c01f0a8ce5839948240f9f30300aa88010037409401b0000046f932c73e97a08e01f000ac44f92fc73e97608c01f0' -- pet egg cd
Hex[68] =
  'f40f1ef8f37b01a9d42b01f0930401b088f67239737e41f988010037000101f0004044f98b0ef79660010190008c45f9880ef796800401b0007c41f9850ef796' -- mobs per wave
Hex[69] =
  'f40f1ef8f37b01a934ae02f088c66a39f30300aa88010037608702d0000843f9fe9db897c08402f0006044f9fb9db897808602b0003c47f9f89db89728008052' -- clan gadgets
Hex[70] = 'broken'
Hex[71] =
  'f75bbda9f55301a9f37b02a9163402f0f70d02f0c8f67b39f79a44f9f40302aaf50301aaf30300aa88010037a00802f0008040f952767b97a00b02b0000845f9' -- unlock unreleased royal and hats
Hex[72] =
  'f553bea9f37b01a934d101f0d5a3019088ba7a39b53647f9f30300aa28010037c0a30190003447f9e2ee499760a701f0006044f9dfee49972800805288ba3a39' -- wear parts [401F80D2C0035FD6]
Hex[73] =
  'e80193524800a0721f00086b6d010054080293524800a0721f00086be001005408e497524800a0721f00086b6001005408c69c520600001408d984524800a072' -- wear [true]
Hex[76] =
  'f40f1ef8f37b01a9f4c702b0886e6539f30300aac8000037c09a02f0003447f9207ac59728008052886e2539680e40f9a80100b4c99a02f0293547f9132940f9' -- gift pass offers [1]
Hex[77] =
  'f40f1ef8f37b01a9f4c702b088726539f30300aac8000037c09a02f0003447f9037ac5972800805288722539680e40f9a80100b4c99a02f0293547f9131540f9' -- gift pass offers [2]
Hex[78] =
  'ff4301d1fe2300f900e4006fe8030091e00301ade00300adb2feff97e0030091e1031faad4702994fe2340f91f1c2f71e0179f1aff430191c0035fd6f553bea9' -- gift pass offers [3]
Hex[79] =
  'fe0f1ff8084042f8e0230091e1031faae80700f999a3be97e803202a007d1f53fe0741f8c0035fd6fe0f1ff808c041f8e0230091e1031faae80700f98fa3be97' -- clan wear
Hex[80] =
  'f40f1ef8f37b01a954c6029088a66b39f30300aac8000037e09c02b0006044f96ea6c4972800805288a62b39e00313aa01ffff97e0010036e89c02b0086144f9' -- collectibles v2 [true] combined with vd3
Hex[81] =
  'e80193524800a0721f00086b6d010054080293524800a0721f00086be001005408e497524800a0721f00086b6001005408c69c520600001408d984524800a072' -- unreleased royal [false]
Hex[82] =
  'f60f1df8f55301a9f37b02a9153402d0a83e7c39f30301aaf40300aa88010037c00a02f0009045f9bd727b97200702d0004046f9ba727b97e00c0290005c42f9' -- unreleased royal [true]
Hex[83] =
  'fe0f1ff8080840f9e0230091e1031faae80700f9cd0aae94fe0741f8c0035fd6000c40f9c0035fd6018c01f87fdbfb17f60f1df8f55301a9f37b02a9953403b0'


-- armory price[not weps]