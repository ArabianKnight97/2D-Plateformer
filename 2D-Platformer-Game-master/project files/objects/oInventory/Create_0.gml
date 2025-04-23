global.inventory = false;
global.paused = false;
global.canToggleInventory = true;
// oInventory Create Event
global.inventorySlots = array_create(18, noone); // 6 columns * 3 rows = 18 slots
if (!variable_global_exists("coinage")) {
    global.coinage = 0; // starting amount
}
