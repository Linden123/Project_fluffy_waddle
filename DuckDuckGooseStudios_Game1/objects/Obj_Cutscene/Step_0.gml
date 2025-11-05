// Skip with any key or tap
if (keyboard_check_pressed(vk_anykey) || mouse_check_button_pressed(mb_left)) {
    room_goto(Rm_menu);
}

// When animation finishes, go to menu
if (image_index >= image_number - 1) {
    room_goto(Rm_menu);
}
