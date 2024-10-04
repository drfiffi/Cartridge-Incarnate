import funkin.backend.scripting.EventManager;
import funkin.backend.scripting.events.MenuChangeEvent;
import funkin.backend.scripting.events.NameEvent;
import funkin.menus.ModSwitchMenu;

function update(){
    if (controls.SWITCHMOD) {
        FlxG.switchState(new ModState("BoWayState"));
    } else if(FlxG.keys.pressed.SIX){
        openSubState(new ModSwitchMenu());
        persistentUpdate = false;
        persistentDraw = true;
    }
}