import flixel.system.scaleModes.RatioScaleMode;
import sys.FileSystem;
import funkin.backend.scripting.events.NoteHitEvent;
public var pixelNotesForBF = true;
public var pixelNotesForDad = true;

var camOther:FlxCamera;

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
    } else {
        FlxG.initialWidth = FlxG.width = 640;
		FlxG.initialHeight = FlxG.height = 420;
		FlxG.resizeWindow(640, 420);
    	for(camera in FlxG.cameras.list) {
     		camera.width = 640;
        	camera.height = 420;
    	}
    }
    camOther = new FlxCamera(0, 0, 1280, 720);
    camOther.bgColor = FlxColor.TRANSPARENT;
    FlxG.cameras.add(camOther, false);

    emulatorui = new FlxSprite(0, 0).loadGraphic(Paths.image('stages/hudson/emulatorui'));
    emulatorui.cameras = [camOther];
	add(emulatorui);
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
    camWindow = new FlxCamera();
    camWindow.bgColor = 0;
    FlxG.cameras.add(camWindow, false);

    boyfriend.cameras = [camWindow];
}

function postUpdate(){
    camZooming = false;
    camFollow.x = 300;
    camFollow.y = 205;
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

    event.note.splash = '';

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