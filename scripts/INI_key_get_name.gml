///INI_key_get_name(ini,section,n)
var ini,section,key;
ini = argument0
section = argument1
key = argument2

var sMap;
if(ds_map_exists(ini,section)) {
    sMap = ds_map_find_value(ini,section)
    var l,index;
    l[0] = ds_map_find_value(sMap,0)
    l[1] = ds_map_find_value(sMap,1)
    index = key - 1;
    return ds_list_find_value(l[0],index)
}
return false

