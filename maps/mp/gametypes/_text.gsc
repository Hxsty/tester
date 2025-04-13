#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;

createText()
{
	MyYT2 = self createFontString("hudbig", 2);	//HEADER v2
	MyYT2 setPoint("CENTER", "CENTER", 0, -180);
	MyYT2.glowAlpha = 1;
	MyYT2.glowColor = (255, 255, 0);
	MyYT = self createFontString("hudbig", 1);	//HEADER v2
	MyYT setPoint("CENTER", "CENTER", 115, -160);
	MyYT.glowAlpha = 30;
	MyYT.glowColor = (0, 255, 0);
	Menu1 = self createFontString("default", 2); // Main Menu Text
	Menu1 setPoint("CENTER", "CENTER", 0, -150);
	Menu2 = self createFontString("default", 1.75); // Sub Menu Text
	Menu2 setPoint("CENTER", "CENTER", 0, -125);
	Menu3 = self createFontString("default", 1.75); // Sub Sub Menu Text
	Menu3 setPoint("CENTER", "CENTER", 0, -105);

	subMenu1 = self createFontString("default", 1.5);
	subMenu1 setPoint("CENTER", "CENTER", -200, -150);
	subMenu2 = self createFontString("default", 1.5);
	subMenu2 setPoint("CENTER", "CENTER", 200, -150);

	Text1 = self createFontString("default", 1.5);
	Text1 setPoint("CENTER", "CENTER", 0, -80);
	Text2 = self createFontString("default", 1.5);
	Text2 setPoint("CENTER", "CENTER", 0, -60);
	Text3 = self createFontString("default", 1.5);
	Text3 setPoint("CENTER", "CENTER", 0, -40);
	Text4 = self createFontString("default", 1.5);
	Text4 setPoint("CENTER", "CENTER", 0, -20);
	Text5 = self createFontString("default", 1.5);
	Text5 setPoint("CENTER", "CENTER", 0, 0);
	Text6 = self createFontString("default", 1.5);
	Text6 setPoint("CENTER", "CENTER", 0, 20);
	Text7 = self createFontString("default", 1.5);
	Text7 setPoint("CENTER", "CENTER", 0, 40);
	Text8 = self createFontString("default", 1.5);
	Text8 setPoint("CENTER", "CENTER", 0, 60);
	Text9 = self createFontString("default", 1.5);
	Text9 setPoint("CENTER", "CENTER", 0, 80);
	Text10 = self createFontString("default", 1.5);
	Text10 setPoint("CENTER", "CENTER", 0, 100);
	Text11 = self createFontString("default", 1.5);
	Text11 setPoint("CENTER", "CENTER", 0, 120);
	Text12 = self createFontString("default", 1.5);
	Text12 setPoint("CENTER", "CENTER", 0, 140);

	Left1 = self createFontString("default", 1.5);
	Left1 setPoint("CENTER", "CENTER", -300, -40);

	Right1 = self createFontString("default", 1.5);
	Right1 setPoint("CENTER", "CENTER", 300, -40);

	Close1 = self createFontString("default", 2);
	Close1 setPoint("CENTER", "CENTER", 0, 160);

	for(;;)
	{
		if (self.menuOpen == 0)
		{
			MyYT setText( "" );
			MyYT2 setText( "" );
			Menu1 setText( "" );
			Menu2 setText( "" );
			Menu3 setText( "" );
			subMenu1 setText( "" );
			subMenu2 setText( "" );
			Text1 setText( "" );
			Text2 setText( "" );
			Text3 setText( "" );
			Text4 setText( "" );
			Text5 setText( "" );
			Text6 setText( "" );
			Text7 setText( "" );
			Text8 setText( "" );
			Text9 setText( "" );
			Text10 setText( "" );
			Text11 setText( "" );
			Text12 setText( "" );
			Left1 setText( "" );
			Right1 setText( "" );
			Close1 setText( "" );
			

		} else if (self.menuOpen == 1) {

			MyYT setText( "" );
			Menu1 setText( "" );
			Menu2 setText( "" );
			Menu3 setText( "" );
			subMenu1 setText( "" );
			subMenu2 setText( "" );
			Text1 setText( "" );
			Text2 setText( "" );
			Text3 setText( "" );
			Text4 setText( "" );
			Text5 setText( "" );
			Text6 setText( "" );
			Text7 setText( "" );
			Text8 setText( "" );
			Text9 setText( "" );
			Text10 setText( "" );
			Text11 setText( "" );
			Text12 setText( "" );
			Close1 setText( "" );
			
		
			Close1 setText( "^2Press ^3[{+actionslot 1}] ^2to ^3close the menu" );


			if (self.menuOpen == 1)
			{
			myYT2 setText( "ALL IN ONE V1" );
			myYT setText( "by Nuze" );
			Left1 setText("^3A ^2 to cycle menu left\n^3D ^2 to cycle menu right\n^3W ^2to move up on the menu\n^3S ^2to move down on the menu\n^3Space ^2to to make your selection\n");
			
				if (self.menuPos == 1) // Teleports
				{
					if (self.admin == true)
						subMenu1 setText( "^3Binds" );
					else
						subMenu1 setText( "^3Character Preferences" );
					subMenu2 setText( "^3Equipment" );
				}
				else if (self.menuPos == 2) // Equipment
				{
					subMenu1 setText( "^3Teleports" );
					subMenu2 setText( "^3Weapons" );
				}
				else if (self.menuPos == 3) // Weapons
				{
					subMenu1 setText( "^3Equipment" );
					subMenu2 setText( "^3Killstreaks" );
				}
				else if (self.menuPos == 4) // Killstreaks
				{
					subMenu1 setText( "^3Weapons" );
					subMenu2 setText( "^3Character Preferences" );
				}
				else if (self.menuPos == 5) // Character Prefs.
				{
					subMenu1 setText( "^3Killstreaks" );

					if (self.admin == true)
						subMenu2 setText( "^3Match Settings" );
					else
						subMenu2 setText( "^3Teleports" );
				}
				else if (self.menuPos == 6) // Match Settings
				{
					subMenu1 setText( "^3Character Preferences" );
					subMenu2 setText( "^3Change Map" );
				}
				else if (self.menuPos == 7) // Change Map
				{
					subMenu1 setText( "^3Match Settings" );
					subMenu2 setText( "^3Bot Settings" );
				}
				else if (self.menuPos == 8) // Bot Settings
				{
					subMenu1 setText( "^3Change Map" );
					subMenu2 setText( "^3Kick Players" );
				}
				else if (self.menuPos == 9) // Kick Players
				{
					subMenu1 setText( "^3Bot Settings" );
					subMenu2 setText( "^3Binds" );
				}
				
			}
			
			// Teleport Menu
			if (self.menuPos == 1) {
			
				Menu2 setText( "^3Choose a Location to teleport" );

				if (self.admin == true) {
					Text1 setText( "^2Press ^3[{+frag}] ^2To Spawn ^3a Enemy Bot" );
					Text2 setText( "^2Press ^3[{+back}] ^2To Spawn ^3a Teammate Bot" );
					Text3 setText( "^2Press ^3[{+actionslot 2}] ^2To ^3Move Bots To Crosshair" );
				}

				if (getdvar("mapname") == "mp_afghan") {
					Menu1 setText( "^2Afghan Menu" );
					Text4 setText( "^2Press ^3[{+actionslot 3}] ^2To Teleport To: ^3Top of the Wing" );
					Text5 setText( "^2Press ^3[{+actionslot 4}] ^2To Teleport To: ^3Top of the Rocks" );
					Text6 setText( "^2Press ^3[{+smoke}] ^2To Teleport To: ^3Above the Cockpit" );
					Text7 setText( "^2Press ^3[{+activate}] ^2To Teleport To: ^3Suicide Spot" );
				} else if (getdvar("mapname") == "mp_derail") {
					Menu1 setText( "^2Derail Menu" );
					Text4 setText( "^2Press ^3[{+actionslot 3}] ^2To Teleport To: ^3Passage of the Rail" );
					Text5 setText( "^2Press ^3[{+actionslot 4}] ^2To Teleport To: ^3Roof of NovaStar" );
					Text6 setText( "^2Press ^3[{+smoke}] ^2To Teleport To: ^3Ladder Spot" );
					Text7 setText( "^2Press ^3[{+activate}] ^2To Teleport To: ^3Goods Wagon" );
				} else if (getdvar("mapname") == "mp_estate") {
					Menu1 setText( "^2Estate Menu" );
					Text4 setText( "^2Press ^3[{+actionslot 3}] ^2To Teleport To: ^3Next to the destroyed Roof" );
					Text5 setText( "^2Press ^3[{+actionslot 4}] ^2To Teleport To: ^3Top of the Greenhouse" );
					Text6 setText( "^2Press ^3[{+smoke}] ^2To Teleport To: ^3Roof of the Fishing Hut" );
					Text7 setText( "^2Press ^3[{+activate}] ^2To Teleport To: ^3Above the Power Grid" );
				} else if (getdvar("mapname") == "mp_favela") {
					Menu1 setText( "^2Favela Menu" );
					Text4 setText( "^2Press ^3[{+actionslot 3}] ^2To Teleport To: ^3Stairs next to Bombsite A" );
					Text5 setText( "^2Press ^3[{+actionslot 4}] ^2To Teleport To: ^3Next to the Water Tank" );
					Text6 setText( "^2Press ^3[{+smoke}] ^2To Teleport To: ^3Wood Stairs of the Barbershop" );
					Text7 setText( "^2Press ^3[{+activate}] ^2To Teleport To: ^3Elevator Spot" );
				} else if (getdvar("mapname") == "mp_highrise") {
					Menu1 setText( "^2Highrise Menu" );
					Text4 setText( "^2Press ^3[{+actionslot 3}] ^2To Teleport To: ^3Top of Highrise" );
					Text5 setText( "^2Press ^3[{+actionslot 4}] ^2To Teleport To: ^3Crane Suicide Shot" );
					Text6 setText( "^2Press ^3[{+smoke}] ^2To Teleport To: ^3Top of the Helicopter " );
					Text7 setText( "^2Press ^3[{+activate}] ^2To Teleport To: ^3Above Elevators" );
				} else if (getdvar("mapname") == "mp_nightshift") {
					Menu1 setText( "^2Skidrow Menu" );
					Text4 setText( "^2Press ^3[{+actionslot 3}] ^2To Teleport To: ^3Sheef Roof" );
					Text5 setText( "^2Press ^3[{+actionslot 4}] ^2To Teleport To: ^3Top of the Water Tank" );
					Text6 setText( "^2Press ^3[{+smoke}] ^2To Teleport To: ^3Containers near the River" );
					Text7 setText( "^2Press ^3[{+activate}] ^2To Teleport To: ^3Top of the Map" );
				} else if (getdvar("mapname") == "mp_invasion") {
					Menu1 setText( "^2Invasion Menu" );
					Text4 setText( "^2Press ^3[{+actionslot 3}] ^2To Teleport To: ^3Next to the American Flag" );
					Text5 setText( "^2Press ^3[{+actionslot 4}] ^2To Teleport To: ^3Above OpFor Spawn" );
					Text6 setText( "^2Press ^3[{+smoke}] ^2To Teleport To: ^3Elevator Trickshot Spot" );
					Text7 setText( "^2Press ^3[{+activate}] ^2To Teleport To: ^3Highest Building of the Map" );
				} else if (getdvar("mapname") == "mp_checkpoint") {
					Menu1 setText( "^2Karachi Menu" );
					Text4 setText( "^2Press ^3[{+actionslot 3}] ^2To Teleport To: ^3Platform near Bombsite A" );
					Text5 setText( "^2Press ^3[{+actionslot 4}] ^2To Teleport To: ^3Next to Hotel Kashmir" );
					Text6 setText( "^2Press ^3[{+smoke}] ^2To Teleport To: ^3Out of Map near destroyed Roof" );
					Text7 setText( "^2Press ^3[{+activate}] ^2To Teleport To: ^3Out of Map next to the Clock Tower" );
				} else if (getdvar("mapname") == "mp_quarry") {
					Menu1 setText( "^2Quarry Menu" );
					Text4 setText( "^2Press ^3[{+actionslot 3}] ^2To Teleport To: ^3Passage on House 14" );
					Text5 setText( "^2Press ^3[{+actionslot 4}] ^2To Teleport To: ^3Nearly Edge of the Map" );
					Text6 setText( "^2Press ^3[{+smoke}] ^2To Teleport To: ^3Above Transportadora" );
					Text7 setText( "^2Press ^3[{+activate}] ^2To Teleport To: ^3Highest Latern Spot" );
				} else if (getdvar("mapname") == "mp_rundown") {
					Menu1 setText( "^2Rundown Menu" );
					Text4 setText( "^2Press ^3[{+actionslot 3}] ^2To Teleport To: ^3Above Barateiro" );
					Text5 setText( "^2Press ^3[{+actionslot 4}] ^2To Teleport To: ^3Windows Shot Spot" );
					Text6 setText( "^2Press ^3[{+smoke}] ^2To Teleport To: ^3Wall near Stone Stairs" );
					Text7 setText( "^2Press ^3[{+activate}] ^2To Teleport To: ^3Wooden Power Pole near Bombsite B" );
				} else if (getdvar("mapname") == "mp_rust") {
					Menu1 setText( "^2Rust Menu" );
					Text4 setText( "^2Press ^3[{+actionslot 3}] ^2To Teleport To: ^3Top of Rust" );
					Text5 setText( "^2Press ^3[{+actionslot 4}] ^2To Teleport To: ^3Platform at Bombsite B" );
					Text6 setText( "^2Press ^3[{+smoke}] ^2To Teleport To: ^3Above Box Room" );
					Text7 setText( "^2Press ^3[{+activate}] ^2To Teleport To: ^3Oil Pipe near Drilling Rig" );
				} else if (getdvar("mapname") == "mp_boneyard") {
					Menu1 setText( "^2Scrapyard Menu" );
					Text4 setText( "^2Press ^3[{+actionslot 3}] ^2To Teleport To: ^3Above TF141 Spawn" );
					Text5 setText( "^2Press ^3[{+actionslot 4}] ^2To Teleport To: ^3Oil Drums near Bombsite A" ); 
					Text6 setText( "^2Press ^3[{+smoke}] ^2To Teleport To: ^3On Top of the Plane Shell" );
					Text7 setText( "^2Press ^3[{+activate}] ^2To Teleport To: ^3Forklift" );
				} else if (getdvar("mapname") == "mp_subbase") {
					Menu1 setText( "^2Sub Base Menu" );
					Text4 setText( "^2Press ^3[{+actionslot 3}] ^2To Teleport To: ^3Roof near 1st Propeller" );
					Text5 setText( "^2Press ^3[{+actionslot 4}] ^2To Teleport To: ^3Terrace near Communications Room" );
					Text6 setText( "^2Press ^3[{+smoke}] ^2To Teleport To: ^3Roof near 2nd Propeller" );
					Text7 setText( "^2Press ^3[{+activate}] ^2To Teleport To: ^3Elevator Spot" );
				} else if (getdvar("mapname") == "mp_terminal") {
					Menu1 setText( "^2Terminal Menu" );
					Text4 setText( "^2Press ^3[{+actionslot 3}] ^2To Teleport To: ^3Roof of Electronic Room" );
					Text5 setText( "^2Press ^3[{+actionslot 4}] ^2To Teleport To: ^3Ladder above Bombsite A" );
					Text6 setText( "^2Press ^3[{+smoke}] ^2To Teleport To: ^3Top of Plane" );
					Text7 setText( "^2Press ^3[{+activate}] ^2To Teleport To: ^3Top of Latern" );
				} else if (getdvar("mapname") == "mp_underpass") {
					Menu1 setText( "^2Underpass Menu" );
					Text4 setText( "^2Press ^3[{+actionslot 3}] ^2To Teleport To: ^3Circular Platform" );
					Text5 setText( "^2Press ^3[{+actionslot 4}] ^2To Teleport To: ^3Roof of the Favela Houses" );
					Text6 setText( "^2Press ^3[{+smoke}] ^2To Teleport To: ^3Out of Map Bridge" );
					Text7 setText( "^2Press ^3[{+activate}] ^2To Teleport To: ^3Roof above Bombsite A" );
				} else if (getdvar("mapname") == "mp_brecourt") {
					Menu1 setText( "^2Wasteland Menu" );
					Text4 setText( "^2Press ^3[{+actionslot 3}] ^2To Teleport To: ^3Top of Roofless House" );
					Text5 setText( "^2Press ^3[{+actionslot 4}] ^2To Teleport To: ^3Top of Helicopter" );
					Text6 setText( "^2Press ^3[{+smoke}] ^2To Teleport To: ^3Roof near crashed Cars" );
					Text7 setText( "^2Press ^3[{+activate}] ^2To Teleport To: ^3Wooden Power Pole at the Graveyard" );
				} else if (getdvar("mapname") == "mp_fuel2") {
					Menu1 setText( "^2Fuel Menu" );
					Text4 setText( "^2Press ^3[{+actionslot 3}] ^2To Teleport To: ^3Near the Palm" );
					Text5 setText( "^2Press ^3[{+actionslot 4}] ^2To Teleport To: ^3Into House near Bombsite B" );
					Text6 setText( "^2Press ^3[{+smoke}] ^2To Teleport To: ^3Roof near Scrap Box" );
					Text7 setText( "^2Press ^3[{+activate}] ^2To Teleport To: ^3Roof of Oildepot" );
				} else if (getdvar("mapname") == "mp_complex") {
					Menu1 setText( "^2Bailout Menu" );
					Text4 setText( "^2Press ^3[{+actionslot 3}] ^2To Teleport To: ^3Suicide Spot" );
					Text5 setText( "^2Press ^3[{+actionslot 4}] ^2To Teleport To: ^3Outside Terrace" );
					Text6 setText( "^2Press ^3[{+smoke}] ^2To Teleport To: ^3Balcony of the Blue House" );
					Text7 setText( "^2Press ^3[{+activate}] ^2To Teleport To: ^3Out of Map Roof" );
				} else if (getdvar("mapname") == "mp_overgrown") {
					Menu1 setText( "^2Overgrown Menu" );
					Text4 setText( "^2Press ^3[{+actionslot 3}] ^2To Teleport To: ^3Top of Bombsite B House" );
					Text5 setText( "^2Press ^3[{+actionslot 4}] ^2To Teleport To: ^3 Destroyed House" );
					Text6 setText( "^2Press ^3[{+smoke}] ^2To Teleport To: ^3Roof of the River Passage" );
					Text7 setText( "^2Press ^3[{+activate}] ^2To Teleport To: ^3Roof of Rectangle House" );
				} else if (getdvar("mapname") == "mp_compact") {
					Menu1 setText( "^2Salvage Menu" );
					Text4 setText( "^2Press ^3[{+actionslot 3}] ^2To Teleport To: ^3Platform under the Crane" );
					Text5 setText( "^2Press ^3[{+actionslot 4}] ^2To Teleport To: ^3Roof near the Crane" );
					Text6 setText( "^2Press ^3[{+smoke}] ^2To Teleport To: ^3Stairs at House 33" );
					Text7 setText( "^2Press ^3[{+activate}] ^2To Teleport To: ^3Truck near NovaStar" );
				} else if (getdvar("mapname") == "mp_crash") {
					Menu1 setText( "^2Crash Menu" );
					Text4 setText( "^2Press ^3[{+actionslot 3}] ^2To Teleport To: ^3Platform near TF141 Spawn" );
					Text5 setText( "^2Press ^3[{+actionslot 4}] ^2To Teleport To: ^3Roof of a Store" );
					Text6 setText( "^2Press ^3[{+smoke}] ^2To Teleport To: ^3Pharmacy House" );
					Text7 setText( "^2Press ^3[{+activate}] ^2To Teleport To: ^3Roof above Bombsite A" );
				} else if (getdvar("mapname") == "mp_abandon") {
					Menu1 setText( "^2Carnival Menu" );
					Text4 setText( "^2Press ^3[{+actionslot 3}] ^2To Teleport To: ^3Castle" );
					Text5 setText( "^2Press ^3[{+actionslot 4}] ^2To Teleport To: ^3FUNHAUS Balcony" );
					Text6 setText( "^2Press ^3[{+smoke}] ^2To Teleport To: ^3Roller-Coaster" );
					Text7 setText( "^2Press ^3[{+activate}] ^2To Teleport To: ^3FUNHAUS Window" );
				} else if (getdvar("mapname") == "mp_storm") {
					Menu1 setText( "^2Storm Menu" );
					Text4 setText( "^2Press ^3[{+actionslot 3}] ^2To Teleport To: ^3Platform near Spetsnaz Spawn" );
					Text5 setText( "^2Press ^3[{+actionslot 4}] ^2To Teleport To: ^3Top of the Truck" );
					Text6 setText( "^2Press ^3[{+smoke}] ^2To Teleport To: ^3Little Office near Bombsite B" );
					Text7 setText( "^2Press ^3[{+activate}] ^2To Teleport To: ^3Terrace next to the Dolls " );
				} else if (getdvar("mapname") == "mp_strike") {
					Menu1 setText( "^2Strike Menu" );
					Text4 setText( "^2Press ^3[{+actionslot 3}] ^2To Teleport To: ^3Balcony near Bombsite B" );
					Text5 setText( "^2Press ^3[{+actionslot 4}] ^2To Teleport To: ^3Platform near Bombsite B" );
					Text6 setText( "^2Press ^3[{+smoke}] ^2To Teleport To: ^3Balcony near Army Rangers Spawn" );
					Text7 setText( "^2Press ^3[{+activate}] ^2To Teleport To: ^3Out of Map Roof" );
				} else if (getdvar("mapname") == "mp_trailerpark") {
					Menu1 setText( "^2Trailer Park  Menu" );
					Text4 setText( "^2Press ^3[{+actionslot 3}] ^2To Teleport To: ^3Top of Tube" );
					Text5 setText( "^2Press ^3[{+actionslot 4}] ^2To Teleport To: ^3Scrap Box near Bombsite A" );
					Text6 setText( "^2Press ^3[{+smoke}] ^2To Teleport To: ^3Scrap Box near Bombsite B" );
					Text7 setText( "^2Press ^3[{+activate}] ^2To Teleport To: ^3Car next to the Green Trailer" );
				} else if (getdvar("mapname") == "mp_vacant") {
					Menu1 setText( "^2Vacant Menu" );
					Text4 setText( "^2Press ^3[{+actionslot 3}] ^2To Teleport To: ^3Outside Truck" );
					Text5 setText( "^2Press ^3[{+actionslot 4}] ^2To Teleport To: ^3Wood Boxes at Bombsite B" );
					Text6 setText( "^2Press ^3[{+smoke}] ^2To Teleport To: ^3Car at Edge of the Map " );
					Text7 setText( "^2Press ^3[{+activate}] ^2To Teleport To: ^3Oil Drums at Bombsite A" );
				} else if (getdvar("mapname") == "mp_nuked") {
					Menu1 setText( "^2Nuketown Menu" );
					Text4 setText( "^2Press ^3[{+actionslot 3}] ^2To Teleport To: ^3Balkon Yellow House" );
					Text5 setText( "^2Press ^3[{+actionslot 4}] ^2To Teleport To: ^3Balkon Green House" );
				} else if (getdvar("mapname") == "mp_cross_fire") {
					Menu1 setText( "^2Crossfire Menu" );
					Text4 setText( "^2Press ^3[{+actionslot 3}] ^2To Teleport To: ^3Highest Spot" );
					Text5 setText( "^2Press ^3[{+actionslot 4}] ^2To Teleport To: ^3Out of Map Plateau" );
				} else if (getdvar("mapname") == "mp_bloc") {
					Menu1 setText( "^2Bloc Menu" );
					Text4 setText( "^2Press ^3[{+actionslot 3}] ^2To Teleport To: ^3Top of half-destroyed House" );
					Text5 setText( "^2Press ^3[{+actionslot 4}] ^2To Teleport To: ^3Top of Stonestairs" );
				} else if (getdvar("mapname") == "mp_cargoship") {
					Menu1 setText( "^2Wet Work Menu" );
					Text4 setText( "^2Press ^3[{+actionslot 3}] ^2To Teleport To: ^3Top of Conning Bridge" );
					Text5 setText( "^2Press ^3[{+actionslot 4}] ^2To Teleport To: ^3Top of Ship's Mast " );
				} else if (getdvar("mapname") == "mp_killhouse") {
					Menu1 setText( "^2Killhouse Menu" );
					Text4 setText( "^2Press ^3[{+actionslot 3}] ^2To Teleport To: ^3Top of Midspot" );
					Text5 setText( "^2Press ^3[{+actionslot 4}] ^2To Teleport To: ^3Top of House 3" );
				} else if (getdvar("mapname") == "mp_bog_sh") {
					Menu1 setText( "^2Bog Menu" );
					Text4 setText( "^2Press ^3[{+actionslot 3}] ^2To Teleport To: ^3Bridge" );
					Text5 setText( "^2Press ^3[{+actionslot 4}] ^2To Teleport To: ^3Out of Map House" );
				} else {
					Menu1 setText( "^1No Locations" );
					Text4 setText( "^1No Locations available" );
				}
				
				Text9 setText( "^2Press ^3[{+melee}] ^2To ^3Save ^2Your Current Location" );

				if (self.ufo == false) {
					Text8 setText( "^2Press ^3[{+gostand}] ^2To ^3Enter ^2Into ^3UFO Mode" );
				} else {
					Text8 setText( "^2Press ^3[{+gostand}] ^2To ^3Exit ^2Out Of ^3UFO Mode" );
				}
				
				if (self.pers["loc"] == false) {
					Text10 setText( "^2You Have To ^3Save ^2A Location ^3To Load It" );
				} else if (self.pers["loc"] == true) {
					Text10 setText( "^2Press ^3[{+reload}] ^2To Load ^3Your Saved Location" );
				}

				if (self.pers["mySpawn"] == 0) {
					Text11 setText( "^2Press ^3[{+forward}] ^2To Set ^3Your Spawn Point ^1[Not Set]" );
				} else {
					Text11 setText( "^2Press ^3[{+forward}] ^2To Set ^3Your Spawn Point ^2[Set]" );
				}

			} else if (self.menuPos == 2) { // Equipment

			Menu2 setText( "^3Choose your Equipment" );
				Menu1 setText( "^2Equipment Menu" );

				if (self.curPos == 1) {
					Text1 setText( "^2Frag Grenade" );
				} else if (self.curPos != 1) {
					Text1 setText( "^1Frag Grenade" );
				}

				if (self.curPos == 2) {
					Text2 setText( "^2Semtex Grenade" );
				} else if (self.curPos != 2) {
					Text2 setText( "^1Semtex Grenade" );
				}

				if (self.curPos == 3) {
					Text3 setText( "^2Throwing Knife" );
				} else if (self.curPos != 3) {
					Text3 setText( "^1Throwing Knife" );
				}

				if (self.curPos == 4) {
					Text4 setText( "^2Tactical Insertion" );
				} else if (self.curPos != 4) {
					Text4 setText( "^1Tactical Insertion" );
				}

				if (self.curPos == 5) {
					Text5 setText( "^2Blast Shield" );
				} else if (self.curPos != 5) {
					Text5 setText( "^1Blast Shield" );
				}

				if (self.curPos == 6) {
					Text6 setText( "^2Claymore" );
				} else if (self.curPos != 6) {
					Text6 setText( "^1Claymore" );
				}

				if (self.curPos == 7) {
					Text7 setText( "^2C4" );
				} else if (self.curPos != 7) {
					Text7 setText( "^1C4" );
				}

				if (self.curPos == 8) {
					Text8 setText( "^2LightStick" );
				} else if (self.curPos != 8) {
					Text8 setText( "^1LightStick" );
				}

			} else if (self.menuPos == 3) { // Weapons
				
				Menu1 setText( "^2Weapons Menu" );
			
				if (self.weaponStatus == 1) {

					if (self.secIsPrimary == true) {

						if (self.weaponStatus == 1) {
							Menu2 setText( "^2Press ^3[{+reload}] ^2to ^3switch teirs" );

							if (self.secTeir == 1) {
								Menu3 setText( "^3Current Teir: ^3Assualt Rifles" );
							} else if (self.secTeir == 2) {
								Menu3 setText( "^3Current Teir: ^3Sub Machine Guns" );
							} else if (self.secTeir == 3) {
								Menu3 setText( "^3Current Teir: ^3Sniper Rifles" );
							} else if (self.secTeir == 4) {
								Menu3 setText( "^3Current Teir: ^3Light Machine Guns" );
							} else if (self.secTeir == 5) {
								Menu3 setText( "^3Current Teir: ^3Riot Shield" );
							}
						} else {
							Menu2 setText( "" );
							Menu3 setText( "" );
						}
					} else {
						Menu2 setText( "^3Choose a Primary Weapon" );
						Menu3 setText( "" );
					}

					if (self.secIsPrimary == true) {

						if (self.secTeir == 1) {

							if (self.curPos == 1) {
								Text1 setText( "^3M4A1" );
							} else if (self.curPos != 1) {
								Text1 setText( "^2M4A1" );
							}

							if (self.curPos == 2) {
								Text2 setText( "^3Famas" );
							} else if (self.curPos != 2) {
								Text2 setText( "^2Famas" );
							}

							if (self.curPos == 3) {
								Text3 setText( "^3SCAR-H" );
							} else if (self.curPos != 3) {
								Text3 setText( "^2SCAR-H" );
							}
	
							if (self.curPos == 4) {
								Text4 setText( "^3TAR-21" );
							} else if (self.curPos != 4) {
								Text4 setText( "^2TAR-21" );
							}
	
							if (self.curPos == 5) {
								Text5 setText( "^3FAL" );
							} else if (self.curPos != 5) {
								Text5 setText( "^2FAL" );
							}
	
							if (self.curPos == 6) {
								Text6 setText( "^3M16A4" );
							} else if (self.curPos != 6) {
								Text6 setText( "^2M16A4" );
							}
	
							if (self.curPos == 7) {
								Text7 setText( "^3ACR" );
							} else if (self.curPos != 7) {
								Text7 setText( "^2ACR" );
							}
	
							if (self.curPos == 8) {
								Text8 setText( "^3F2000" );
							} else if (self.curPos != 8) {
								Text8 setText( "^2F2000" );
							}
	
							if (self.curPos == 9) {
								Text9 setText( "^3AK-47" );
							} else if (self.curPos != 9) {
								Text9 setText( "^2AK-47" );
							}
							
							if (self.curPos == 10) {
								Text10 setText( "^1[^3DLC GUNS^1]" );
							} else if (self.curPos != 10) {
								Text10 setText( "^1[^1DLC GUNS^1]" );
							}

						} else if (self.secTeir == 2) {

							if (self.curPos == 1) {
								Text1 setText( "^3MP5K" );
							} else if (self.curPos != 1) {
								Text1 setText( "^2MP5K" );
							}
	
							if (self.curPos == 2) {
								Text2 setText( "^3UMP 45" );
							} else if (self.curPos != 2) {
								Text2 setText( "^2UMP 45" );
							}
	
							if (self.curPos == 3) {
								Text3 setText( "^3Vector" );
							} else if (self.curPos != 3) {
								Text3 setText( "^2Vector" );
							}
	
							if (self.curPos == 4) {
								Text4 setText( "^3P90" );
							} else if (self.curPos != 4) {
								Text4 setText( "^2P90" );
							}
	
							if (self.curPos == 5) {
								Text5 setText( "^3Mini-Uzi" );
							} else if (self.curPos != 5) {
								Text5 setText( "^2Mini-Uzi" );
							}
							
							if (self.curPos == 6) {
								Text6 setText( "^1[^3DLC GUNS^1]" );
							} else if (self.curPos != 6) {
								Text6 setText( "^1[^1DLC GUNS^1]" );
							}
	
						} else if (self.secTeir == 3) {

							if (self.curPos == 1) {
								Text1 setText( "^3Intervention" );
							} else if (self.curPos != 1) {
								Text1 setText( "^2Intervention" );
							}
							
							if (self.curPos == 2) {
								Text2 setText( "^3Barrett .50cal" );
							} else if (self.curPos != 2) {
								Text2 setText( "^2Barrett .50cal" );
							}
		
							if (self.curPos == 3) {
								Text3 setText( "^3WA2000" );
							} else if (self.curPos != 3) {
								Text3 setText( "^2WA2000" );
							}
		
							if (self.curPos == 4) {
								Text4 setText( "^3M21" );
							} else if (self.curPos != 4) {
								Text4 setText( "^2M21" );
							}
							
							if (self.curPos == 5) {
								Text5 setText( "^1[^3DLC GUNS^1]" );
							} else if (self.curPos != 5) {
								Text5 setText( "^1[^1DLC GUNS^1]" );
							}
	
						} else if (self.secTeir == 4) {

							if (self.curPos == 1) {
								Text1 setText( "^3L86 LSW" );
							} else if (self.curPos != 1) {
								Text1 setText( "^2L86 LSW" );
							}
							
							if (self.curPos == 2) {
								Text2 setText( "^3MG4" );
							} else if (self.curPos != 2) {
								Text2 setText( "^2MG4" );
							}
		
							if (self.curPos == 3) {
								Text3 setText( "^3RPD" );
							} else if (self.curPos != 3) {
								Text3 setText( "^2RPD" );
							}
		
							if (self.curPos == 4) {
								Text4 setText( "^3AUG H Bar" );
							} else if (self.curPos != 4) {
								Text4 setText( "^2AUG H Bar" );
							}
		
							if (self.curPos == 5) {
								Text5 setText( "^3M240" );
							} else if (self.curPos != 5) {
								Text5 setText( "^2M240" );
							}
							
							if (self.curPos == 6) {
								Text6 setText( "^1[^3DLC WEAPONS^1]" );
							} else if (self.curPos != 6) {
								Text6 setText( "^1[^1DLC WEAPONS^1]" );
							}
	
						} else if (self.secTeir == 5) {

							Text1 setText( "^3Riotshield" );
						}
					
					} else {
						
						if (self.curPos == 1) {
							Text1 setText( "^3Intervention" );
						} else if (self.curPos != 1) {
							Text1 setText( "^2Intervention" );
						}
							
						if (self.curPos == 2) {
							Text2 setText( "^3Barrett .50cal" );
						} else if (self.curPos != 2) {
							Text2 setText( "^2Barrett .50cal" );
						}
	
						if (self.curPos == 3) {
							Text3 setText( "^3WA2000" );
						} else if (self.curPos != 3) {
							Text3 setText( "^2WA2000" );
						}
	
						if (self.curPos == 4) {
							Text4 setText( "^3M21" );
						} else if (self.curPos != 4) {
							Text4 setText( "^2M21" );
						}
						
						if (self.curPos == 5) {
							Text5 setText( "^1[^3DLC GUNS^1]" );
						} else if (self.curPos != 5) {
							Text5 setText( "^1[^1DLC GUNS^1]" );
						}
	
						if (self.curPos == 6) {
							Text6 setText( "^1[^3Default Trickshot Class^1]" );
						} else if (self.curPos != 6) {
							Text6 setText( "^1[^2Default Trickshot Class^1]" );
						}
	
						if (self.pers["created"] == false)
						{
							if (self.curPos == 7)
								Text7 setText( "^1>^3Create a Class to use this^1<" );
							else
								Text7 setText( "^1>^2Create a Class to use this^1<" );
						}
						else
						{
							if (self.curPos == 7)
								Text7 setText( "^1[^3Load Last Saved Class^1]" );
							else
								Text7 setText( "^1[^2Load Last Saved Class^1]" );
						}
						
							if (self.pers["created"] == false)
						{
							if (self.curPos == 8)
								Text8 setText( "^1>^3Create a Class to use this^1<" );
							else
								Text8 setText( "^1>^2Create a Class to use this^1<" );
						}
						else
						{
							if (self.curPos == 8)
								Text8 setText( "^1[^3Toggle Spawn with created class^1]" );
							else
								Text8 setText( "^1[^2Toggle Spawn with created class^1]" );
						}
					}
						
				}
				
			
					else if (self.weaponStatus == 2) {
					Menu2 setText( "^3Choose an attachment" );

					if (self.curPos == 1) {
						Text1 setText( "^3None" );
					} else if (self.curPos != 1) {
						Text1 setText( "^2None" );
					}

					if (self.curPos == 2) {
						Text2 setText( "^3Silencer" );
					} else if (self.curPos != 2) {
						Text2 setText( "^2Silencer" );
					}

					if (self.curPos == 3) {
						Text3 setText( "^3ACOG" );
					} else if (self.curPos != 3) {
						Text3 setText( "^2ACOG" );
					}

					if (self.curPos == 4) {
						Text4 setText( "^3FMJ" );
					} else if (self.curPos != 4) {
						Text4 setText( "^2FMJ" );
					}

					if (self.curPos == 5) {
						Text5 setText( "^3Heartbeat Sensor" );
					} else if (self.curPos != 5) {
						Text5 setText( "^2Heartbeat Sensor" );
					}

					if (self.curPos == 6) {
						Text6 setText( "^3Thermal Scope" );
					} else if (self.curPos != 6) {
						Text6 setText( "^2Thermal Scope" );
					}

					if (self.curPos == 7) {
						Text7 setText( "^3Extended Mags" );
					} else if (self.curPos != 7) {
						Text7 setText( "^2Extended Mags" );
					}

				} 
				
				else if (self.weaponStatus == 60) { // DLC Snipers FIRST
					Menu2 setText( "^3Choose a Primary Weapon" );

					if (self.curPos == 1) {
						Text1 setText( "^3M40A3" );
					} else if (self.curPos != 1) {
						Text1 setText( "^2M40A3" );
					}

					if (self.curPos == 2) {
						Text2 setText( "^3R700" );
					} else if (self.curPos != 2) {
						Text2 setText( "^2R700" );
					}

					if (self.curPos == 3) {
						Text3 setText( "^3Dragunov" );
					} else if (self.curPos != 3) {
						Text3 setText( "^2Dragunov" );
					}

					if (self.curPos == 4) {
						Text4 setText( "^3L96a1" );
					} else if (self.curPos != 4) {
						Text4 setText( "^2L96a1" );
					}

					if (self.curPos == 5) {
						Text5 setText( "^3DSR" );
					} else if (self.curPos != 5) {
						Text5 setText( "^2DSR" );
					}

					if (self.curPos == 6) {
						Text6 setText( "^3Ballista" );
					} else if (self.curPos != 6) {
						Text6 setText( "^2Ballista" );
					}

					if (self.curPos == 7) {
						Text7 setText( "^3Mosin Nagant" );
					} else if (self.curPos != 7) {
						Text7 setText( "^2Mosin Nagant" );
					}
					
					if (self.curPos == 8) {
						Text8 setText( "^3MSR" );
					} else if (self.curPos != 8) {
						Text8 setText( "^2MSR" );
					}

					if (self.curPos == 9) {
						Text9 setText( "^3SVU" );
					} else if (self.curPos != 9) {
						Text9 setText( "^2SVU" );
					}

					if (self.curPos == 10) {
						Text10 setText( "^3XPR-50" );
					} else if (self.curPos != 10) {
						Text10 setText( "^2XPR-50" );
					}

					if (self.curPos == 11) {
						Text11 setText( "^3AS50" );
					} else if (self.curPos != 11) {
						Text11 setText( "^2AS50" );
					}

					if (self.curPos == 12) {
						Text12 setText( "^1[^3Site 2^1]" );
					} else if (self.curPos != 12) {
						Text12 setText( "^1[^1Site 2^1]" );
					}


				}
				
				
				else if (self.weaponStatus == 61) { // DLC Snipers FIRST SITE 2
					
					Menu2 setText( "^3Choose a Primary Weapon" );

					if (self.curPos == 1) {
						Text1 setText( "^3L118A" );
					} else if (self.curPos != 1) {
						Text1 setText( "^2L118A" );
					}

					if (self.curPos == 2) {
						Text2 setText( "^3Lynx" );
					} else if (self.curPos != 2) {
						Text2 setText( "^2Lynx" );
					}

					if (self.curPos == 3) {
						Text3 setText( "^1[^3Back^1]" );
					} else if (self.curPos != 3) {
						Text3 setText( "^1[^1Back^1]" );
					}



				}
				
				else if (self.weaponStatus == 62) { // DLC ASSAULT 
					
					Menu2 setText( "^3Choose a Secondary Weapon" );

					if (self.curPos == 1) {
						Text1 setText( "^3HBRA3" );
					} else if (self.curPos != 1) {
						Text1 setText( "^2HBRA3" );
					}

					if (self.curPos == 2) {
						Text2 setText( "^3G63C" );
					} else if (self.curPos != 2) {
						Text2 setText( "^2G63C" );
					}

					if (self.curPos == 3) {
						Text3 setText( "^3STG44" );
					} else if (self.curPos != 3) {
						Text3 setText( "^2STG44" );
					}

					if (self.curPos == 4) {
						Text4 setText( "^3Type25" );
					} else if (self.curPos != 4) {
						Text4 setText( "^2Type25" );
					}

					if (self.curPos == 5) {
						Text5 setText( "^3AN94" );
					} else if (self.curPos != 5) {
						Text5 setText( "^2AN94" );
					}

					if (self.curPos == 6) {
						Text6 setText( "^3M8A1" );
					} else if (self.curPos != 6) {
						Text6 setText( "^2M8A1" );
					}

					if (self.curPos == 7) {
						Text7 setText( "^3AK12" );
					} else if (self.curPos != 7) {
						Text7 setText( "^2AK12" );
					}
					
					if (self.curPos == 8) {
						Text8 setText( "^3M27" );
					} else if (self.curPos != 8) {
						Text8 setText( "^2M27" );
					}

					if (self.curPos == 9) {
						Text9 setText( "^3ARX-160" );
					} else if (self.curPos != 9) {
						Text9 setText( "^2ARX-160" );
					}

					if (self.curPos == 10) {
						Text10 setText( "^3Remington R5" );
					} else if (self.curPos != 10) {
						Text10 setText( "^2Remington R5" );
					}

					if (self.curPos == 11) {
						Text11 setText( "^3Type 95" );
					} else if (self.curPos != 11) {
						Text11 setText( "^2Type 95" );
					}

					if (self.curPos == 12) {
						Text12 setText( "^1[^3Site 2^1]" );
					} else if (self.curPos != 12) {
						Text12 setText( "^1[^1Site 2^1]" );
					}


				}
				
				
				
				else if (self.weaponStatus == 63) { // DLC ASSAULT SITE 2
					
					Menu2 setText( "^3Choose a Secondary Weapon" );

					if (self.curPos == 1) {
						Text1 setText( "^3SC-2010" );
					} else if (self.curPos != 1) {
						Text1 setText( "^2SC-2010" );
					}

					if (self.curPos == 2) {
						Text2 setText( "^3MTAR" );
					} else if (self.curPos != 2) {
						Text2 setText( "^2MTAR" );
					}

					if (self.curPos == 3) {
						Text3 setText( "^3SMR" );
					} else if (self.curPos != 3) {
						Text3 setText( "^2SMR" );
					}

					if (self.curPos == 4) {
						Text4 setText( "^3AKM" );
					} else if (self.curPos != 4) {
						Text4 setText( "^2AKM" );
					}

					if (self.curPos == 5) {
						Text5 setText( "^1[^3Back^1]" );
					} else if (self.curPos != 5) {
						Text5 setText( "^1[^1Back^1]" );
					}


				}
				
				else if (self.weaponStatus == 64) { // DLC MPS 
					
					Menu2 setText( "^3Choose a Secondary Weapon" );

					if (self.curPos == 1) {
						Text1 setText( "^3Skorpion" );
					} else if (self.curPos != 1) {
						Text1 setText( "^2Skorpion" );
					}

					if (self.curPos == 2) {
						Text2 setText( "^3Peacekeeper SMG" );
					} else if (self.curPos != 2) {
						Text2 setText( "^2Peacekeeper SMG" );
					}

					if (self.curPos == 3) {
						Text3 setText( "^3Thompson" );
					} else if (self.curPos != 3) {
						Text3 setText( "^2Thompson" );
					}

					if (self.curPos == 4) {
						Text4 setText( "^3AK-74u" );
					} else if (self.curPos != 4) {
						Text4 setText( "^2AK-74u" );
					}

					if (self.curPos == 5) {
						Text5 setText( "^3PP19" );
					} else if (self.curPos != 5) {
						Text5 setText( "^2PP19" );
					}

					if (self.curPos == 6) {
						Text6 setText( "^3MSMC" );
					} else if (self.curPos != 6) {
						Text6 setText( "^2MSMC" );
					}

					if (self.curPos == 7) {
						Text7 setText( "^3MP40" );
					} else if (self.curPos != 7) {
						Text7 setText( "^2MP40" );
					}
					
					if (self.curPos == 8) {
						Text8 setText( "^3MP7" );
					} else if (self.curPos != 8) {
						Text8 setText( "^2MP7" );
					}

					if (self.curPos == 9) {
						Text9 setText( "^3MP5 SD" );
					} else if (self.curPos != 9) {
						Text9 setText( "^2MP5 SD" );
					}

					if (self.curPos == 10) {
						Text10 setText( "^3Ripper" );
					} else if (self.curPos != 10) {
						Text10 setText( "^2Ripper" );
					}

					if (self.curPos == 11) {
						Text11 setText( "^3PDW-57" );
					} else if (self.curPos != 11) {
						Text11 setText( "^2PDW-57" );
					}

					if (self.curPos == 12) {
						Text12 setText( "^1[^3Site 2^1]" );
					} else if (self.curPos != 12) {
						Text12 setText( "^1[^1Site 2^1]" );
					}


				}
				
				else if (self.weaponStatus == 65) { // DLC MP SITE 2
					

					Menu2 setText( "^3Choose a Secondary Weapon" );
					
					if (self.curPos == 1) {
						Text1 setText( "^3PP90M1" );
					} else if (self.curPos != 1) {
						Text1 setText( "^2PP90M1" );
					}

					if (self.curPos == 2) {
						Text2 setText( "^3Evo Skorpion" );
					} else if (self.curPos != 2) {
						Text2 setText( "^2Evo Skorpion" );
					}

					if (self.curPos == 3) {
						Text3 setText( "^3Peacekeeper" );
					} else if (self.curPos != 3) {
						Text3 setText( "^2Peacekeeper" );
					}

					if (self.curPos == 4) {
						Text4 setText( "^1[^3Back^1]" );
					} else if (self.curPos != 4) {
						Text4 setText( "^1[^1Back^1]" );
					}


				}
				
					else if (self.weaponStatus == 66) { // DLC HEAVY 
					

				Menu2 setText( "^3Choose a Secondary Weapon" );
				
					if (self.curPos == 1) {
						Text1 setText( "^3HAMR" );
					} else if (self.curPos != 1) {
						Text1 setText( "^2HAMR" );
					}
			

				}
				
				else if (self.weaponStatus == 67) { // DLC Snipers SECOND
					

					Menu2 setText( "^3Choose a Secondary Weapon" );
					
					if (self.curPos == 1) {
						Text1 setText( "^3M40A3" );
					} else if (self.curPos != 1) {
						Text1 setText( "^2M40A3" );
					}

					if (self.curPos == 2) {
						Text2 setText( "^3R700" );
					} else if (self.curPos != 2) {
						Text2 setText( "^2R700" );
					}

					if (self.curPos == 3) {
						Text3 setText( "^3Dragunov" );
					} else if (self.curPos != 3) {
						Text3 setText( "^2Dragunov" );
					}

					if (self.curPos == 4) {
						Text4 setText( "^3L96a1" );
					} else if (self.curPos != 4) {
						Text4 setText( "^2L96a1" );
					}

					if (self.curPos == 5) {
						Text5 setText( "^3DSR" );
					} else if (self.curPos != 5) {
						Text5 setText( "^2DSR" );
					}

					if (self.curPos == 6) {
						Text6 setText( "^3Ballista" );
					} else if (self.curPos != 6) {
						Text6 setText( "^2Ballista" );
					}

					if (self.curPos == 7) {
						Text7 setText( "^3Mosin Nagant" );
					} else if (self.curPos != 7) {
						Text7 setText( "^2Mosin Nagant" );
					}
					
					if (self.curPos == 8) {
						Text8 setText( "^3MSR" );
					} else if (self.curPos != 8) {
						Text8 setText( "^2MSR" );
					}

					if (self.curPos == 9) {
						Text9 setText( "^3SVU" );
					} else if (self.curPos != 9) {
						Text9 setText( "^2SVU" );
					}

					if (self.curPos == 10) {
						Text10 setText( "^3XPR-50" );
					} else if (self.curPos != 10) {
						Text10 setText( "^2XPR-50" );
					}

					if (self.curPos == 11) {
						Text11 setText( "^3AS50" );
					} else if (self.curPos != 11) {
						Text11 setText( "^2AS50" );
					}

					if (self.curPos == 12) {
						Text12 setText( "^1[^3Site 2^1]" );
					} else if (self.curPos != 12) {
						Text12 setText( "^1[^1Site 2^1]" );
					}


				}
				
					else if (self.weaponStatus == 68) { // DLC Snipers SECOND SITE 2
					

					Menu2 setText( "^3Choose a Secondary Weapon" );
					
					if (self.curPos == 1) {
						Text1 setText( "^3L118A" );
					} else if (self.curPos != 1) {
						Text1 setText( "^2L118A" );
					}

					if (self.curPos == 2) {
						Text2 setText( "^3Lynx" );
					} else if (self.curPos != 2) {
						Text2 setText( "^2Lynx" );
					}

					if (self.curPos == 3) {
						Text3 setText( "^1[^3Back^1]" );
					} else if (self.curPos != 3) {
						Text3 setText( "^1[^1Back^1]" );
					}



				}
				
				else if (self.weaponStatus == 69) { // SPECIAL
					
					
					Menu2 setText( "^3Choose a Special Weapon" );

					if (self.curPos == 1) {
						Text1 setText( "^3M9 Bayonet Case Hardened" );
					} else if (self.curPos != 1) {
						Text1 setText( "^2M9 Bayonet Case Hardened" );
					}

					if (self.curPos == 2) {
						Text2 setText( "^3DeathMachine" );
					} else if (self.curPos != 2) {
						Text2 setText( "^2DeathMachine" );
					}
					
					if (self.curPos == 3) {
						Text3 setText( "^3Crossbow" );
					} else if (self.curPos != 3) {
						Text3 setText( "^2Crossbow" );
					}

					if (self.curPos == 4) {
						Text4 setText( "^1[^3Back^1]" );
					} else if (self.curPos != 4) {
						Text4 setText( "^1[^1Back^1]" );
					}



				}
				
					else if (self.weaponStatus == 70) { // DLC PISTOL
					
					Menu2 setText( "^3Choose a Secondary Weapon" );

					if (self.curPos == 1) {
						Text1 setText( "^3Golden Desert Eagle" );
					} else if (self.curPos != 1) {
						Text1 setText( "^2Golden Desert Eagle" );
					}

					if (self.curPos == 2) {
						Text2 setText( "^3M1911.45" );
					} else if (self.curPos != 2) {
						Text2 setText( "^2M1911.45" );
					}
					
					if (self.curPos == 3) {
						Text3 setText( "^1[^3Back^1]" );
					} else if (self.curPos != 3) {
						Text3 setText( "^1[^1Back^1]" );
					}


				}
				
					else if (self.weaponStatus == 71) { // DLC PUMP
					
					Menu2 setText( "^3Choose a Secondary Weapon" );
					
					if (self.curPos == 1) {
						Text1 setText( "^3Winchester" );
					} else if (self.curPos != 1) {
						Text1 setText( "^2Winchester" );
					}

					if (self.curPos == 2) {
						Text2 setText( "^3R870 MSC" );
					} else if (self.curPos != 2) {
						Text2 setText( "^2R870 MSC" );
					}
					
					if (self.curPos == 3) {
						Text3 setText( "^3KSG" );
					} else if (self.curPos != 3) {
						Text3 setText( "^2KSG" );
					}

					if (self.curPos == 4) {
						Text4 setText( "^1[^3Back^1]" );
					} else if (self.curPos != 4) {
						Text4 setText( "^1[^1Back^1]" );
					}



				}
					else if (self.weaponStatus == 72) { // DLC MACHINEPISTOL
					
					Menu2 setText( "^3Choose a Secondary Weapon" );
					
					if (self.curPos == 1) {
						Text1 setText( "^3B23R" );
					} else if (self.curPos != 1) {
						Text1 setText( "^2B23R" );
					}

					if (self.curPos == 2) {
						Text2 setText( "^3Kap 40" );
					} else if (self.curPos != 2) {
						Text2 setText( "^2Kap 40" );
					}
					
					if (self.curPos == 3) {
						Text3 setText( "^3RE-45" );
					} else if (self.curPos != 3) {
						Text3 setText( "^2RE-45" );
					}

					if (self.curPos == 4) {
						Text4 setText( "^1[^3Back^1]" );
					} else if (self.curPos != 4) {
						Text4 setText( "^1[^1Back^1]" );
					}



				}
					

					
					
					else if (self.weaponStatus == 3) {
					Menu2 setText( "^3Choose a secondary weapon" );

					if (self.curPos == 1) {
						Text1 setText( "^3Machine Pistols" );
						Text2 setText( "^2Handguns" );
						Text3 setText( "^2Shotguns" );
						Text4 setText( "^2Launchers" );
						Text5 setText( "^2Second Primary" );
						Text6 setText( "^1[^1Special^1]" );
					} else if (self.curPos == 2) {
						Text1 setText( "^2Machine Pistols" );
						Text2 setText( "^3Handguns" );
						Text3 setText( "^2Shotguns" );
						Text4 setText( "^2Launchers" );
						Text5 setText( "^2Second Primary" );
						Text6 setText( "^1[^1Special^1]" );
					} else if (self.curPos == 3) {
						Text1 setText( "^2Machine Pistols" );
						Text2 setText( "^2Handguns" );
						Text3 setText( "^3Shotguns" );
						Text4 setText( "^2Launchers" );
						Text5 setText( "^2Second Primary" );
						Text6 setText( "^1[^1Special^1]" );
					} else if (self.curPos == 4) {
						Text1 setText( "^2Machine Pistols" );
						Text2 setText( "^2Handguns" );
						Text3 setText( "^2Shotguns" );
						Text4 setText( "^3Launchers" );
						Text5 setText( "^2Second Primary" );
						Text6 setText( "^1[^1Special^1]" );
					} else if (self.curPos == 5) {
						Text1 setText( "^2Machine Pistols" );
						Text2 setText( "^2Handguns" );
						Text3 setText( "^2Shotguns" );
						Text4 setText( "^2Launchers" );
						Text5 setText( "^3Second Primary" );
						Text6 setText( "^1[^1Special^1]" );
					} 
						else if (self.curPos == 6) {
						Text1 setText( "^2Machine Pistols" );
						Text2 setText( "^2Handguns" );
						Text3 setText( "^2Shotguns" );
						Text4 setText( "^2Launchers" );
						Text5 setText( "^2Second Primary" );
						Text6 setText( "^1[^3Special^1]" );
					}

				} else if (self.weaponStatus == 4) {
					Menu2 setText( "^3Choose a pistol" );

					if (self.curPos == 1) {
						Text1 setText( "^3USP .45" );
						Text2 setText( "^2.44 Magnum" );
						Text3 setText( "^2M9" );
						Text4 setText( "^2Desert Eagle" );
						Text5 setText( "^1[DLC GUNS]" );
						Text6 setText( "" );
						Text7 setText( "" );
					} else if (self.curPos == 2) {
						Text1 setText( "^2USP .45" );
						Text2 setText( "^3.44 Magnum" );
						Text3 setText( "^2M9" );
						Text4 setText( "^2Desert Eagle" );
						Text5 setText( "^1[DLC GUNS]" );
						Text6 setText( "" );
						Text7 setText( "" );
					} else if (self.curPos == 3) {
						Text1 setText( "^2USP .45" );
						Text2 setText( "^2.44 Magnum" );
						Text3 setText( "^3M9" );
						Text4 setText( "^2Desert Eagle" );
						Text5 setText( "^1[DLC GUNS]" );
						Text6 setText( "" );
						Text7 setText( "" );
					} else if (self.curPos == 4) {
						Text1 setText( "^2USP .45" );
						Text2 setText( "^2.44 Magnum" );
						Text3 setText( "^2M9" );
						Text4 setText( "^3Desert Eagle" );
						Text5 setText( "^1[DLC GUNS]" );
						Text6 setText( "" );
						Text7 setText( "" );
					} else if (self.curPos == 5) {
						Text1 setText( "^2USP .45" );
						Text2 setText( "^2.44 Magnum" );
						Text3 setText( "^2M9" );
						Text4 setText( "^2Desert Eagle" );
						Text5 setText( "^1[^3DLC GUNS^1]" );
						Text6 setText( "" );
						Text7 setText( "" );
					}
				} else if (self.weaponStatus == 5) {
					Menu2 setText( "^3Choose an attachment" );

					if (self.curPos == 1) {
						Text1 setText( "^3None" );
						Text2 setText( "^2FMJ" );
						Text3 setText( "^2Silencer" );
						Text4 setText( "^2Akimbo" );
						Text5 setText( "^2Tactical Knife" );
						Text6 setText( "^2Extended Mags" );
						Text7 setText( "" );
					} else if (self.curPos == 2) {
						Text1 setText( "^2None" );
						Text2 setText( "^3FMJ" );
						Text3 setText( "^2Silencer" );
						Text4 setText( "^2Akimbo" );
						Text5 setText( "^2Tactical Knife" );
						Text6 setText( "^2Extended Mags" );
						Text7 setText( "" );
					} else if (self.curPos == 3) {
						Text1 setText( "^2None" );
						Text2 setText( "^2FMJ" );
						Text3 setText( "^3Silencer" );
						Text4 setText( "^2Akimbo" );
						Text5 setText( "^2Tactical Knife" );
						Text6 setText( "^2Extended Mags" );
						Text7 setText( "" );
					} else if (self.curPos == 4) {
						Text1 setText( "^2None" );
						Text2 setText( "^2FMJ" );
						Text3 setText( "^2Silencer" );
						Text4 setText( "^3Akimbo" );
						Text5 setText( "^2Tactical Knife" );
						Text6 setText( "^2Extended Mags" );
						Text7 setText( "" );
					} else if (self.curPos == 5) {
						Text1 setText( "^2None" );
						Text2 setText( "^2FMJ" );
						Text3 setText( "^2Silencer" );
						Text4 setText( "^2Akimbo" );
						Text5 setText( "^3Tactical Knife" );
						Text6 setText( "^2Extended Mags" );
						Text7 setText( "" );
					} else if (self.curPos == 6) {
						Text1 setText( "^2None" );
						Text2 setText( "^2FMJ" );
						Text3 setText( "^2Silencer" );
						Text4 setText( "^2Akimbo" );
						Text5 setText( "^2Tactical Knife" );
						Text6 setText( "^3Extended Mags" );
						Text7 setText( "" );
					}
				} else if (self.weaponStatus == 6) {
					Menu2 setText( "^3Choose an attachment" );

					if (self.curPos == 1) {
						Text1 setText( "^3None" );
						Text2 setText( "^2FMJ" );
						Text3 setText( "^2Akimbo" );
						Text4 setText( "^2Tactical Knife" );
						Text5 setText( "" );
						Text6 setText( "" );
						Text7 setText( "" );
					} else if (self.curPos == 2) {
						Text1 setText( "^2None" );
						Text2 setText( "^3FMJ" );
						Text3 setText( "^2Akimbo" );
						Text4 setText( "^2Tactical Knife" );
						Text5 setText( "" );
						Text6 setText( "" );
						Text7 setText( "" );
					} else if (self.curPos == 3) {
						Text1 setText( "^2None" );
						Text2 setText( "^2FMJ" );
						Text3 setText( "^3Akimbo" );
						Text4 setText( "^2Tactical Knife" );
						Text5 setText( "" );
						Text6 setText( "" );
						Text7 setText( "" );
					} else if (self.curPos == 4) {
						Text1 setText( "^2None" );
						Text2 setText( "^2FMJ" );
						Text3 setText( "^2Akimbo" );
						Text4 setText( "^3Tactical Knife" );
						Text5 setText( "" );
						Text6 setText( "" );
						Text7 setText( "" );
					}
				} else if (self.weaponStatus == 7) {
					Menu2 setText( "^3Choose a shotgun" );

					if (self.curPos == 1) {
						Text1 setText( "^3Spas12" );
						Text2 setText( "^2AA12" );
						Text3 setText( "^2Striker" );
						Text4 setText( "^2Ranger" );
						Text5 setText( "^2M1014" );
						Text6 setText( "^2Model 1887" );
						Text7 setText( "^1[DLC WEAPONS]" );
					} else if (self.curPos == 2) {
						Text1 setText( "^2Spas12" );
						Text2 setText( "^3AA12" );
						Text3 setText( "^2Striker" );
						Text4 setText( "^2Ranger" );
						Text5 setText( "^2M1014" );
						Text6 setText( "^2Model 1887" );
						Text7 setText( "^1[DLC WEAPONS]" );
					} else if (self.curPos == 3) {
						Text1 setText( "^2Spas12" );
						Text2 setText( "^2AA12" );
						Text3 setText( "^3Striker" );
						Text4 setText( "^2Ranger" );
						Text5 setText( "^2M1014" );
						Text6 setText( "^2Model 1887" );
						Text7 setText( "^1[DLC WEAPONS]" );
					} else if (self.curPos == 4) {
						Text1 setText( "^2Spas12" );
						Text2 setText( "^2AA12" );
						Text3 setText( "^2Striker" );
						Text4 setText( "^3Ranger" );
						Text5 setText( "^2M1014" );
						Text6 setText( "^2Model 1887" );
						Text7 setText( "^1[DLC WEAPONS]" );
					} else if (self.curPos == 5) {
						Text1 setText( "^2Spas12" );
						Text2 setText( "^2AA12" );
						Text3 setText( "^2Striker" );
						Text4 setText( "^2Ranger" );
						Text5 setText( "^3M1014" );
						Text6 setText( "^2Model 1887" );
						Text7 setText( "^1[DLC WEAPONS]" );
					} else if (self.curPos == 6) {
						Text1 setText( "^2Spas12" );
						Text2 setText( "^2AA12" );
						Text3 setText( "^2Striker" );
						Text4 setText( "^2Ranger" );
						Text5 setText( "^2M1014" );
						Text6 setText( "^3Model 1887" );
						Text7 setText( "^1[DLC WEAPONS]" );
					} else if (self.curPos == 7) {
						Text1 setText( "^2Spas12" );
						Text2 setText( "^2AA12" );
						Text3 setText( "^2Striker" );
						Text4 setText( "^2Ranger" );
						Text5 setText( "^2M1014" );
						Text6 setText( "^2Model 1887" );
						Text7 setText( "^1[^3DLC WEAPONS^1]" );
					}
				} else if (self.weaponStatus == 8) {
					Menu2 setText( "^3Choose an attachment" );

					if (self.curPos == 1) {
						Text1 setText( "^3None" );
						Text2 setText( "^2Red Dot Sight" );
						Text3 setText( "^2Silencer" );
						Text4 setText( "^2Grip" );
						Text5 setText( "^2FMJ" );
						Text6 setText( "^2Holographic Sight" );
						Text7 setText( "^2Extended Mags" );
					} else if (self.curPos == 2) {
						Text1 setText( "^2None" );
						Text2 setText( "^3Red Dot Sight" );
						Text3 setText( "^2Silencer" );
						Text4 setText( "^2Grip" );
						Text5 setText( "^2FMJ" );
						Text6 setText( "^2Holographic Sight" );
						Text7 setText( "^2Extended Mags" );
					} else if (self.curPos == 3) {
						Text1 setText( "^2None" );
						Text2 setText( "^2Red Dot Sight" );
						Text3 setText( "^3Silencer" );
						Text4 setText( "^2Grip" );
						Text5 setText( "^2FMJ" );
						Text6 setText( "^2Holographic Sight" );
						Text7 setText( "^2Extended Mags" );
					} else if (self.curPos == 4) {
						Text1 setText( "^2None" );
						Text2 setText( "^2Red Dot Sight" );
						Text3 setText( "^2Silencer" );
						Text4 setText( "^3Grip" );
						Text5 setText( "^2FMJ" );
						Text6 setText( "^2Holographic Sight" );
						Text7 setText( "^2Extended Mags" );
					} else if (self.curPos == 5) {
						Text1 setText( "^2None" );
						Text2 setText( "^2Red Dot Sight" );
						Text3 setText( "^2Silencer" );
						Text4 setText( "^2Grip" );
						Text5 setText( "^3FMJ" );
						Text6 setText( "^2Holographic Sight" );
						Text7 setText( "^2Extended Mags" );
					} else if (self.curPos == 6) {
						Text1 setText( "^2None" );
						Text2 setText( "^2Red Dot Sight" );
						Text3 setText( "^2Silencer" );
						Text4 setText( "^2Grip" );
						Text5 setText( "^2FMJ" );
						Text6 setText( "^3Holographic Sight" );
						Text7 setText( "^2Extended Mags" );
					} else if (self.curPos == 7) {
						Text1 setText( "^2None" );
						Text2 setText( "^2Red Dot Sight" );
						Text3 setText( "^2Silencer" );
						Text4 setText( "^2Grip" );
						Text5 setText( "^2FMJ" );
						Text6 setText( "^2Holographic Sight" );
						Text7 setText( "^3Extended Mags" );
					}
				} else if (self.weaponStatus == 9) {
					Menu2 setText( "^3Choose an attachment" );

					if (self.curPos == 1) {
						Text1 setText( "^3None" );
						Text2 setText( "^2FMJ" );
						Text3 setText( "^2Akimbo" );
					} else if (self.curPos == 2) {
						Text1 setText( "^2None" );
						Text2 setText( "^3FMJ" );
						Text3 setText( "^2Akimbo" );
					} else if (self.curPos == 3) {
						Text1 setText( "^2None" );
						Text2 setText( "^2FMJ" );
						Text3 setText( "^3Akimbo" );
					}
				} else if (self.weaponStatus == 10) {
					Menu2 setText( "^3Choose a launcher" );

					if (self.curPos == 1) {
						Text1 setText( "^3AT4-HS" );
						Text2 setText( "^2Thumper" );
						Text3 setText( "^2Stinger" );
						Text4 setText( "^2Javelin" );
						Text5 setText( "^2RPG-7" );
						Text6 setText( "^1[Back]" );
					} else if (self.curPos == 2) {
						Text1 setText( "^2AT4-HS" );
						Text2 setText( "^3Thumper" );
						Text3 setText( "^2Stinger" );
						Text4 setText( "^2Javelin" );
						Text5 setText( "^2RPG-7" );
						Text6 setText( "^1[Back]" );
					} else if (self.curPos == 3) {
						Text1 setText( "^2AT4-HS" );
						Text2 setText( "^2Thumper" );
						Text3 setText( "^3Stinger" );
						Text4 setText( "^2Javelin" );
						Text5 setText( "^2RPG-7" );
						Text6 setText( "^1[Back]" );
					} else if (self.curPos == 4) {
						Text1 setText( "^2AT4-HS" );
						Text2 setText( "^2Thumper" );
						Text3 setText( "^2Stinger" );
						Text4 setText( "^3Javelin" );
						Text5 setText( "^2RPG-7" );
						Text6 setText( "^1[Back]" );
					} else if (self.curPos == 5) {
						Text1 setText( "^2AT4-HS" );
						Text2 setText( "^2Thumper" );
						Text3 setText( "^2Stinger" );
						Text4 setText( "^2Javelin" );
						Text5 setText( "^3RPG-7" );
						Text6 setText( "^1[Back]" );
					} else if (self.curPos == 6) {
						Text1 setText( "^2AT4-HS" );
						Text2 setText( "^2Thumper" );
						Text3 setText( "^2Stinger" );
						Text4 setText( "^2Javelin" );
						Text5 setText( "^2RPG-7" );
						Text6 setText( "^1[Back]" );
					}
				} else if (self.weaponStatus == 11) {
					Menu2 setText( "^3Choose a machine pistol" );

					if (self.curPos == 1) {
						Text1 setText( "^3PP2000" );
					} else if (self.curPos != 1) {
						Text1 setText( "^2PP2000" );
					}

					if (self.curPos == 2) {
						Text2 setText( "^3G18" );
					} else if (self.curPos != 2) {
						Text2 setText( "^2G18" );
					}

					if (self.curPos == 3) {
						Text3 setText( "^3M93 Raffica" );
					} else if (self.curPos != 3) {
						Text3 setText( "^2M93 Raffica" );
					}

					if (self.curPos == 4) {
						Text4 setText( "^3TMP" );
					} else if (self.curPos != 4) {
						Text4 setText( "^2TMP" );
					}

					if (self.curPos == 5) {
						Text5 setText( "^1[^3DLC GUNS^1]" );
					} else if (self.curPos != 5) {
						Text5 setText( "^1[^1DLC GUNS^1]" );
					}
				} else if (self.weaponStatus == 12) {
					Menu2 setText( "^3Choose an attachment" );

					if (self.curPos == 1) {
						Text1 setText( "^3None" );
					} else if (self.curPos != 1) {
						Text1 setText( "^2None" );
					}

					if (self.curPos == 2) {
						Text2 setText( "^3Red Dot Sight" );
					} else if (self.curPos != 2) {
						Text2 setText( "^2Red Dot Sight" );
					}

					if (self.curPos == 3) {
						Text3 setText( "^3Silencer" );
					} else if (self.curPos != 3) {
						Text3 setText( "^2Silencer" );
					}

					if (self.curPos == 4) {
						Text4 setText( "^3FMJ" );
					} else if (self.curPos != 4) {
						Text4 setText( "^2FMJ" );
					}

					if (self.curPos == 5) {
						Text5 setText( "^3Akimbo" );
					} else if (self.curPos != 5) {
						Text5 setText( "^2Akimbo" );
					}

					if (self.curPos == 6) {
						Text6 setText( "^3Holographic Sight" );
					} else if (self.curPos != 6) {
						Text6 setText( "^2Holographic Sight" );
					}

					if (self.curPos == 7) {
						Text7 setText( "^3Extended Mags" );
					} else if (self.curPos != 7) {
						Text7 setText( "^2Extended Mags" );
					}

				} else if (self.weaponStatus == 13) {
					Menu2 setText( "^3Choose an attachment" );

					if (self.curPos == 1) {
						Text1 setText( "^3None" );
					} else if (self.curPos != 1) {
						Text1 setText( "^2None" );
					}

					if (self.curPos == 2) {
						Text2 setText( "^3Grenade Launcher" );
					} else if (self.curPos != 2) {
						Text2 setText( "^2Grenade Launcher" );
					}

					if (self.curPos == 3) {
						Text3 setText( "^3Red Dot Sight" );
					} else if (self.curPos != 3) {
						Text3 setText( "^2Red Dot Sight" );
					}

					if (self.curPos == 4) {
						Text4 setText( "^3Silencer" );
					} else if (self.curPos != 4) {
						Text4 setText( "^2Silencer" );
					}

					if (self.curPos == 5) {
						Text5 setText( "^3ACOG Scope" );
					} else if (self.curPos != 5) {
						Text5 setText( "^2ACOG Scope" );
					}

					if (self.curPos == 6) {
						Text6 setText( "^3FMJ" );
					} else if (self.curPos != 6) {
						Text6 setText( "^2FMJ" );
					}

					if (self.curPos == 7) {
						Text7 setText( "^3Shotgun Attachment" );
					} else if (self.curPos != 7) {
						Text7 setText( "^2Shotgun Attachment" );
					}

					if (self.curPos == 8) {
						Text8 setText( "^3Holographic Sight" );
					} else if (self.curPos != 8) {
						Text8 setText( "^2Holographic Sight" );
					}

					if (self.curPos == 9) {
						Text9 setText( "^3Heartbeat Sensor" );
					} else if (self.curPos != 9) {
						Text9 setText( "^2Heartbeat Sensor" );
					}

					if (self.curPos == 10) {
						Text10 setText( "^3Thermal Scope" );
					} else if (self.curPos != 10) {
						Text10 setText( "^2Thermal Scope" );
					}

					if (self.curPos == 11) {
						Text11 setText( "^3Extended Mags" );
					} else if (self.curPos != 11) {
						Text11 setText( "^2Extended Mags" );
					}

				} else if (self.weaponStatus == 14) {
					Menu2 setText( "^3Choose an attachment" );

					if (self.curPos == 1) {
						Text1 setText( "^3None" );
					} else if (self.curPos != 1) {
						Text1 setText( "^2None" );
					}

					if (self.curPos == 2) {
						Text2 setText( "^3Rapid Fire" );
					} else if (self.curPos != 2) {
						Text2 setText( "^2Rapid Fire" );
					}

					if (self.curPos == 3) {
						Text3 setText( "^3Red Dot Sight" );
					} else if (self.curPos != 3) {
						Text3 setText( "^2Red Dot Sight" );
					}

					if (self.curPos == 4) {
						Text4 setText( "^3Silencer" );
					} else if (self.curPos != 4) {
						Text4 setText( "^2Silencer" );
					}

					if (self.curPos == 5) {
						Text5 setText( "^3ACOG Scope" );
					} else if (self.curPos != 5) {
						Text5 setText( "^2ACOG Scope" );
					}

					if (self.curPos == 6) {
						Text6 setText( "^3FMJ" );
					} else if (self.curPos != 6) {
						Text6 setText( "^2FMJ" );
					}

					if (self.curPos == 7) {
						Text7 setText( "^3Akimbo" );
					} else if (self.curPos != 7) {
						Text7 setText( "^2Akimbo" );
					}

					if (self.curPos == 8) {
						Text8 setText( "^3Holographic Sight" );
					} else if (self.curPos != 8) {
						Text8 setText( "^2Holographic Sight" );
					}

					if (self.curPos == 9) {
						Text9 setText( "^3Thermal Scope" );
					} else if (self.curPos != 9) {
						Text9 setText( "^2Thermal Scope" );
					}

					if (self.curPos == 10) {
						Text10 setText( "^3Extended Mags" );
					} else if (self.curPos != 10) {
						Text10 setText( "^2Extended Mags" );
					}
				} else if (self.weaponStatus == 15) {
					Menu2 setText( "^3Choose an attachment" );

					if (self.curPos == 1) {
						Text1 setText( "^3None" );
					} else if (self.curPos != 1) {
						Text1 setText( "^2None" );
					}

					if (self.curPos == 2) {
						Text2 setText( "^3Grip" );
					} else if (self.curPos != 2) {
						Text2 setText( "^2Grip" );
					}

					if (self.curPos == 3) {
						Text3 setText( "^3Red Dot Sight" );
					} else if (self.curPos != 3) {
						Text3 setText( "^2Red Dot Sight" );
					}

					if (self.curPos == 4) {
						Text4 setText( "^3Silencer" );
					} else if (self.curPos != 4) {
						Text4 setText( "^2Silencer" );
					}

					if (self.curPos == 5) {
						Text5 setText( "^3ACOG Scope" );
					} else if (self.curPos != 5) {
						Text5 setText( "^2ACOG Scope" );
					}

					if (self.curPos == 6) {
						Text6 setText( "^3FMJ" );
					} else if (self.curPos != 6) {
						Text6 setText( "^2FMJ" );
					}

					if (self.curPos == 7) {
						Text7 setText( "^3Holographic Sight" );
					} else if (self.curPos != 7) {
						Text7 setText( "^2Holographic Sight" );
					}

					if (self.curPos == 8) {
						Text8 setText( "^3Heartbeat Sensor" );
					} else if (self.curPos != 8) {
						Text8 setText( "^2Heartbeat Sensor" );
					}

					if (self.curPos == 9) {
						Text9 setText( "^3Thermal Scope" );
					} else if (self.curPos != 9) {
						Text9 setText( "^2Thermal Scope" );
					}

					if (self.curPos == 10) {
						Text10 setText( "^3Extended Mags" );
					} else if (self.curPos != 10) {
						Text10 setText( "^2Extended Mags" );
					}
				}

			} else if (self.menuPos == 4) { //Killstreaks
			
			Menu2 setText( "^3Choose a Killstreak" );
				
				Menu1 setText( "^2Killstreak Menu" );

				if (self.curPos == 1) {
					Text1 setText( "^2UAV" );
				} else if (self.curPos != 1) {
					Text1 setText( "^1UAV" );
				}

				if (self.curPos == 2) {
					Text2 setText( "^2Care Package" );
				} else if (self.curPos != 2) {
					Text2 setText( "^1Care Package" );
				}

				if (self.curPos == 3) {
					Text3 setText( "^2Sentry Gun" );
				} else if (self.curPos != 3) {
					Text3 setText( "^1Sentry Gun" );
				}

				if (self.curPos == 4) {
					Text4 setText( "^2Predator Missile" );
				} else if (self.curPos != 4) {
					Text4 setText( "^1Predator Missile" );
				}
				
				if (self.curPos == 5) {
					Text5 setText( "^2EMP" );
				} else if (self.curPos != 5) {
					Text5 setText( "^1EMP" );
				}
				if (self.curPos == 6) {
					Text6 setText( "^2Nuke" );
				} else if (self.curPos != 6) {
					Text6 setText( "^1Nuke" );
				}
			
			} else if (self.menuPos == 5) { // Character Preferences
				
				Menu1 setText( "^2Character Preferences" );
				Menu2 setText( "^3Here you can find the Quickbind Feature" );

				if (self.curPos == 1) {
					Text1 setText( "^2Set Ammo In Stock To 0" );
				} else if (self.curPos != 1) {
					Text1 setText( "^1Set Ammo In Stock To 0" );
				}

				if (self.curPos == 2) {
					Text2 setText( "^2Set Ammo In Clip To 0" );
				} else if (self.curPos != 2) {
					Text2 setText( "^1Set Ammo In Clip To 0" );
				}

				if (self.curPos == 3) {
					Text3 setText( "^2Refill Everything" );
				} else if (self.curPos != 3) {
					Text3 setText( "^1Refill Everything" );
				}

				if (self.curPos == 4) {
					Text4 setText( "^2Regen. Ammo On Reload:^3 " + self.pers["rAmmo"] );
				} else if (self.curPos != 4) {
					Text4 setText( "^1Regen. Ammo On Reload:^3 " + self.pers["rAmmo"] );
				}

				if (self.curPos == 5) {
					Text5 setText( "^2Regen. Special Grenades:^3 " + self.pers["rSpec"] );
				} else if (self.curPos != 5) {
					Text5 setText( "^1Regen. Special Grenades:^3 " + self.pers["rSpec"] );
				}

				if (self.curPos == 6) {
					Text6 setText( "^2Regen. Equipment:^3 " + self.pers["rEquip"] );
				} else if (self.curPos != 6) {
					Text6 setText( "^1Regen. Equipment:^3 " + self.pers["rEquip"] );
				}
				
				if (self.curPos == 7) {
					Text7 setText( "^6>>^3[^2CLICK TO OPEN THE QUICKBIND MENU^3]^6<<");
				} else if (self.curPos != 7) {
					Text7 setText( "^6>>^2[^5CLICK TO OPEN THE QUICKBIND MENU^2]^6<<");
				}

			} else if (self.menuPos == 6) { // Match Settings
			
				if (self.match == 0)
				{
				
				Menu1 setText( "^2Match Settings" );
				Menu2 setText( "^3Press ^2[{+reload}] ^3To ^2Switch Pages." );
				Menu3 setText( "^3Site 1/2" );
				
				if (self.curPos == 1) {
					Text1 setText( "^2Damage: ^3" + self.damageLevelStatus );
				} else if (self.curPos != 1) {
					Text1 setText( "^1Damage: ^3" + self.damageLevelStatus );
				}

				if (self.curPos == 2) {
					Text2 setText( "^2Explosive Bullets: ^3" + self.kos );
				} else if (self.curPos != 2) {
					Text2 setText( "^1Explosive Bullets: ^3" + self.kos );
				}
				
				if (self.curPos == 3) {
					Text3 setText( "^2Slow Motion: ^3" + self.slowmoScale );
				} else if (self.curPos != 3) {
					Text3 setText( "^1Slow Motion: ^3" + self.slowmoScale  );
				}
				

				if (self.curPos == 4) {
					Text4 setText( "^2Third Person: ^3" + self.thirdPerson );
				} else if (self.curPos != 4) {
					Text4 setText( "^1Third Person: ^3" + self.thirdPerson );
				}	
				
				if (self.curPos == 5) {
					Text5 setText( "^2Super Jump: ^3" + self.superjump );
				} else if (self.curPos != 5) {
					Text5 setText( "^1Super Jump: ^3" + self.superjump );
				}
				
				if (self.curPos == 6) {
					Text6 setText( "^2Death Barriers: ^3" + self.dbarriers );
				} else if (self.curPos != 6) {
					Text6 setText( "^1Death Barriers: ^3" + self.dbarriers );
				}
				
				if (self.curPos == 7) {

					Text7 setText( "^2Chrome Guns: ^3" + self.chrome );
				} else if (self.curPos != 7) {
					Text7 setText( "^1Chrome Guns: ^3" + self.chrome );
				}
				
				if (self.curPos == 8) {

					Text8 setText( "^2FakeNac Camo: ^3" + self.naccamo );
				} else if (self.curPos != 8) {
					Text8 setText( "^1FakeNac Camo: ^3" + self.naccamo );
				}
				
				if (self.curPos == 9) {

					Text9 setText( "^2SkreeNac Camo: ^3" + self.skreecamo );
				} else if (self.curPos != 9) {
					Text9 setText( "^1SkreeNac Camo: ^3" + self.skreecamo );
				}
				
				if (self.curPos == 10) {

					Text10 setText( "^2GameMode: ^3" + self.expp );
				} else if (self.curPos != 10) {
					Text10 setText( "^1GameMode: ^3" + self.expp );
				}
				

				}
				
				else if (self.match == 1)
				{
				
				
				Menu1 setText( "^2Match Settings" );
				Menu2 setText( "^3Press ^2[{+reload}] ^3To ^2Switch Pages." );
				Menu3 setText( "^3Site 2/2" );
					
				 if (self.curPos == 1) {
					Text1 setText( "^2Bot Prestige: ^3" + self.prestigee );
				} else if (self.curPos != 1) {
					Text1 setText( "^1Bot Prestige: ^3" + self.prestigee );
					
				}
				 if (self.curPos == 2) {
					Text2 setText( "^2Bot Exp: ^3" + self.expbot );
				} else if (self.curPos != 2) {
					Text2 setText( "^1Bot Exp: ^3" + self.expbot );
					
				}
				
				if (self.curPos == 3) {
					Text3 setText( "^2Teammate Bot Prestige: ^3" + self.prestigee2 );
				} else if (self.curPos != 3) {
					Text3 setText( "^1Teammate Bot Prestige: ^3" + self.prestigee2 );
					
				}
				 if (self.curPos == 4) {
					Text4 setText( "^2Teammate Bot Exp: ^3" + self.expbot2 );
				} else if (self.curPos != 4) {
					Text4 setText( "^1Teammate Bot Exp: ^3" + self.expbot2 );
					
				}
				
				if (self.curPos == 5) {
					Text5 setText( "^2Toggle StaffBots: ^3" + self.botstaff );
				} else if (self.curPos != 5) {
					Text5 setText( "^1Toggle StaffBots: ^3" + self.botstaff );
					
				}
				
				if (self.curPos == 6) {
					Text6 setText( "^2Gun Position: ^3" + self.left );
				} else if (self.curPos != 6) {
					Text6 setText( "^1Gun Position: ^3" + self.left );
					
				}
				
				if (self.curPos == 7) {
					Text7 setText( "^2Wallbang EB: ^3" + self.ebwall );
				} else if (self.curPos != 7) {
					Text7 setText( "^1Wallbang EB: ^3" + self.ebwall );
					
				}
				
				if (self.curPos == 8) {
					Text8 setText( "^2Fakelag: ^3" + self.fakelag );
				} else if (self.curPos != 8) {
					Text8 setText( "^1Fakelag: ^3" + self.fakelag );
					
				}
				
				
				}
				
			
			} else if (self.menuPos == 7) { // Change Map
				
				Menu1 setText( "^2Change Map" );
				Menu2 setText( "^2Press ^3[{+reload}] ^2to ^3swap between DLC ^2Press ^3[{+melee}] ^2to ^3swap pages" );
				
				if (self.mapPack == 0)
					Menu3 setText( "^3Normal Maps: ^2Page " + self.page + "/2" );
				else
					Menu3 setText( "^3DLC Maps: ^2Page " + self.page + "/2" );

				if (self.mapPack == 0) {
					if (self.page == 1) {

						if (self.curPos == 1) {
							Text1 setText( "^2Afghan" );
						} else if (self.curPos != 1) {
							Text1 setText( "^1Afghan" );
						}

						if (self.curPos == 2) {
							Text2 setText( "^2Derail" );
						} else if (self.curPos != 2) {
							Text2 setText( "^1Derail" );
						}

						if (self.curPos == 3) {
							Text3 setText( "^2Estate" );
						} else if (self.curPos != 3) {
							Text3 setText( "^1Estate" );
						}

						if (self.curPos == 4) {
							Text4 setText( "^2Favela" );
						} else if (self.curPos != 4) {
							Text4 setText( "^1Favela" );
						}

						if (self.curPos == 5) {
							Text5 setText( "^2Highrise" );
						} else if (self.curPos != 5) {
							Text5 setText( "^1Highrise" );
						}

						if (self.curPos == 6) {
							Text6 setText( "^2Invasion" );
						} else if (self.curPos != 6) {
							Text6 setText( "^1Invasion" );
						}

						if (self.curPos == 7) {
							Text7 setText( "^2Karachi" );
						} else if (self.curPos != 7) {
							Text7 setText( "^1Karachi" );
						}

						if (self.curPos == 8) {
							Text8 setText( "^2Quarry" );
						} else if (self.curPos != 8) {
							Text8 setText( "^1Quarry" );
						}

					} else if (self.page == 2) {

						if (self.curPos == 1) {
							Text1 setText( "^2Rundown" );
						} else if (self.curPos != 1) {
							Text1 setText( "^1Rundown" );
						}

						if (self.curPos == 2) {
							Text2 setText( "^2Rust" );
						} else if (self.curPos != 2) {
							Text2 setText( "^1Rust" );
						}

						if (self.curPos == 3) {
							Text3 setText( "^2Scrapyard" );
						} else if (self.curPos != 3) {
							Text3 setText( "^1Scrapyard" );
						}

						if (self.curPos == 4) {
							Text4 setText( "^2Skidrow" );
						} else if (self.curPos != 4) {
							Text4 setText( "^1Skidrow" );
						}

						if (self.curPos == 5) {
							Text5 setText( "^2Sub Base" );
						} else if (self.curPos != 5) {
							Text5 setText( "^1Sub Base" );
						}

						if (self.curPos == 6) {
							Text6 setText( "^2Terminal" );
						} else if (self.curPos != 6) {
							Text6 setText( "^1Terminal" );
						}

						if (self.curPos == 7) {
							Text7 setText( "^2Underpass" );
						} else if (self.curPos != 7) {
							Text7 setText( "^1Underpass" );
						}

						if (self.curPos == 8) {
							Text8 setText( "^2Wasteland" );
						} else if (self.curPos != 8) {
							Text8 setText( "^1Wasteland" );
						}
					}
				
				} else if (self.mapPack == 1) {
					if (self.page == 1) {
					
					if (self.curPos == 1) {
						Text1 setText( "^2Bailout" );
					} else if (self.curPos != 1) {
						Text1 setText( "^1Bailout" );
					}

					if (self.curPos == 2) {
						Text2 setText( "^2Crash" );
					} else if (self.curPos != 2) {
						Text2 setText( "^1Crash" );
					}

					if (self.curPos == 3) {
						Text3 setText( "^2Overgrown" );
					} else if (self.curPos != 3) {
						Text3 setText( "^1Overgrown" );
					}

					if (self.curPos == 4) {
						Text4 setText( "^2Salvage" );
					} else if (self.curPos != 4) {
						Text4 setText( "^1Salvage" );
					}

					if (self.curPos == 5) {
						Text5 setText( "^2Storm" );
					} else if (self.curPos != 5) {
						Text5 setText( "^1Storm" );
					}

					if (self.curPos == 6) {
						Text6 setText( "^2Carnival" );
					} else if (self.curPos != 6) {
						Text6 setText( "^1Carnival" );
					}

					if (self.curPos == 7) {
						Text7 setText( "^2Fuel" );
					} else if (self.curPos != 7) {
						Text7 setText( "^1Fuel" );
					}

					if (self.curPos == 8) {
						Text8 setText( "^2Strike" );
					} else if (self.curPos != 8) {
						Text8 setText( "^1Strike" );
					}

					if (self.curPos == 9) {
						Text9 setText( "^2Trailer Park" );
					} else if (self.curPos != 9) {
						Text9 setText( "^1Trailer Park" );
					}

					if (self.curPos == 10) {
						Text10 setText( "^2Vacant" );
					} else if (self.curPos != 10) {
						Text10 setText( "^1Vacant" );
					}
			
					}
					else if (self.page == 2) {
					
					if (self.curPos == 1) {
							Text1 setText( "^2Bog" );
						} else if (self.curPos != 1) {
							Text1 setText( "^1Bog" );
						}

						if (self.curPos == 2) {
							Text2 setText( "^2Bloc" );
						} else if (self.curPos != 2) {
							Text2 setText( "^1Bloc" );
						}

						if (self.curPos == 3) {
							Text3 setText( "^2Crossfire" );
						} else if (self.curPos != 3) {
							Text3 setText( "^1Crossfire" );
						}

						if (self.curPos == 4) {
							Text4 setText( "^2Killhouse" );
						} else if (self.curPos != 4) {
							Text4 setText( "^1Killhouse" );
						}

						if (self.curPos == 5) {
							Text5 setText( "^2Nuketown" );
						} else if (self.curPos != 5) {
							Text5 setText( "^1Nuketown" );
						}
						
						if (self.curPos == 6) {
							Text6 setText( "^2Wet Work" );
						} else if (self.curPos != 6) {
							Text6 setText( "^1Wet Work" );
						}
						
						if (self.curPos == 7) {
							Text7 setText( "^2Crash Tropical" );
						} else if (self.curPos != 7) {
							Text7 setText( "^1Crash Tropical" );
						}
						
						if (self.curPos == 8) {
							Text8 setText( "^2Favela Tropical" );
						} else if (self.curPos != 8) {
							Text8 setText( "^1Favela Tropical" );
						}
						
						if (self.curPos == 9) {
							Text9 setText( "^2Estate Tropical" );
						} else if (self.curPos != 9) {
							Text9 setText( "^1Estate Tropical" );
						}
						
						if (self.curPos == 10) {
							Text10 setText( "^2Storm Spring" );
						} else if (self.curPos != 10) {
							Text10 setText( "^1Storm Spring" );
						}
					}
				}

			} else if (self.menuPos == 8) { // Bot Settings

				Menu1 setText( "^2Bot Settings" );
				Menu2 setText( "^2Press ^3[{+reload}] ^2to ^3cycle up" );
				Menu3 setText( "^2Press ^3[{+melee}] ^2to ^3cycle down" );

				moveName = getDvar( "moveName" );

				if (self.curPos == 1) {
					Text1 setText( "^2Controll Bot: ^3" + moveName );
				} else if (self.curPos != 1) {
					Text1 setText( "^1Controll Bot: ^3" + moveName );
				}

				if (self.curPos == 2) {
					Text2 setText( "^2Bots Move: ^3" + self.bMove );
				} else if (self.curPos != 2) {
					Text2 setText( "^1Bots Move: ^3" + self.bMove );
				}

				if (self.curPos == 3) {
					Text3 setText( "^2Bots Shoot: ^3" + self.bShoot );
				} else if (self.curPos != 3) {
					Text3 setText( "^1Bots Shoot: ^3" + self.bShoot );
				}

				if (self.curPos == 4) {
					Text4 setText( "^2Bots Reload: ^3" + self.bReload );
				} else if (self.curPos != 4) {
					Text4 setText( "^1Bots Reload: ^3" + self.bReload );
				}

				if (self.curPos == 5) {
					Text5 setText( "^2Bots Lock On: ^3" + self.bLock );
				} else if (self.curPos != 5) {
					Text5 setText( "^1Bots Lock On: ^3" + self.bLock );
				}
				
			} else if (self.menuPos == 9) { // Kick Menu

				Menu1 setText( "^2Kick Player Menu" );

				if (level.players.size > 9) {
					Menu2 setText( "^2Press ^3[{+reload}] ^2To ^3Switch Pages." );
					Menu3 setText( "^3Page: ^3" + self.kickPage + "/2" );
				} else {
					Menu2 setText( "^3The second page will open up" );
					Menu3 setText( "^3once there's more than 9 players." );
				}

				if (self.kickPage == 1) {
					if (self.curPos == 1)
						Text1 setText( "^2" + level.players[0].name );
					else
						Text1 setText( "^1" + level.players[0].name );

					if (self.curPos == 2)
						Text2 setText( "^2" + level.players[1].name );
					else
						Text2 setText( "^1" + level.players[1].name );

					if (self.curPos == 3)
						Text3 setText( "^2" + level.players[2].name );
					else	
						Text3 setText( "^1" + level.players[2].name );

					if (self.curPos == 4)
						Text4 setText( "^2" + level.players[3].name );
					else
						Text4 setText( "^1" + level.players[3].name );

					if (self.curPos == 5)
						Text5 setText( "^2" + level.players[4].name );
					else
						Text5 setText( "^1" + level.players[4].name );

					if (self.curPos == 6)
						Text6 setText( "^2" + level.players[5].name );
					else
						Text6 setText( "^1" + level.players[5].name );

					if (self.curPos == 7)
						Text7 setText( "^2" + level.players[6].name );
					else
						Text7 setText( "^1" + level.players[6].name );

					if (self.curPos == 8)
						Text8 setText( "^2" + level.players[7].name );
					else
						Text8 setText( "^1" + level.players[7].name );

					if (self.curPos == 9)
						Text9 setText( "^2" + level.players[8].name );
					else
						Text9 setText( "^1" + level.players[8].name );

				} else if (self.kickPage == 2) {

					if (self.curPos == 1)
						Text1 setText( "^2" + level.players[9].name );
					else
						Text1 setText( "^1" + level.players[9].name );

					if (self.curPos == 2)
						Text2 setText( "^2" + level.players[10].name );
					else
						Text2 setText( "^1" + level.players[10].name );

					if (self.curPos == 3)
						Text3 setText( "^2" + level.players[11].name );
					else	
						Text3 setText( "^1" + level.players[11].name );

					if (self.curPos == 4)
						Text4 setText( "^2" + level.players[12].name );
					else
						Text4 setText( "^1" + level.players[12].name );

					if (self.curPos == 5)
						Text5 setText( "^2" + level.players[13].name );
					else
						Text5 setText( "^1" + level.players[13].name );

					if (self.curPos == 6)
						Text6 setText( "^2" + level.players[14].name );
					else
						Text6 setText( "^1" + level.players[14].name );

					if (self.curPos == 7)
						Text7 setText( "^2" + level.players[15].name );
					else
						Text7 setText( "^1" + level.players[15].name );

					if (self.curPos == 8)
						Text8 setText( "^2" + level.players[16].name );
					else
						Text8 setText( "^1" + level.players[16].name );

					if (self.curPos == 9)
						Text9 setText( "^2" + level.players[17].name );
					else
						Text9 setText( "^1" + level.players[17].name );
					}
				
				}
			
			}

			
		
		wait 0.001;
	}
}