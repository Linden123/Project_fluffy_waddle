// --- Input handling ---
var up_key = keyboard_check_pressed(vk_up);
var down_key = keyboard_check_pressed(vk_down);
var accept_key = keyboard_check_pressed(vk_space);

// --- Move cursor ---
pos += down_key - up_key;

// Clamp cursor position safely
if (pos >= array_length(option[menu_level])) pos = 0;
if (pos < 0) pos = array_length(option[menu_level]) - 1;

// --- Accept key logic ---
if (accept_key)
{
    switch (menu_level)
    {
        // ---------- MAIN MENU ----------
        case 0:
            switch (pos)
            {
                case 0:
                    room_goto_next(); // Start game
                break;

                case 1:
                    menu_level = 1;   // Go to settings
                    pos = 0;
                break;

                case 2:
                    game_end();       // Exit game
                break;
				
				 case 3:
                   menu_level = 2;   // Go to settings
                    pos = 0;       // Exit game
                break;
            }
        break;

        // ---------- SETTINGS MENU ----------
        case 1:
            switch (pos)
            {
                case 0:
                    // Audio
                break;

                case 1:
                    // Video
                break;
                case 2:
                    // Video
                break;
				 case 3:
                    // Video
                break;
                case 4:
                    menu_level = 0; // Back to main menu
                    pos = 0;
                break;
            }
        break;
		///------------------//credits
		case 2:
            switch (pos)
            {
                case 0:
                    // Audio
                break;

                case 1:
                    // Video
                break;
                case 2:
                    // Video
                break;
				 case 3:
                    // Video
                break;
				 case 4:
                    // Video
                break;
                case 5:
                    menu_level = 0; // Back to main menu
                    pos = 0;
                break;
            }
        break;
    }
}

// Always update op_length to match current menu
op_length = array_length(option[menu_level]);
