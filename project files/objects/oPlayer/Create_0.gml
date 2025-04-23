//custom functions for player
function setOnGround(_val = true)
{
	if _val == true
	{
		onGround = true;
		coyoteHangTimer = coyoteHangFrames;
	} else {
		onGround = false;
		myFloorPlat = noone;
		coyoteHangTimer = 0;
	}
}

function checkForSemiSolidPlatform(_x, _y)
{
	//create a return variable
	var _rtrn = noone;
	
	//we must not be moving upwards then we check for a normal collision
	if yspd >= 0 && place_meeting(_x,_y, oSemiSolidWall)
	{
		//create a dslist to store all collising sintances of osemisolid wall
		var _list = ds_list_create();
		var _listSize = instance_place_list(_x, _y, oSemiSolidWall, _list, false);
		
		//loop thru the collisding instances and only return one of its top is below the player
		for (var i = 0; i < _listSize; i++)
		{
			var _listInst = _list[| i];
			if _listInst != forgetSemiSolid && floor(bbox_bottom) <= ceil(_listInst.bbox_top - _listInst.yspd)
			{
			//return the id of a semisolid platform 
			_rtrn = _listInst;
			//exit loop early
			i = _listSize
			}
		}
		//destroy ds list for memory
		ds_list_destroy(_list);
	}
	//return our variable
	return _rtrn;
}

depth = -30;

//control setupo
controlsSetup();

//sprite
maskSpr = sPlayerIdle;
idleSpr = sPlayerIdle;
walkSpr = sPlayerWalk;
runSpr = sPlayerRun;
jumpSpr = sPlayerJump;
crouchSpr = sPlayerCrouch;


//Moving
face = 1;
moveDir = 0;
runType = 0;
moveSpd[0] = 1.7;
moveSpd[1] = 3.5;
xspd = 0;
yspd = 0;

//state variable
crouching = false;
crouchMoveSpd = 1
//Jumping
grav = .275; //pixels per frame
termVel = 8; //pixels per frame MAX
onGround = true;
jumpMax = 2; //extra jumps
jumpCount = 0;
jumpHoldTimer = 0;

//Jump values for each successive jump
jumpHoldFrames[0] = 18;
jspd[0] = -4.15; //jump speed, y axis is upside down in gamemaker
jumpHoldFrames[1] = 10;
jspd[1] = -3.15;

//Coyote Time
//Hang time
coyoteHangFrames = 2;
coyoteHangTimer = 0;
// jump buffer time
coyoteJumpFrames = 5;
coyoteJumpTimer = 0;

// Instance variables
oPlayer.stamina = stamina
oPlayer.mana = mana
oPlayer.stamina_regen_rate = stamina_regen_rate

// Hurt state variables
hurtTimer = 0; // Timer to reset player color after hurt
isHurt = false; // Indicates if player is in hurt state

// Moving plats
myFloorPlat = noone;
downSlopeSemiSolid = noone;
forgetSemiSolid = noone;
moveplatXspd = 0;
moveplatMaxYspd = termVel;

// Define inventory in oPlayer Create Event
// oInventory Create Event
if(!variable_global_exists("inventorySlots")){
	global.inventorySlots = array_create(18, noone); // 6 columns * 3 rows = 18 slots
	global.inventory_size = 18;  // Max number of slots
	global.inventory_sprites = array_create(global.inventory_size, -1);
}


