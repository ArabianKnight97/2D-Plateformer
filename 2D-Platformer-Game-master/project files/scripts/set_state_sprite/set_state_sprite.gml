/// @arg sprite
/// @arg speed
/// @arg _index
function set_state_sprite(sprite, speed, _index) {
    if (sprite_index != sprite) { // Only change if the sprite is different
        sprite_index = sprite;
        image_speed = speed; // Set the animation speed
        image_index = _index; // Set starting frame
    }
}
