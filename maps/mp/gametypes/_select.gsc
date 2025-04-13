#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include maps\mp\gametypes\_rank;
#include maps\mp\gametypes\_cleanScript;

defaultSnipingSet()
{
	self TakeAllWeapons();
	self giveWeapon( "cheytac_fmj_mp", 7, false );
	self giveWeapon( "beretta_tactical_mp" );
	self switchToWeapon( "cheytac_fmj_mp" );

	self _clearPerks();
	self maps\mp\perks\_perks::givePerk( "throwingknife_mp" );
	self maps\mp\perks\_perks::givePerk( "specialty_fastreload" );
	self maps\mp\perks\_perks::givePerk( "specialty_quickdraw" );
	self maps\mp\perks\_perks::givePerk( "specialty_bulletdamage" );
	self maps\mp\perks\_perks::givePerk( "specialty_armorpiercing" );
	self maps\mp\perks\_perks::givePerk( "specialty_extendedmelee" );
	self maps\mp\perks\_perks::givePerk( "specialty_falldamage" );

	self SetOffhandSecondaryClass( "concussion" );
	self giveWeapon( "concussion_grenade_mp" );

	self thread menuClose();
}

refillAmmo()
{
	weaponList = self GetWeaponsListAll();
	
	if ( self _hasPerk( "specialty_tacticalinsertion" ) && self getAmmoCount( "flare_mp" ) < 1 )
		self _setPerk( "specialty_tacticalinsertion");
	
	foreach ( weaponName in weaponList )
	{
		if ( isSubStr( weaponName, "grenade" ) )
		{
			if ( self getAmmoCount( weaponName ) >= 1 )
				continue;
		}
		self giveMaxAmmo( weaponName );
	}
}

acceptLoadout()
{
	if (self.pers["secAttach"] == "none")
	{
		self thread menuClose();
	}
	else
	{
		self thread menuClose();
		self.pers["created"] = true;
	
		self.weap1 = "none";
		self.weap2 = "none";
	
		if (self.pers["priAttach"] == "mp")
			self.weap1 = self.pers["pri"] + "_" + self.pers["priAttach"];
		else
			self.weap1 = self.pers["pri"] + "_" + self.pers["priAttach"] + "_mp";
	
		if (self.pers["secAttach"] == "mp")
			self.weap2 = self.pers["sec"] + "_" + self.pers["secAttach"];
		else
			self.weap2 = self.pers["sec"] + "_" + self.pers["secAttach"] + "_mp";
	
		if (self.weap1 == self.weap2)
			self iPrintLnBold( "^You picked the same weapons!" );

		weapList = self GetWeaponsListAll();
		weapListPrim = self GetWeaponsListPrimaries();

		self takeWeapon( self getCurrentWeapon() );

		while(self getCurrentWeapon() == "none")
		{
			if (weapListPrim.size)
				self switchToWeapon(weapListPrim[RandomInt(weapListPrim.size)]);
			else
				self switchToWeapon(weapList[RandomInt(weapList.size)]);
			wait .05; 
		}

		self takeWeapon( self getCurrentWeapon() );
		self giveWeapon( self.weap1, 6 + randomInt(3), false);
		self giveWeapon( self.weap2, 6 + randomInt(3), false);
	
		if (self.pers["secAttach"] == "default")
		{
		}
		
		if (self.pers["secAttach"] == "akimbo")
			self giveWeapon( self.weap2, 5 + randomInt(3), true );
		else if (self.pers["secAttach"] != "akimbo" || self.pers["secAttach"] != "default")
			self giveWeapon( self.weap2 );

		wait 0.1;
	
		self switchToWeapon( self.weap1 );

		self.secIsPrimary = false;
		self.secType = "none";
	}
}

handleMapNames()
{
	self.mapCurPos = 0;

	self.NormMap1 = [];
	self.NormMap1[0] = "mp_afghan";
	self.NormMap1[1] = "mp_derail";
	self.NormMap1[2] = "mp_estate";
	self.NormMap1[3] = "mp_favela";
	self.NormMap1[4] = "mp_highrise";
	self.NormMap1[5] = "mp_invasion";
	self.NormMap1[6] = "mp_checkpoint";
	self.NormMap1[7] = "mp_quarry";

	self.NormMap2 = [];
	self.NormMap2[0] = "mp_rundown";
	self.NormMap2[1] = "mp_rust";
	self.NormMap2[2] = "mp_boneyard";
	self.NormMap2[3] = "mp_nightshift";
	self.NormMap2[4] = "mp_subbase";
	self.NormMap2[5] = "mp_terminal";
	self.NormMap2[6] = "mp_underpass";
	self.NormMap2[7] = "mp_brecourt";

	self.DLCMap = [];
	self.DLCMap[0] = "mp_complex";
	self.DLCMap[1] = "mp_crash";
	self.DLCMap[2] = "mp_overgrown";
	self.DLCMap[3] = "mp_compact";
	self.DLCMap[4] = "mp_storm";
	self.DLCMap[5] = "mp_abandon";
	self.DLCMap[6] = "mp_fuel2";
	self.DLCMap[7] = "mp_strike";
	self.DLCMap[8] = "mp_trailerpark";
	self.DLCMap[9] = "mp_vacant";

	self.DLCMap2 = [];
	self.DLCMap2[0] = "mp_bog_sh";
	self.DLCMap2[1] = "mp_bloc";
	self.DLCMap2[2] = "mp_cross_fire";
	self.DLCMap2[3] = "mp_killhouse";
	self.DLCMap2[4] = "mp_nuked";
	self.DLCMap2[5] = "mp_cargoship";
	self.DLCMap2[6] = "mp_crash_trop";
	self.DLCMap2[7] = "mp_fav_tropical";
	self.DLCMap2[8] = "mp_estate_tropical";
	self.DLCMap2[9] = "mp_storm_spring";
}

efficiencyPlusPlus()
{
	self.sniAttach = [];
	self.sniAttach[0] = "mp";
	self.sniAttach[1] = "silencer";
	self.sniAttach[2] = "acog";
	self.sniAttach[3] = "fmj";
	self.sniAttach[4] = "heartbeat";
	self.sniAttach[5] = "thermal";
	self.sniAttach[6] = "xmags";
	wait 0.1;
	self.mPisAttach = [];
	self.mPisAttach[0] = "mp";
	self.mPisAttach[1] = "reflex";
	self.mPisAttach[2] = "silencer";
	self.mPisAttach[3] = "fmj";
	self.mPisAttach[4] = "akimbo";
	self.mPisAttach[5] = "eotech";
	self.mPisAttach[6] = "xmags";
	wait 0.1;
	self.assAttach = [];
	self.assAttach[0] = "mp";
	self.assAttach[1] = "gl";
	self.assAttach[2] = "reflex";
	self.assAttach[3] = "silencer";
	self.assAttach[4] = "acog";
	self.assAttach[5] = "fmj";
	self.assAttach[6] = "shotgun";
	self.assAttach[7] = "eotech";
	self.assAttach[8] = "heartbeat";
	self.assAttach[9] = "thermal";
	self.assAttach[10] = "xmags";
	wait 0.1;
	self.smgAttach = [];
	self.smgAttach[0] = "mp";
	self.smgAttach[1] = "rof";
	self.smgAttach[2] = "reflex";
	self.smgAttach[3] = "silencer";
	self.smgAttach[4] = "acog";
	self.smgAttach[5] = "fmj";
	self.smgAttach[6] = "akimbo";
	self.smgAttach[7] = "eotech";
	self.smgAttach[8] = "termal";
	self.smgAttach[9] = "xmags";
	wait 0.1;
	self.sgAttach = [];
	self.sgAttach[0] = "mp";
	self.sgAttach[1] = "reflex";
	self.sgAttach[2] = "silencer";
	self.sgAttach[3] = "grip";
	self.sgAttach[4] = "fmj";
	self.sgAttach[5] = "eotech";
	self.sgAttach[6] = "xmags";
	wait 0.1;
	self.lmgAttach = [];
	self.lmgAttach[0] = "mp";
	self.lmgAttach[1] = "grip";
	self.lmgAttach[2] = "reflex";
	self.lmgAttach[3] = "silencer";
	self.lmgAttach[4] = "acog";
	self.lmgAttach[5] = "fmj";
	self.lmgAttach[6] = "eotech";
	self.lmgAttach[7] = "heartbeat";
	self.lmgAttach[8] = "thermal";
	self.lmgAttach[9] = "xmags";
}

handleSelection()
{
	self thread efficiencyPlusPlus();
	for(;;)
	{
		self thread handleMapNames();
		self notifyOnPlayerCommand( "gostand", "+gostand" );
		self waittill( "gostand" );
		
		if (self.menuOpen == 1)
		{
			if (self.menuPos == 2) // Equipment
			{
				equ = [];
				equ[0] = "frag_grenade_mp";
				equ[1] = "semtex_mp";
				equ[2] = "throwingknife_mp";
				equ[3] = "specialty_tacticalinsertion";
				equ[4] = "specialty_blastshield";
				equ[5] = "claymore_mp";
				equ[6] = "c4_mp";
				equ[7] = "lightstick_mp";

				if (self.curPos == 9)
					self maps\mp\gametypes\_class::giveSameLoadout( self.pers["class"], "" );
				else
					self maps\mp\gametypes\_class::giveSameLoadout( self.pers["class"], equ[self.curPos - 1] );

				self thread menuClose();

			}
			else if (self.menuPos == 3) // Weapons
			{
				if (self.weaponStatus == 1)
				{
					if (self.curPos == 1)
					{
						if (self.secIsPrimary == false)
						{
							self.pers["pri"] = "cheytac";
							self.weaponStatus = 2;
						}
						else
						{
							if (self.secTeir == 1)
							{
								self.pers["sec"] = "m4";
								self.weaponStatus = 13;
							}
							else if (self.secTeir == 2)
							{
								self.pers["sec"] = "mp5k";
								self.weaponStatus = 14;
							}
							else if (self.secTeir == 3)
							{
								self.pers["sec"] = "cheytac";
								self.weaponStatus = 2;
							}
							else if (self.secTeir == 4)
							{
								self.pers["sec"] = "sa80";
								self.weaponStatus = 15;
							}
							else if (self.secTeir == 5)
							{
								self.pers["sec"] = "riotshield";
								self.pers["secAttach"] = "mp";
								self thread acceptLoadout();	
							}
						}
					}
					else if (self.curPos == 2)
					{
						if (self.secIsPrimary == false)
						{
							self.pers["pri"] = "barrett";
							self.weaponStatus = 2;
						}
						else
						{
							if (self.secTeir == 1)
							{
								self.pers["sec"] = "famas";
								self.weaponStatus = 13;
							}
							else if (self.secTeir == 2)
							{
								self.pers["sec"] = "ump45";
								self.weaponStatus = 14;
							}
							else if (self.secTeir == 3)
							{
								self.pers["sec"] = "barrett";
								self.weaponStatus = 2;
							}
							else if (self.secTeir == 4)
							{
								self.pers["sec"] = "mg4";
								self.weaponStatus = 15;
							}
						}
					}
					else if (self.curPos == 3)
					{
						if (self.secIsPrimary == false)
						{
							self.pers["pri"] = "wa2000";
							self.weaponStatus = 2;
						}
						else
						{
							if (self.secTeir == 1)
							{
								self.pers["sec"] = "scar";
								self.weaponStatus = 13;
							}
							else if (self.secTeir == 2)
							{
								self.pers["sec"] = "kriss";
								self.weaponStatus = 14;
							} 
							else if (self.secTeir == 3)
							{
								self.pers["sec"] = "wa2000";
								self.weaponStatus = 2;
							}
							else if (self.secTeir == 4)
							{
								self.pers["sec"] = "rpd";
								self.weaponStatus = 15;
							}
						}
					} 
					else if (self.curPos == 4)
					{
						if (self.secIsPrimary == false)
						{
							self.pers["pri"] = "m21";
							self.weaponStatus = 2;
						}
						else
						{
							if (self.secTeir == 1)
							{
								self.pers["sec"] = "tavor";
								self.weaponStatus = 13;
							}
							else if (self.secTeir == 2)
							{
								self.pers["sec"] = "p90";
								self.weaponStatus = 14;
							}
							else if (self.secTeir == 3)
							{
								self.pers["sec"] = "m21";
								self.weaponStatus = 2;
							}
							else if (self.secTeir == 4)
							{
								self.pers["sec"] = "mg4";
								self.weaponStatus = 15;
							}
						}
					}
					else if (self.curPos == 5)
					{
						if (self.secIsPrimary == false)
						{
							
						self.weaponStatus = 60;
						
							
						}
						else
						{
							if (self.secTeir == 1)
							{
								self.pers["sec"] = "fal";
								self.weaponStatus = 13;
							}
							else if (self.secTeir == 2)
							{
								self.pers["sec"] = "uzi";
								self.weaponStatus = 14;
							} 
							else if (self.secTeir == 3)
							{
								
								self.weaponStatus = 67;
							}
							else if (self.secTeir == 4)
							{
								self.pers["sec"] = "m240";
								self.weaponStatus = 15;
							}
						}
					} 
					else if (self.curPos == 6)
					{
						if (self.secIsPrimary == false)
						{
							self thread defaultSnipingSet(); 
							self thread menuClose();
						}
						else
						{
							if (self.secTeir == 1)
							{
								self.pers["sec"] = "m16";
								self.weaponStatus = 13;
							}
							else if (self.secTeir == 2)
							{
								
								self.weaponStatus = 64;
							}
							else if (self.secTeir == 3)
							{
								self.pers["sec"] = "";
							}
							else if (self.secTeir == 4)
							{
								
								self.weaponStatus = 66;
							}
						}
					}
					else if (self.curPos == 7)
					{
						if (self.secIsPrimary == false)
						{
							self thread acceptLoadout(); // Give last loaded shit... O.o ?
							
						}
						else
						{
							if (self.secTeir == 1)
							{
								self.pers["sec"] = "masada";
								self.weaponStatus = 13;
							}
							else if (self.secTeir == 2)
							{
								self.pers["sec"] = "";
							}
							else if (self.secTeir == 3)
							{
								self.pers["sec"] = "";
							}
							else if (self.secTeir == 4)
							{
								self.pers["sec"] = "";
							}
						}

					}
						
					else if (self.curPos == 8)
					{
						if (self.secIsPrimary == false)
						{
								if (self.pers["spawnn"] == "false")
								{
								self.pers["spawnn"] = "true";
								self iPrintLnBold( "^2ON" );
								
								}
								else if (self.pers["spawnn"] == "true")
								{
								self.pers["spawnn"] = "false";
								self iPrintLnBold( "^1OFF" );
								}
								self thread menuClose();
						}	
							
						else
						{
							if (self.secTeir == 1)
							{
								self.pers["sec"] = "fn2000";
								self.weaponStatus = 13;
							}
							else if (self.secTeir == 2)
							{
								self.pers["sec"] = "";
							}
							else if (self.secTeir == 3)
							{
								self.pers["sec"] = "";
							}
							else if (self.secTeir == 4)
							{
								self.pers["sec"] = "";
							}
						}
					}
					else if (self.curPos == 9)
					{
						if (self.secIsPrimary == true)
						{
							if (self.secTeir == 1)
							{
								self.pers["sec"] = "ak47";
								self.weaponStatus = 13;
							}
							else if (self.secTeir == 2)
							{
								self.pers["sec"] = "";
							}
							else if (self.secTeir == 3)
							{
								self.pers["sec"] = "";
							}
							else if (self.secTeir == 4)
							{
								self.pers["sec"] = "";
							}
						}
					}
					
					else if (self.curPos == 10)
					{
						if (self.secIsPrimary == true)
						{
							
							
							if (self.secTeir == 1)
							{
								
								self.weaponStatus = 62;
							}
							else if (self.secTeir == 2)
							{
								self.pers["sec"] = "";
							}
							else if (self.secTeir == 3)
							{
								self.pers["sec"] = "";
							}
							else if (self.secTeir == 4)
							{
								self.pers["sec"] = "";
							}
						}
					}
					
					self.curPos = 1;
				}
				else if (self.weaponStatus == 2)
				{
					if (self.secIsPrimary == false)
					{
						self.pers["priAttach"] = self.sniAttach[self.curPos - 1];
						self.weaponStatus = 3;
					}
					else
					{
						self.pers["secAttach"] = self.sniAttach[self.curPos - 1];
						self thread acceptLoadout();
					}
				}
				else if (self.weaponStatus == 3)
				{
					if (self.curPos == 1) // Machine Pistols
						self.weaponStatus = 11;
					else if (self.curPos == 2) // Handguns
						self.weaponStatus = 4;
					else if (self.curPos == 3) // Shotguns
						self.weaponStatus = 7;
					else if (self.curPos == 4) // Launchers
						self.weaponStatus = 10;
					else if (self.curPos == 5) // Second Primary
					{
						self.secIsPrimary = true;
						self.weaponStatus = 1;
					}
					else if (self.curPos == 6) // SPECIAL
						self.weaponStatus = 69;
				}
				else if (self.weaponStatus == 60) // SNIPER FIRST
				{
					if (self.curPos == 1)
					{
						self.pers["pri"] = "m40a3";
						self.pers["priAttach"] = "mp";
						self.weaponStatus = 3;
						
					}
					else if (self.curPos == 2)
					{
						self.pers["pri"] = "remington700";
						self.pers["priAttach"] = "mp";
						self.weaponStatus = 3;
					}
					else if (self.curPos == 3)
					{
						self.pers["pri"] = "dragunov";
						self.pers["priAttach"] = "mp";
						self.weaponStatus = 3;
					}
					else if (self.curPos == 4)
					{
						self.pers["pri"] = "l96a1";
						self.pers["priAttach"] = "mp";
						self.weaponStatus = 3;
					}
					else if (self.curPos == 5)
					{
						self.pers["pri"] = "dsr";
						self.pers["priAttach"] = "mp";
						self.weaponStatus = 3;
					}
					else if (self.curPos == 6)
					{
					
						self.pers["pri"] = "ballista";
						self.pers["priAttach"] = "mp";
						self.weaponStatus = 3;
					
					}
					else if (self.curPos == 7)
					{
						self.pers["pri"] = "mosin";
						self.pers["priAttach"] = "mp";
						self.weaponStatus = 3;
					}
					else if (self.curPos == 8)
					{
						self.pers["pri"] = "msr";
						self.pers["priAttach"] = "mp";
						self.weaponStatus = 3;
					}
					else if (self.curPos == 9)
					{
						self.pers["pri"] = "svu";
						self.pers["priAttach"] = "mp";
						self.weaponStatus = 3;
					}
					
					else if (self.curPos == 10)
					{
						self.pers["pri"] = "xpr";
						self.pers["priAttach"] = "mp";
						self.weaponStatus = 3;
					}
					
					else if (self.curPos == 11)
					{
						self.pers["pri"] = "as50";
						self.pers["priAttach"] = "mp";
						self.weaponStatus = 3;
					}
					
					else if (self.curPos == 12)
					{
						self.weaponStatus = 61;
					}
					
					
					
					

				}
				
				else if (self.weaponStatus == 61) // SNIPER FIRST SITE 2
				{
					if (self.curPos == 1)
					{
						self.pers["pri"] = "l118a";
						self.pers["priAttach"] = "mp";
						self.weaponStatus = 3;
						
					}
					else if (self.curPos == 2)
					{
						self.pers["pri"] = "lynx";
						self.pers["priAttach"] = "mp";
						self.weaponStatus = 3;
					}
					else if (self.curPos == 3)
					{
						self.weaponStatus = 60;
					}
						

				}
				
				else if (self.weaponStatus == 62) // ASSAULT
				{
					if (self.curPos == 1)
					{
						self.pers["sec"] = "hbra3";
						self.pers["secAttach"] = "mp";
						self thread acceptLoadout();
					}
					else if (self.curPos == 2)
					{
						self.pers["sec"] = "g36c";
						self.pers["secAttach"] = "mp";
						self thread acceptLoadout();
					}
					else if (self.curPos == 3)
					{
						self.pers["sec"] = "stg44";
						self.pers["secAttach"] = "mp";
						self thread acceptLoadout();
					}
					else if (self.curPos == 4)
					{
						self.pers["sec"] = "type25";
						self.pers["secAttach"] = "mp";
						self thread acceptLoadout();
					}
					else if (self.curPos == 5)
					{
						self.pers["sec"] = "an94";
						self.pers["secAttach"] = "mp";
						self thread acceptLoadout();
					}
					else if (self.curPos == 6)
					{
					
						self.pers["sec"] = "m8a1";
						self.pers["secAttach"] = "mp";
						self thread acceptLoadout();
					
					}
					else if (self.curPos == 7)
					{
						self.pers["sec"] = "ak12";
						self.pers["secAttach"] = "mp";
						self thread acceptLoadout();
					}
					else if (self.curPos == 8)
					{
						self.pers["sec"] = "m27";
						self.pers["secAttach"] = "mp";
						self thread acceptLoadout();
					}
					else if (self.curPos == 9)
					{
						self.pers["sec"] = "arx160";
						self.pers["secAttach"] = "mp";
						self thread acceptLoadout();
					}
					else if (self.curPos == 10)
					{
						self.pers["sec"] = "remington_r5";
						self.pers["secAttach"] = "mp";
						self thread acceptLoadout();
					}
					else if (self.curPos == 11)
					{
					
						self.pers["sec"] = "type95";
						self.pers["secAttach"] = "mp";
						self thread acceptLoadout();
					
					}
					
					else if (self.curPos == 12)
					{
					
					self.weaponStatus = 63;	
					
					}
					
				}
				
				else if (self.weaponStatus == 63) // ASSAULT SITE 2
				{
					if (self.curPos == 1)
					{
						self.pers["sec"] = "sc2010";
						self.pers["secAttach"] = "mp";
						self thread acceptLoadout();
					}
					else if (self.curPos == 2)
					{
						self.pers["sec"] = "mtar";
						self.pers["secAttach"] = "mp";
						self thread acceptLoadout();
					}
					else if (self.curPos == 3)
					{
						self.pers["sec"] = "smr";
						self.pers["secAttach"] = "mp";
						self thread acceptLoadout();
					}
					else if (self.curPos == 4)
					{
						self.pers["sec"] = "akm";
						self.pers["secAttach"] = "mp";
						self thread acceptLoadout();
					}
					else if (self.curPos == 5)
					{
						self.weaponStatus = 62;	
					}
					
					
				}
				
				else if (self.weaponStatus == 64) // MP
				{
					if (self.curPos == 1)
					{
						self.pers["sec"] = "skorpion";
						self.pers["secAttach"] = "mp";
						self thread acceptLoadout();
					}
					else if (self.curPos == 2)
					{
						self.pers["sec"] = "peacekeeper";
						self.pers["secAttach"] = "mp";
						self thread acceptLoadout();
					}
					else if (self.curPos == 3)
					{
						self.pers["sec"] = "thompson";
						self.pers["secAttach"] = "mp";
						self thread acceptLoadout();
					}
					else if (self.curPos == 4)
					{
						self.pers["sec"] = "ak74";
						self.pers["secAttach"] = "mp";
						self thread acceptLoadout();
					}
					else if (self.curPos == 5)
					{
						self.pers["sec"] = "pp19";
						self.pers["secAttach"] = "mp";
						self thread acceptLoadout();
					}
					else if (self.curPos == 6)
					{
					
						self.pers["sec"] = "msmc";
						self.pers["secAttach"] = "mp";
						self thread acceptLoadout();
					
					}
					else if (self.curPos == 7)
					{
						self.pers["sec"] = "mp40";
						self.pers["secAttach"] = "mp";
						self thread acceptLoadout();
					}
					else if (self.curPos == 8)
					{
						self.pers["sec"] = "mp7";
						self.pers["secAttach"] = "mp";
						self thread acceptLoadout();
					}
					else if (self.curPos == 9)
					{
						self.pers["sec"] = "mp5sd";
						self.pers["secAttach"] = "mp";
						self thread acceptLoadout();
					}
					else if (self.curPos == 10)
					{
						self.pers["sec"] = "ripper";
						self.pers["secAttach"] = "mp";
						self thread acceptLoadout();
					}
					else if (self.curPos == 11)
					{
					
						self.pers["sec"] = "pdw";
						self.pers["secAttach"] = "mp";
						self thread acceptLoadout();
					
					}
					
						else if (self.curPos == 12)
					{
					
						self.weaponStatus = 65;
					
					}
					
					
				}
				
				else if (self.weaponStatus == 65) // MPS
				{
					if (self.curPos == 1)
					{
						self.pers["sec"] = "pp90";
						self.pers["secAttach"] = "mp";
						self thread acceptLoadout();
					}
					else if (self.curPos == 2)
					{
						self.pers["sec"] = "evo";
						self.pers["secAttach"] = "mp";
						self thread acceptLoadout();
					}
					else if (self.curPos == 3)
					{
						self.pers["sec"] = "peacemaker";
						self.pers["secAttach"] = "mp";
						self thread acceptLoadout();
					}
					
						else if (self.curPos == 4)	
					{
					
							self.weaponStatus = 64;
					}
					
				}
				
					else if (self.weaponStatus == 66) // MPS
				{
					if (self.curPos == 1)
					{
						self.pers["sec"] = "hamr";
						self.pers["secAttach"] = "mp";
						self thread acceptLoadout();
					}
					
				
		
				}
				
				else if (self.weaponStatus == 67) // SNIPER 2 
				{
					if (self.curPos == 1)
					{
						self.pers["sec"] = "m40a3";
						self.pers["secAttach"] = "mp";
						self thread acceptLoadout();
						
					}
					else if (self.curPos == 2)
					{
						self.pers["sec"] = "r700";
						self.pers["secAttach"] = "mp";
						self thread acceptLoadout();
					}
					else if (self.curPos == 3)
					{
						self.pers["sec"] = "dragunov";
						self.pers["secAttach"] = "mp";
						self thread acceptLoadout();
					}
					else if (self.curPos == 4)
					{
						self.pers["sec"] = "l96a1";
						self.pers["secAttach"] = "mp";
						self thread acceptLoadout();
					}
					else if (self.curPos == 5)
					{
						self.pers["sec"] = "dsr";
						self.pers["secAttach"] = "mp";
						self thread acceptLoadout();
					}
					else if (self.curPos == 6)
					{
					
						self.pers["sec"] = "ballista";
						self.pers["secAttach"] = "mp";
						self thread acceptLoadout();
					
					}
					else if (self.curPos == 7)
					{
						self.pers["sec"] = "mosin";
						self.pers["secAttach"] = "mp";
						self thread acceptLoadout();
					}
					else if (self.curPos == 8)
					{
						self.pers["sec"] = "msr";
						self.pers["secAttach"] = "mp";
						self thread acceptLoadout();
					}
					else if (self.curPos == 9)
					{
						self.pers["sec"] = "svu";
						self.pers["secAttach"] = "mp";
						self thread acceptLoadout();
					}
					
					else if (self.curPos == 10)
					{
						self.pers["sec"] = "xpr";
						self.pers["secAttach"] = "mp";
						self thread acceptLoadout();
					}
					
					else if (self.curPos == 11)
					{
						self.pers["sec"] = "as50";
						self.pers["secAttach"] = "mp";
						self thread acceptLoadout();
					}
					
					else if (self.curPos == 12)
					{
						self.weaponStatus = 68;	
					}
					

				}
				
				else if (self.weaponStatus == 68) // SNIPER 2 SITE 2
				{
					if (self.curPos == 1)
					{
						self.pers["sec"] = "l118a";
						self.pers["secAttach"] = "mp";
						self thread acceptLoadout();
						
					}
					else if (self.curPos == 2)
					{
						self.pers["sec"] = "lynx";
						self.pers["secAttach"] = "mp";
						self thread acceptLoadout();
					}
					else if (self.curPos == 3)
					{
						self.weaponStatus = 67;	
					}
					
					

				}
				
				else if (self.weaponStatus == 69) // SPECIAL
				{
					if (self.curPos == 1)
					{
						self.pers["sec"] = "commando_knife";
						self.pers["secAttach"] = "mp";
						self thread acceptLoadout();
						
					}
					else if (self.curPos == 2)
					{
						self.pers["sec"] = "death_machine";
						self.pers["secAttach"] = "mp";
						self thread acceptLoadout();
					}
					else if (self.curPos == 3)
					{
						self.weaponStatus = 67;
						self.pers["sec"] = "crossbow";
						self.pers["secAttach"] = "mp";
						self thread acceptLoadout();
					}
					
					else if (self.curPos == 4)
					{
						self.weaponStatus = 3;
						
					}
					
					

				}
				
				else if (self.weaponStatus == 70) // SPECIAL
				{
					if (self.curPos == 1)
					{
						self.pers["sec"] = "deserteaglegold";
						self.pers["secAttach"] = "mp";
						self thread acceptLoadout();
						
					}
					else if (self.curPos == 2)
					{
						self.pers["sec"] = "colt45";
						self.pers["secAttach"] = "mp";
						self thread acceptLoadout();
					}
					
					else if (self.curPos == 3)
					{
						self.weaponStatus = 4;
						
					}
					
					

				}
				
				else if (self.weaponStatus == 71) // DLC PUMP
				{
					if (self.curPos == 1)
					{
						self.pers["sec"] = "w1200";
						self.pers["secAttach"] = "mp";
						self thread acceptLoadout();
					}
					else if (self.curPos == 2)
					{
						self.pers["sec"] = "r870_mcs";
						self.pers["secAttach"] = "mp";
						self thread acceptLoadout();
					}
					else if (self.curPos == 3)
					{
						self.pers["sec"] = "ksg";
						self.pers["secAttach"] = "mp";
						self thread acceptLoadout();
					}
					
					
					else if (self.curPos == 4)
					{
						self.weaponStatus = 3;
					}

				}
				
				else if (self.weaponStatus == 72) // DLC MACHINE PISTOL
				{
					if (self.curPos == 1)
					{
						self.pers["sec"] = "b23r";
						self.pers["secAttach"] = "mp";
						self thread acceptLoadout();
					}
					else if (self.curPos == 2)
					{
						self.pers["sec"] = "kap40";
						self.pers["secAttach"] = "mp";
						self thread acceptLoadout();
					}
					else if (self.curPos == 3)
					{
						self.pers["sec"] = "re45";
						self.pers["secAttach"] = "mp";
						self thread acceptLoadout();
					}
					
					
					else if (self.curPos == 4)
					{
						self.weaponStatus = 3;
					}

				}
				
		
				
				else if (self.weaponStatus == 4)
				{
					if (self.curPos == 1)
					{
						self.pers["sec"] = "usp";
						self.weaponStatus = 5;
					}
					else if (self.curPos == 2)
					{
						self.pers["sec"] = "coltanaconda";
						self.weaponStatus = 6;
					}
					else if (self.curPos == 3)
					{
						self.pers["sec"] = "beretta";
						self.weaponStatus = 5;
					}
					else if (self.curPos == 4)
					{
						self.pers["sec"] = "deserteagle";
						self.weaponStatus = 6;
					}
					else if (self.curPos == 5)
					{
						self.weaponStatus = 70;
					}
					self.curPos = 1;
				}
				else if (self.weaponStatus == 5)
				{
					if (self.curPos == 1)
						self.pers["secAttach"] = "mp";
					else if (self.curPos == 2)
						self.pers["secAttach"] = "fmj";
					else if (self.curPos == 3)
						self.pers["secAttach"] = "silencer";
					else if (self.curPos == 4)
						self.pers["secAttach"] = "akimbo";
					else if (self.curPos == 5)
						self.pers["secAttach"] = "tactical";
					else if (self.curPos == 6)
						self.pers["secAttach"] = "xmags";

					self thread acceptLoadout();
				}
				else if (self.weaponStatus == 6)
				{
					if (self.curPos == 1)
						self.pers["secAttach"] = "mp";
					else if (self.curPos == 2)
						self.pers["secAttach"] = "fmj";
					else if (self.curPos == 3)
						self.pers["secAttach"] = "akimbo";
					else if (self.curPos == 4)
						self.pers["secAttach"] = "tactical";
					
					self thread acceptLoadout();
				}
				else if (self.weaponStatus == 7)
				{
					if (self.curPos == 1)
					{
						self.pers["sec"] = "spas12";
						self.weaponStatus = 8;
						self.secType = "sg";
					}
					else if (self.curPos == 2)
					{
						self.pers["sec"] = "aa12";
						self.weaponStatus = 8;
						self.secType = "sg";
					}
					else if (self.curPos == 3)
					{
						self.pers["sec"] = "striker";
						self.weaponStatus = 8;
						self.secType = "sg";
					}
					else if (self.curPos == 4)
					{
						self.pers["sec"] = "ranger";
						self.weaponStatus = 9;
						self.secType = "sg";
					}
					else if (self.curPos == 5)
					{
						self.pers["sec"] = "m1014";
						self.weaponStatus = 8;
						self.secType = "sg";
					}
					else if (self.curPos == 6)
					{
						self.pers["sec"] = "model1887";
						self.weaponStatus = 9;
						self.secType = "sg";
					}
					else if (self.curPos == 7)
					{
						self.weaponStatus = 71;
					}
				}
				else if (self.weaponStatus == 8)
				{
					self.pers["secAttach"] = self.sgAttach[self.curPos - 1];
					self thread acceptLoadout();
				}
				else if (self.weaponStatus == 9)
				{
					if (self.curPos == 1)
						self.pers["secAttach"] = "mp";
					else if (self.curPos == 2)
						self.pers["secAttach"] = "fmj";
					else if (self.curPos == 3)
						self.pers["secAttach"] = "akimbo";
					
					self thread acceptLoadout();
				}
				else if (self.weaponStatus == 10) // Launchers
				{
					if (self.curPos == 1)
					{
						self.pers["sec"] = "at4";
						self.pers["secAttach"] = "mp";
						self thread acceptLoadout();
					}
					else if (self.curPos == 2)
					{
						self.pers["sec"] = "m79";
						self.pers["secAttach"] = "mp";
						self thread acceptLoadout();
					}
					else if (self.curPos == 3)
					{
						self.pers["sec"] = "stinger";
						self.pers["secAttach"] = "mp";
						self thread acceptLoadout();
					}
					else if (self.curPos == 4)
					{
						self.pers["sec"] = "javelin";
						self.pers["secAttach"] = "mp";
						self thread acceptLoadout();
					}
					else if (self.curPos == 5)
					{
						self.pers["sec"] = "rpg";
						self.pers["secAttach"] = "mp";
						self thread acceptLoadout();
					}
					else if (self.curPos == 6)
					{
						self.weaponStatus = 3;
					}
				}
				else if (self.weaponStatus == 11) // Machine Pistols
				{
					if (self.curPos == 1)
					{
						self.pers["sec"] = "pp2000";
						self.weaponStatus = 12;
					}
					else if (self.curPos == 2)
					{
						self.pers["sec"] = "glock";
						self.weaponStatus = 12;
					}
					else if (self.curPos == 3)
					{
						self.pers["sec"] = "beretta393";
						self.weaponStatus = 12;
					}
					else if (self.curPos == 4)
					{
						self.pers["sec"] = "tmp";
						self.weaponStatus = 12;
					}
					else if (self.curPos == 5)
					{
						self.weaponStatus = 72;
					}
				}
				else if (self.weaponStatus == 12) // Machine Pistol Attachments
				{
					self.pers["secAttach"] = self.mPisAttach[self.curPos - 1];
					self thread acceptLoadout();
				}
				else if (self.weaponStatus == 13) // Assault Rifle Attachments
				{
					self.pers["secAttach"] = self.assAttach[self.curPos - 1];
					self thread acceptLoadout();
				}
				else if (self.weaponStatus == 14) // Sub Machine Gun Attachments
				{
					self.pers["secAttach"] = self.smgAttach[self.curPos - 1];
					self thread acceptLoadout();
				}
				else if (self.weaponStatus == 15) // Light Machine Gun Attachments
				{
					self.pers["secAttach"] = self.lmgAttach[self.curPos - 1];
					self thread acceptLoadout();
				}

				if (self.secIsPrimary == false && self.curPos == 7)
				{
				}
				else
				{
					self.curPos = 1;
				}
			}
			else if (self.menuPos == 4) // Killsteaks
			{
				if (self.curPos == 1)
					self maps\mp\killstreaks\_killstreaks::giveKillstreak( "uav", false );
				else if (self.curPos == 2)
					self maps\mp\killstreaks\_killstreaks::giveKillstreak( "airdrop", false );
				else if (self.curPos == 3)
					self maps\mp\killstreaks\_killstreaks::giveKillstreak( "sentry", false );
				else if (self.curPos == 4)
					self maps\mp\killstreaks\_killstreaks::giveKillstreak( "predator_missile", false );
				else if (self.curPos == 5)
					self maps\mp\killstreaks\_killstreaks::giveKillstreak( "emp", false );
				else if (self.curPos == 6)
					self maps\mp\killstreaks\_killstreaks::giveKillstreak( "nuke", false );
				
				self thread menuClose();
			}
			else if (self.menuPos == 5) // Character Prefs.
			{
				if (self.curPos == 1)
				{
					self setWeaponAmmoStock( self getCurrentWeapon(), 0 );
					self setWeaponAmmoStock( self getCurrentWeapon(), 0, "right" );
					self setWeaponAmmoStock( self getCurrentWeapon(), 0, "left" );
					
				}
				else if (self.curPos == 2)
				{
					self setWeaponAmmoClip( self getCurrentWeapon(), 0 );
					self setWeaponAmmoClip( self getCurrentWeapon(), 0, "right" );
					self setWeaponAmmoClip( self getCurrentWeapon(), 0, "left" );
					
				}
				else if (self.curPos == 3)
				{
					//self thread refillAmmo();
					self setWeaponAmmoStock( self getCurrentWeapon(), randomIntRange( 9, 28 ));
					self setWeaponAmmoStock( self getCurrentWeapon(), randomIntRange( 9, 28 ) , "right" );
					self setWeaponAmmoStock( self getCurrentWeapon(), randomIntRange( 9, 28 ) , "left" );
					self setWeaponAmmoClip( self getCurrentWeapon(), randomIntRange( 9, 28 )	 );
					self setWeaponAmmoClip( self getCurrentWeapon(), randomIntRange( 9, 28 ), "right" );
					self setWeaponAmmoClip( self getCurrentWeapon(), randomIntRange( 9, 28 ), "left" );
					
				}
				else if (self.curPos == 4)
				{
					if (self.pers["rAmmo"] == "true")
						self.pers["rAmmo"] = "false";
					else if (self.pers["rAmmo"] == "false")
						self.pers["rAmmo"] = "true";
				}
				else if (self.curPos == 5)
				{
					if (self.pers["rSpec"] == "true")
						self.pers["rSpec"] = "false";
					else if (self.pers["rSpec"] == "false")
						self.pers["rSpec"] = "true";
				}
				else if (self.curPos == 6)
				{
					if (self.pers["rEquip"] == "true")
						self.pers["rEquip"] = "false";
					else if (self.pers["rEquip"] == "false")
						self.pers["rEquip"] = "true";
				}
				else if (self.curPos == 7)
				{
					self openpopupMenu( "quickbindings" );	
				}
			}
			else if (self.menuPos == 6) // Match Settings
			{
			if (self.match == 0)
			{
			
				if (self.curPos == 1)
				{
					{
					if ( getDvar( "dmgt" ) == "0" )
						setDvar( "dmgt", "1" );
					else if ( getdvar( "dmgt" ) == "1" )
						setDvar( "dmgt", "2" );
					else if ( getdvar( "dmgt" ) == "2" )
						setDvar( "dmgt", "3" );
					else if ( getdvar( "dmgt" ) == "3" )
						setDvar( "dmgt", "4" );
					else if ( getdvar( "dmgt" ) == "4" )
						setDvar( "dmgt", "5" );
					else if ( getdvar( "dmgt" ) == "5" )
						setDvar( "dmgt", "6" );
					else if ( getdvar( "dmgt" ) == "6" )
						setDvar( "dmgt", "7" );
					else if ( getdvar( "dmgt" ) == "7" )
						setDvar( "dmgt", "0" );
				}
					
				
				}
				else if (self.curPos == 2)
				{
					if ( getdvar( "expb" ) == "0" )
						setDvar( "expb", "1" );
					else if ( getdvar( "expb" ) == "1" ) 
						setDvar( "expb", "2" );
					else if ( getdvar( "expb" ) == "2" ) 
						setDvar( "expb", "3" );
					else if ( getdvar( "expb" ) == "3" ) 
						setDvar( "expb", "4" );
					else if ( getdvar( "expb" ) == "4" ) 
						setDvar( "expb", "5" );
					else if ( getdvar( "expb" ) == "5" ) 
						setDvar( "expb", "6" );
					else if ( getdvar( "expb" ) == "6" ) 
						setDvar( "expb", "0" );
				}
				
				else if (self.curPos == 3)
				{
							
					
					if ( getdvar( "timescale" ) == "1" )
						setDvar( "timescale", "0.75" );
					else if ( getdvar( "timescale" ) == "0.75" )
						setDvar( "timescale", "0.5" );
					else if ( getdvar( "timescale" ) == "0.5" )
						setDvar( "timescale", "0.25" );
					else if ( getdvar( "timescale" ) == "0.25" )
						setDvar( "timescale", "1" );
				}
				else if (self.curPos == 4)
				{
						
					if ( getDvar( "thirdPerson" ) == "0" )
					setDvar( "thirdPerson", "1" );
					else if ( getDvar( "thirdPerson" ) == "1" )
					setDvar( "thirdPerson", "0" );
						
				}
				else if (self.curPos == 5)
				{
					if ( getDvar( "superjump" ) == "0" )
					setDvar( "superjump", "1" );
					else if ( getDvar( "superjump" ) == "1" )
					setDvar( "superjump", "0" );
				}
				else if (self.curPos == 6)
				{
					if ( getdvar( "dbarriers" ) == "0" )
						setDvar( "dbarriers", "1" );
					else if ( getdvar( "dbarriers" ) == "1" )
						setDvar( "dbarriers", "0" );
				}
				else if (self.curPos == 7)
				{
					if ( getDvar( "r_specularMap" ) == "Unchanged" )
						setDvar( "r_specularMap", "White" );
					else if ( getDvar( "r_specularMap" ) == "White" )
						setDvar( "r_specularMap", "Black" );
					else if ( getDvar( "r_specularMap" ) == "Black" )
						setDvar( "r_specularMap", "Gray" );
					else if ( getDvar( "r_specularMap" ) == "Gray" )
						setDvar( "r_specularMap", "Unchanged" );
					
					
						
				}

				else if (self.curPos == 8)
				{
					if ( getdvar( "naccamo" ) == "0" )
						setDvar( "naccamo", "1" );
					else if ( getdvar( "naccamo" ) == "1" )
						setDvar( "naccamo", "2" );
					else if ( getdvar( "naccamo" ) == "2" )
						setDvar( "naccamo", "3" );
					else if ( getdvar( "naccamo" ) == "3" )
						setDvar( "naccamo", "4" );
					else if ( getdvar( "naccamo" ) == "4" )
						setDvar( "naccamo", "5" );
					else if ( getdvar( "naccamo" ) == "5" )
						setDvar( "naccamo", "6" );
					else if ( getdvar( "naccamo" ) == "6" )
						setDvar( "naccamo", "7" );
					else if ( getdvar( "naccamo" ) == "7" )
						setDvar( "naccamo", "8" );
					else if ( getdvar( "naccamo" ) == "8" )
						setDvar( "naccamo", "0" );
						
				}
				
				else if (self.curPos == 9)
				{
					if ( getdvar( "skreecamo" ) == "0" )
						setDvar( "skreecamo", "1" );
					else if ( getdvar( "skreecamo" ) == "1" )
						setDvar( "skreecamo", "2" );
					else if ( getdvar( "skreecamo" ) == "2" )
						setDvar( "skreecamo", "3" );
					else if ( getdvar( "skreecamo" ) == "3" )
						setDvar( "skreecamo", "4" );
					else if ( getdvar( "skreecamo" ) == "4" )
						setDvar( "skreecamo", "5" );
					else if ( getdvar( "skreecamo" ) == "5" )
						setDvar( "skreecamo", "6" );
					else if ( getdvar( "skreecamo" ) == "6" )
						setDvar( "skreecamo", "7" );
					else if ( getdvar( "skreecamo" ) == "7" )
						setDvar( "skreecamo", "8" );
					else if ( getdvar( "skreecamo" ) == "8" )
						setDvar( "skreecamo", "0" );
						
				}
				
				else if (self.curPos == 10)
				{
					if ( getdvar( "expp" ) == "0" )
						setDvar( "expp", "1" );
					else if ( getdvar( "expp" ) == "1" )
						setDvar( "expp", "2" );
					else if ( getdvar( "expp" ) == "2" )
						setDvar( "expp", "3" );
					else if ( getdvar( "expp" ) == "3" )
						setDvar( "expp", "4" );
					else if ( getdvar( "expp" ) == "4" )
						setDvar( "expp", "0" );
						
				}
				
			}
			
			else
			{
			
			if (self.curPos == 1)
				{
					{
					if ( getDvar( "prestigee" ) == "0" )
						setDvar( "prestigee", "1" );
					else if ( getdvar( "prestigee" ) == "1" )
						setDvar( "prestigee", "2" );
					else if ( getdvar( "prestigee" ) == "2" )
						setDvar( "prestigee", "3" );
					else if ( getdvar( "prestigee" ) == "3" )
						setDvar( "prestigee", "4" );
					else if ( getdvar( "prestigee" ) == "4" )
						setDvar( "prestigee", "5" );
					else if ( getdvar( "prestigee" ) == "5" )
						setDvar( "prestigee", "6" );
					else if ( getdvar( "prestigee" ) == "6" )
						setDvar( "prestigee", "7" );
					else if ( getdvar( "prestigee" ) == "7" )
						setDvar( "prestigee", "8" );
					else if ( getdvar( "prestigee" ) == "8" )
						setDvar( "prestigee", "9" );
					else if ( getdvar( "prestigee" ) == "9" )
						setDvar( "prestigee", "10" );
					else if ( getdvar( "prestigee" ) == "10" )
						setDvar( "prestigee", "11" );
					else if ( getdvar( "prestigee" ) == "11" )
						setDvar( "prestigee", "0" );
					
					}
				}
				
				else if (self.curPos == 2)
				{
					{
					if ( getDvar( "expbot" ) == "0" )
						setDvar( "expbot", "1" );
					else if ( getdvar( "expbot" ) == "1" )
						setDvar( "expbot", "0" );	
					}
				}
				
				if (self.curPos == 3)
				{
					{
					if ( getDvar( "prestigee2" ) == "0" )
						setDvar( "prestigee2", "1" );
					else if ( getdvar( "prestigee2" ) == "1" )
						setDvar( "prestigee2", "2" );
					else if ( getdvar( "prestigee2" ) == "2" )
						setDvar( "prestigee2", "3" );
					else if ( getdvar( "prestigee2" ) == "3" )
						setDvar( "prestigee2", "4" );
					else if ( getdvar( "prestigee2" ) == "4" )
						setDvar( "prestigee2", "5" );
					else if ( getdvar( "prestigee2" ) == "5" )
						setDvar( "prestigee2", "6" );
					else if ( getdvar( "prestigee2" ) == "6" )
						setDvar( "prestigee2", "7" );
					else if ( getdvar( "prestigee2" ) == "7" )
						setDvar( "prestigee2", "8" );
					else if ( getdvar( "prestigee2" ) == "8" )
						setDvar( "prestigee2", "9" );
					else if ( getdvar( "prestigee2" ) == "9" )
						setDvar( "prestigee2", "10" );
					else if ( getdvar( "prestigee2" ) == "10" )
						setDvar( "prestigee2", "11" );
					else if ( getdvar( "prestigee2" ) == "11" )
						setDvar( "prestigee2", "0" );
					
					}
				}
				
				else if (self.curPos == 4)
				{
					{
					if ( getDvar( "expbot2" ) == "0" )
						setDvar( "expbot2", "1" );
					else if ( getdvar( "expbot2" ) == "1" )
						setDvar( "expbot2", "0" );	
					}
				}
				
				else if (self.curPos == 5)
				{
					{
					if ( getDvar( "staffBots" ) == "0" )
						setDvar( "StaffBots", "1" );
					else if ( getdvar( "StaffBots" ) == "1" )
						setDvar( "StaffBots", "0" );	
					}
				}
				
				else if (self.curPos == 6)
				{
					{
					if ( getdvar( "left" ) == "0" ) 
						setDvar( "left", "1" );
					 else if ( getdvar( "left" ) == "1" ) 
						setDvar( "left", "2" );
					 else if ( getdvar( "left" ) == "2" ) 
						setDvar( "left", "0" );
					
					}
				}
				
				else if (self.curPos == 7)
				{
					{
				    if ( getdvar( "walls" ) == "0" )
						setDvar( "walls", "1" );
					else if ( getdvar( "walls" ) == "1" ) 
						setDvar( "walls", "0" );
					}
				}
				
				else if (self.curPos == 8)
				{
					{
				    if ( getdvar( "fakelag" ) == "0" )
						setDvar( "fakelag", "1" );
					else if ( getdvar( "fakelag" ) == "1" ) 
						setDvar( "fakelag", "2" );
					else if ( getdvar( "fakelag" ) == "2" ) 
						setDvar( "fakelag", "3" );
					else if ( getdvar( "fakelag" ) == "3" ) 
						setDvar( "fakelag", "0" );
					
					
					}
				}
				
			
			}
			
			}
			
			
			else if (self.menuPos == 7) // Change Map
			{
				if (self.mapPack == 0) 
				{
					if (self.page == 1)
						map( self.NormMap1[self.curPos - 1] );
					else if (self.page == 2)
						map( self.NormMap2[self.curPos - 1] );
				}
				else if (self.mapPack == 1)
				{
					if (self.page == 1)
					map( self.DLCMap[self.curPos - 1] );
					else if (self.page == 2)
					map( self.DLCMap2[self.curPos - 1] );
				}
			}
			else if (self.menuPos == 8) // Bot Settings
			{
				if (self.curPos == 2)
				{
					if ( getdvar( "testClients_doMove" ) == "0" )
						setDvar( "testClients_doMove", "1" );
					else if ( getdvar( "testClients_doMove" ) == "1" )
						setDvar( "testClients_doMove", "0" );
				}
				else if (self.curPos == 3)
				{
					if ( getdvar( "testClients_doAttack" ) == "0" )
						setDvar( "testClients_doAttack", "1" );
					else if ( getdvar( "testClients_doAttack" ) == "1" )
						setDvar( "testClients_doAttack", "0" );
				}
				else if (self.curPos == 4)
				{
					if ( getdvar( "testClients_doReload" ) == "0" )
						setDvar( "testClients_doReload", "1" );
					else if ( getdvar( "testClients_doReload" ) == "1" )
						setDvar( "testClients_doReload", "0" );
				}
				else if (self.curPos == 5)
				{
					if ( getDvar( "testClients_doLock" ) == "0" )
						setDvar( "testClients_doLock", "1" );
					else if ( getdvar( "testClients_doLock" ) == "1" )
						setDvar( "testClients_doLock", "0" );
				}
			}
			else if (self.menuPos == 9) // Kick Players
			{
				foreach(player in level.players)
				{
					if (self.kickPage == 1)
					{
						if (player.name == level.players[self.curPos - 1].name)
							kick(player getEntityNumber(),"EXE_PLAYERKICKED");
				 	}
				 	else if (self.kickPage == 2)
				 	{
						if (player.name == level.players[self.curPos - 1 + 9].name)
							kick(player getEntityNumber(),"EXE_PLAYERKICKED");
					}
				}
			}
			
		}	
	}
}

	