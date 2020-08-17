clear()
lmc_device_set_name('base_keyboard', '6C03908')
lmc_device_set_name('fantech_numeric', '1B9DACC')
lmc_print_devices()

 -- ^ = Control
 -- % = Alt
 -- + = Shift
 -- # = Win
 -- & = Tab

local under = '0'
local layout = 1

lmc_set_handler('fantech_numeric', function(button, direction)
  --print('button '..button.. ' in direction '..direction)


  local code = {
    --[32]  = 'A',
    --[110] = 'B',
    --[13]  = 'C',

    [96]  = '0',
    [97]  = '1',
    [98]  = '2',
    [99]  = '3',
    [100] = '4',
    [101] = '5',
    [102] = '6',
    [103] = '7',
    [104] = '8',
    [105] = '9',

    [109] = 'minus',
    [107] = 'plus',
    [9]   = 'tab',

    [111] = 'X',
    [106] = 'Y',
    [8]   = 'Z',

    [45]  = '0nl',
    [35]  = '1nl',
    [40]  = '2nl',
    [34]  = '3nl',
    [37]  = '4nl',
    [12]  = '5nl',
    [39]  = '6nl',
    [36]  = '7nl',
    [38]  = '8nl',
    [33]  = '9nl'
  }



  local layouts = {
    [1] = "google_docs",
    [2] = "general_coding"
  }

  if direction == 1 and button == 9 then

    layout = layout + 1

    if layout == 3 then
      layout = 1
    end
  end



  if direction == 1 and under ~= '0' then

    if button == 32 or button == 110 or button == 13 then

      print('Under reset')
      under = '0'

    end

  elseif direction == 1 and button == 32 then

    print('A pressed and set')
    under = 'A'

  elseif direction == 1 and button == 110 then

    print('B pressed and set')
    under = 'B'

  elseif direction == 1 and button == 13 then

    print('C pressed and set')
    under = 'C'

  end


  if direction == 1 and button ~= 32 and button ~= 110 and button ~= 13 then

    if button == 9 then

      print('Layout ' .. layouts[layout] .. ', was set.')

      local file = io.open('C:/lhk/hotCode.txt', 'w')
      file:write(layouts[layout])
      file:flush()
      file:close()

      lmc_send_keys('{F23}')

    else

      print('Under ' .. under .. ',  [' .. button .. '] = (' .. code[button] .. ') was pressed.')

      local file = io.open('C:/lhk/hotCode.txt', 'w')
      file:write(under..'_'..code[button])
      file:flush()
      file:close()

      lmc_send_keys('{F24}')

    end

    under = '0'

  end
  
end)
