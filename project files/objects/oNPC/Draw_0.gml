// Draw the NPC sprite
draw_self();

// Health bar position (relative to NPC)
var bar_x1 = x - 20; // Left side of the health bar
var bar_y1 = y - sprite_height + 20; // Top side of the health bar
var bar_x2 = x + 20; // Right side of the health bar
var bar_y2 = bar_y1 + 6; // Bottom side of the health bar

// Draw the health bar
draw_healthbar(bar_x1, bar_y1, bar_x2, bar_y2, NPChealth,
    c_red, c_yellow, c_green,    // Colors for low, medium, and high health
    true,                       // background
    true,                       // border
    true                         // percentage
);
