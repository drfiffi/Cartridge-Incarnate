import haxe.io.Input;
import funkin.backend.utils.NdllUtil;
import sys.FileSystem;
import Sys;

import funkin.backend.utils.NativeAPI;

var notifSend = NdllUtil.getFunction("notification", "notification_send", 3);
var notifDelete = NdllUtil.getFunction("notification", "notification_delete", 0);
function sendNotif(title:String, desc:String, taskIconPath:String) {
    //the taskbar icon argument only accepts .ico files, sorry!!
    var args:Array<String>;

    #if windows //FOR WINDOWS
    notifSend(title, desc, FileSystem.absolutePath(taskIconPath));
    #elseif mac //FOR MAC
    notifSend(title, desc, FileSystem.absolutePath(taskIconPath));
    #elseif linux //FOR LINUX
    args = ["-u", "normal", title, desc]
    Sys.command("notify-send", args);
    #end
}

function onEvent(_){
    if (_.event.name == "Events") {
        var types = switch(_.event.params[0]){
            case 'Default Cam Zoom (Global)':
                defaultCamZoom = _.event.params[1];
                trace('Zoom Set');
            case 'Notification (Global)':
                #if windows
                    sendNotif(_.event.params[1], _.event.params[2], "icon.ico");
                    trace('Notification Sent');
                    window.onClose.add(function() {
                    notifDelete();
                });
                #end
            case 'Popup (Global)':
                NativeAPI.showMessageBox(_.event.params[1], _.event.params[2], 'icon.ico');
            case 'Window Name (Global)':
                window.title = _.event.params[1];
        }
    }
}