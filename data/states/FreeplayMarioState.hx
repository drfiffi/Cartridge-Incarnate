import openfl.text.TextField;
import openfl.text.TextFormat;
import flixel.text.FlxTextBorderStyle;

var songSelected:Int = 0;
var songsAvaliable = ['Hudson', 'Louisiana'];

function create(){
    song = new FlxText(0, 100, 1280, 'Song\n______\nHudson', 0);
    song.setFormat(Paths.font('vcr.ttf'), 40, FlxColor.WHITE, 'center', FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
    song.antialiasing = false;
    song.borderSize = 0;
    song.screenCenter();
    add(song);
}

function update(){
    if(controls.LEFT_P){
        songSelected -= 1;
    } else if(controls.RIGHT_P){
        songSelected += 1;
    }
    if(songSelected < 0){
        songSelected = 1;
    } else if(songSelected > 1){
        songSelected = 0;
    }

    switch(songSelected){
        case 0:
            song.text = 'Song\n______\nHudson';
        case 1:
            song.text = 'Song\n______\nLouisiana';
    }

    if(controls.BACK){
        FlxG.switchState(new ModState('NightmareSelectState'));
    }

    if(controls.ACCEPT){
        PlayState.loadSong(songsAvaliable[songSelected], 'normal', false, false);
        FlxG.switchState(new PlayState());
    }
}