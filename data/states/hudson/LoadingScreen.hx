function create(){
    var bg:FlxSprite = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, 0xFF000000);
	bg.scrollFactor.set();
	add(bg);

    finishTiming = new FlxTimer().start(2, function(timer){
        close();
    });
}