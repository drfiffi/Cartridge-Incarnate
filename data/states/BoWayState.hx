function create(){
	bg = new FlxSprite(150, 0);
	bg.frames = Paths.getSparrowAtlas('sonicAssets/BoWayState/noWAY');
	bg.animation.addByPrefix('lol', "noway", 4);
	bg.animation.play('lol');
    bg.scale.set(3.215,3.215);
	bg.updateHitbox();
	add(bg);
}

function update(){
    if(FlxG.keys.justPressed.BACKSPACE){
        FlxG.switchState(new MainMenuState());
    }
}