//move in circle
dir+= rotSpd;

//get our target positions
var _targetX = xstart + lengthdir_x( radius, dir );
var _targetY = ystart + lengthdir_y( radius, dir );

//get our x and yspd
xspd = _targetX - x;
//xspd = 0;
yspd = _targetY - y;

//move
x += xspd;
y += yspd;

