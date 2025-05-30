#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include maps\mp\gametypes\_cleanScript;

doThreads()
{
	self thread menuContUP();
	self thread menuContDOWN();
	self thread menuSwapMenuLEFT();
	self thread menuSwapTeirs();
	self thread menuSwapMenuRIGHT();
	self thread menuControllerNorm();
	self thread menuSwitchPages();
	self thread determinMaxCycle();
}

menuSwitchPages()
{
	for(;;)
	{
		self notifyOnPlayerCommand( "melee", "+melee" );
		self waittill( "melee" );

		if (self.menuOpen == 1)
		{
			if (self.menuPos == 7)
			{
				self.curPos = 1;
				self.page++;

				if (self.page > 2)
					self.page = 1;
			}
			else if (self.menuPos == 8)
			{
				if (self.curPos == 1)
				{
					self.bNum--;
					
					if (self.bNum < 0)
					{
						self.bNum = level.players.size;
						setDvar( "moveName", level.players[self.bNum - 1].name );
					}
					else if (self.bNum == 0)
					{
						setDvar( "moveName", "All" );
					}
					else
					{
						setDvar( "moveName", level.players[self.bNum - 1].name );
					}
				}
			}
		}
	}
}

menuSwapTeirs()
{
	for(;;)
	{
		self notifyOnPlayerCommand( "reload", "+reload" );
		self waittill( "reload" );
		
		if (self.menuOpen == 1)
		{
			if (self.menuPos == 2)
			{
				if (self.curPos == 9)
				{
					self.selector++;

					if (self.selector > 2)
						self.selector = 1;
				}

			}
			else if (self.menuPos == 3)
			{
				if (self.secIsPrimary == true)
				{
					self.curPos = 1;
					self.secTeir++;

					if (self.secTeir > 5)
						self.secTeir = 1;
				}
			}
			else if (self.menuPos == 6)
			{
				self.curPos = 1;
				self.match++;

					if (self.match > 1)
					self.match = 0;

			}
			else if (self.menuPos == 7)
			{
				self.curPos = 1;
				self.mapPack++;

				if (self.mapPack > 1)
					self.mapPack = 0;

			}
			else if (self.menuPos == 8)
			{
				self.bNum++;
					
				if (self.bNum > level.players.size)
				{
					self.bNum = 0;
					setDvar( "moveName", "All" );
				}
				else
				{
					setDvar( "moveName", level.players[self.bNum - 1].name );
				}
			}
			else if (self.menuPos == 9)
			{
				if (level.players.size > 9)
				{
					self.curPos = 1;
					self.kickPage++;

					if (self.kickPage > 2)
						self.kickPage = 1;
				}
			}
		}
	}
}

menuControllerNorm()
{
	for(;;)
	{
		self notifyOnPlayerCommand( "as1", "+actionslot 1" );
		self waittill( "as1" );
		
		if ( getDvar( "menuu" ) == "0" )
		{
		
		if (self.menuOpen == 0)
			self thread menuOpen();
		else if (self.menuOpen == 1)
			self thread menuClose();
		}
		
		else
		{
		//
		}
	}
}

menuSwapMenuRIGHT()
{
	for(;;)
	{
		self notifyOnPlayerCommand( "moveright", "+moveright" );
		self waittill( "moveright" );

		self.curPos = 1;
		self.page = 1;

		if (self.menuOpen == 1)
		{
			self.menuPos++;

			if (self.admin == true)
			{
				if (self.menuPos > 9)
					self.menuPos = 1;	
			}
			
			else
			{
				if (self.menuPos > 4)
					self.menuPos = 1;
	
			}

		}
	}
}

menuSwapMenuLEFT()
{
	for(;;)
	{
		self notifyOnPlayerCommand( "moveleft", "+moveleft" );
		self waittill( "moveleft" );
		
		self.curPos = 1;
		self.page = 1;

		if (self.menuOpen == 1)
		{
			self.menuPos--;

			if (self.menuPos < 1)
			{
				if (self.admin == true)
					self.menuPos = 9;
				else
					self.menuPos = 4;
			}
			
		}
	}
}

determinMaxCycle()
{
	for(;;)
	{
		if (self.menuOpen == 1)
		{
			if (self.menuPos == 2) // Equipment
			{
				self.maxCycle = 8;
			}
			else if (self.menuPos == 3) // Weapons
			{
				if (self.weaponStatus == 1)
				{
					if (self.secIsPrimary == true)
					{
						if (self.secTeir == 1)
							self.maxCycle = 10;
						else if (self.secTeir == 2)
							self.maxCycle = 6;
						else if (self.secTeir == 3)
							self.maxCycle = 5;
						else if (self.secTeir == 4)
							self.maxCycle = 6;
						else if (self.secTeir == 5)
							self.maxCycle = 1;
					}
					else
					{
						self.maxCycle = 8;
					}
				}
				else if (self.weaponStatus == 2)
					self.maxCycle = 7;
				else if (self.weaponStatus == 3)
					self.maxCycle = 6;
				else if (self.weaponStatus == 4)
					self.maxCycle = 5;
				else if (self.weaponStatus == 5)
					self.maxCycle = 6;
				else if (self.weaponStatus == 6)
					self.maxCycle = 4;
				else if (self.weaponStatus == 7)
					self.maxCycle = 7;
				else if (self.weaponStatus == 8)
					self.maxCycle = 7;
				else if (self.weaponStatus == 9)
					self.maxCycle = 3;
				else if (self.weaponStatus == 10)
					self.maxCycle = 6;
				else if (self.weaponStatus == 11)
					self.maxCycle = 5;
				else if (self.weaponStatus == 12)
					self.maxCycle = 7;
				else if (self.weaponStatus == 13)
					self.maxCycle = 11;
				else if (self.weaponStatus == 14)
					self.maxCycle = 10;
				else if (self.weaponStatus == 15)
					self.maxCycle = 10;
				else if (self.weaponStatus == 16)
					self.maxCycle = 3;
				else if (self.weaponStatus == 60) //DLC SNIPER 1
					self.maxCycle = 12;
				else if (self.weaponStatus == 61) //DLC SNIPER 1 SITE 2
					self.maxCycle = 3;
				else if (self.weaponStatus == 62) //DLC ASSAULT 
					self.maxCycle = 12;
				else if (self.weaponStatus == 63) //DLC ASSAULT SITE 2
					self.maxCycle = 5;
				else if (self.weaponStatus == 64) //DLC MP 
					self.maxCycle = 12;
				else if (self.weaponStatus == 65) //DLC MP SITE 2
					self.maxCycle = 4;
				else if (self.weaponStatus == 66) //DLC HEAVY 
					self.maxCycle = 1;
				else if (self.weaponStatus == 67) //DLC SNIPER 2
					self.maxCycle = 12;
				else if (self.weaponStatus == 68) //DLC SNIPER 2 SITE 2
					self.maxCycle = 3;
				else if (self.weaponStatus == 69) //SPECIAL
					self.maxCycle = 4;
				else if (self.weaponStatus == 70) //DLC PISTOL
					self.maxCycle = 3;
				else if (self.weaponStatus == 71) //DLC PUMP
					self.maxCycle = 4;
				else if (self.weaponStatus == 72) //DLC MACHINE PISTOL
					self.maxCycle = 4;
				
			}
			else if (self.menuPos == 4) // Killstreaks
				self.maxCycle = 6;
			else if (self.menuPos == 5) // Character Prefs.
				self.maxCycle = 7;
			else if (self.menuPos == 6) // Match Settings
			{
				if (self.match == 1)
					self.maxCycle = 8;
				else 
					self.maxCycle = 10;
			}
			else if (self.menuPos == 73) // Match Settings site 2
				self.maxCycle = 8;
			else if (self.menuPos == 7) // Change Map
			{
				if (self.mapPack == 0)
					self.maxCycle = 8;
				else if (self.mapPack == 1)
					self.maxCycle = 10;
			}
			else if (self.menuPos == 8) // Bot Settings
				self.maxCycle = 5;
			else if (self.menuPos == 9) // Kick Players
			{
				if (self.kickPage == 1) // 1st page
				{
					if (level.players.size > 9) 
						self.maxCycle = 9;
					else
						self.maxCycle = level.players.size;
				}
				else if (self.kickPage == 2) // 2nd page
				{
					self.maxCycle = level.players.size - 9;
				}
			}
		}
		wait 0.1;
	}
}

menuContUP()
{
	for(;;)
	{
		self notifyOnPlayerCommand( "forward", "+forward" );
		self waittill( "forward" );
		
		if (self.menuOpen == 1)
		{
			if (self.menuPos == 1)
			{
				self.pers["mySpawn"] = self.origin;
				self.pers["myAngles"] = self.angles;
				
				if (self.pers["useCustom"] == "false")
				{
					self.pers["useCustom"] = "true";
					
				}
			}
			else
			{
				self.curPos--;
	
				if (self.curPos < 1)
					self.curPos = self.maxCycle;
			}
		}
	}
}

menuContDOWN()
{
	for(;;)
	{
		self notifyOnPlayerCommand( "back", "+back" );
		self waittill( "back" );
		
		if (self.menuOpen == 1)
		{
			self.curPos++;

			if (self.curPos > self.maxCycle)
				self.curPos = 1;
		}
	}
}