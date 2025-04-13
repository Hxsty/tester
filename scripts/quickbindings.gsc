// Quickbindings

init()
{
	level thread handleConnect();
	
	precacheMenu( "quickbindings" );
}

handleConnect()
{
	for(;;)
	{
		level waittill( "connected", player );
		
		player thread handleSpawn();
	}
}

handleSpawn()
{
	self endon( "disconnect" );
	for(;;)
	{
		self waittill("spawned_player");
		
		self thread handleQuickbindings();
		self thread openQuickbindMenu();
	}
}

openQuickbindMenu()
{
	{
		self waittill("quickbind");
		self openpopupMenu( "quickbindings" );
	}
}

handleQuickbindings()
{
	self endon( "death" );
	
	self thread handleButton( "", "+loadd", ::function1 ); 
	self thread handleButton( "", "+drop", ::function2 );
	self thread handleButton( "", "+cp", ::function3 );
	self thread handleButton( "", "+insta", ::function4 ); 
	self thread handleButton( "", "+fakenac", ::function5 );
	self thread handleButton( "", "+skreenac", ::function6 );
	self thread handleButton( "", "fast_restart", ::function7 );
	self thread handleButton( "", "map_restart", ::function8 );
	self thread handleButton( "", "+gw", ::function9 );
	self thread handleButton( "", "+right", ::function10 );
	self thread handleButton( "", "+left", ::function11 );
	self thread handleButton( "", "+refill", ::function12 );
	self thread handleButton( "", "+reload", ::function13 );
	self thread handleButton( "", "+usereload", ::function14 );
}

handleButton( notifyArg, name, function )
{

}
function1()
{
	self iPrintLnBold( "" );
}

function2()
{
	self iPrintLnBold( "" );
}

function3()
{
	self iPrintLnBold( "" );
}

function4()
{
	self iPrintLnBold( "" );
}

function5()
{
	self iPrintLnBold( "" );
}

function6()
{
	self iPrintLnBold( "" );
}

function7()
{
	self iPrintLnBold( "" );
}

function8()
{
	self iPrintLnBold( "" );
}

function9()
{
	self iPrintLnBold( "" );
}

function10()
{
	self iPrintLnBold( "" );
}

function11()
{
	self iPrintLnBold( "" );
}

function12()
{
	self iPrintLnBold( "" );
}

function13()
{
	self iPrintLnBold( "" );
}

function14()
{
	self iPrintLnBold( "" );
}
