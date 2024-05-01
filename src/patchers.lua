local lib = 'libil2cpp.so'
local editedHexValues = {}
Patchers = {}

function Patchers.patchHex(hex, to)
  gg.searchNumber('h ' .. hex, gg.TYPE_BYTE)
  gg.getResults(8)
  gg.editAll('h ' .. to, gg.TYPE_BYTE)
  editedHexValues[hex] = to .. string.sub(hex, 9)
  gg.clearResults()
end

function Patchers.patch(offset, hex)
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

function Patchers.restoreHe(hex)
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

function Patchers.restore(offset)
  for i = 1, #tabl0001 do
    if tabl0001[i] == lib and tabl0001[i + 1] == offset then
      local edi = tabl0001[i + 2]
      local hex = #tabl0001[i + 2] - 1
    end
  end
  for i, v in ipairs(gg.getRangesList()) do
    if v.type:sub(3, 3) == 'x' then
      local targetAddr = v.start + offset
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

function Patchers.switch(name, offsets, hex_values)
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

return Patchers