#! python

import sys
import json
import lhk_addons
from pathlib import Path

# - - - - - - - - - -
#  hot key intrpreters
# - - - - - - - - - -

def crank_details(details, display_code):

    result = ""

    for x in details:

        if str.lower(x)[:6] == "_label":
            if(display_code == "true"):
                result += "      ToolTip, "+details[x]+", 60, 40\n"
            else:
                result += "      ToolTip, [%code%] "+details[x]+", 60, 40\n"


        elif str.lower(x)[:4] == "send":
            result += "      Send, "+details[x]+"\n"


        elif str.lower(x)[:5] == "click":
            tmp = details[x]
            result += "      Click, "+tmp[0]+", "+tmp[1]+", left \n"

        elif str.lower(x)[:6] == "lclick":
            tmp = details[x]
            result += "      Click, "+tmp[0]+", "+tmp[1]+", left \n"

        elif str.lower(x)[:6] == "rclick":
            tmp = details[x]
            result += "      Click, "+tmp[0]+", "+tmp[1]+", right \n"

        elif str.lower(x)[:6] == "dclick":
            tmp = details[x]
            result += "      Click, "+tmp[0]+", "+tmp[1]+", 2 \n"


        elif str.lower(x)[:5] == "mmode":
            result += "      CoordMode, "+details[x]+" \n"

        elif str.lower(x)[:5] == "mmove":
            tmp = details[x]
            result += "      MouseMove, "+tmp[0]+", "+tmp[1]+" \n"


        elif str.lower(x)[:5] == "sleep":
            result += "      Wait, "+details[x]+" \n"
    
    return result

def crank_keys(layout, under, body, tooltip_code):

    result = ""

    for x in body:
        result += "    case \""+str(layout)+"_"+under+"_"+x+"\":\n"
        result += crank_details(body[x], tooltip_code)
        result += "\n"

    return result

# - - - - - - - - - -
#  ahk file addons
# - - - - - - - - - -

def save(body_ahk, body_lua, layout_max, file, time, display_empty, display_code):

    result =  lhk_addons.ahk_header(time, display_empty, display_code)
    result += body_ahk
    result += lhk_addons.ahk_footer(time)

    ahk = open("./../" + file + ".lhk.ahk", "w+")
    ahk.writelines(result)

    result =  ""
    result += lhk_addons.lua_header()
    result += body_lua
    result += lhk_addons.lua_footer(layout_max)

    lua = open("./../" + file + ".lhk.lua", "w+")
    lua.writelines(result)


# - - - - - - - - - -
#  main
# - - - - - - - - - -

def process(name):

    result_ahk = ""
    result_lua = ""

    name = name.replace('\n', '')
    txt = Path(name).read_text()
    #print(txt)

    loaded_json = json.loads(txt)
    

    filename = loaded_json["filename"]
    #tooltips = loaded_json["tooltips"]
    #tooltips_layout = loaded_json["tooltips_layout"]
    tooltips_empty = loaded_json["tooltips_display_empty"]
    tooltips_code = loaded_json["tooltips_display_code"]
    tooltips_time = loaded_json["tooltips_time"]
    layouts = loaded_json["layouts"]


    layout_num = 0
    
    for l in layouts:

        layout = layouts[l]
        layout_num = layout_num + 1
        
        result_lua += "    ["+str(layout_num)+"] = \""+str(l)+"\",\n"

        for x in layout:

            if(x == "under0"):
                result_ahk += crank_keys(layout_num, "0", layout[x], tooltips_code)
                
            elif (x == "underA"):
                result_ahk += crank_keys(layout_num, "A", layout[x], tooltips_code)

            elif (x == "underB"):
                result_ahk += crank_keys(layout_num, "B", layout[x], tooltips_code)

            elif (x == "underC"):
                result_ahk += crank_keys(layout_num, "C", layout[x], tooltips_code)

            else:
                result_ahk += ""
    
    #print(result)

    save(result_ahk, result_lua, layout_num, filename, tooltips_time, tooltips_empty, tooltips_code)


# - - - - - - - - - -
#  setup
# - - - - - - - - - -

if len(sys.argv) == 1:
    file = "./../coding_base.json"
else:
    file = sys.argv[1]

print('> LHK processing `' + file + '`')
process(file)
print('> done')
