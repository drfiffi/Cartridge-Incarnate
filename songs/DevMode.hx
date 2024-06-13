
import sys.FileSystem;
import funkin.game.PlayState;
import funkin.editors.charter.Charter;
import openfl.text.TextField;
import openfl.text.TextFormat;
import flixel.text.FlxTextBorderStyle;
import Sys;

var debugMenu:Bool = false;

public var curSpeed:Float = 1;

var optionDev:Int = 0;
var maxOption:Int = 2;

var settingsDev = [];

function postCreate(){
	debugMenuBG = new FlxSprite();
	debugMenuBG.makeGraphic(FlxG.width, FlxG.height, 0xff000000);
	debugMenuBG.cameras = [camHUD];
	debugMenuBG.screenCenter();
    debugMenuBG.alpha = 0;
    add(debugMenuBG);

	setting1 = new FlxText(0, 0, FlxG.width, 'Charting Menu', 0);
    setting1.setFormat(Paths.font("vcr.ttf"), 41, 0xFFFFFFFF, "center", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
    setting1.cameras = [camHUD];
    setting1.antialiasing = false;
    setting1.alpha = 0;
	setting1.screenCenter();
	setting1.y -= 100;
    setting1.borderSize = 3;
    add(setting1);

	setting2 = new FlxText(0, 0, FlxG.width, 'Skip Time:', 0);
    setting2.setFormat(Paths.font("vcr.ttf"), 41, 0xFFFFFFFF, "center", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
    setting2.cameras = [camHUD];
    setting2.antialiasing = false;
    setting2.alpha = 0;
	setting2.screenCenter();
    setting2.borderSize = 3;
    add(setting2);

	setting3 = new FlxText(0, 0, FlxG.width, 'Enter To Save Debug', 0);
    setting3.setFormat(Paths.font("vcr.ttf"), 41, 0xFFFFFFFF, "center", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
    setting3.cameras = [camHUD];
    setting3.antialiasing = false;
    setting3.alpha = 0;
	setting3.screenCenter();
	setting3.y += 100;
    setting3.borderSize = 3;
    add(setting3);

    settingsDev = [setting1, setting2, setting3];
    defaultColor = 0xFFDEFFFF;
}

function postUpdate(){	
    if(FlxG.save.data.DevMode){
		if(FlxG.keys.justPressed.SIX && !debugMenu){
			debugMenu = true;
		}
		if(debugMenu && controls.BACK){
			debugMenu = false;
            optionDev = 0;
		}

		curSpeed = FlxMath.bound(curSpeed, 0, 1);
		updateSpeed(FlxG.keys.pressed.FIVE ? 2 : curSpeed);

		if(debugMenu){
			curSpeed = 0;
			canPause = false;
			debugMenuBG.alpha = 0.5;
			setting1.alpha = 1;
			setting2.alpha = 1;
			setting3.alpha = 1;
            for(i in strumLines.members[1].members) i.animation.play('static');

                                        //\\//\\//\\//\\//\\//\\//\\//\\ Math //\\//\\//\\//\\//\\//\\//\\//\\

            if(controls.UP_P){
                optionDev -= 1;
            } else if(controls.DOWN_P){
                optionDev += 1;
            }
            if(optionDev < 0){
                optionDev = maxOption;
            } else if(optionDev > maxOption){
                optionDev = 0;
            }

                                        //\\//\\//\\//\\//\\//\\//\\//\\ Code //\\//\\//\\//\\//\\//\\//\\//\\

            if(FlxG.keys.justPressed.ENTER && optionDev == 0){
                debugMenu = false;
                chartingMenu = new FlxTimer().start(0.1, function(timer){
                    FlxG.switchState(new Charter(PlayState.SONG.meta.name, PlayState.difficulty, true));
                });
            }

            for(t in settingsDev) t.color = defaultColor;
            settingsDev[optionDev].color = 0xFFFFFF00;

		} else if(!debugMenu){
			curSpeed = 1;
			canPause = true;
			debugMenuBG.alpha = 0;
			setting1.alpha = 0;
			setting2.alpha = 0;
			setting3.alpha = 0;
		}
	}
}

function updateSpeed(speed:Float){
    FlxG.timeScale = inst.pitch = vocals.pitch = speed;
}