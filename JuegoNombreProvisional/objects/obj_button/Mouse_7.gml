switch(button_id)
{
	case 0: // resume
		obj_pause_manager.paused = false;
		obj_pause_manager.update_pause();
	break;
	
	case 1: // settings
		layer_set_visible("PauseLayer",false);
		layer_set_visible("SettingsLayer",true);
	break;
	
	case 2: // quit
		game_end();
	break;
	
	case 3: // Back from settings
		layer_set_visible("PauseLayer",true);
		layer_set_visible("SettingsLayer",false);
	break;
}