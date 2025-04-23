/// @param text_id
function scr_game_text(_text_id){

switch(_text_id) {
	
	
	
	case "npc 1":
		scr_text("HI I AM NPC 1");
		scr_text("HI I AM NPC 1 AND HERE IS A LONG TEXT");
		scr_text("SHORT");
		scr_text("DO YOU LIKE SHORT TEXTS?");
		scr_option("I LOVE SHORT TEXTS!", "npc 1 - yes");
		scr_option("I DONT LIKE SHORT TEXTS!", "npc 1 - no");
		
		break;
		case "npc 1 - yes":
			scr_text(":)");
			break;
		case "npc 1 - no":
			scr_text("HERE IS A SUPER LONG ANNOYING TO TYPE TEXT JUST BECAUSE YOU CHOSE THAT YOU LIKE LONG TEXTS!!!!!!!");
			break;
		
		
		
	case "npc 2":
		scr_text("HI I AM NPC 2");
		scr_text("HI I AM NPC 2 AND HERE IS A LONG SCRIPT");
		scr_text("BYE");
		break;
		
		
		
	case "npc 3":
	
		break;
	
	}

}