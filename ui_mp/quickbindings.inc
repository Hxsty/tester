#define QUICKBIND_OPTION( rectW, rectH, commandArg, textArg ) \
	itemDef \
	{ \
		rect rectW rectH 252 20 2 1 \
		visible 1 \
		style 1 \
		forecolor 1 1 1 1 \
		background "white" \
		type 14 \
		textfont 3 \
		textalign 4 \
		textalignx 180 \
		textscale 0.375 \
		dvar commandArg \
		visible when ( 1 ) \
		action \
		{ \
			play "mouse_click"; \
		} \
		onFocus \
		{ \
			setItemColor self backcolor 0 0 0 1 play "mouse_over"; \
			show "keyBindStatus"; \
		} \
		leaveFocus \
		{ \
			setItemColor self backcolor 0 0 0 0; \
			hide "keyBindStatus"; \
		} \
	} \
	itemDef \
	{ \
		rect rectW rectH 252 20 2 1 \
		decoration \
		visible 1 \
		forecolor 1 1 1 1 \
		textfont 3 \
		textalign 8 \
		textalignx 5 \
		textscale 0.25 \
		text textArg \
		visible when ( 1 ) \
	}

QUICKBIND_OPTION( 10, 30, "+loadd", "^2Load Positon" )
QUICKBIND_OPTION( 10, 50, "+drop", "^2Drop your Weapon" )
QUICKBIND_OPTION( 10, 70, "+cp", "^2Spawn a Carepackage" )
QUICKBIND_OPTION( 10, 90, "+insta", "^2Instaswap" )
QUICKBIND_OPTION( 10, 110, "+fakenac", "^2Fakenac" )
QUICKBIND_OPTION( 10, 130, "+skreenac", "^2FakeSkreenac" )
QUICKBIND_OPTION( 10, 150, "fast_restart", "^2Fast Restart" )
QUICKBIND_OPTION( 10, 170, "map_restart", "^2Map Restart" )
QUICKBIND_OPTION( 10, 190, "+gw", "^2Load Last saved class" )
QUICKBIND_OPTION( 10, 210, "+right", "^2Yawspeed Right" )
QUICKBIND_OPTION( 10, 230, "+left", "^2Yawspeed Left" )
QUICKBIND_OPTION( 10, 250, "+refill", "^2Legit Ammo Refill" )
QUICKBIND_OPTION( 10, 270, "+reload", "^2PC Reload" )
QUICKBIND_OPTION( 10, 290, "+usereload", "^2Console Reload[WristTwist/InfinityFayde]" )
