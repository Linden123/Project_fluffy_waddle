/// === PLAYER STEP EVENT ===

// --- Skip step if dialogue is active or shop open ---
if (instance_exists(Obj_dialouge)) exit;
if (global.shop) exit;

// --- MOVEMENT INPUT ---
var right_key = keyboard_check(vk_right);
var left_key  = keyboard_check(vk_left);
var up_key    = keyboard_check(vk_up);
var down_key  = keyboard_check(vk_down);

// --- MOVEMENT SPEED ---
var xspd = (right_key - left_key) * move_spd;
var yspd = (down_key - up_key) * move_spd;

// --- SPRITE FACING LOGIC ---
if (yspd == 0) {
    if (xspd > 0) face = RIGHT;
    if (xspd < 0) face = LEFT;
}
if (xspd == 0) {
    if (yspd > 0) face = DOWN;
    if (yspd < 0) face = UP;
}

sprite_index = sprite[face];

// --- COLLISION ---
if (place_meeting(x + xspd, y, Obj_wall)) xspd = 0;
if (place_meeting(x, y + yspd, Obj_wall)) yspd = 0;

// --- APPLY MOVEMENT ---
x += xspd;
y += yspd;

// --- ANIMATION IDLE ---
if (xspd == 0 && yspd == 0) image_index = 0;

// --- ATTACK ---
if (keyboard_check_pressed(vk_space)) {
    var _inst = instance_create_depth(x, y, depth, Obj_attack);
    audio_play_sound(sword_slice_393847, 0, false);

    // Attack direction
    switch (face) {
        case RIGHT: _inst.image_angle = 0; break;
        case UP:    _inst.image_angle = 90; break;
        case LEFT:  _inst.image_angle = 180; break;
        case DOWN:  _inst.image_angle = 270; break;
    }

    _inst.damage *= damage;
}

// --- TOGGLE INVENTORY ---
if (keyboard_check_pressed(vk_tab)) show_inventory = !show_inventory;

// --- INVENTORY LOGIC ---
if (show_inventory) {
    var len = ds_list_size(inventoryItems);
    if (len > 0) {

        // --- HOTBAR SELECTION 1–9 ---
        for (var i = 0; i < 9; i++) {
            if (keyboard_check_pressed(ord(string(i + 1)))) {
                if (i < len) selected_item = i;
            }
        }

        var key = ds_list_find_value(inventoryItems, selected_item);
        var count = ds_map_find_value(inventory, key);
        var item_name = object_get_name(key);

        // --- USE ITEM (E) ---
        if (keyboard_check_pressed(ord("E"))) {
            switch (item_name) {
                case "Obj_potion":
                    if (count > 0) {
                        hp = hp_total;
                        ds_map_replace(inventory, key, count - 1);
                    }
                    break;

                case "Obj_sword":
                    if (count > 0) {
                        damage *= 2; // double damage
                        ds_map_replace(inventory, key, count - 1);
                        // No dialogue
                    }
                    break;

                case "Obj_food":
                    if (count > 0) {
                        hp = min(hp_total, hp + 2);
                        ds_map_replace(inventory, key, count - 1);
                    }
                    break;

                default:
                    show_debug_message("Cannot use this item.");
                    break;
            }

            // Remove from inventory if count is 0
            if (ds_map_find_value(inventory, key) <= 0) {
                ds_map_delete(inventory, key);
                ds_list_delete(inventoryItems, selected_item);
                if (selected_item >= ds_list_size(inventoryItems)) selected_item = 0;
            }
        }

        // --- SELL ITEM (S) ---
        if (keyboard_check_pressed(ord("S"))) {
            if (count > 0) {
                // Set shop price for items
                var shop_price = 0;
                switch (item_name) {
                    case "Obj_wood":   shop_price = 3; break;
                    case "Obj_potion": shop_price = 10; break;
                    case "Obj_sword":  shop_price = 50; break;
                    default: shop_price = 1; break;
                }

                var sell_price = shop_price * 0.9; // 10% less
                global.money += sell_price;

                ds_map_replace(inventory, key, count - 1);

                // Remove from inventory if count reaches 0
                if (ds_map_find_value(inventory, key) <= 0) {
                    ds_map_delete(inventory, key);
                    ds_list_delete(inventoryItems, selected_item);
                    if (selected_item >= ds_list_size(inventoryItems)) selected_item = 0;
                }

                show_debug_message("Sold " + item_name + " for " + string(sell_price) + " gold.");
            }
        }
    }
}
