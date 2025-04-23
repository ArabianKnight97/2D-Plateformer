event_inherited();
item_name = "Scroll of Speed";   // Name of the item
item_sprite = ScrollOfSpeed;   // The item's sprite
item_category = "gear";
can_pickup = false;           // Only true when the player is near
item_type = "scroll"; // default type, child objects can override
pickup_radius = 35;

item_data = {
    name: item_name,
    sprite: item_sprite,
	category: item_category,
    type: item_type,
    can_pickup: can_pickup,
    pickup_radius: pickup_radius
};