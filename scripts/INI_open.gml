// INI_open(fname) : iniHandle
// open a ini file and return the ini file ID
// if error return -1

/*
    ini MAP鐨勪繚瀛樻柟寮?
    0 : ini鐨勬枃浠朵綅缃?
    1 : ini鏄惁琚洿鏀?
    2 : section鍒楄〃鐨勭储寮?
*/

var fname ;
fname = argument0
if(is_real(fname)) {
    global.__ini_error_string = "fname must be a string";
    return -1;
}
var file,iniID;

// 鑾峰彇ini鐨処D锛屽垱寤篿ni闇€瑕佺殑map
var map;
map = ds_map_create();
iniID = map

// 灏嗚矾寰勫瓨鍏ュ埌map,key=0瀛樺偍鐨勬槸ini鐨勬枃浠惰矾寰?
ds_map_add(map,0,fname)

// 璇ni鏂囦欢鏄惁琚慨鏀?
ds_map_add(map,1,false)

// 璇诲彇ini鏂囦欢锛屽苟瀛樺叆map
var exists,list;
list = ds_list_create()
exists = file_exists(fname)

var section,set_map;
section = ""
set_map = -1
if(exists) {
file = file_text_open_read(fname)
while(!file_text_eof(file)) {
    var text;
    text = file_text_read_string(file)
    file_text_readln(file)
    ds_list_add(list,text)
}
file_text_close(file)
} else ds_map_replace(map,1,true)
__Load_ini(list,iniID)
return iniID;


