// oItem Step Event (Pickup Logic)
if (point_distance(x, y, oPlayer.x, oPlayer.y) < pickup_radius) {
    if (keyboard_check_pressed(ord("Q"))) {
        if (!inventory_is_full()) {
            // Store item data (name, type, etc.) in inventory
            var item_data = {
                name: item_name,
                sprite: item_sprite,
                type: item_type,
                can_pickup: can_pickup,
                pickup_radius: pickup_radius
            };

            // Add item data to first available slot in inventory
            for (var i = 0; i < array_length(global.inventorySlots); i++) {
                if (global.inventorySlots[i] == noone) {
                    global.inventorySlots[i] = item_data;
                    show_debug_message("Item added to inventory: " + item_data.name);
                    break;
                }
            }

            // Optionally destroy the item in the world (but not in inventory)
            //instance_destroy();

            // Show inventory contents as debug message
            show_debug_message("Current Inventory:");
            for (var i = 0; i < array_length(global.inventorySlots); i++) {
                if (global.inventorySlots[i] != noone) {
                    var item = global.inventorySlots[i];
                    show_debug_message("Slot " + string(i) + ": " + item.name + " | Type: " + item.type);
                } else {
                    show_debug_message("Slot " + string(i) + ": Empty");
                }
            }
        } else {
            show_debug_message("Inventory is full!");
        }
    }
}
