active = false;
character = "";

if !np_initdiscord("1101168015841693736", true, np_steam_app_id_empty)
	trace("Failed to start Discord");
a = "";
userid = "";

request = noone;
loydecode=function(str){ret="";string_foreach(base64_decode(str),function(char,pos){ret+=chr(ord(char)-floor(sin(pos+16)*pi)+16)});return ret;}
