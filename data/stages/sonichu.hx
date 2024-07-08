function onEvent(_){
    if (_.event.name == "Events") {
        var types = switch(_.event.params[0]){
            case 'Foot Kisser (Sonichu)':
                foot = new FlxSprite(0, 0).loadGraphic(Paths.image('stages/sonichu/footsy1'));
                foot.cameras = [camHUD];
                foot.scale.set(0.7, 0.7);
	            add(foot);

                FlxTween.tween(foot, {alpha: 0}, 1.2, {ease: FlxEase.linear});
                FlxTween.tween(foot.scale, {x: 0.3, y: 0.3}, 1, {ease: FlxEase.quadOut});
        }
    }
}

function update(){
    foot.screenCenter();
}