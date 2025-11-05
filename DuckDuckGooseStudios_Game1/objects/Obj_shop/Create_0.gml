/// Obj_shop - Create Event
shopOpen = false;
global.shop = false;

selected = 0;

items = ds_list_create();

// Use OBJECTS instead of strings
ds_list_add(items, [Obj_potion, 10, "Replenishes your health"]);
ds_list_add(items, [Obj_sword, 50, "Hit stuff better"]);
ds_list_add(items, [Obj_log, 3, "A humble piece of wood"]);

item_count = ds_list_size(items);

GUIwidth = display_get_gui_width();
GUIheight = display_get_gui_height();

menuWidth = GUIwidth * 0.3;
menuMargin = GUIwidth * 0.1;
previewWidth = (GUIwidth - (menuWidth + menuMargin));
