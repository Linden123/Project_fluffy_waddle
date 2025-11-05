if (!finished) {
    timer += text_speed;
    display_text = string_copy(text, 1, floor(timer));

    if (string_length(display_text) >= string_length(text)) {
        finished = true;
        restart_timer = room_speed * 3; // 3 seconds
    }
}
else {
    restart_timer--;

    // Update countdown every second
    if (restart_timer mod room_speed == 0 && countdown > 0) {
        countdown--;
    }

    if (restart_timer <= 0) {
        game_restart();
    }
}
