import openfl.Lib;
import openfl.system.Capabilities;
import flixel.system.scaleModes.RatioScaleMode;
import Type;
import funkin.editors.charter.Charter;

public var pixelNotesForBF = true;
public var pixelNotesForDad = true;

var camOther:FlxCamera;

var grid:Int = 16;

var loading:Bool = false;

var missTimer:FlxTimer;

function resize(w,h) {
	FlxG.scaleMode = new RatioScaleMode();
	FlxG.initialWidth = FlxG.width = w;
	FlxG.initialHeight = FlxG.height = h;
	FlxG.resizeWindow(w, h);
    Lib.application.window.x = Std.int((Capabilities.screenResolutionX / 2) - (Lib.application.window.width / 2));
	Lib.application.window.y = Std.int((Capabilities.screenResolutionY / 2) - (Lib.application.window.height / 2));
}


resize(640, 420);

function preStateSwitch()
    if(FlxG.save.data.hudsonSize == "960x620")
        FlxG.resizeWindow(960, 620);

function create() {
		for(camera in FlxG.cameras.list) {
     		camera.width = 640;
        	camera.height = 420;
    	}

    bg = new FlxSprite(0, 20).loadGraphic(Paths.image('stages/hudson/screens/screen1'));
    bg.antialiasing = false;
    bg.scrollFactor.set(0,0);
    insert(1, bg);

    camOther = new FlxCamera(0, 0, 640, 420);
    camOther.bgColor = FlxColor.TRANSPARENT;
    FlxG.cameras.add(camOther, false);

    emulatorui = new FlxSprite(0, 0).loadGraphic(Paths.image('stages/hudson/emulatorui'));
    emulatorui.cameras = [camOther];
	add(emulatorui);

    dad.scrollFactor.set(0,0);
    boyfriend.scrollFactor.set(0,0);

    boyfriend.setPosition(381, -28);
    dad.setPosition(185, -130);

    defaultCamZoom = 1;

    drums = FlxG.sound.load(Paths.music('hudson/drums'));
    inst1 = FlxG.sound.load(Paths.music('hudson/inst-hidden-main'));
    missMusic(false);
}

/*import openfl.display.Bitmap;
import openfl.display.BitmapData;*/

function postCreate(){
    remove(scoreTxt);
    remove(missesTxt);
    remove(accuracyTxt);
    remove(healthBarBG);
    remove(iconP1);
    remove(iconP2);
    remove(healthBar);
    remove(comboGroup);
}

function onSongStart(){
    drums.play();
    inst1.play();

    inst1.time = drums.time = (PlayState.chartingMode && Charter.startHere) ? Charter.startTime : 0;
}

function onPlayerMiss(_){
    _.playMissSound = false;
    if(missTimer != null) missTimer.cancel();

    if(!_.note.isSustainNote){
        drums.volume = 0;

        FlxG.sound.play(Paths.soundRandom('hudsonShit/misses/miss', 1, 2));
        missTimer = new FlxTimer().start(0.75, function(timer){drums.volume = 1;});
    }
    missMusic(true);
}

function onNoteHit(_) _.enableCamZooming = false;

function onPlayerHit(_){
    missMusic(false);
    _.showSplash = false;
}

function onOpponentHit(_)
    if(!duet)
        missMusic(false);

function onGameOver(){
    missTimer.cancel();
    drums.volume = 0;
    inst1.volume = 0;
}

function reloadMusic(fully){
    switch(fully){
        case true:
            drums.pause();
            inst1.pause();
    }
    Conductor.songPosition = FlxG.sound.music.time;

    drums.time = Conductor.songPosition;
    inst1.time = Conductor.songPosition;

    drums.play();
    inst1.play();
}

function onGamePause(event) reloadMusic(true);

function update(){
    if(subState == null && loading == true){
        reloadMusic(false);
        loading = false;
    }
}

function missMusic(allow){
    switch(allow){
        case true: inst1.volume = 1;
        case false: inst1.volume = 0;
    }
}

function destroy(){
    if(Type.getClassName(Type.getClass(FlxG.game._requestedState)) != "funkin.game.PlayState"){
        resize(1280, 720);
        for(camera in FlxG.cameras.list) {
            camera.width = 1280;
            camera.height = 720;
       }
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
            boyfriend.setPosition(381, -124);
            bg.loadGraphic(Paths.image('stages/hudson/screens/screen2'));
        case 816:
            boyfriend.setPosition(361, -38);
            bg.loadGraphic(Paths.image('stages/hudson/screens/screen3'));
        case 1170:
            boyfriend.setPosition(291, -176);
            dad.setPosition(176, -246);
            bg.loadGraphic(Paths.image('stages/hudson/screens/screen4'));
        case 1234:
            boyfriend.setPosition(421, -48);
            dad.x = 155;
            bg.loadGraphic(Paths.image('stages/hudson/screens/screen5'));
        case 1298:
            dad.y = -145;
            bg.loadGraphic(Paths.image('stages/hudson/screens/screen6'));
        case 1362:
            dad.setPosition(212, -277);
            bg.loadGraphic(Paths.image('stages/hudson/screens/screen7'));
        case 1426:
            dad.setPosition(245, -213);
            bg.loadGraphic(Paths.image('stages/hudson/screens/screen8'));
        case 1490:
            boyfriend.setPosition(361, -112);
            dad.setPosition(220, -144);
            bg.loadGraphic(Paths.image('stages/hudson/screens/screen9'));
        case 1554:
            boyfriend.setPosition(381, -38);
            dad.x = 205;
            bg.loadGraphic(Paths.image('stages/hudson/screens/screen10'));
    }
}

function onEvent(_){
    if (_.event.name == "Events") {
        switch(_.event.params[0]){
            case 'Duet (Hudson)':
                if(_.event.params[1] == 'true'){
                    duet = true;
                } else if(_.event.params[1] == 'false'){
                    duet = false;
                }
            case 'Loading Screen (Hudson)':
                paused = true;
                persistentUpdate = false;
                persistentDraw = true;
                openSubState(new ModSubState("hudson/LoadingScreen"));
                drums.pause();
                inst1.pause();
                loading = true;
        }
    }
}