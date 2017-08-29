//__Load_ini(list,map)

var iniID;
show_debug_message("------ini loading------")
// 鑾峰彇ini鐨処D锛屽垱寤篿ni闇€瑕佺殑map
var map;
map = argument1;
iniID = map
show_debug_message("ini map:" + string(iniID))
// section鍒楄〃
var secList;
secList = ds_list_create();
show_debug_message("section list:" + string(secList))
ds_map_add(map,2,secList)

// 璇诲彇ini鏂囦欢锛屽苟瀛樺叆map
var exists,iniList;
iniList = argument0

var section,set_map,size,i;
section = ""
set_map = -1
size = ds_list_size(iniList)
for(i = 0;i < size;i += 1) {
    var text;
    text = ds_list_find_value(iniList,i)
    var a,b,c;
    a = string_pos(INI_SECTION_SIGN_LEFT,text)
    b = string_pos(INI_SECTION_SIGN_RIGHT,text)
    c = string_pos(INI_ITEM_SIGN,text)
    // 妫€鏌ュ瓧绗︿覆鏄惁绗﹀悎鏍囧噯ini鏍煎紡
    if(text == "") continue
    if(c == 0) {
        if!(a == 1 and b > 2) {
            continue
        }
    }
    // 妫€鏌ヨ琛屾槸鍚︿负娉ㄩ噴璇彞
    if(string_pos(INI_NOTE_SIGN,text) == 1) continue
    
    if(a == 1 and b > 2) {
        section = string_copy(text,a+1,b-a-1)
        if(!ds_map_exists(map,section)) {
            var m,l;
            m = ds_map_create()
            show_debug_message("section map:" + string(m))
            ds_map_add(map,section,m)
            l[0] = ds_list_create()
            l[1] = ds_list_create()
            show_debug_message("value map:" + string(l[0]) + "," + string(l[1]))
            ds_map_add(m,0,l[0])
            ds_map_add(m,1,l[1])
            if(ds_list_find_index(secList,section) == -1) {
                ds_list_add(secList,section)
            }
            set_map = m
            
        } else {
            set_map = ds_map_find_value(map,section)
        }
        continue
    }
    
    if(c != 0) {
        if(set_map != -1) {
            var left,right,list;
            left = string_copy(text,1,c-1)
            right = string_copy(text,c+1,string_length(text) - c)
            list[0] = ds_map_find_value(set_map,0)
            list[1] = ds_map_find_value(set_map,1)
            ds_list_add(list[0],left)
            ds_list_add(list[1],right)
            //show_debug_message("Set Item : [" + section + "] " + left + " : " + right)
        }
    }
}
ds_list_destroy(iniList)
show_debug_message("------ini loaded------")
return iniID;
