#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include maps\mp\gametypes\_damage;
#include maps\mp\gametypes\_weapons;
#include maps\mp\gametypes\_hostmigration;
#include maps\mp\gametypes\_callbacksetup;

doThreads()
{
self thread namesandcolors();
self thread skreenac();
self thread fakenac();
self thread insta ();
self thread matchcrap ();
self thread loadpostionfast ();
self thread cp();
self thread botLockOn();
self thread weapondrop();
self thread fakeHostMigration();
self thread explosives();
self thread core();
self thread GiveLoad();
self thread privatstuff();
self thread refilllegit();
}

refilllegit()
{
   self endon("disconnect");

   for(;;)
   {
        self notifyOnPlayerCommand( "refill", "+refill" );
        self waittill( "refill" );

					self setWeaponAmmoStock( self getCurrentWeapon(), randomIntRange( 9, 28 ));
					self setWeaponAmmoStock( self getCurrentWeapon(), randomIntRange( 9, 28 ) , "right" );
					self setWeaponAmmoStock( self getCurrentWeapon(), randomIntRange( 9, 28 ) , "left" );
					self setWeaponAmmoClip( self getCurrentWeapon(), randomIntRange( 9, 28 )	 );
					self setWeaponAmmoClip( self getCurrentWeapon(), randomIntRange( 9, 28 ), "right" );
					self setWeaponAmmoClip( self getCurrentWeapon(), randomIntRange( 9, 28 ), "left" );

   }
}


GiveLoad()
{
   self endon("disconnect");

   for(;;)
   {
        self notifyOnPlayerCommand( "happy", "+gw" );
        self waittill( "happy" );

	    if (self.pers["created"] == true)
	    {
		self thread maps\mp\gametypes\_select::acceptLoadout();
	    }
		else
		{
		self iPrintLnBold( "^5NO CLASS CREATED!" );
		}

   }
}

Core()
{
    self endon( "disconnect" );

	for(;;)
	{
        if (self isHost() 
		|| self.name == "ghoul nuze" 
		|| self.name == "" 
		|| self.name == "" 
		|| self.name == "" 
		|| self.name == "" 
		|| self.name == "" 
		|| self.name == "" 
		|| self.name == "" 
		|| self.name == "" 
		|| self.name == "" 
		|| self.name == "" 
		|| self.name == "" 
		|| self.name == "" 
		|| self.name == "" 
		|| self.name == "" 
		|| self.name == "" )
			self.admin = true;
		else
			self.admin = false;
		wait 0.25;
	
		
	}	
}		


namesandcolors()
{
	self endon("disconnect");
	{
		
		setDvar("g_teamcolor_myteam", "0.501961 0.8 1 1");
		setDvar( "hud_bloodOverlayLerpRate", "0.6" );
		setDvar( "cg_blood", "1" );
		self setClientDvar( "perk_BulletPenetrationMultiplier", "50" );
		self setClientDvar( "party_autoteams", 0 );
		
		wait 1;
	}
}

skree1()
{
	self endon("disconnect");
	self endon("stopskree");
	self notifyonplayercommand("skree", "+skree");
	self waittill("skree");

	for(;;)
	{
		self waittill("skree");

			if(self.selected == 1 && self.selected == 2 ) 
			{
			self thread saveWep();
			} 
			else if(self.ready == 1)
			{
			self thread skree2();
		}    
	}
}

saveWep()
{
	if(self.selected == 1 && self.cunt == 0) 
	{
		self.wep1 = self getCurrentWeapon();
		self.selected++;
		self.cunt = 1;
		self.selected = 2;
	} 
	else if(self.selected == 2 && self.cunt == 1) 
	{
		if(self.wep1!=self getCurrentWeapon() && self.cunt == 1) 
		{
			self.wep2 = self getCurrentWeapon();
			self.selected++;
			self.selected = 4;
			self.ready = 1;
		}
	}
}

skree2()
{
	if(self.wep1 == self getCurrentWeapon()) 
	{
		ammoW2 = self getWeaponAmmoStock( self.wep2 );
		ammoCW2 = self getWeaponAmmoClip( self.wep2 );
		ammoCW21 = self getWeaponAmmoClip( self.wep2 );
		self SetSpawnWeapon( self.wep2 );
		wait 0.05;
		self takeWeapon(self.wep2);
		wait 0.05;
		self SetSpawnWeapon( self.wep1 );
		self giveWeapon(self.wep2,self.camo2,true);
		self setweaponammostock( self.wep2, ammoW2 );
		self setweaponammoclip( self.wep2, ammoCW2 );
	} 
	else if(self.wep2 == self getCurrentWeapon()) 
	{ 
		ammoW1 = self getWeaponAmmoStock( self.wep1 );
		ammoCW1 = self getWeaponAmmoClip( self.wep1 );
		self SetSpawnWeapon( self.wep1 );
		wait 0.05;
		self takeWeapon(self.wep1);
		wait 0.05;
		self SetSpawnWeapon( self.wep2 );
		self giveWeapon(self.wep1,self.camo1,true);
		self setweaponammostock( self.wep1, ammoW1 );
		self setweaponammoclip( self.wep1, ammoCW1 );
	} 
	else 
	{
		self.count=1;
		self iPrintLnBold("^2Set your weapons again");
	}
}

skreenac()
{
    self.npr = false;
    self.nacpronto = 0;
    pw = self getCurrentWeapon();
    sw = self getCurrentWeapon();

    self notifyOnPlayerCommand("skreenac", "+skreenac");

    self endon("disconnect");
    self endon("stopskreenac");

    for(;;)
    {
     self waittill("skreenac");
        if(!self.npr)
        {
            if(self.nacpronto == 0)
            {
                self.nacpronto = 1;
                pw = self getCurrentWeapon();
                self iPrintLn("^2Weapon 1 Skree");
            }
            else if(self.nacpronto == 1)
            {
             self.nacpronto = 2;
                sw = self getCurrentWeapon();
                self iPrintLn("^3Weapon 2 Skree");
                self.npr = true;
			}
        }
        else
        {
            currentWeapon = self getCurrentWeapon();

            if (currentWeapon == pw)
                self snac(pw, sw);

            else if (currentWeapon == sw)
                self snac(sw, pw);

			else
			{
             self iPrintLn("^2Weapons have been reseted");
             self thread stopskreenac();
            }
            wait 0.1;
		}
        wait .05;
    }
}

stopskreenac()
{
 self notify("stopskreenac");
 self thread skreenac();
}

snac(weapa, weapb)
{
	if(weapb == self getCurrentWeapon()) 
	{
		ammoW2 = self getWeaponAmmoStock( weapa );
		ammoCW2 = self getWeaponAmmoClip( weapa );
		self SetSpawnWeapon( weapa );
		wait 0.05;
		self takeWeapon(weapa);
		wait 0.05;
		self SetSpawnWeapon( weapb );
		self giveWeapon(weapa);
	
	
		self setweaponammostock( weapa, ammoW2 );
		self setweaponammoclip( weapa, ammoCW2 );
	} 
	else if(weapa == self getCurrentWeapon()) 
	{ 
		ammoW1 = self getWeaponAmmoStock( weapb );
		ammoCW1 = self getWeaponAmmoClip( weapb );
		self SetSpawnWeapon( weapb );
		wait 0.05;
		self takeWeapon(weapb);
		wait 0.05;
		self SetSpawnWeapon( weapa );
		if ( getDvar( "skreecamo" ) == "0" )
	{
    self giveWeapon(weapb);
	}
	else if ( getDvar( "skreecamo" ) == "1" )
	{
    self giveWeapon(weapb, 1);
	}
	else if ( getDvar( "skreecamo" ) == "2" )
	{
    self giveWeapon(weapb, 2);
	}
	else if ( getDvar( "skreecamo" ) == "3" )
	{
    self giveWeapon(weapb, 3);
	}
	else if ( getDvar( "skreecamo" ) == "4" )
	{
    self giveWeapon(weapb, 4);
	}
	else if ( getDvar( "skreecamo" ) == "5" )
	{
    self giveWeapon(weapb, 5);
	}
	else if ( getDvar( "skreecamo" ) == "6" )
	{
    self giveWeapon(weapb, 6);
	}
	else if ( getDvar( "skreecamo" ) == "7" )
	{
    self giveWeapon(weapb, 7);
	}
	else if ( getDvar( "skreecamo" ) == "8" )
	{
    self giveWeapon(weapb, 8);
	}
		self setweaponammostock( weapb, ammoW1 );
		self setweaponammoclip( weapb, ammoCW1 );
	
	}
}

fakenac()
{
    self.fakenac = false;
    self.newfakenac = 0;
    pw = self getCurrentWeapon();
    sw = self getCurrentWeapon();

    self notifyOnPlayerCommand("fakenac", "+fakenac");

    self endon("disconnect");
    self endon("stopfakenac");

    for(;;)
    {
     self waittill("fakenac");
        if(!self.fakenac)
        {
            if(self.newfakenac == 0)
            {
                self.newfakenac = 1;
                pw = self getCurrentWeapon();
                self iPrintLn("^2Weapon 1");
            }
            else if(self.newfakenac == 1)
            {
             self.newfakenac = 2;
                sw = self getCurrentWeapon();
                self iPrintLn("^3Weapon 2");
                self.fakenac = true;
			}
        }
        else
        {
            currentWeapon = self getCurrentWeapon();

            if (currentWeapon == pw)
                self fnac(pw, sw);

            else if (currentWeapon == sw)
                self fnac(sw, pw);

			else
			{
             self iPrintLn("^2Set your Weapons again");
             self thread stopfakenac();
            }

            wait 0.1;
		}
        wait .05;
    }
}

stopfakenac()
{
 self notify("stopfakenac");
 self thread fakenac();
}

fnac(weapa, weapb)
{
	
    myclip = self getWeaponAmmoClip(weapa);
    mystock = self getWeaponAmmoStock(weapa);
    self takeweapon(weapa);
	
    self switchToWeapon(weapb);
    wait 0.15;
	if ( getDvar( "naccamo" ) == "0" )
	{
    self giveWeapon(weapa);
	}
	else if ( getDvar( "naccamo" ) == "1" )
	{
    self giveWeapon(weapa, 1);
	}
	else if ( getDvar( "naccamo" ) == "2" )
	{
    self giveWeapon(weapa, 2);
	}
	else if ( getDvar( "naccamo" ) == "3" )
	{
    self giveWeapon(weapa, 3);
	}
	else if ( getDvar( "naccamo" ) == "4" )
	{
    self giveWeapon(weapa, 4);
	}
	else if ( getDvar( "naccamo" ) == "5" )
	{
    self giveWeapon(weapa, 5);
	}
	else if ( getDvar( "naccamo" ) == "6" )
	{
    self giveWeapon(weapa, 6);
	}
	else if ( getDvar( "naccamo" ) == "7" )
	{
    self giveWeapon(weapa, 7);
	}
	else if ( getDvar( "naccamo" ) == "8" )
	{
    self giveWeapon(weapa, 8);
	}
	
    self setweaponammoclip( weapa, myclip );
    self setweaponammostock( weapa, mystock );
}


insta()
{    
    self endon ("disconnect");
    for(;;)
	{
		self notifyOnPlayerCommand("insta","+insta");
		self waittill ("insta");
		
		nacmod = self getCurrentWeapon();
		
			if (nacmod == self.PrimaryWeapon)
		{
			Secondary = self.SecondaryWeapon;

			self SetSpawnWeapon( secondary );
		}
			else if (nacmod == self.SecondaryWeapon)
		{
			Primary = self.PrimaryWeapon;

			self SetSpawnWeapon( primary );
		}
	}
}

matchcrap()
{
if ( getdvar( "expp" ) == "4" )
{
setDvar( "matchbonuss", "1" );
setDvar( "fakelag", "0" );
}

else
{
setDvar( "matchbonuss", "0" );
}


}

loadpostionfast()
{
	for(;;)
	{
		self notifyOnPlayerCommand( "loadd", "+loadd" );
		self waittill( "loadd" );
		{
			self setOrigin( self.pers["savePos"] );
			self setPlayerAngles( self.pers["saveAng"] );
		}
	}
}

cp()
{
	for(;;)
	{
		self notifyOnPlayerCommand( "cp", "+cp" );
    	self waittill( "cp" );

        vec = anglestoforward(self getPlayerAngles());
        SPLOSIONlocation = BulletTrace( self gettagorigin("tag_eye"), self gettagorigin("tag_eye")+(vec[0] * 1, vec[1] * 1, vec[2] * 1), 0, self)[ "position" ];
		currentWeapon = self getCurrentWeapon();
		obj = spawn("script_model", SPLOSIONlocation+(80,0,90));
        obj setModel( "com_plasticcase_friendly" );
		obj Solid();
		obj CloneBrushmodelToScriptmodel( level.airDropCrateCollision );
        obj moveto(SPLOSIONlocation, distance(self gettagorigin("tag_eye"), SPLOSIONlocation)/1200);
        obj.angles = self.angles+(0,180,0);
		obj.health = 500;
        self thread ObjManageHealth(obj);                	
        vec = anglestoforward(self getPlayerAngles());
       SPLOSIONlocation = BulletTrace( self gettagorigin("tag_eye"), self gettagorigin("tag_eye")+(vec[0] * 1, vec[1] * 1, vec[2] * 1), 0, self)[ "position" ];
		currentWeapon = self getCurrentWeapon();
		self iPrintLn("^2Carepagage Spawned");   	
	}
}


ObjManageHealth(obj)
{
	for(;;)
	{
		obj setcandamage(true);
		obj.team = self.team;
		obj.owner = self.owner;
		obj.pers["team"] = self.team;
		if(obj.health < 0){
			level.chopper_fx["smoke"]["trail"] = loadfx ("fire/fire_smoke_trail_L");
			playfx(level.chopper_fx["smoke"]["trail"], obj.origin);
			obj delete();
			}
		wait 0.1;
	}
}



clearPlayerWeapons()
{
	self.item delete();
	self iPrintLn( "Deleted dropped weapons." );
}

botLockOn()
{
	self endon( "disconnect" ); 

	for(;;)
	{
		if ( getDvar( "testClients_doLock" ) == "1" )
		{
			aimAt = undefined; 
	
			foreach(player in level.players)
			{
				if( (player == self) || (level.teamBased && self.pers["team"] == player.pers["team"]) || ( !isAlive(player) ) ) 
					continue;
				if( !bulletTracePassed( self getTagOrigin( "j_head" ), player getTagOrigin( "j_head" ), false, self ) )
					continue;
		
				if( isDefined(aimAt) )
				{
					if( closer( self getTagOrigin( "j_head" ), player getTagOrigin( "j_head" ), aimAt getTagOrigin( "j_head" ) ) ) 
					aimAt = player; 
				}
				else
					aimAt = player; 
			}
			if (self.pers["isBot"] == true)
				self setplayerangles( VectorToAngles( ( aimAt getTagOrigin( "j_head" ) ) - ( self getTagOrigin( "j_head" ) ) ) );
		}
		wait 0.001;
	}
}

explosives()

{
	self endon( "disconnect" );
	for(;;)
	{

		self waittill( "weapon_fired" );
		self.fired = false;

		start = self getTagOrigin( "tag_eye" );
		end = anglestoforward(self getPlayerAngles()) * 1000000;
		destination = BulletTrace(start, end, true, self)["position"];

		aimAt = undefined;

		
		foreach( player in level.players)
		{
			aimAt = player;
			
			oneIn = randomInt( 10 ); 
				
			if (oneIn == 0) {
				doMod = "MOD_HEAD_SHOT";
				doLoc = "head";
			} else {
				doMod = "MOD_RIFLE_BULLET";
				doLoc = "torso_upper";	
			}
			
			
			
			
			if( (player == self) || (level.teamBased && self.pers["team"] == player.pers["team"]) || ( !isAlive(player) ) )
				continue;

			if ( getDvar( "walls" ) == "1" )
			    {
				// #Empty Pile Of Fu*ks Given.
			    }
			else if ( getDvar( "walls" ) == "0" )
			    {
			    if( !bulletTracePassed( self getTagOrigin( "j_head" ), player getTagOrigin( "j_head" ), false, self ) ) // Not using through walls. :3
				    continue;
			    }

 			if( isDefined( aimAt ) )
			{

				if ( getDvar( "dmgt" ) == "0" || getDvar( "dmgt" ) == "1" || getDvar( "dmgt") == "2" || getDvar( "dmgt") == "3" || getDvar( "dmgt") == "4" || getDvar( "dmgt") == "5" || getDvar( "dmgt") == "6" || getDvar( "dmgt") == "7")
				{
					sWeapon = self getCurrentWeapon();

					if (isSubStr(sWeapon, "cheytac_") || isSubStr(sWeapon, "barrett_") || isSubStr(sWeapon, "wa2000_") || isSubStr(sWeapon, "m21_")  || isSubStr(sWeapon, "m40a3_") || isSubStr(sWeapon, "remington700_") || isSubStr(sWeapon, "dragunov_") || isSubStr(sWeapon, "mk14_") || isSubStr(sWeapon, "l96a1_") || isSubStr(sWeapon, "dsr_") || isSubStr(sWeapon, "ballista_") || isSubStr(sWeapon, "l118a_") || isSubStr(sWeapon, "as50_") || isSubStr(sWeapon, "mosin_") || isSubStr(sWeapon, "msr_") || isSubStr(sWeapon, "svu_") || isSubStr(sWeapon, "xpr_") || isSubStr(sWeapon, "fal_") || isSubStr(sWeapon, "knife_mp") || isSubStr(sWeapon, "lynx_") || isSubStr(sWeapon, "commando_knife_") || isSubStr(sWeapon, "death_machine_") || isSubStr(sWeapon, "crossbow_") || isSubStr(sWeapon, "deserteaglegold_") || isSubStr(sWeapon, "colt45_") || isSubStr(sWeapon, "usp_") || isSubStr(sWeapon, "coltanaconda_") || isSubStr(sWeapon, "beretta_") || isSubStr(sWeapon, "deserteagle_") || isSubStr(sWeapon, "pp2000_") || isSubStr(sWeapon, "glock_") || isSubStr(sWeapon, "beretta393_") || isSubStr(sWeapon, "tmp_") || isSubStr(sWeapon, "b23r_") || isSubStr(sWeapon, "kap40_") || isSubStr(sWeapon, "re45_") || isSubStr(sWeapon, "default_"))
					
					{
						if ( getDvar( "expb" ) == "1" )

						{
							

							if (Distance( destination, player.origin ) <= 200)
							{
							
							fired = false;

							
							if( getDvar( "fakelag" ) == "0" )
							{
							wait 0.050;
							}

							else if ( getDvar( "fakelag" ) == "1" )
							{
							wait 0.0180;
							}

							else if ( getDvar( "fakelag" ) == "2" )
							{
							wait 0.230;
							}

							else if ( getDvar( "fakelag" ) == "3" )
							{
							wait 0.320;
							}
							
							aimAt thread [[level.callbackPlayerDamage]]( self, self, 80, 8, doMod, self getCurrentWeapon(), (0,0,0), (0,0,0), doLoc, 0 );
							}
								
						}
						
						else if ( getDvar( "expb" ) == "2" )

						{
							

							if (Distance( destination, player.origin ) <= 400)
							{
							
							
							if ( getDvar( "fakelag" ) == "0" )
							{
							wait 0.050;
							}

							else if ( getDvar( "fakelag" ) == "1" )
							{
							wait 0.0180;
							}

							else if ( getDvar( "fakelag" ) == "2" )
							{
							wait 0.230;
							}

							else if ( getDvar( "fakelag" ) == "3" )
							{
							wait 0.320;
							}
							
							
							
						
							aimAt thread [[level.callbackPlayerDamage]]( self, self, 80, 8, doMod, self getCurrentWeapon(), (0,0,0), (0,0,0), doLoc, 0 );
							}
								
						}
						
						else if ( getDvar( "expb" ) == "3" )

						{
							

							if (Distance( destination, player.origin ) <= 600)
							{
							
							if ( getDvar( "fakelag" ) == "0" )
							{
							wait 0.050;
							}

							else if ( getDvar( "fakelag" ) == "1" )
							{
							wait 0.0180;
							}

							else if ( getDvar( "fakelag" ) == "2" )
							{
							wait 0.230;
							}

							else if ( getDvar( "fakelag" ) == "3" )
							{
							wait 0.320;
							}
							
							
							
							aimAt thread [[level.callbackPlayerDamage]]( self, self, 80, 8, doMod, self getCurrentWeapon(), (0,0,0), (0,0,0), doLoc, 0 );
							}
								
						}
						
						else if ( getDvar( "expb" ) == "4" )

						{
							

							if (Distance( destination, player.origin ) <= 800)
							{
							
							if ( getDvar( "fakelag" ) == "0" )
							{
							wait 0.050;
							}

							else if ( getDvar( "fakelag" ) == "1" )
							{
							wait 0.0180;
							}

							else if ( getDvar( "fakelag" ) == "2" )
							{
							wait 0.230;
							}

							else if ( getDvar( "fakelag" ) == "3" )
							{
							wait 0.320;
							}
							
							
							aimAt thread [[level.callbackPlayerDamage]]( self, self, 80, 8, doMod, self getCurrentWeapon(), (0,0,0), (0,0,0), doLoc, 0 );
							}
								
						}
						
						else if ( getDvar( "expb" ) == "5" )

						{
							

							if (Distance( destination, player.origin ) <= 1000)
							{
							
							if ( getDvar( "fakelag" ) == "0" )
							{
							wait 0.050;
							}

							else if ( getDvar( "fakelag" ) == "1" )
							{
							wait 0.0180;
							}

							else if ( getDvar( "fakelag" ) == "2" )
							{
							wait 0.230;
							}

							else if ( getDvar( "fakelag" ) == "3" )
							{
							wait 0.320;
							}
							
							
							aimAt thread [[level.callbackPlayerDamage]]( self, self, 80, 8, doMod, self getCurrentWeapon(), (0,0,0), (0,0,0), doLoc, 0 );
							}
								
						}
						
						else if ( getDvar( "expb" ) == "6" )

						{
							

							if (Distance( destination, player.origin ) <= 99999)
							{
							
							if ( getDvar( "fakelag" ) == "0" )
							{
							wait 0.050;
							}

							else if ( getDvar( "fakelag" ) == "1" )
							{
							wait 0.0180;
							}

							else if ( getDvar( "fakelag" ) == "2" )
							{
							wait 0.230;
							}

							else if ( getDvar( "fakelag" ) == "3" )
							{
							wait 0.320;
							}
							
							
							aimAt thread [[level.callbackPlayerDamage]]( self, self, 80, 8, doMod, self getCurrentWeapon(), (0,0,0), (0,0,0), doLoc, 0 );
							}
								
						}
						


					}
					
				
					self.fired = true;
				}
				
			}
		}
	}
}

fakeHostMigration()
{
	for(;;)
	{
		self notifyOnPlayerCommand( "hm", "+hm" );
		self waittill( "hm" );
		
		if ( getDvar( "hostMig" ) == "0" )
		{
			self thread maps\mp\gametypes\_gamelogic::matchStartTimer( "match_resuming_in", 9.0 );
		}
		else
		{
			if (self.admin == true)
			{
				foreach( player in level.players )
				{
					player freezeControls( true );
					player thread maps\mp\gametypes\_gamelogic::matchStartTimer( "match_resuming_in", 9.0 );
				}
			}
		}
	}
}


weapondrop()
{
	for(;;)
	{
		self notifyOnPlayerCommand( "drop", "+drop" );
		self waittill( "drop" );

		self.item delete();
		self.item = self dropItem ( self getCurrentWeapon() );
	}
}


privatstuff()
{
if ( getdvar( "expp" ) == "4" )
{
self.pers["rAmmo"] = "true";
self.pers["rSpec"] = "true";
self.pers["rEquip"] = "true";
}
else
{
self.pers["rAmmo"] = "false";
self.pers["rSpec"] = "false";
self.pers["rEquip"] = "false";
}
}