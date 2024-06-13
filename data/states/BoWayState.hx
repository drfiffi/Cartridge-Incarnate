import Sys;
import flixel.addons.display.FlxBackdrop;
import haxe.io.Input;
import funkin.backend.utils.NdllUtil;
import sys.FileSystem;
import funkin.backend.utils.NativeAPI;
var removed:Bool = false;
var timerNumberForBullshitLmaoIFuckingHATEWRITINGTHISCODE:Int = 3;
var neverHere:Bool = false;

function create(){
	
	FlxG.sound.play(Paths.soundRandom('noWay/noWay', 1, 12));
		
    FlxG.sound.playMusic(Paths.music('NO WAY'), 0);
	FlxTween.tween(FlxG.sound.music, {volume: 1}, 1);

	noWayText = new FlxBackdrop(Paths.image('sonicAssets/BoWayState/noWay-noWay'));
    add(noWayText);
    noWayText.screenCenter();
    noWayText.velocity.x = -250;
    noWayText.scale.set(3.215,3.215);

	chars1 = new FlxSprite(150, 0);
	chars1.frames = Paths.getSparrowAtlas('sonicAssets/BoWayState/NoWay-Characters');
	chars1.animation.addByPrefix('NO WAY?', "NO WAY!", 12);
	chars1.animation.play('NO WAY?');
    chars1.scale.set(3.215,3.215);
	chars1.updateHitbox();
	add(chars1);

	text = new FlxSprite(150, 0);
	text.frames = Paths.getSparrowAtlas('sonicAssets/BoWayState/NoWay-Text');
	text.animation.addByPrefix('NO WAY!', "NO WAY?", 12);
	text.animation.play('NO WAY!');
    text.scale.set(3.215,3.215);
	text.updateHitbox();
	add(text);

	copyright = new FlxSprite(440, 240).loadGraphic(Paths.image('sonicAssets/BoWayState/copyright'));
    copyright.scale.set(3.215,3.215);
	add(copyright);
}

function update(){
    if(FlxG.keys.justPressed.WINDOWS || FlxG.keys.justPressed.PRINTSCREEN || FlxG.keys.pressed.CONTROL){ // FUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUCK
		if (!removed){
			removed = true;
			remove(chars1);
			chars2 = new FlxSprite(150, 0);
			chars2.frames = Paths.getSparrowAtlas('sonicAssets/BoWayState/NoWay-Characters-NOCHAR4');
			chars2.animation.addByPrefix('NO WAY?', "NO WAY!", 12);
			chars2.animation.play('NO WAY?');
			chars2.scale.set(3.215,3.215);
			add(chars2);
			chars2.updateHitbox();
			new FlxTimer().start(timerNumberForBullshitLmaoIFuckingHATEWRITINGTHISCODE, function(timer)
				{
					NativeAPI.showMessageBox('E0lMFLjO00qZXA= SAYS:', 'I WAS NEVER HERE.\nI WAS NEVER HERE.\nI WAS NEVER HERE.\n\n                           -S', 'icon.ico');
				});
				}
			if (!neverHere){
				FlxG.sound.play(Paths.sound('noWay/noWayNeverHere'), 1);
				neverHere = true;
			}
		}
    if(FlxG.keys.pressed.A && FlxG.keys.pressed.SHIFT){
        FlxG.switchState(new MainMenuState());
    }
}
