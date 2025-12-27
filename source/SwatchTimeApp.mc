using Toybox.Application;

class SwatchTimeApp extends Application.AppBase {

    function initialize() {
        AppBase.initialize();
    }

    function getInitialView() {
        return [ new SwatchTimeView() ];
    }

    function onSettingsChanged() as Void {
        WatchUi.requestUpdate();
    }

    function getSettingsView() {
        return [ new SwatchTimeSettingsMenu(), new SwatchTimeSettingsDelegate() ];
    }

}