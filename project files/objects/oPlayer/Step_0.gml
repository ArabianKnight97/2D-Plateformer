//get inputs
getControls()

if(!global.paused) {
	
//crouching
	//transition to crouch
		//manual
		if onGround && (downKey || place_meeting(x,y, oWall))
		{
			crouching = true;
		}
		
		//change collision mask
		if crouching {mask_index = crouchSpr; };
		
	//transition out of crouch
		//manual = !downkey, automatic not on ground
		if crouching && (!downKey || !onGround)
		{
			//check if i can uncrouch
			mask_index = idleSpr;
			//uncrouch if no solid wall in way
			if !place_meeting(x, y, oWall)
			{
				crouching = false;
			}
			//go back tou crouching mask index if there is a wall
			else
			{
				mask_index = crouchSpr;
			}
		}
		/*/automatic uncrouch in the air
		if !onGround
		{
			//check if i can uncrouch
			mask_index = idleSpr;
			//uncrouch if no solid wall in way
			if !place_meeting(x, y, oWall)
			{
				crouching = false;
			}
			//go back tou crouching mask index if there is a wall
			else
			{
				mask_index = crouchSpr;
			}
		}
		/*/

//X movement
	//Direction
	moveDir = rightKey - leftKey; //math to diced moving left or right (1 or -1)
	
	//get my face
	if moveDir != 0 { face = moveDir; };
	

	//get xspd
	if oPlayer.stamina >=10
	{
	runType = runKey;
	xspd = moveDir * moveSpd[runType];
	} else { xspd = moveDir * moveSpd[0];
	}
	if crouching { xspd = moveDir * crouchMoveSpd;};
	
	//X collision
	var _subPixel = .5; //how close you can get to the wall
	if place_meeting (x + xspd, y, oWall )
	{
		
		//First check if there is a slope to go up
		if !place_meeting( x + xspd, y - abs(xspd) - 1, oWall )
		{ 
			while place_meeting(x + xspd, y, oWall) { y-= _subPixel };	
		} 
		//if there is no slope, regular collision
		else 
		{
			//Ceiling Slopes
			if !place_meeting( x + xspd, y + abs(xspd)+1, oWall )
		{ 
			while place_meeting(x + xspd, y, oWall) { y+= _subPixel };	
		} 
		//normal collision
		else
	{
		//scoot up to wall precise
		var _pixelCheck = _subPixel * sign(xspd);
		while !place_meeting( x + _pixelCheck, y, oWall ){ x += _pixelCheck;};
	
		// if you hit wall you stop moving /collision
			xspd = 0;
		}
	}
	}
//Go down slopes
downSlopeSemiSolid = noone;
if yspd >= 0 && !place_meeting ( x + xspd, y +1, oWall ) && place_meeting(x + xspd, y + abs(xspd) +1, oWall)
{
	//check for semi solidplat
	downSlopeSemiSolid = checkForSemiSolidPlatform( x + xspd, y + abs(xspd)+1);
	//percise move down slop if there is no semisolid
	if !instance_exists(downSlopeSemiSolid)
	{
	while !place_meeting( x + xspd, y + _subPixel, oWall ) {y+= _subPixel; };
	}
}
	//move
	x += xspd;
	
	
//Y movement
	//Gravity
	if coyoteHangTimer > 0
	{
		//count timer down
		coyoteHangTimer--;
	} else {
		//apply gravity to player
		yspd += grav;
		//were no longer on the ground
		setOnGround(false);
	}
	
	
	//Reset/prepare jump variable
	if onGround 
	{
		jumpCount =0;
		coyoteJumpTimer = coyoteJumpFrames
	} else {
		//if palyer is in the air make sure they cant use an extra jmup
		coyoteJumpTimer--;
		if jumpCount == 0 && coyoteJumpTimer <=0 { jumpCount = 1; };
		
		coyoteHangTimer = 0;
	}
	
	
	//Initiate Jump
	if JumpKeyBuffered && !downKey && jumpCount < jumpMax
	{
		jumperKeyBuffered = false;
		JumpKeyBufferTimer = 0;
		//Increase the number of performed jumps
		jumpCount++
		//set jump hold timer
		jumpHoldTimer = jumpHoldFrames[jumpCount-1];
		//tell self we are no longer on the ground
		setOnGround(false);
	}
	//Cut off the jump by releasing the jump button
	if !jumpKey
	{
		jumpHoldTimer = 0;
	}
	//Jump based on the timer/holding of button
	if jumpHoldTimer > 0
	{
		//constatnly set the yspd to be the jumping speed
		yspd = jspd[jumpCount-1];
		//Count down the timer
		jumpHoldTimer--;
	}
		
	 
	 
	//Y collision and movement
		//Cap falling speed
		if yspd > termVel { yspd = termVel; };
		
		 //Y Collision
		 var _subPixel =.5;
		 
		 //upwards y collision (with cieling slopes)
		 if yspd < 0 && place_meeting(x, y+ yspd, oWall)
		 {
			 //jump into sloped cielings
			 var _slopeSlide = false;
			 //Slide up left slope
			 if moveDir == 0 && !place_meeting( x - abs(yspd)-1, y + yspd, oWall)
			 {
				 while place_meeting( x, y + yspd, oWall) { x -= 1; };
				 _slopeSlide =true;
			 }
			 
			 //slide up right
			 if moveDir == 0 && !place_meeting( x +abs(yspd)+1, y + yspd, oWall)
			 {
				 while place_meeting(x, y + yspd, oWall) { x +=1;};
				 _slopeSlide = true;
			 }	 
			 //normal y collsion
			 if !_slopeSlide
			 {
				  //Scoot up to wall
			 var _pixelCheck = _subPixel *sign(yspd);
			 while !place_meeting ( x, y + _pixelCheck, oWall) { y += _pixelCheck;}
			 
				  // head bonk code (OPTIONAL)
			 if yspd < 0 {  jumpHoldTimer = 0;};
				 
			//set yspd to 0 to collide
			 yspd =0;
				 
			 }
		 }
		 
		 
		 
		 //Floor Y collision
		 
		 //Check for solid and semi solid plats under me
		 var _clampYspd = max( 0, yspd );
		 var _list = ds_list_create();  //create ds list to store all the object we run into
		 var _array = array_create(0);
		 array_push ( _array, oWall, oSemiSolidWall);
		 
		 //Do the actual cheack and add objects to list
		 var _listSize = instance_place_list(x, y+1 + _clampYspd + moveplatMaxYspd, _array, _list, false );
		 
		 //check for semisolid below me
		 var _yCheck = y+1 + _clampYspd;
		 if instance_exists(myFloorPlat) { _yCheck += max(0, myFloorPlat.yspd); };
		 var _semiSolid = checkForSemiSolidPlatform(x, _yCheck);
		 
		 //loop thru the colliding instances and only return if top is below the player
		 for( var i = 0; i < _listSize; i++)
		 {
			 
			 //get an instance of owall or osemisolidwall from list
			 var _listInst = _list[| i];
			 
			 //avoid magnetism
			 if _listInst != forgetSemiSolid
			 && (_listInst.yspd <= yspd || instance_exists(myFloorPlat))
			 && (_listInst.yspd > 0 || place_meeting(x, y+1 + _clampYspd, _listInst) )
			 || (_listInst == _semiSolid)
			 {
				 
			 //return a solid wall or any semisolid wall that are below teh player
			 if _listInst.object_index == oWall
			 || object_is_ancestor( _listInst.object_index, oWall)
			 || floor(bbox_bottom) <= ceil( _listInst.bbox_top - _listInst.yspd )
			 {
					 //return the 'highest' wall object
					 if !instance_exists(myFloorPlat)
					 || _listInst.bbox_top +_listInst.yspd <= myFloorPlat.bbox_top + myFloorPlat.yspd
					 || _listInst.bbox_top +_listInst.yspd <= bbox_bottom 
					 {
						myFloorPlat = _listInst;
					 }
				 }
			} 
		 }
		 
		 //destroy ds list for mem leak
		 ds_list_destroy(_list);
		 
		 //downslope semisolid for mkaing sure we dont miss semisolids while going down slopes
		 if instance_exists(downSlopeSemiSolid) {myFloorPlat = downSlopeSemiSolid;};
		 
		 //One last check to make sure the floor platform is actually below us
		 if instance_exists(myFloorPlat) && !place_meeting (x , y + moveplatMaxYspd, myFloorPlat)
		 {
			 myFloorPlat = noone;
		 }
		 
		 //land on ground plat if there is one
		 if instance_exists(myFloorPlat)
		 {
			 //scoot up to wall percise
			 var _subPixel = .5;
			 while !place_meeting(x, y + _subPixel, myFloorPlat) && !place_meeting(x, y , oWall) { y+= _subPixel}
			 //make sure we dont end up below the top of a semisolid
			 if myFloorPlat.object_index == oSemiSolidWall || object_is_ancestor(myFloorPlat.object_index, oSemiSolidWall)
			 {
				 while place_meeting(x, y, myFloorPlat) {y -= _subPixel; };
			 }
			 //floor the y variable
			 y = floor(y);
			 
			 //collide w ground
			 yspd =0;
			 setOnGround(true);
		 }
		 
		 //manually fall thru semisolidplat
		 if downKey && jumpKeyPressed
		 {
			 //make sure we have a floor platform thats a semisolid
			 if instance_exists (myFloorPlat)
			 && ( myFloorPlat.object_index ==  oSemiSolidWall || object_is_ancestor(myFloorPlat.object_index, oSemiSolidWall))
			 {
				 //check if we can go below the semi solid
				 var _yCheck = max(1, myFloorPlat.yspd + 1);
				 if !place_meeting(x, y +  _yCheck, oWall)
				 {
					 //move below the platform
					 y+=1
					 
					 //inherit any downward speed from floor plat so it doesnt catch me
					 yspd = _yCheck -1;
					 
					 //forget this paltform for a brief time so we dont get caught again
					 forgetSemiSolid = myFloorPlat;
					 
					 //no more floor platform
					 setOnGround(false);
					 
				 }
			 }
		 }
		 
		 
	 
	 //Move
	 y += yspd;
	 
	 //reset the forgetsemisolid variable
	 if instance_exists(forgetSemiSolid) && !place_meeting(x,y,forgetSemiSolid)
	 {
		 forgetSemiSolid = noone;
	 }
	 
	 
 //final moving paltform collisions and movemnet
	 //X - moveplatxspd and collision
	 //get moveplat xspd
	 moveplatXspd= 0;
	 if instance_exists(myFloorPlat) { moveplatXspd = myFloorPlat.xspd; };
	 
	 //move with moveplatxspd
	 if place_meeting( x +moveplatXspd,y, oWall)
	 {
		 var _subPixel = .5;
		 var _pixelCheck = _subPixel * sign(moveplatXspd);
		 while !place_meeting(x + _pixelCheck,y,oWall)
		 {
			 x += _pixelCheck;
		 }
		 //set moveplatxspd to 0 to finsih collision
		 moveplatXspd =0;
	 }
	 //move
	 x += moveplatXspd
	 
	 //y- snap to platform
	 if instance_exists(myFloorPlat)
	 && (myFloorPlat.yspd != 0
	 || myFloorPlat.object_index == oSemiSolidMovePlat
	 || object_is_ancestor(myFloorPlat.object_index, oSemiSolidMovePlat))
	 {
		 //snap to the top of floor plat (unfloor y var)
		 if !place_meeting(x, myFloorPlat.bbox_top, oWall)
		 && myFloorPlat.bbox_top >= bbox_bottom - moveplatMaxYspd
		{ 
		  y = myFloorPlat.bbox_top;
		}
		
		//going up into a solid wall while on semisolid plat
		if myFloorPlat.yspd < 0 && place_meeting(x, y+ myFloorPlat.yspd, oWall)
		{
			//get pushed thru semisolid floor
			if myFloorPlat.object_index == oSemiSolidWall || object_is_ancestor(myFloorPlat.object_index, oSemiSolidWall)
			{
				//get pushed down
				var _subPixel = .25;
				while place_meeting(x, y + myFloorPlat.yspd, oWall) { y += _subPixel };
				//if we got pushed into a solid wall while going downwards, push pourselves back out
				while place_meeting(x,y, oWall){ y -= _subPixel; };
				y = round(y);
			}
			//cancel myfloorplat variable
			setOnGround(false);
		 }
	 }
	 
	 
	 
	 
	
	//Sprite Control
	//walking
	if abs(xspd) > 0 {sprite_index = walkSpr;};
	//running
	if abs(xspd) >= moveSpd[1] { sprite_index = runSpr; };
	//not moving
	if xspd == 0 {sprite_index = idleSpr;};
	//in the air 
	if !onGround { sprite_index = jumpSpr;};
	//crouching
	if crouching {sprite_index = crouchSpr;};
	
	//set collission mask
	mask_index = idleSpr;
	if crouching {mask_index = crouchSpr;};
	//check if dead
	//if (oPlayer.health < 1) kill_player();

}