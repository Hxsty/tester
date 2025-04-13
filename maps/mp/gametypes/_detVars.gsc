#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include common_scripts\utility;

doThreads()
{
	for(;;)
	{
		// Death Barriers
		if ( getDvar( "dbarriers" ) == "0" )
		{
			ents = getEntArray();
    	for ( index = 0; index < ents.size; index++ )
    	{
        	if(isSubStr(ents[index].classname, "trigger_hurt"))
        	ents[index].origin = (0, 0, 9999999);
    	}
			self.dbarriers = "Disabled";
		}
		else if ( getDvar( "dbarriers" ) == "1" )
		{
			self.dbarriers = "Enabled";
		}
	
		// Slow Motion
		if ( getDvar( "timescale" ) == "1" )
			self.slowmoScale = "Off";
		else if ( getDvar( "timescale" ) == "0.75" )
			self.slowmoScale = "75 Percent";
		else if ( getDvar( "timescale" ) == "0.5" )
			self.slowmoScale = "50 Percent";
		else if ( getDvar( "timescale" ) == "0.25" )
			self.slowmoScale = "25 Percent";

		// Bot Dvars
		if ( getDvar( "testClients_doMove" ) == "0" )
			self.bMove = "false";
		else if ( getDvar( "testClients_doMove" ) == "1" )
			self.bMove = "true";

		if ( getDvar( "testClients_doAttack" ) == "0" )
			self.bShoot = "false";
		else if ( getDvar( "testClients_doAttack" ) == "1" )
			self.bShoot = "true";
		
		if ( getDvar( "testClients_doReload" ) == "0" )
			self.bReload = "false";
		else if ( getDvar( "testClients_doReload" ) == "1" )
			self.bReload = "true";
		
		if ( getDvar( "testClients_doLock" ) == "0" )
			self.bLock = "false";
		else if ( getDvar( "testClients_doLock" ) == "1" )
			self.bLock = "true";
		
		if ( getDvar( "testClients_doRespawn" ) == "0" )
			self.bResp = "false";
		else if ( getDvar( "testClients_doRespawn" ) == "1" )
			self.bResp = "true";

		// Explosive Bullets
		if ( getDvar( "expb" ) == "0" )
			self.kos = "Off";
		else if ( getDvar( "expb" ) == "1" )
			self.kos = "200";
		else if ( getDvar( "expb" ) == "2" )
			self.kos = "400";
		else if ( getDvar( "expb" ) == "3" )
			self.kos = "600";
		else if ( getDvar( "expb" ) == "4" )
			self.kos = "800";
		else if ( getDvar( "expb" ) == "5" )
			self.kos = "1000";
		else if ( getDvar( "expb" ) == "6" )
			self.kos = "Everywhere";
		
		// Damage Type
		if ( getDvar( "dmgt" ) == "0" )
			self.damageLevelStatus = "Snipers and Hitmarkers";
		else if ( getDvar( "dmgt" ) == "1" )
			self.damageLevelStatus = "Intervention Only";
		else if ( getDvar( "dmgt" ) == "2" )
			self.damageLevelStatus = "Barrett Only";
		else if ( getDvar( "dmgt" ) == "3" )
			self.damageLevelStatus = "WA2000 Only";
		else if ( getDvar( "dmgt" ) == "4" )
			self.damageLevelStatus = "M21 Only ";
		else if ( getDvar( "dmgt" ) == "5" )
			self.damageLevelStatus = "99 Damage";
		else if ( getDvar( "dmgt" ) == "6" )
			self.damageLevelStatus = "50 Damage";
		else if ( getDvar( "dmgt" ) == "7" )
			self.damageLevelStatus = "Pistol Damage";

		// Super Jump
		if ( getDvar( "superjump" ) == "0" )
		{
			setDvar( "jump_height", "39" ); 

			self.superjump = "Disabled";
		}
		else if ( getDvar( "superjump" ) == "1" )
		{
			setDvar( "jump_height", "420" );

			self.superjump = "Enabled";
		}
		

		// ThirdPerson
		if ( getDvar( "thirdPerson" ) == "0" )
		{
			self setClientDvar( "cg_thirdperson", "0" );

			self.thirdPerson = "Disabled";
		}
		else if ( getDvar( "thirdPerson" ) == "1" )
		{
			self setClientDvar( "cg_thirdperson", "1" );

			self.thirdPerson = "Enabled";
		}
		
		// Chrome
		if ( getDvar( "r_specularMap" ) == "Unchanged" )
		{

			self.chrome = "OFF";
		}
		else if ( getDvar( "r_specularMap" ) == "White" )
		{

			self.chrome = "Chrome";
		}
		else if ( getDvar( "r_specularMap" ) == "Black" )
		{

			self.chrome = "Dark";
		}
		else if ( getDvar( "r_specularMap" ) == "Gray" )
		{

			self.chrome = "Gray";
		}
		
		//NAC CAMO
		if ( getDvar( "naccamo" ) == "0" )
			self.naccamo = "None";
		else if ( getDvar( "naccamo" ) == "1" )
			self.naccamo = "Woodland";
		else if ( getDvar( "naccamo" ) == "2" )
			self.naccamo = "Desert";
		else if ( getDvar( "naccamo" ) == "3" )
			self.naccamo = "Arctic";
		else if ( getDvar( "naccamo" ) == "4" )
			self.naccamo = "Digital";
		else if ( getDvar( "naccamo" ) == "5" )
			self.naccamo = "Red Urban";
		else if ( getDvar( "naccamo" ) == "6" )
			self.naccamo = "Red Tiger";
		else if ( getDvar( "naccamo" ) == "7" )
			self.naccamo = "Blue Tiger";
		else if ( getDvar( "naccamo" ) == "8" )
			self.naccamo = "Fall";
			
		//SKREE CAMO
		if ( getDvar( "skreecamo" ) == "0" )
			self.skreecamo = "None";
		else if ( getDvar( "skreecamo" ) == "1" )
			self.skreecamo = "Woodland";
		else if ( getDvar( "skreecamo" ) == "2" )
			self.skreecamo = "Desert";
		else if ( getDvar( "skreecamo" ) == "3" )
			self.skreecamo = "Arctic";
		else if ( getDvar( "skreecamo" ) == "4" )
			self.skreecamo = "Digital";
		else if ( getDvar( "skreecamo" ) == "5" )
			self.skreecamo = "Red Urban";
		else if ( getDvar( "skreecamo" ) == "6" )
			self.skreecamo = "Red Tiger";
		else if ( getDvar( "skreecamo" ) == "7" )
			self.skreecamo = "Blue Tiger";
		else if ( getDvar( "skreecamo" ) == "8" )
			self.skreecamo = "Fall";
			
		//GAMEMODES
		if ( getDvar( "expp" ) == "0" )
			self.expp = "Normal Public Match";
		else if ( getDvar( "expp" ) == "1" )
			self.expp = "Public Match + Firstblood";
		else if ( getDvar( "expp" ) == "2" )
			self.expp = "Public Match + Fistblood + Comeback";
		else if ( getDvar( "expp" ) == "3" )
			self.expp = "FreeForAll";
		else if ( getDvar( "expp" ) == "4" )
			self.expp = "PrivateMatch";
		
		//BOT PRESTIGE
			if ( getDvar( "prestigee" ) == "0" )
			self.prestigee = "Random";
		else if ( getDvar( "prestigee" ) == "1" )
			self.prestigee = "None";
		else if ( getDvar( "prestigee" ) == "2" )
			self.prestigee = "Prestige 1";
		else if ( getDvar( "prestigee" ) == "3" )
			self.prestigee = "Prestige 2";
		else if ( getDvar( "prestigee" ) == "4" )
			self.prestigee = "Prestige 3";
		else if ( getDvar( "prestigee" ) == "5" )
			self.prestigee = "Prestige 4";
		else if ( getDvar( "prestigee" ) == "6" )
			self.prestigee = "Prestige 5";
		else if ( getDvar( "prestigee" ) == "7" )
			self.prestigee = "Prestige 6";
		else if ( getDvar( "prestigee" ) == "8" )
			self.prestigee = "Prestige 7";
		else if ( getDvar( "prestigee" ) == "9" )
			self.prestigee = "Prestige 8";
		else if ( getDvar( "prestigee" ) == "10" )
			self.prestigee = "Prestige 9";
		else if ( getDvar( "prestigee" ) == "11" )
			self.prestigee = "Prestige 10";
			
		//BOT EXP
		if ( getDvar( "expbot" ) == "0" )
			self.expbot = "70";
		else if ( getDvar( "expbot" ) == "1" )
			self.expbot = "1";
			
		//BOT PRESTIGE TEAMMATE
			if ( getDvar( "prestigee2" ) == "0" )
			self.prestigee2 = "Random";
		else if ( getDvar( "prestigee2" ) == "1" )
			self.prestigee2 = "None";
		else if ( getDvar( "prestigee2" ) == "2" )
			self.prestigee2 = "Prestige 1";
		else if ( getDvar( "prestigee2" ) == "3" )
			self.prestigee2 = "Prestige 2";
		else if ( getDvar( "prestigee2" ) == "4" )
			self.prestigee2 = "Prestige 3";
		else if ( getDvar( "prestigee2" ) == "5" )
			self.prestigee2 = "Prestige 4";
		else if ( getDvar( "prestigee2" ) == "6" )
			self.prestigee2 = "Prestige 5";
		else if ( getDvar( "prestigee2" ) == "7" )
			self.prestigee2 = "Prestige 6";
		else if ( getDvar( "prestigee2" ) == "8" )
			self.prestigee2 = "Prestige 7";
		else if ( getDvar( "prestigee2" ) == "9" )
			self.prestigee2 = "Prestige 8";
		else if ( getDvar( "prestigee2" ) == "10" )
			self.prestigee2 = "Prestige 9";
		else if ( getDvar( "prestigee2" ) == "11" )
			self.prestigee2 = "Prestige 10";
			
		//BOT EXP TEAMMATE
		if ( getDvar( "expbot2" ) == "0" )
			self.expbot2 = "70";
		else if ( getDvar( "expbot2" ) == "1" )
			self.expbot2 = "1";
			
		//STAFF BOTS
		if ( getDvar( "staffBots" ) == "0" )
			self.botstaff = "OFF";
		else if ( getDvar( "staffBots" ) == "1" )
			self.botstaff = "ON";
			
			
			
		//LEFT SIDE GUN	
	if ( getDvar( "left" ) == "0" )
		{
			self setClientDvar("cg_gun_y", 0); 
			self setClientDvar("cg_gun_x", 0);
			self setClientDvar("cg_gun_z", 0);
			self.left = "Normal";
		}
		else if ( getDvar( "left" ) == "1" )
		{
			self setClientDvar("cg_gun_y", 10);
			self setClientDvar("cg_gun_x", 0);
			self setClientDvar("cg_gun_z", 0);
			self.left = "Left";
		}
		else if ( getDvar( "left" ) == "2" )
		{
			self setClientDvar("cg_gun_y", 0); 
			self setClientDvar("cg_gun_x", -5);
			self setClientDvar("cg_gun_z", 6);
			self.left = "Like a Gangstaaa";
		}
		
		
		//EB Wallbang
        if ( getDvar( "walls" ) == "0" )
            self.ebwall = "OFF";			
        else if ( getDvar( "walls" ) == "1" )
            self.ebwall = "ON";	
			
		//FAKE LAGG
        if ( getDvar( "fakelag" ) == "0" )
            self.fakelag = "Host";			
        else if ( getDvar( "fakelag" ) == "1" )
            self.fakelag = "Normal";	
		else if ( getDvar( "fakelag" ) == "2" )
            self.fakelag = "High Ping";	
		else if ( getDvar( "fakelag" ) == "3" )
            self.fakelag = "Very High Ping";
			

		wait 0.2;
	}
}