import funkin.backend.utils.NativeAPI;
import openfl.system.Capabilities;
import funkin.backend.utils.NdllUtil;
import lime.graphics.Image;
import sys.FileSystem;

static var initialized:Bool = false;

static var redirectStates:Map<FlxState, String> = [
    FreeplayState => "NightmareSelectState",
    StoryMenuState => "BoWayState"
];

function preStateSwitch() {
    FlxG.camera.bgColor = 0xFF000000;
		for (redirectState in redirectStates.keys())
			if (FlxG.game._requestedState is redirectState)
				FlxG.game._requestedState = new ModState(redirectStates.get(redirectState));
}

function update(){
    if(FlxG.save.data.DevMode){
        if(FlxG.keys.justPressed.P && FlxG.keys.pressed.W){
            FlxG.switchState(new MainMenuState());
        } else if(FlxG.keys.justPressed.M && FlxG.keys.pressed.W){
            FlxG.switchState(new ModState("FreeplaySonicState"));
        } else if(FlxG.keys.pressed.N && FlxG.keys.pressed.W){
            FlxG.switchState(new ModState("BoWayState"));
        }
    }
}