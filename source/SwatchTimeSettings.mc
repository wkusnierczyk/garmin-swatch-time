using Toybox.Application.Properties;
using Toybox.WatchUi;


class SwatchTimeSettingsMenu extends WatchUi.Menu2 {

    function initialize() {

        Menu2.initialize({:title=>CUSTOMIZE_MENU_TITLE});

        var standardTimeEnabled = PropertyUtils.getPropertyElseDefault(STANDARD_TIME_PROPERTY, STANDARD_TIME_MODE_DEFAULT);
        addItem(new WatchUi.ToggleMenuItem(
            STANDARD_TIME_LABEL, 
            null, 
            STANDARD_TIME_PROPERTY, 
            standardTimeEnabled, 
            null
        ));

        var beatsSymbolMode = PropertyUtils.getPropertyElseDefault(BEATS_SYMBOL_PROPERTY, BEATS_SYMBOL_MODE_DEFAULT);
        var beatsSymbol =
            (beatsSymbolMode == BEATS_SYMBOL_MODE_AT) 
            ? Application.loadResource(Rez.Strings.BeatsSymbolOptionAt) 
            : Application.loadResource(Rez.Strings.BeatsSymbolOptionDot);
        addItem(new WatchUi.MenuItem(
            BEATS_SYMBOL_LABEL, 
            beatsSymbol, 
            BEATS_SYMBOL_PROPERTY, 
            null
        ));
        
    }

}


class SwatchTimeSettingsDelegate extends WatchUi.Menu2InputDelegate {

    function initialize() {
        Menu2InputDelegate.initialize();
    }

    function onSelect(item) {
        var id = item.getId();
        if (id.equals(STANDARD_TIME_PROPERTY) && item instanceof WatchUi.ToggleMenuItem) {
            Properties.setValue(STANDARD_TIME_PROPERTY, item.isEnabled());
        }
        if (id.equals(BEATS_SYMBOL_PROPERTY)) {
            var currentMode = PropertyUtils.getPropertyElseDefault(BEATS_SYMBOL_PROPERTY, BEATS_SYMBOL_MODE_DEFAULT);
            var newMode = (currentMode +1) % 2;
            Properties.setValue(BEATS_SYMBOL_PROPERTY, newMode);
            if (newMode == BEATS_SYMBOL_MODE_AT) {
                item.setSubLabel(Application.loadResource(Rez.Strings.BeatsSymbolOptionAt));
            } else {
                item.setSubLabel(Application.loadResource(Rez.Strings.BeatsSymbolOptionDot));
            }
        }
    }

    function onBack() {
        WatchUi.popView(WatchUi.SLIDE_IMMEDIATE);
    }

}