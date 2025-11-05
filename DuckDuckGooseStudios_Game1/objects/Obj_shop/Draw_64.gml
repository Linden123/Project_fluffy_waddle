/// Obj_shop - Draw GUI Event
if (!shopOpen) exit;

// Background overlay
draw_set_color(c_black);
draw_set_alpha(0.8);
draw_rectangle(0, 0, GUIwidth, GUIheight, false);

// Menu panel
draw_set_alpha(0.5);
draw_rectangle(menuMargin, 0, menuMargin + menuWidth, GUIheight, false);
draw_set_alpha(1);
draw_set_color(c_white);

// Item list
for (var i = 0; i < item_count; i++) {
    var arr = items[| i];
    var item_obj = arr[0];
    var item_name = object_get_name(item_obj);

    var _x = menuMargin + menuWidth / 2;
    var _y = (GUIheight / 2) + (i - selected) * 40;
    var scale = (i == selected) ? 1.4 : 1;

    if (i == selected) item_name = "> " + item_name + " <";

    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_text_transformed(_x, _y, item_name, scale, scale, 0);
}

// Selected item details
var arr = items[| selected];
var item_obj = arr[0];
var price = arr[1];
var desc = arr[2];

var _x = (menuMargin + menuWidth) + previewWidth / 2;
var _y = GUIheight / 2;

// Try drawing item sprite
var spr = object_get_sprite(item_obj);
if (spr != -1) {
     draw_sprite_ext(spr, 0, _x, _y - 32, 10, 10, 0, c_white, 1);
}

// Description & price
draw_set_halign(fa_center);
draw_text(_x, _y + 80, desc);
draw_text(_x, _y + 110, "Price: " + string(price) + "g");

// Player gold
draw_set_halign(fa_left);
draw_text(16, 16, "Money: " + string(global.money));
