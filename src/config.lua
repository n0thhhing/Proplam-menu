local json = require('dkjson.dkjson')

local configFile = io.open('config.json', 'r')
local content = configFile:read('*a')

configFile:close()
config = json.decode(content)
useHex = config.hex

if config.hex then
  hexPatch = ON
else
  hexPatch = OFF
end

function configure(main)
  local menu = gg.choice({ hexPatch .. 'Hex patch', '⬅  Back' }, nil, 'config')
  if menu == 1 then
    if hexPatch == ON then
      config.hex = false
      hexPatch = OFF
    else
      config.hex = true
      hexPatch = ON
    end
    local json_data = json.encode(config)
    local file = io.open('config.json', 'w')
    file:write(json_data)
    file:close()
  else
    main()
  end
end
