/// Obj_shop - Step Event

// === Toggle shop ===
if (!shopOpen && place_meeting(x, y + 10, Obj_player) && keyboard_check_pressed(vk_shift)) {
    shopOpen = true;
    global.shop = true;
}
else if (shopOpen && keyboard_check_pressed(vk_escape)) {
    shopOpen = false;
    global.shop = false;
}

// === Shop logic ===
if (shopOpen) {
    if (keyboard_check_pressed(vk_down)) {
        selected++;
        if (selected >= item_count) selected = 0;
    }

    if (keyboard_check_pressed(vk_up)) {
        selected--;
        if (selected < 0) selected = item_count - 1;
    }

    // === BUY ===
    if (keyboard_check_pressed(vk_enter)) {
        var arr = items[| selected];
        var item_obj = arr[0];
        var price = arr[1];

        if (global.money >= price) {
            global.money -= price;

            with (Obj_player) {
                if (ds_map_exists(inventory, item_obj)) {
                    var count = ds_map_find_value(inventory, item_obj);
                    ds_map_replace(inventory, item_obj, count + 1);
                } else {
                    ds_map_add(inventory, item_obj, 1);
                    ds_list_add(inventoryItems, item_obj);
                }
            }

            show_debug_message("Bought: " + string(object_get_name(item_obj)));
        } else {
            show_debug_message("Not enough money!");
        }
    }

    // === SELL (press S) ===
    if (keyboard_check_pressed(ord("S"))) {
        with (Obj_player) {
            var item_to_sell = Obj_log; // Selling wood (log)
            if (ds_map_exists(inventory, item_to_sell)) {
                var count = ds_map_find_value(inventory, item_to_sell);
                if (count > 0) {
                    ds_map_replace(inventory, item_to_sell, count - 1);
                    global.money += 3; // price per wood

                    show_debug_message("Sold Wood for 3g");

                    // remove item if count hits 0
                    if (count - 1 <= 0) {
                        ds_map_delete(inventory, item_to_sell);
                        var idx = ds_list_find_index(inventoryItems, item_to_sell);
                        if (idx != -1) ds_list_delete(inventoryItems, idx);
                    }
                } else {
                    show_debug_message("You have no wood!");
                }
            } else {
                show_debug_message("You have no wood!");
            }
        }
    }
}
