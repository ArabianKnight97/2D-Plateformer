if (global.canToggleInventory) {
    global.canToggleInventory = false; // Prevents multiple toggles until key is released

    if (!global.inventory) {
        show_debug_message("Inventory Up");
        inv();
    } else {
        show_debug_message("Inventory Down");
        invDown();
    }
}
