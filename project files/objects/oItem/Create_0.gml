// oItem Create Event
item_name = "Default Item";   // Name of the item
item_sprite = sprite_index;   // The item's sprite
item_category = "generic"; // category: gear, item, stock, loot
can_pickup = false;           // Only true when the player is near
item_type = "generic"; // default type, child objects can override
pickup_radius = 35;

item_data = {
    name: item_name,
    sprite: item_sprite,
	category: item_category,
    type: item_type,
    can_pickup: can_pickup,
    pickup_radius: pickup_radius
};