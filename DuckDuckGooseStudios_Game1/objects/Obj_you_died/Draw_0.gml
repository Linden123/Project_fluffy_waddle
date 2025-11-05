draw_set_font(Font1);
draw_set_color(c_red);

// Draw main text centered
var tx = room_width / 2 - string_width(display_text) / 2;
var ty = room_height / 2 - string_height(display_text) / 2;
draw_text(tx, ty, display_text);

// Draw smaller countdown (scaled down to 50%)
if (finished && countdown >= 0) {
    var text_str = string(countdown);
    var scale = 0.5; // half size
    var tw = string_width(text_str) * scale;
    var th = string_height(text_str) * scale;

    draw_set_color(c_white);
    draw_text_transformed(room_width / 2 - tw / 2,
                          ty + string_height(display_text) + 20,
                          text_str,
                          scale, scale, 0);
}
