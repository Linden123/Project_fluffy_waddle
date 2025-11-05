draw_sprite_ext(sprite_index, image_index, x, y, width / sprite_width, height / sprite_height, 0, c_white, 1);

draw_set_font(Font1);
draw_set_valign(fa_top);
draw_set_halign(fa_left);

for (var i_c = 0; i_c < op_length; i_c++)
{
    var _c = (pos == i_c) ? c_yellow : c_white;

    draw_set_color(_c);
    draw_text_transformed(
        x + op_border,
        y + op_border + op_space * i_c,
        option[menu_level][i_c], // ✅ Correct array access
        0.3, 0.3, 1
    );
}

draw_set_color(c_white);
