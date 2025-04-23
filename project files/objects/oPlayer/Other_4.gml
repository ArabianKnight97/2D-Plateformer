save_game();

if (file_exists(CHECKFILE))
{
	ini_open(CHECKFILE);
	if (ini_read_real("checkpoint", "room", -1) != asset_get_index(room_get_name(room)))
	{
		ini_close();
		file_delete(CHECKFILE);
	}
	else
	{
		oPlayer.x = ini_read_real("player", "x", x);
		oPlayer.y = ini_read_real("player", "y", y);
		ini_close();
	}
}