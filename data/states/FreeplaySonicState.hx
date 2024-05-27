import openfl.text.TextField;
import openfl.text.TextFormat;
import flixel.text.FlxTextBorderStyle;

var portraitArray = ['mortify', 'miles', 'mazin', 'snick', 'sonichu', 'prototype'];
var characterText = [];

var bioNumber:Int;
var songNumber:Int;

var defaultColor;

var bioSelect:Bool = true;
var songSelect:Bool = false;

var mortifySongsArray = ['daemonium', 'futility', 'freedom fighters', 'praesagium'];
var milesSongsArray = ['experiment', 'enigma'];
var mazinSongsArray = ['mugendai'];
var snickSongsArray = ['expired chili'];
var sonichuSongsArray = ['NO NAME4'];
var prototypeSongsArray = ['NO NAME5'];

var mortifySongs = [];
var milesSongs = [];
var mazinSongs = [];
var snickSongs = [];
var sonichuSongs = [];
var prototypeSongs = [];

var maxWeek:Int = 5;
var maxSong:Int;

function create(){
    portrait = new FlxSprite(150, 0).loadGraphic(Paths.image('sonicAssets/freeplay/portraits/mortify'));
    portrait.scale.set(3.215,3.215);
    portrait.antialiasing = false;
	portrait.updateHitbox();
	add(portrait);

    fuckME = new FlxSprite(150, 0).loadGraphic(Paths.image('sonicAssets/freeplay/uh_hogt'));
    fuckME.scale.set(3.215,3.215);
    fuckME.antialiasing = false;
	fuckME.updateHitbox();
    fuckME.alpha = (0.5);
	//add(fuckME);

    //\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\ WEEK 1 TEXT //\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//

    char0 = new FlxText(250, 108, 1280, 'MORTIFY', 60);
    char0.setFormat(Paths.font("sonic-level-select-font.ttf"), 19, 0xFFFFFF00, "left", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
    char0.antialiasing = false;
    char0.borderSize = 0;
    add(char0);

    mortifySongA = new FlxText(680, 108, 1280, mortifySongsArray[0].toUpperCase() + 'X', 60);
    mortifySongA.setFormat(Paths.font("sonic-level-select-font.ttf"), 19, 0xFFDEFFFF, "left", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
    mortifySongA.antialiasing = false;
    mortifySongA.borderSize = 0;
    add(mortifySongA);

    mortifySongB = new FlxText(680, 133, 1280, mortifySongsArray[1].toUpperCase() + 'X', 60);
    mortifySongB.setFormat(Paths.font("sonic-level-select-font.ttf"), 19, 0xFFDEFFFF, "left", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
    mortifySongB.antialiasing = false;
    mortifySongB.borderSize = 0;
    add(mortifySongB);

    mortifySongC = new FlxText(680, 159, 1280, mortifySongsArray[2].toUpperCase() + 'X', 60);
    mortifySongC.setFormat(Paths.font("sonic-level-select-font.ttf"), 19, 0xFFDEFFFF, "left", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
    mortifySongC.antialiasing = false;
    mortifySongC.borderSize = 0;
    add(mortifySongC);

    mortifySongD = new FlxText(680, 185, 1280, mortifySongsArray[3].toUpperCase() + 'X', 60);
    mortifySongD.setFormat(Paths.font("sonic-level-select-font.ttf"), 19, 0xFFDEFFFF, "left", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
    mortifySongD.antialiasing = false;
    mortifySongD.borderSize = 0;
    add(mortifySongD);

    //\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\ WEEK 2 TEXT //\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//

    char1 = new FlxText(250, 236, 1280, 'MILES T. ???', 60);
    char1.setFormat(Paths.font("sonic-level-select-font.ttf"), 19, 0xFFDEFFFF, "left", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
    char1.antialiasing = false;
    char1.borderSize = 0;
    add(char1);

    milesSongA = new FlxText(680, 236, 1280, milesSongsArray[0].toUpperCase(), 60);
    milesSongA.setFormat(Paths.font("sonic-level-select-font.ttf"), 19, 0xFFDEFFFF, "left", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
    milesSongA.antialiasing = false;
    milesSongA.borderSize = 0;
    add(milesSongA);

    milesSongB = new FlxText(680, 262, 1280, milesSongsArray[1].toUpperCase() + 'X', 60);
    milesSongB.setFormat(Paths.font("sonic-level-select-font.ttf"), 19, 0xFFDEFFFF, "left", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
    milesSongB.antialiasing = false;
    milesSongB.borderSize = 0;
    add(milesSongB);

    //\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\ WEEK 3 TEXT //\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//

    char2 = new FlxText(250, 313, 1280, 'MAZIN', 60);
    char2.setFormat(Paths.font("sonic-level-select-font.ttf"), 19, 0xFFDEFFFF, "left", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
    char2.antialiasing = false;
    char2.borderSize = 0;
    add(char2);

    mazinSongA = new FlxText(680, 313, 1280, mazinSongsArray[0].toUpperCase(), 60);
    mazinSongA.setFormat(Paths.font("sonic-level-select-font.ttf"), 19, 0xFFDEFFFF, "left", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
    mazinSongA.antialiasing = false;
    mazinSongA.borderSize = 0;
    add(mazinSongA);

    //\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\ WEEK 4 TEXT //\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//

    char3 = new FlxText(250, 364, 1280, 'SNICK.EXE', 60);
    char3.setFormat(Paths.font("sonic-level-select-font.ttf"), 19, 0xFFDEFFFF, "left", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
    char3.antialiasing = false;
    char3.borderSize = 0;
    add(char3);

    snickSongA = new FlxText(680, 364, 1280, snickSongsArray[0].toUpperCase() + 'X', 60);
    snickSongA.setFormat(Paths.font("sonic-level-select-font.ttf"), 19, 0xFFDEFFFF, "left", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
    snickSongA.antialiasing = false;
    mazinSongA.borderSize = 0;
    add(snickSongA);

    //\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\ WEEK 5 TEXT //\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//

    char4 = new FlxText(250, 416, 1280, 'SONICHU', 60);
    char4.setFormat(Paths.font("sonic-level-select-font.ttf"), 19, 0xFFDEFFFF, "left", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
    char4.antialiasing = false;
    char4.borderSize = 0;
    add(char4);

    sonichuSongA = new FlxText(680, 416, 1280, sonichuSongsArray[0].toUpperCase() + 'X', 60);
    sonichuSongA.setFormat(Paths.font("sonic-level-select-font.ttf"), 19, 0xFFDEFFFF, "left", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
    sonichuSongA.antialiasing = false;
    sonichuSongA.borderSize = 0;
    add(sonichuSongA);

    //\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\ WEEK 6 TEXT //\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//

    char5 = new FlxText(250, 467, 1280, 'PROTOTYPE', 60);
    char5.setFormat(Paths.font("sonic-level-select-font.ttf"), 19, 0xFFDEFFFF, "left", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
    char5.antialiasing = false;
    char5.borderSize = 0;
    add(char5);

    prototypeSongA = new FlxText(680, 467, 1280, prototypeSongsArray[0].toUpperCase() + 'X', 60);
    prototypeSongA.setFormat(Paths.font("sonic-level-select-font.ttf"), 19, 0xFFDEFFFF, "left", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
    prototypeSongA.antialiasing = false;
    prototypeSongA.borderSize = 0;
    add(prototypeSongA);
    
    //\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\ XTRA IMAGES //\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//

    copyright = new FlxSprite(150, 0).loadGraphic(Paths.image('sonicAssets/freeplay/copyright'));
    copyright.scale.set(3.215,3.215);
    copyright.antialiasing = false;
	copyright.updateHitbox();
	add(copyright);

    //\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\ DEBUG TEXT! //\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//

    bioOptionDebug = new FlxText(0, 600, 1280, '', 60);
    bioOptionDebug.setFormat(Paths.font("sonic-level-select-font.ttf"), 19, 0xFFDEFFFF, "left", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
    bioOptionDebug.antialiasing = false;
    bioOptionDebug.borderSize = 0;
    add(bioOptionDebug);

    defaultColor = 0xFFDEFFFF;

    characterText = [char0, char1, char2, char3, char4, char5];
    mortifySongs = [mortifySongA, mortifySongB, mortifySongC, mortifySongD];
    milesSongs = [milesSongA, milesSongB];
    mazinSongs = [mazinSongA];
    snickSongs = [snickSongA];
    sonichuSongs = [sonichuSongA];
    prototypeSongs = [prototypeSongA];

    bioNumber = 0;
    songNumber = 0;
    
}

function update(){
    if(bioSelect){
        for(t in mortifySongs) t.color = defaultColor;
        for(t in milesSongs) t.color = defaultColor;
        for(t in mazinSongs) t.color = defaultColor;
        for(t in snickSongs) t.color = defaultColor;
        for(t in sonichuSongs) t.color = defaultColor;
        for(t in prototypeSongs) t.color = defaultColor;
        if(FlxG.keys.justPressed.UP){
            bioNumber -= 1;
        } else if(FlxG.keys.justPressed.DOWN){
            bioNumber += 1;
        }
    } else if(songSelect) {
        if(FlxG.keys.justPressed.UP){
            songNumber -= 1;
        } else if(FlxG.keys.justPressed.DOWN){
            songNumber += 1;
        }
    }

    switch(bioNumber){
        case 0:
            if(songSelect && FlxG.keys.justPressed.ENTER){
                PlayState.loadSong(mortifySongsArray[songNumber], 'normal', false, false);
                FlxG.switchState(new PlayState());
            }
        case 1:
            if(songSelect && FlxG.keys.justPressed.ENTER){
                PlayState.loadSong(milesSongsArray[songNumber], 'normal', false, false);
                FlxG.switchState(new PlayState());
            }
        case 2:
            if(songSelect && FlxG.keys.justPressed.ENTER){
                PlayState.loadSong(mazinSongsArray[songNumber], 'normal', false, false);
                FlxG.switchState(new PlayState());
            }
        case 3:
            if(songSelect && FlxG.keys.justPressed.ENTER){
                PlayState.loadSong(snickSongsArray[songNumber], 'normal', false, false);
                FlxG.switchState(new PlayState());
            }
        case 4:
            if(songSelect && FlxG.keys.justPressed.ENTER){
                PlayState.loadSong(sonichuSongsArray[songNumber], 'normal', false, false);
                FlxG.switchState(new PlayState());
            }
        case 5:
            if(songSelect && FlxG.keys.justPressed.ENTER){
                PlayState.loadSong(prototypeSongsArray[songNumber], 'normal', false, false);
                FlxG.switchState(new PlayState());
            }
    }

    if(bioNumber > maxWeek){
        bioNumber = 0;
    } else if(bioNumber < 0){
        bioNumber = maxWeek;
    }

    if(songNumber > maxSong){
        songNumber = 0;
    } else if(songNumber < 0){
        songNumber = maxSong;
    }

    if(FlxG.keys.justPressed.RIGHT){
        songSelect = true;
        bioSelect = false;
    } else if(FlxG.keys.justPressed.LEFT) {
        songSelect = false;
        bioSelect = true;
    }

    if(songNumber != 0 && bioSelect){
        songNumber = 0;
    }

    if(songSelect){
        switch(bioNumber){
            case 0:
                maxSong = 3;
                for(t in mortifySongs) t.color = defaultColor;
                mortifySongs[songNumber].color = 0xFFFFFF00;
            case 1:
                maxSong = 1;
                for(t in milesSongs) t.color = defaultColor;
                milesSongs[songNumber].color = 0xFFFFFF00;
            case 2:
                maxSong = 0;
                for(t in mazinSongs) t.color = defaultColor;
                mazinSongs[songNumber].color = 0xFFFFFF00;
            case 3:
                maxSong = 0;
                for(t in snickSongs) t.color = defaultColor;
                snickSongs[songNumber].color = 0xFFFFFF00;
            case 4:
                maxSong = 0;
                for(t in sonichuSongs) t.color = defaultColor;
                sonichuSongs[songNumber].color = 0xFFFFFF00;
            case 5:
                maxSong = 0;
                for(t in prototypeSongs) t.color = defaultColor;
                prototypeSongs[songNumber].color = 0xFFFFFF00;
        }
    }

    for(t in characterText) t.color = defaultColor;
    defaultColor = 0xFFDEFFFF;
    characterText[bioNumber].color = 0xFFFFFF00;

    portrait.loadGraphic(Paths.image('sonicAssets/freeplay/portraits/' + portraitArray[bioNumber]));

    bioOptionDebug.text = 'CHARACTER   ' + portraitArray[bioNumber].toUpperCase() + ' \n \nSONG NUMBER   ' + songNumber;

    if(FlxG.keys.justPressed.BACKSPACE){
        FlxG.switchState(new FreeplayState());
    }
}

function keepForEmergencySHITCODE(){
    switch(bioNumber){
        case 0:
            char5.color = 0xFFDEFFFF;
            char0.color = 0xFFFFFF00;
            char1.color = 0xFFDEFFFF;
        case 1:
            char0.color = 0xFFDEFFFF;
            char1.color = 0xFFFFFF00;
            char2.color = 0xFFDEFFFF;
        case 2:
            char1.color = 0xFFDEFFFF;
            char2.color = 0xFFFFFF00;
            char3.color = 0xFFDEFFFF;
        case 3:
            char2.color = 0xFFDEFFFF;
            char3.color = 0xFFFFFF00;
            char4.color = 0xFFDEFFFF;
        case 4:
            char3.color = 0xFFDEFFFF;
            char4.color = 0xFFFFFF00;
            char5.color = 0xFFDEFFFF;
        case 5:
            char4.color = 0xFFDEFFFF;
            char5.color = 0xFFFFFF00;
            char0.color = 0xFFDEFFFF;
    }
}