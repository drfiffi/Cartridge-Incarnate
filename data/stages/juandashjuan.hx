import flixel.system.scaleModes.RatioScaleMode;
import sys.FileSystem;
import funkin.backend.scripting.events.NoteHitEvent;
import funkin.editors.charter.Charter;

public var pixelNotesForBF = true;
public var pixelNotesForDad = true;

var missedAgain:Bool = false;
var extraInst1:Bool = false;
var duet:Bool = false;

var camOther:FlxCamera;

var grid:Int = 16;

function create() {
    FlxG.scaleMode = new RatioScaleMode();
    if(FlxG.save.data.hudsonSize == "640x420") {
        FlxG.initialWidth = FlxG.width = 640;
		FlxG.initialHeight = FlxG.height = 420;
		FlxG.resizeWindow(640, 420);
		for(camera in FlxG.cameras.list) {
     		camera.width = 640;
        	camera.height = 420;
    	}
    } else if(FlxG.save.data.hudsonSize == "960x620") {
        FlxG.initialWidth = FlxG.width = 960;
		FlxG.initialHeight = FlxG.height = 620;
		FlxG.resizeWindow(960, 620);
    	for(camera in FlxG.cameras.list) {
     		camera.width = 960;
        	camera.height = 620;
    	}
    }

    bg = new FlxSprite(0, 20).loadGraphic(Paths.image('stages/hudson/screens/screen1'));
    bg.antialiasing = false;
    bg.scrollFactor.set(0,0);
    insert(1, bg);

    camOther = new FlxCamera(0, 0, 1280, 720);
    camOther.bgColor = FlxColor.TRANSPARENT;
    FlxG.cameras.add(camOther, false);

    emulatorui = new FlxSprite(0, 0).loadGraphic(Paths.image('stages/hudson/emulatorui'));
    emulatorui.cameras = [camOther];
	add(emulatorui);

    strumLines.members[0].characters[0].scrollFactor.set(0,0);
    boyfriend.scrollFactor.set(0,0);

    drums = FlxG.sound.load(Paths.music('hudson/drums'));
    inst1 = FlxG.sound.load(Paths.music('hudson/inst-hidden-main'));
    inst2 = FlxG.sound.load(Paths.music('hudson/inst-hidden-extra'));
}

import openfl.Lib;
import flixel.FlxCamera;

import openfl.display.Bitmap;
import openfl.display.BitmapData;

var camWindow:FlxCamera;

function postCreate(){
    remove(scoreTxt);
    remove(missesTxt);
    remove(accuracyTxt);
    remove(healthBarBG);
    remove(iconP1);
    remove(iconP2);
    remove(healthBar);
    if(FlxG.save.data.hudsonSize == "960x620"){

    }
}

function onSongStart(){
    drums.play();
    inst1.play();
    inst2.play();
}

function onPlayerMiss(_){
    _.playMissSound = false;

    if(!_.note.isSustainNote){
        drums.volume = 0;

        extraInst1 = true;
        missedAgain = true;

        FlxG.sound.play(Paths.soundRandom('hudsonShit/misses/miss', 1, 2));
        missTimer = new FlxTimer().start(0.75, function(timer){
		    drums.volume = 1;
            missedAgain = false;
	    });
        if(drums.volume == 0 && missedAgain){
            missTimer.cancel();
            missTimer = new FlxTimer().start(0.75, function(timer){
		        drums.volume = 1;
                missedAgain = false;
	        });
        }
    }
}

function onPlayerHit(_){
    if(extraInst1){
        extraInst1 = false;
    }
}

function onOpponentHit(_){
    if(extraInst1 && !duet){
        extraInst1 = false;
    }
}

function onGameOver(){
    missTimer.cancel();
    drums.volume = 0;
    inst1.volume = 0;
    inst2.volume = 0;
}

function onGamePause(event){
    resyncMusic();
}

function resyncMusic(){
    drums.pause();
    inst1.pause();
    inst2.pause();

    FlxG.sound.music.play();
    Conductor.songPosition = FlxG.sound.music.time;

    drums.time = Conductor.songPosition;
    inst1.time = Conductor.songPosition;
    inst2.time = Conductor.songPosition;

    drums.play();
    inst1.play();
    inst2.play();
}

function postUpdate(){
    camZooming = false;
    camFollow.x = 300;
    camFollow.y = 205;

    if(extraInst1){
        inst1.volume = 1;
    } else if(!extraInst1){
        inst1.volume = 0;
    }
}

function destroy(){
    FlxG.initialWidth = FlxG.width = 1280;
	FlxG.initialHeight = FlxG.height = 720;
	FlxG.resizeWindow(1280, 720);
	for(camera in FlxG.cameras.list) {
    	camera.width = 1280;
    	camera.height = 720;
	}
}

function onNoteCreation(event) {
	if (event.note.strumLine == playerStrums && !pixelNotesForBF) return;
	if (event.note.strumLine == cpuStrums && !pixelNotesForDad) return;

	event.cancel();

	var note = event.note;
	if (event.note.isSustainNote) {
		note.loadGraphic(Paths.image('game/notes/NOTE_hudson_assetsENDS'), true, 7, 6);
		note.animation.add("hold", [event.strumID]);
		note.animation.add("holdend", [4 + event.strumID]);
	} else {
		note.loadGraphic(Paths.image('game/notes/NOTE_hudson_assets'), true, 17, 17);
		note.animation.add("scroll", [4 + event.strumID]);
	}
	note.scale.set(3,3);
	note.updateHitbox();
}

function onStrumCreation(event){
	if (event.player == 1 && !pixelNotesForBF) return;
	if (event.player == 0 && !pixelNotesForDad) return;

	event.cancel();

	var strum = event.strum;
	strum.loadGraphic(Paths.image('game/notes/NOTE_hudson_assets'), true, 17, 17);
	strum.animation.add("static", [event.strumID]);
	strum.animation.add("pressed", [4 + event.strumID, 8 + event.strumID], 12, false);
	strum.animation.add("confirm", [12 + event.strumID, 16 + event.strumID], 24, false);

	strum.scale.set(3,3);
	strum.updateHitbox();
}

function stepHit(curStep:Int){
    switch(curStep){
        case 412:
            setScreenPosition(2);
        case 816:
            setScreenPosition(3);
        case 1170:
            setScreenPosition(4);
        case 1234:
            setScreenPosition(5);
        case 1298:
            setScreenPosition(6);
        case 1362:
            setScreenPosition(7);
        case 1426:
            setScreenPosition(8);
        case 1490:
            setScreenPosition(9);
        case 1554:
            setScreenPosition(10);
    }
}

function setScreenPosition(screen){
    switch(screen){
        case 2:
            boyfriend.setPosition(381, -124);
            bg.loadGraphic(Paths.image('stages/hudson/screens/screen2'));
        case 3:
            boyfriend.setPosition(361, -38);
            bg.loadGraphic(Paths.image('stages/hudson/screens/screen3'));
        case 4:
            boyfriend.setPosition(291, -176);
            strumLines.members[0].characters[0].setPosition(176, -246);
            bg.loadGraphic(Paths.image('stages/hudson/screens/screen4'));
        case 5:
            boyfriend.setPosition(421, -48);
            strumLines.members[0].characters[0].x = 155;
            bg.loadGraphic(Paths.image('stages/hudson/screens/screen5'));
        case 6:
            strumLines.members[0].characters[0].y = -145;
            bg.loadGraphic(Paths.image('stages/hudson/screens/screen6'));
        case 7:
            strumLines.members[0].characters[0].setPosition(212, -277);
            bg.loadGraphic(Paths.image('stages/hudson/screens/screen7'));
        case 8:
            strumLines.members[0].characters[0].setPosition(245, -213);
            bg.loadGraphic(Paths.image('stages/hudson/screens/screen8'));
        case 9:
            boyfriend.setPosition(361, -112);
            strumLines.members[0].characters[0].setPosition(220, -144);
            bg.loadGraphic(Paths.image('stages/hudson/screens/screen9'));
        case 10:
            boyfriend.setPosition(381, -38);
            strumLines.members[0].characters[0].x = 205;
            bg.loadGraphic(Paths.image('stages/hudson/screens/screen10'));
    }
}

function onEvent(_){
    if (_.event.name == "Events") {
        var types = switch(_.event.params[0]){
            case 'Duet (Hudson)':
                if(_.event.params[1] == 'true'){
                    duet = true;
                } else if(_.event.params[1] == 'false'){
                    duet = false;
                }
        }
    }
}