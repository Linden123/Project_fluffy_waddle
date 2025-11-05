

hp = 7;
hp_total = hp;
damage = 1;
move_spd = 1;
inventory = ds_map_create();
inventoryItems = ds_list_create();
show_inventory = true;
selected_item = 0;


sprite[RIGHT] = spr_walking;
sprite[UP] = spr_walking;
sprite[LEFT] = spr_walking_2;
sprite[DOWN] = spr_walking_2;

face = DOWN;
level = 1;
xp = 0;
xp_require = 100;

function add_xp(_xp_to_add) {
    xp += _xp_to_add;
    
    if (xp >= xp_require) {
        level++;
        xp -= xp_require;
        xp_require *= 1.4;
        hp_total += 5;
        hp = hp_total;
        damage += 1;
        
        // Fixed dialogue call
        create_dialouge([
            {
                name: "Congrats",
                msg: $"Oh my sigmaly skibbidy!!! You have Leveled up!!!\nYour new stats are...\nHP:{hp_total}\nDMG:{damage}"
            }
        ]);
    }
}

global.money = 100;
global.inv = ds_list_create();