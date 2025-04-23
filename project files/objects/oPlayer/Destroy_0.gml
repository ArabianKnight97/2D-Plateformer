if (file_exists(CHECKFILE))
{
	ini_open(CHECKFILE);
	var _target = ini_read_real("player", "room", room_get_name(room));
	ini_close();
	room_goto(_target);
}