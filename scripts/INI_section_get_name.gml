///INI_section_get_name(ini,n)
var list,ini,n;
ini = argument0
n = argument1
list = ds_map_find_value(ini,2)
return ds_list_find_value(list,n-1)

