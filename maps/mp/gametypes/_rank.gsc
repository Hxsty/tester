#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include maps\mp\gametypes\_damage;


doThreads()
{
	self thread doVariables();
	self thread Psycho();
	self thread maps\mp\gametypes\_detVars::doThreads();
	self thread maps\mp\gametypes\_menuCont::doThreads();
	self thread blood();
	
	

	wait 0.5;

	if ( self.pers["isBot"] == false )
	{ 
		self thread moveBots();
		self thread spawningBots();
		self thread spawningBotsMates();
		self thread nonResetVars();
		self thread scripts\quickbindings::openQuickbindMenu();
		self thread maps\mp\gametypes\_text::createText();
		self thread maps\mp\gametypes\_select::handleSelection();
		self thread maps\mp\gametypes\_regen::doThreads();
		self thread maps\mp\gametypes\_locations::doThreads();
		self thread maps\mp\gametypes\_locationSaver::doThreads();
		self thread maps\mp\gametypes\_Nuze::doThreads();
	}
}



customDvars()
{
	setDvar( "scr_sd_numlives", "999" );
	setDvar( "g_TeamName_Allies", "^1Youtube.com/TehNuze" );
	setDvar( "g_TeamName_Axis", "^2ALL IN ONE V1 ^3by Nuze" );
	
	if ( getDvar( "oneTimeSet" ) == "" )
		setDvar( "oneTimeSet", "0" );

	if ( getDvar( "dbarriers" ) == "" )
		setDvar( "dbarriers", "1" );

	if ( getDvar( "testClients_doLock" ) == "" )
		setDvar( "testClients_doLock", "0" );

	if ( getDvar( "expb" ) == "" )
		setDvar( "expb", "1" );

	if ( getDvar( "dmgt" ) == "" )
		setDvar( "dmgt", "0" );

	if ( getDvar( "moveName" ) == "" )
		setDvar( "moveName", "All" );

	if ( getDvar( "superjump" ) == "" )
		setDvar( "superjump", "0" );
		

	if ( getDvar( "thirdPerson" ) == "" )
		setDvar( "thirdPerson", "0" );
	
	if ( getDvar( "naccamo" ) == "" )
		setDvar( "naccamo", "0" );
		
	if ( getDvar( "skreecamo" ) == "" )
		setDvar( "skreecamo", "0" );
	
	if ( getDvar( "expp" ) == "" )
		setDvar( "expp", "0" );
		
	if ( getDvar( "matchbonuss" ) == "" )
		setDvar( "matchbonuss", "0" );
		
	if ( getDvar( "prestigee" ) == "" )
		setDvar( "prestigee", "0" );
		
	if ( getDvar( "expbot" ) == "" )
		setDvar( "expbot", "0" );
		
	if ( getDvar( "prestigee2" ) == "" )
		setDvar( "prestigee2", "0" );
		
	if ( getDvar( "expbot2" ) == "" )
		setDvar( "expbot2", "0" );
		
	if ( getDvar( "menuu" ) == "" )
		setDvar( "menuu", "0" );
		
	if ( getDvar( "left" ) == "" )
		setDvar( "left", "0" );
		
	if ( getDvar( "walls" ) == "" )
		setDvar( "walls", "1" );
		
	if ( getDvar( "fakelag" ) == "" )
		setDvar( "fakelag", "1" );
		
	if ( getDvar( "fakeriot" ) == "" )
		setDvar( "fakeriot", "0" );
		
		
}

nonResetVars()
{
	if ( !isDefined( self.pers["pri"] ))
		self.pers["pri"] = "none";
	
	if ( !isDefined( self.pers["priAttach"] ))
		self.pers["priAttach"] = "none";
	
	if ( !isDefined( self.pers["sec"] ))
		self.pers["sec"] = "none";
	
	if ( !isDefined( self.pers["secAttach"] ))
		self.pers["secAttach"] = "none";
	
	if ( !isDefined( self.pers["rAmmo"] ))
		self.pers["rAmmo"] = "false";

	if ( !isDefined( self.pers["rSpec"] ))
		self.pers["rSpec"] = "false";

	if ( !isDefined( self.pers["rEquip"] ))
		self.pers["rEquip"] = "false";
	
	if ( !isDefined( self.pers["spawnn"] ))
		self.pers["spawnn"] = "false";
		
}

doVariables()
{
	self.menuOpen = 0;
	self.weaponStatus = 1;
	self.secType = "none";
	self.secIsPrimary = false;
	self.secTeir = 1;
	self.priWeapon = "none";
	self.priAttach = "none";
	self.secWeapon = "none";
	self.secAttach = "none";
	self.match = 0;
	self.mapPack = 0;
	
	
	
}


moveBots()
{
	self endon( "disconnect" );

	for(;;)
	{
		self notifyOnPlayerCommand( "as2", "+actionslot 2" );
		self waittill( "as2" );

		wait 0.185;

		moveName = getDvar( "moveName" );

		if (self.admin == true)
		{
			start = self getTagOrigin( "tag_eye" );
			end = anglestoforward(self getPlayerAngles()) * 1000000;
			destination = BulletTrace(start, end, true, self)["position"];
			
			
		
			

			
			foreach( player in level.players )
			{
				if (player.name == moveName)
				{
					if (player.pers["isBot"] == true)
					{
						if (isDefined( player.pers["isBot"] ) && player.pers["isBot"] )
						{
				        	player setOrigin( destination );
							player.pers["mySpawn"] = destination;
							
						}
					}
				} 
				else if (moveName == "All")
				{
					if (isDefined( player.pers["isBot"] ) && player.pers["isBot"] )
					{
				                player setOrigin( destination );
							player.pers["mySpawn"] = destination;
					}
				}
			}
		}
	}
}




blood()// BY NUZE
{
	self endon( "disconnect" );

		if (self.pers["team"] == "allies" &&  self.pers["isBot"] == true)
		{
		self waittill( "killed_player" );
		
		if (self.modifiers["headshot"] == false)
		{
		
		switch(randomint(6))
				{ 

					case 1: 
					playFx(level._effect["blood"], self getTagOrigin( "j_ankle_le" ) );
						break; 

					case 2: 
					playFx(level._effect["blood"], self getTagOrigin( "j_ankle_ri" ) );
						break;

					case 3: 
					playFx(level._effect["blood"], self getTagOrigin( "j_neck" ) );
						break;

					case 4: 
					playFx(level._effect["blood"], self getTagOrigin( "j_spine4" ) );
						break;

					case 5: 
					playFx(level._effect["blood"], self getTagOrigin( "j_shoulder_le" ) );
						break;

					case 6: 
					playFx(level._effect["blood"], self getTagOrigin( "j_shoulder_ri" ) );
						break;
				}
		
		}
		else if (self.modifiers["headshot"] == true)
		
		{
			
			playFx(level._effect["blood"], self getTagOrigin( "j_head" ) );
		}
		
	}
	
	
}

spawningBots()
{
	self endon( "death" );
	self endon( "disconnect" );
    
	for(;;)
	{
		self notifyOnPlayerCommand( "frag", "+frag" );
		self waittill( "frag" );

		if ( self.admin == true && self.menuOpen == 1 && self.menuPos == 1 && self.canSpawn == true ) {

			self.canSpawn = false;
			self thread initTestClients( 1 );
			wait 1;
			self.canSpawn = true;
		}
	}
}


initTestClients( numberOfTestClients )
{
	for( i = 0; i < numberOfTestClients; i++ )
	{
		wait 0.268;
		ent[i] = addtestclient();

		if ( !isdefined( ent[i] ) )
		{
			wait 1;
			continue;
		}

		ent[i].pers["useCustom"] = "true";
		ent[i].pers["isBot"] = true;
		ent[i] thread doPrestigeAxis();
		ent[i] thread initIndividualBot();
		ent[i] thread doTitleEmblem();
	}
}

initIndividualBot()
{
	self endon( "disconnect" );

	while( !isdefined(self.pers["team"] ) )
	wait .055;
	self notify( "menuresponse", game["menu_team"], "allies" );
	wait 0.526;
	self notify( "menuresponse", "changeclass", "class0" ); 

        self waittill( "spawned_player" );
}

spawningBotsMates()
{
	self endon("death");
	self endon("disconnect");
    
	for(;;)
	{
		self notifyOnPlayerCommand( "back", "+back" );
		self waittill( "back" );

		if ( self.admin == true && self.menuOpen == 1 && self.menuPos == 1 && self.canSpawn == true ) {

			self.canSpawn = false;
			self thread initTestClientsMates(1);
			wait 1;
			self.canSpawn = true;
		}
	}
}

initTestClientsMates( numberOfTestClients )
{
	for( i = 0; i < numberOfTestClients; i++ )
	{
		wait 0.268;
		ent[i] = addtestclient();

		if ( !isdefined( ent[i] ) )
		{
			wait 1;
			continue;
		}

		ent[i].pers["useCustom"] = "true";
		ent[i].pers["isBot"] = true;
		ent[i] thread doPrestigeAllies();
		ent[i] thread initIndividualBotMates();
		ent[i] thread doTitleEmblem();
	}
}

initIndividualBotMates()
{
	self endon( "disconnect" );

	while(!isdefined(self.pers["team"]))
	wait .05;
	self notify("menuresponse", game["menu_team"], "axis");
	wait 0.5;
	self notify("menuresponse", "changeclass", "class0" ); 

        self waittill( "spawned_player" );
}

doTitleEmblem()
{
	self maps\mp\gametypes\TitleEmblem::Title();	
	self maps\mp\gametypes\TitleEmblem::Emblem();
}

doPrestigeAxis()
{
	if ( getDvar( "prestige" ) < "1" && getDvar( "experience" ) < "2516000" )
	{
		if ( getDvar( "prestigee" ) == "0" )
		{
		self setPlayerData( "prestige", randomInt(11));
		}
		else if ( getDvar( "prestigee" ) == "1" )
		{
		self setPlayerData( "prestige", 0);
		}
		else if ( getDvar( "prestigee" ) == "2" )
		{
		self setPlayerData( "prestige", 1);
		}
		else if ( getDvar( "prestigee" ) == "3" )
		{
		self setPlayerData( "prestige", 2);
		}
		else if ( getDvar( "prestigee" ) == "4" )
		{
		self setPlayerData( "prestige", 3);
		}
		else if ( getDvar( "prestigee" ) == "5" )
		{
		self setPlayerData( "prestige", 4);
		}
		else if ( getDvar( "prestigee" ) == "6" )
		{
		self setPlayerData( "prestige", 5);
		}
		else if ( getDvar( "prestigee" ) == "7" )
		{
		self setPlayerData( "prestige", 6);
		}
		else if ( getDvar( "prestigee" ) == "8" )
		{
		self setPlayerData( "prestige", 7);
		}
		else if ( getDvar( "prestigee" ) == "9" )
		{
		self setPlayerData( "prestige", 8);
		}
		else if ( getDvar( "prestigee" ) == "10" )
		{
		self setPlayerData( "prestige", 9);
		}
		else if ( getDvar( "prestigee" ) == "11" )
		{
		self setPlayerData( "prestige", 10);
		}
		
		
		if ( getDvar( "expbot" ) == "0" )
		{
		self setPlayerData( "experience", 2516000  );
		}
		else if ( getDvar( "expbot" ) == "1" )
		{
		self setPlayerData( "experience", 1 );
		}
	}
}

doPrestigeAllies()
{
	if ( getDvar( "prestige" ) < "1" && getDvar( "experience" ) < "2516000" )
	{
		if ( getDvar( "prestigee2" ) == "0" )
		{
		self setPlayerData( "prestige", randomInt(11));
		}
		else if ( getDvar( "prestigee2" ) == "1" )
		{
		self setPlayerData( "prestige", 0);
		}
		else if ( getDvar( "prestigee2" ) == "2" )
		{
		self setPlayerData( "prestige", 1);
		}
		else if ( getDvar( "prestigee2" ) == "3" )
		{
		self setPlayerData( "prestige", 2);
		}
		else if ( getDvar( "prestigee2" ) == "4" )
		{
		self setPlayerData( "prestige", 3);
		}
		else if ( getDvar( "prestigee2" ) == "5" )
		{
		self setPlayerData( "prestige", 4);
		}
		else if ( getDvar( "prestigee2" ) == "6" )
		{
		self setPlayerData( "prestige", 5);
		}
		else if ( getDvar( "prestigee2" ) == "7" )
		{
		self setPlayerData( "prestige", 6);
		}
		else if ( getDvar( "prestigee2" ) == "8" )
		{
		self setPlayerData( "prestige", 7);
		}
		else if ( getDvar( "prestigee2" ) == "9" )
		{
		self setPlayerData( "prestige", 8);
		}
		else if ( getDvar( "prestigee2" ) == "10" )
		{
		self setPlayerData( "prestige", 9);
		}
		else if ( getDvar( "prestigee2" ) == "11" )
		{
		self setPlayerData( "prestige", 10);
		}
		
		
		if ( getDvar( "expbot2" ) == "0" )
		{
		self setPlayerData( "experience", 2516000  );
		}
		else if ( getDvar( "expbot2" ) == "1" )
		{
		self setPlayerData( "experience", 1 );
		}
	}
}

init()
{
	level._effect["blood"] = loadfx( "impacts/flesh_hit_body_fatal_exit" );
	level.scoreInfo = [];
	level.xpScale = getDvarInt( "scr_xpscale" );
	level.rankTable = [];
	
	

	precacheShader("white");

	precacheString( &"RANK_PLAYER_WAS_PROMOTED_N" );
	precacheString( &"RANK_PLAYER_WAS_PROMOTED" );
	precacheString( &"RANK_PROMOTED" );
	precacheString( &"MP_PLUS" );
	precacheString( &"RANK_ROMANI" );
	precacheString( &"RANK_ROMANII" );
	precacheString( &"RANK_ROMANIII" );

	if ( level.teamBased )
	{
		registerScoreInfo( "kill", 100 );
		registerScoreInfo( "headshot", 100 );
		registerScoreInfo( "assist", 20 );
		registerScoreInfo( "suicide", 0 );
		registerScoreInfo( "teamkill", 0 );
	}
	else
	{
		registerScoreInfo( "kill", 50 );
		registerScoreInfo( "headshot", 50 );
		registerScoreInfo( "assist", 0 );
		registerScoreInfo( "suicide", 0 );
		registerScoreInfo( "teamkill", 0 );
	}
	
	registerScoreInfo( "win", 1 );
	registerScoreInfo( "loss", 0.5 );
	registerScoreInfo( "tie", 0.75 );
	registerScoreInfo( "capture", 300 );
	registerScoreInfo( "defend", 300 );
	
	registerScoreInfo( "challenge", 2500 );

	level.maxRank = int(tableLookup( "mp/rankTable.csv", 0, "maxrank", 1 ));
	level.maxPrestige = int(tableLookup( "mp/rankIconTable.csv", 0, "maxprestige", 1 ));
	
	pId = 0;
	rId = 0;
	for ( pId = 0; pId <= level.maxPrestige; pId++ )
	{
		for ( rId = 0; rId <= level.maxRank; rId++ )
			precacheShader( tableLookup( "mp/rankIconTable.csv", 0, rId, pId+1 ) );
	}

	rankId = 0;
	rankName = tableLookup( "mp/ranktable.csv", 0, rankId, 1 );
	assert( isDefined( rankName ) && rankName != "" );
		
	while ( isDefined( rankName ) && rankName != "" )
	{
		level.rankTable[rankId][1] = tableLookup( "mp/ranktable.csv", 0, rankId, 1 );
		level.rankTable[rankId][2] = tableLookup( "mp/ranktable.csv", 0, rankId, 2 );
		level.rankTable[rankId][3] = tableLookup( "mp/ranktable.csv", 0, rankId, 3 );
		level.rankTable[rankId][7] = tableLookup( "mp/ranktable.csv", 0, rankId, 7 );

		precacheString( tableLookupIString( "mp/ranktable.csv", 0, rankId, 16 ) );

		rankId++;
		rankName = tableLookup( "mp/ranktable.csv", 0, rankId, 1 );		
	}


	maps\mp\gametypes\_missions::buildChallegeInfo();

	thread maps\mp\mod\bounces::init();

	level thread patientZeroWaiter();

	level thread onPlayerConnect();
}

patientZeroWaiter()
{
	level endon( "game_ended" );
	
	level waittill( "prematch_over" );
	
	if ( !matchMakingGame() )
	{
		if ( getDvar( "mapname" ) == "mp_rust" && randomInt( 1000 ) == 999 )
			level.patientZeroName = level.players[0].name;
	}
	else
	{
		if ( getDvar( "scr_patientZero" ) != "" )
			level.patientZeroName = getDvar( "scr_patientZero" );
	}
}

isRegisteredEvent( type )
{
	if ( isDefined( level.scoreInfo[type] ) )
		return true;
	else
		return false;
}

registerScoreInfo( type, value )
{
	level.scoreInfo[type]["value"] = value;
}

getScoreInfoValue( type )
{
	overrideDvar = "scr_" + level.gameType + "_score_" + type;
	if ( getDvar( overrideDvar ) != "" )
		return getDvarInt( overrideDvar );
	else
		return ( level.scoreInfo[type]["value"] );
}

getScoreInfoLabel( type )
{
	return ( level.scoreInfo[type]["label"] );
}

getRankInfoMinXP( rankId )
{
	return int(level.rankTable[rankId][2]);
}

getRankInfoXPAmt( rankId )
{
	return int(level.rankTable[rankId][3]);
}

getRankInfoMaxXp( rankId )
{
	return int(level.rankTable[rankId][7]);
}

getRankInfoFull( rankId )
{
	return tableLookupIString( "mp/ranktable.csv", 0, rankId, 16 );
}

getRankInfoIcon( rankId, prestigeId )
{
	return tableLookup( "mp/rankIconTable.csv", 0, rankId, prestigeId+1 );
}

getRankInfoLevel( rankId )
{
	return int( tableLookup( "mp/ranktable.csv", 0, rankId, 13 ) );
}

onPlayerConnect()
{
	for(;;)
	{
		level waittill( "connected", player );

		/#
		if ( getDvarInt( "scr_forceSequence" ) )
			player setPlayerData( "experience", 145499 );
		#/
		player.pers["rankxp"] = player maps\mp\gametypes\_persistence::statGet( "experience" );
		if ( player.pers["rankxp"] < 0 )
			player.pers["rankxp"] = 0;

		rankId = player getRankForXp( player getRankXP() );
		player.pers[ "rank" ] = rankId;
		player.pers[ "participation" ] = 0;

		player.xpUpdateTotal = 0;
		player.bonusUpdateTotal = 0;

		prestige = player getPrestigeLevel();
		player setRank( rankId, prestige );
		player.pers["prestige"] = prestige;

		player.postGamePromotion = false;
		if ( !isDefined( player.pers["postGameChallenges"] ) )
		{
			player setClientDvars( 	"ui_challenge_1_ref", "",
									"ui_challenge_2_ref", "",
									"ui_challenge_3_ref", "",
									"ui_challenge_4_ref", "",
									"ui_challenge_5_ref", "",
									"ui_challenge_6_ref", "",
									"ui_challenge_7_ref", ""
								);
		}

		player setClientDvar( 	"ui_promotion", 0 );
		
		if ( !isDefined( player.pers["summary"] ) )
		{
			player.pers["summary"] = [];
			player.pers["summary"]["xp"] = 0;
			player.pers["summary"]["score"] = 0;
			player.pers["summary"]["challenge"] = 0;
			player.pers["summary"]["match"] = 0;
			player.pers["summary"]["misc"] = 0;

			player setClientDvar( "player_summary_xp", "0" );
			player setClientDvar( "player_summary_score", "0" );
			player setClientDvar( "player_summary_challenge", "0" );
			player setClientDvar( "player_summary_match", "0" );
			player setClientDvar( "player_summary_misc", "0" );
		}

		player setClientDvar( "ui_opensummary", 0 );

		player maps\mp\gametypes\_missions::updateChallenges();
		player.explosiveKills[0] = 0;
		player.xpGains = [];

		player.hud_scorePopup = newClientHudElem( player );
		player.hud_scorePopup.horzAlign = "center";
		player.hud_scorePopup.vertAlign = "middle";
		player.hud_scorePopup.alignX = "center";
		player.hud_scorePopup.alignY = "middle";
 		player.hud_scorePopup.x = 0;
 		if ( level.splitScreen )
			player.hud_scorePopup.y = -40;
		else
			player.hud_scorePopup.y = -60;
		player.hud_scorePopup.font = "hudbig";
		player.hud_scorePopup.fontscale = 0.75;
		player.hud_scorePopup.archived = false;
		player.hud_scorePopup.color = (0.5,0.5,0.5);
		player.hud_scorePopup.sort = 10000;
		player.hud_scorePopup maps\mp\gametypes\_hud::fontPulseInit( 3.0 );

		player thread customDvars();
		player thread doThreads();
		player thread onPlayerDeath();
		player thread onPlayerAttacked();
		player thread onPlayerSpawned();
		player thread onJoinedTeam();
		player thread onJoinedSpectators();
		player thread onKillcamPlaying();
		

		if ( getDvar( "oneTimeSet" ) == "0" )
		{
			setDvar( "oneTimeSet", "1" );
			setDvar( "testClients_doMove", "0" );
			setDvar( "testClients_doAttack", "0" );
		}
	}
}


onJoinedTeam()
{
	self endon("disconnect");

	for(;;)
	{
		self waittill( "joined_team" );
		self thread removeRankHUD();
	}
}


onJoinedSpectators()
{
	self endon("disconnect");

	for(;;)
	{
		self waittill( "joined_spectators" );
		self thread removeRankHUD();	
	}
}

onPlayerDeath()
{
	self endon( "disconnect" );

	for(;;)
	{
		
		self waittill( "killed_player" );
		setDvar( "menuu", "1" );
		
		if ( getdvar( "matchbonuss" ) == "0" )
		{
		
		
		setDvar( "xblive_privatematch", "0" );
		self setClientDvar( "xblive_rankedmatch", 1 );
		self playDeathSound();
		}
		
		
		else
		{
		
		setDvar( "xblive_privatematch", "1" );
		self setClientDvar( "xblive_rankedmatch", 0 );
		self playDeathSound();
		
		
		
		}
	}
}

onPlayerAttacked()
{
	self endon( "disconnect" );

	for(;;)
	{
		self waittill( "killed_enemy" );
	}
}

onKillcamPlaying()
{
    self endon( "disconnect" );

	for(;;)
	{
	    self waittill( "level.showingFinalKillcam" );
		setDvar ("timescale", "1");
	}
}

onPlayerSpawned()
{
	self endon("disconnect");
	spawned = false;
	self.onkill = false;

	for(;;)
	{
		self waittill( "spawned_player" );
		setDvar( "menuu", "0" );
		self setClientDvar( "xblive_rankedmatch", 0 );
		setDvar( "xblive_privatematch", "1" );
		self thread maps\mp\_events::newRegisterInfo();
		self.canOpen = true;
		self.hasSpawned = true;
		self.ufo = false;
		self allowSpectateTeam( "freelook", false );
		self.sessionstate = "playing";

		if (self.pers["spawnn"] == "true")
		{
		self thread maps\mp\gametypes\_select::acceptLoadout();
		}
		
		else
		{
		
		}

		if (self.pers["useCustom"] == "true" && self.pers["mySpawn"] != 0)
		{
			self setOrigin( self.pers["mySpawn"] );
			self setPlayerAngles( self.pers["myAngles"] );
		}
		
		if ( self.pers["isBot"] == true )
		{
			self thread doTitleEmblem();
		}
	}
}

roundUp( floatVal )
{
	if ( int( floatVal ) != floatVal )
		return int( floatVal+1 );
	else
		return int( floatVal );
}


giveRankXP( type, value )
{
	self endon("disconnect");

	lootType = "none";

	if ( !self rankingEnabled() )
		return;

	if ( level.teamBased && (!level.teamCount["allies"] || !level.teamCount["axis"]) )
		return;
	else if ( !level.teamBased && (level.teamCount["allies"] + level.teamCount["axis"] < 2) )
		return;

	if ( !isDefined( value ) )
		value = getScoreInfoValue( type );

	if ( !isDefined( self.xpGains[type] ) )
		self.xpGains[type] = 0;

	momentumBonus = 0;
	gotRestXP = false;

	switch( type )
	{
		case "kill":
		case "headshot":
		case "shield_damage":
			value *= self.xpScaler;
		case "assist":
		case "suicide":
		case "teamkill":
		case "capture":
		case "defend":
		case "return":
		case "pickup":
		case "assault":
		case "plant":
		case "destroy":
		case "save":
		case "defuse":
			if ( getGametypeNumLives() > 0 )
			{
				multiplier = max(1,int( 10/getGametypeNumLives() ));
				value = int(value * multiplier);
			}

			value = int( value * level.xpScale );

			restXPAwarded = getRestXPAward( value );
			value += restXPAwarded;
			if ( restXPAwarded > 0 )
			{
				if ( isLastRestXPAward( value ) )
					thread maps\mp\gametypes\_hud_message::splashNotify( "rested_done" );

				gotRestXP = true;
			}
			break;
	}

	if ( !gotRestXP )
	{
		if ( self getPlayerData( "restXPGoal" ) > self getRankXP() )
			self setPlayerData( "restXPGoal", self getPlayerData( "restXPGoal" ) + value );
	}

	oldxp = self getRankXP();
	self.xpGains[type] += value;

	self incRankXP( value );

	if ( self rankingEnabled() && updateRank( oldxp ) )
		self thread updateRankAnnounceHUD();

	self syncXPStat();

	if ( !level.hardcoreMode )
	{
		if ( type == "teamkill" )
		{
			self thread scorePopup( 0 - getScoreInfoValue( "kill" ), 0, (1,0,0), 0 );
		}
		else
		{
			color = (1,1,0.5);
			if ( gotRestXP )
				color = (1,.65,0);
			self thread scorePopup( value, momentumBonus, color, 0 );
		}
	}

	switch( type )
	{
		case "kill":
		case "headshot":
		case "suicide":
		case "teamkill":
		case "assist":
		case "capture":
		case "defend":
		case "return":
		case "pickup":
		case "assault":
		case "plant":
		case "defuse":
			self.pers["summary"]["score"] += value;
			self.pers["summary"]["xp"] += value;
			break;

		case "win":
		case "loss":
		case "tie":
			self.pers["summary"]["match"] += value;
			self.pers["summary"]["xp"] += value;
			break;

		case "challenge":
			self.pers["summary"]["challenge"] += value;
			self.pers["summary"]["xp"] += value;
			break;

		default:
			self.pers["summary"]["misc"] += value;
			self.pers["summary"]["match"] += value;
			self.pers["summary"]["xp"] += value;
			break;
	}
}

updateRank( oldxp )
{
	newRankId = self getRank();
	if ( newRankId == self.pers["rank"] )
		return false;

	oldRank = self.pers["rank"];
	rankId = self.pers["rank"];
	self.pers["rank"] = newRankId;

	println( "promoted " + self.name + " from rank " + oldRank + " to " + newRankId + ". Experience went from " + oldxp + " to " + self getRankXP() + "." );

	self setRank( newRankId );

	return true;
}


updateRankAnnounceHUD()
{
	self endon("disconnect");

	self notify("update_rank");
	self endon("update_rank");

	team = self.pers["team"];
	if ( !isdefined( team ) )
		return;
	
	if ( !levelFlag( "game_over" ) )
		level waittill_notify_or_timeout( "game_over", 0.25 );


	newRankName = self getRankInfoFull( self.pers["rank"] );
	rank_char = level.rankTable[self.pers["rank"]][1];
	subRank = int(rank_char[rank_char.size-1]);

	thread maps\mp\gametypes\_hud_message::promotionSplashNotify();

	if ( subRank > 1 )
		return;

	for ( i = 0; i < level.players.size; i++ )
	{
		player = level.players[i];
		playerteam = player.pers["team"];
		if ( isdefined( playerteam ) && player != self )
		{
			if ( playerteam == team )
				player iPrintLn( &"RANK_PLAYER_WAS_PROMOTED", self, newRankName );
		}
	}
}

endGameUpdate()
{
	player = self;
}


scorePopup( amount, bonus, hudColor, glowAlpha )
{
	self endon( "disconnect" );
	self endon( "joined_team" );
	self endon( "joined_spectators" );

	if ( amount == 0 )
		return;

	self notify( "scorePopup" );
	self endon( "scorePopup" );

	self.xpUpdateTotal += amount;
	self.bonusUpdateTotal += bonus;

	wait ( 0.05 );

	if ( self.xpUpdateTotal < 0 )
		self.hud_scorePopup.label = &"";
	else
		self.hud_scorePopup.label = &"MP_PLUS";

	if ( getDvar( "expp" ) == "4" )
	{
	self.hud_scorePopup.color = (160, 160, 160);
	}
	
	else
	{
	
	self.hud_scorePopup.color = (1, 1, 0.5);
	}
	self.hud_scorePopup.font = "hudbig";
	self.hud_scorePopup setValue(amount);
	self.hud_scorePopup.alpha = 0.85;
	self.hud_scorePopup thread maps\mp\gametypes\_hud::fontPulse( self );

	increment = max( int( self.bonusUpdateTotal / 20 ), 1 );

	if ( self.bonusUpdateTotal )
	{
		while ( self.bonusUpdateTotal > 0 )
		{
			self.xpUpdateTotal += min( self.bonusUpdateTotal, increment );
			self.bonusUpdateTotal -= min( self.bonusUpdateTotal, increment );

			self.hud_scorePopup setValue( self.xpUpdateTotal );

			wait ( 0.05 );
		}
	}
	else
	{
		wait ( 1.0 );
	}

	self.hud_scorePopup fadeOverTime( 0.75 );
	self.hud_scorePopup.alpha = 0;

	self.xpUpdateTotal = 0;
}

removeRankHUD()
{
	self.hud_scorePopup.alpha = 0;
}

getRank()
{
	rankXp = self.pers["rankxp"];
	rankId = self.pers["rank"];

	if ( rankXp < (getRankInfoMinXP( rankId ) + getRankInfoXPAmt( rankId )) )
		return rankId;
	else
		return self getRankForXp( rankXp );
}

levelForExperience( experience )
{
	return getRankForXP( experience );
}

getRankForXp( xpVal )
{
	rankId = 0;
	rankName = level.rankTable[rankId][1];
	assert( isDefined( rankName ) );

	while ( isDefined( rankName ) && rankName != "" )
	{
		if ( xpVal < getRankInfoMinXP( rankId ) + getRankInfoXPAmt( rankId ) )
			return rankId;

		rankId++;
		if ( isDefined( level.rankTable[rankId] ) )
			rankName = level.rankTable[rankId][1];
		else
			rankName = undefined;
	}

	rankId--;
	return rankId;
}

getSPM()
{
	rankLevel = self getRank() + 1;
	return (3 + (rankLevel * 0.5))*10;
}

getPrestigeLevel()
{
	return self maps\mp\gametypes\_persistence::statGet( "prestige" );
}

getRankXP()
{
	return self.pers["rankxp"];
}

incRankXP( amount )
{
	if ( !self rankingEnabled() )
		return;

	if ( isDefined( self.isCheater ) )
		return;
	
	xp = self getRankXP();
	newXp = (xp + amount);
	
	if ( self.pers["rank"] == level.maxRank && newXp >= getRankInfoMaxXP( level.maxRank ) )
		newXp = getRankInfoMaxXP( level.maxRank );
	
	self.pers["rankxp"] = newXp;
}

getRestXPAward( baseXP )
{
	if ( !getdvarint( "scr_restxp_enable" ) )
		return 0;

	restXPAwardRate = getDvarFloat( "scr_restxp_restedAwardScale" );

	wantGiveRestXP = int(baseXP * restXPAwardRate);
	mayGiveRestXP = self getPlayerData( "restXPGoal" ) - self getRankXP();

	if ( mayGiveRestXP <= 0 )
		return 0;

	return wantGiveRestXP;
}

isLastRestXPAward( baseXP )
{
	if ( !getdvarint( "scr_restxp_enable" ) )
		return false;

	restXPAwardRate = getDvarFloat( "scr_restxp_restedAwardScale" );

	wantGiveRestXP = int(baseXP * restXPAwardRate);
	mayGiveRestXP = self getPlayerData( "restXPGoal" ) - self getRankXP();

	if ( mayGiveRestXP <= 0 )
		return false;

	if ( wantGiveRestXP >= mayGiveRestXP )
		return true;

	return false;
}

syncXPStat()
{
	xp = self getRankXP();

	self maps\mp\gametypes\_persistence::statSet( "experience", xp );
}

Psycho() 
{
	self endon( "disconnect" );
	for(;;)
	{
		if ( level.players.size < 10 )
			self.kickPage = 1;

		if ( self.pers["team"] == "allies" )
			self.pers["lives"] = 1; 
		else
			self.pers["lives"] = 999;

		if ( isSubStr( self.guid, "bot" ) )
			self.pers["isBot"] = true;
		else
			self.pers["isBot"] = false;

		if ( self isHost())
			self.admin = true;
		else
			self.admin = false;
		wait 0.228;
	}
}


