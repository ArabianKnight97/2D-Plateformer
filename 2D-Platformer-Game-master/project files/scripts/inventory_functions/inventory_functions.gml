global.paused = false; // not paused by default

// Open inventory
function inv() {
    global.paused = true;
    global.inventory = true;

    with (all) {
        paused_speed = speed;
        paused_animation = image_speed;
        speed = 0;
        image_speed = 0;
    }
}

// Close inventory
function invDown() {
    global.paused = false;
    global.inventory = false;

    with (all) {
        speed = paused_speed;
        image_speed = paused_animation;
    }
}

// Adds an item instance to the inventory
function inventory_add(item_instance) {
    for (var i = 0; i < array_length(global.inventorySlots); i++) {
        if (global.inventorySlots[i] == noone) { // Check for empty slot
            global.inventorySlots[i] = item_instance; // Store the item instance
            
            return true; // Return success
        }
    }
    return false; // Return false if no empty slot
}



// Returns true if all inventory slots are filled
function inventory_is_full() {
    for (var i = 0; i < array_length(global.inventorySlots); i++) {
        if (global.inventorySlots[i] == noone) { // Found an empty slot
            return false;
        }
    }
    return true; // No empty slots found
}




