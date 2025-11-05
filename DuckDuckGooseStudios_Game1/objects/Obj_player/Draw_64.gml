/// Draw GUI Event

// === Basic setup ===
var GUIw = display_get_gui_width();
var GUIh = display_get_gui_height();

draw_set_font(Font1);
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// === HP Bar (top-left) ===
var bar_w = 256;
var bar_h = 32;
var bar_x = 16;
var bar_y = 16;

var hp_ratio = hp / hp_total;
draw_sprite_stretched(spr_box, 0, bar_x, bar_y, bar_w, bar_h);
draw_sprite_stretched_ext(spr_box, 1, bar_x, bar_y, bar_w * hp_ratio, bar_h, c_red, 0.6);
draw_text(bar_x + bar_w / 2, bar_y + bar_h / 2, "HP");

// === XP Bar (under HP) ===
var xp_ratio = clamp(xp / xp_require, 0, 1);
bar_y += bar_h + 8;

draw_sprite_stretched(spr_box, 0, bar_x, bar_y, bar_w, bar_h);
draw_sprite_stretched_ext(spr_box, 1, bar_x, bar_y, bar_w * xp_ratio, bar_h, c_blue, 0.6);
draw_text(bar_x + bar_w / 2, bar_y + bar_h / 2, "Level " + string(level));

// === INVENTORY HOTBAR (Bottom-Center) ===
if (show_inventory) {
    var len = ds_list_size(inventoryItems);
    if (len > 0) {
        var slot_size = 64;            // each slot size (bigger = Minecraft look)
        var spacing = 8;               // space between slots
        var total_width = len * (slot_size + spacing);
        var start_x = (GUIw - total_width) / 2;
        var start_y = GUIh - slot_size - 20;

        // Draw background
        draw_set_alpha(0.4);
        draw_set_color(c_black);
        draw_rectangle(start_x - 10, start_y - 10, start_x + total_width + 10, start_y + slot_size + 10, false);
        draw_set_alpha(1);

        for (var i = 0; i < len; i++) {
            var key = ds_list_find_value(inventoryItems, i);
            var value = ds_map_find_value(inventory, key);
            var spr = object_get_sprite(key);

            var x_pos = start_x + i * (slot_size + spacing);
            var y_pos = start_y;

            // Highlight selected slot
            if (i == selected_item) {
                draw_set_color(c_yellow);
                draw_rectangle(x_pos - 2, y_pos - 2, x_pos + slot_size + 2, y_pos + slot_size + 2, false);
                draw_set_color(c_white);
            }

            // Slot background
            draw_sprite_stretched(spr_box, 0, x_pos, y_pos, slot_size, slot_size);

            // Draw item sprite
            if (sprite_exists(spr)) {
                draw_sprite_ext(spr, 0, x_pos + slot_size / 2, y_pos + slot_size / 2, 2, 2, 0, c_white, 1);
            }

            // Draw item count
            draw_set_halign(fa_right);
            draw_set_valign(fa_bottom);
            draw_text(x_pos + slot_size - 4, y_pos + slot_size - 4, string(value));
            draw_set_halign(fa_center);
            draw_set_valign(fa_middle);
        }

        // === Info bar above ===
        var sel_key = ds_list_find_value(inventoryItems, selected_item);
        draw_text(GUIw / 2, start_y - 24, string(object_get_name(sel_key)));

        // Help text
        draw_set_halign(fa_right);
        draw_text(GUIw - 16, GUIh - 16, "E Use  |  S Sell  |  ↑↓ Select");
        draw_set_halign(fa_left);
    }
}

