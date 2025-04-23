/// @description draws text

// save original draw settings
var _halign = draw_get_halign()
var _valign = draw_get_valign()
var _font = draw_get_font()
var _color = draw_get_color()
var _alpha = draw_get_alpha()

// set draw and decrement TTL
draw_self()

draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_set_font(fButtons)
draw_set_color(color)

draw_set_alpha(time_to_live * 0.01)
time_to_live--
time_to_live--

draw_text(x, y, text)
draw_set_color(c_black)
draw_set_alpha(time_to_live * 0.0025)
draw_text(x + 1, y + 1, text)

// reset original settings
draw_set_halign(_halign)
draw_set_valign(_valign)
draw_set_alpha(_alpha)
draw_set_halign(_halign)
draw_set_valign(_valign)
draw_set_alpha(_alpha)
draw_set_color(_color)
draw_set_font(_font)