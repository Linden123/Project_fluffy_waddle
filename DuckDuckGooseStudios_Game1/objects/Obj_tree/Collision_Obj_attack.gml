/// Collision Event: with Obj_attack

// Reduce tree HP by attack damage
hp -= other.damage;

// When HP runs out, drop logs and remove tree
if (hp <= 0) {
    // Spawn 3 logs under the tree
    for (var i = 0; i < 3; i++) {
        var xx = x + irandom_range(-6, 6);
        var yy = y + sprite_height / 2 + irandom_range(0, 4);
        instance_create_layer(xx, yy, layer, Obj_log);
    }

    // (Optional) sound or particle effect
    // audio_play_sound(snd_tree_break, 0, false);
    // effect_create_above(ef_smoke, x, y, 1, c_gray);

    instance_destroy(); // remove the tree
}
