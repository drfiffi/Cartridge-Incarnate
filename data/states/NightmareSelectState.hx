var stateSelected:Int;

import openfl.text.TextField;
import openfl.text.TextFormat;
import flixel.text.FlxTextBorderStyle;

function update(){
    if(FlxG.keys.justPressed.RIGHT){
        stateSelected = 1;
        marioStyle.color = FlxColor.RED;
        sonicStyle.color = FlxColor.WHITE;
    } else if(FlxG.keys.justPressed.LEFT){
        stateSelected = 0;
        sonicStyle.color = FlxColor.RED;
        marioStyle.color = FlxColor.WHITE;
    }
    if(FlxG.keys.justPressed.ENTER){
        switch(stateSelected){
            case 0:
                FlxG.switchState(new ModState("FreeplaySonicState"));
            case 1:
                FlxG.switchState(new ModState("BoWayState"));
        }
    }
    if(FlxG.keys.justPressed.BACKSPACE){
        FlxG.switchState(new MainMenuState());
    }
}

function create(){
    FlxG.sound.playMusic(Paths.music('U2SLOV2'), 0);
	FlxTween.tween(FlxG.sound.music, {volume: 1}, 1);

    topText = new FlxText(0, 100, 1280, 'CHOSE YOUR NIGHTMARE', 0);
    topText.setFormat(Paths.font("vcr.ttf"), 40, FlxColor.WHITE, "center", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
    topText.antialiasing = false;
    topText.borderSize = 0;
    topText.screenCenter(FlxAxes.X);
    add(topText);

    sonicStyle = new FlxText(0, 0, 1280, 'MORTIFY', 0);
    sonicStyle.setFormat(Paths.font("sonic-level-select-font.ttf"), 19, FlxColor.RED, "center", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
    sonicStyle.antialiasing = false;
    sonicStyle.borderSize = 0;
    sonicStyle.screenCenter(FlxAxes.X);
    sonicStyle.screenCenter(FlxAxes.Y);
    sonicStyle.x -= 300;
    add(sonicStyle);

    marioStyle = new FlxText(0, 8, 1280, 'OVERLORD', 0);
    marioStyle.setFormat(Paths.font("Mario2.ttf"), 19, FlxColor.WHITE, "center", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
    marioStyle.antialiasing = false;
    marioStyle.borderSize = 0;
    marioStyle.screenCenter(FlxAxes.X);
    marioStyle.screenCenter(FlxAxes.Y);
    marioStyle.x += 300;
    add(marioStyle);

    stateSelected = 0;
}