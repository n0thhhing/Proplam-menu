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

--patchers--
local editedHexValues = {}

function PatchHex(hex, to)
  gg.searchNumber('h ' .. hex, gg.TYPE_BYTE)
  gg.getResults(8)
  gg.editAll('h ' .. to, gg.TYPE_BYTE)
  editedHexValues[hex] = to .. string.sub(hex, 9)
  gg.clearResults()
end

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

--revert--
function RestoreHex(hex)
  local editedHex = editedHexValues[hex]
  if editedHex then
    gg.searchNumber('h ' .. editedHex, gg.TYPE_BYTE)
    gg.getResults(64)
    gg.editAll('h ' .. hex, gg.TYPE_BYTE)
    gg.clearResults()
    editedHexValues[hex] = nil -- Remove the reverted entry from the table
  else
    print('No edited value found for the provided hex.')
  end
end

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

--on/off toggle--
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

function getHex(offset, size)
  local targetaddr = 0
  local targets = {}
  local result = {}
  for i, v in ipairs(gg.getRangesList(lib)) do
    if v.type:sub(3, 3) == 'x' then
      targetaddr = v.start + offset
      break
    end
  end
  for i = 1, size do
    targets[#targets + 1] = {
      address = targetaddr + #targets,
      flags = gg.TYPE_BYTE,
    }
  end
  for i, item in ipairs(gg.getValues(targets)) do
    result[i] = item.value & 0xff
  end
  return result
end
