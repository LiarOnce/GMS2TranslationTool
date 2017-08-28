// INI_load_from_string(string) : iniHandle
// open a ini file and return the ini file ID
// if error return -1

/*
    ini MAP鐨勪繚瀛樻柟寮?
    0 : ini鐨勬枃浠朵綅缃?
    1 : ini鏄惁琚洿鏀?
    2 : section鍒楄〃鐨勭储寮?
*/

var iniStr ;
iniStr = argument0
if(is_real(iniStr)) {
    global.__ini_error_string = "argument must be a string";
    return -1;
}
var iniID;

// 鑾峰彇ini鐨処D锛屽垱寤篿ni闇€瑕佺殑map
var map;
map = ds_map_create();
iniID = map

// 灏嗚矾寰勫瓨鍏ュ埌map,key=0瀛樺偍鐨勬槸ini鐨勬枃浠惰矾寰?
ds_map_add(map,0,0)

// 璇ni鏂囦欢鏄惁琚慨鏀?
ds_map_add(map,1,false)

// 璇诲彇ini鏂囦欢锛屽苟瀛樺叆map
var list;
list = ds_list_create()

var i,length,section,set_map;
section = ""
text = ""
set_map = -1
length = string_length(iniStr)
for(i = 1;i <= length;i += 1) {
    var char;
    char = string_copy(iniStr,i,1)
    if(char == chr(13) or char == chr(10)) {
        if(text != "") {
            ds_list_add(list,text)
            text = ""
        }
    } else {
        text += char
    }
}
if(text != "") {
    ds_list_add(list,text)
}

__Load_ini(list,iniID)
return iniID;


