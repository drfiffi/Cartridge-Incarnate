import funkin.editors.charter.Charter;

var missTimer:FlxTimer;

var loading:Bool = false;

function create(){
    drums = FlxG.sound.load(Paths.music('hudson/drums'));
    inst1 = FlxG.sound.load(Paths.music('hudson/inst-hidden-main'));
    missMusic(false);
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

function onEvent(_){
    if (_.event.name == "Events") {
        switch(_.event.params[0]){
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