using Toybox.Application.Properties;
using Toybox.WatchUi;


class SwatchTimeSettingsMenu extends WatchUi.Menu2 {

    function initialize() {

        Menu2.initialize({:title=>CUSTOMIZE_MENU_TITLE});

        var beatsecondsEnabled = PropertyUtils.getPropertyElseDefault(BEATSECONDS_PROPERTY, BEATSECONDS_MODE_DEFAULT);
        addItem(new WatchUi.ToggleMenuItem(
            BEATSECONDS_LABEL, 
            null, 
            BEATSECONDS_PROPERTY, 
            beatsecondsEnabled, 
            null
        ));

        var standardTimeEnabled = PropertyUtils.getPropertyElseDefault(STANDARD_TIME_PROPERTY, STANDARD_TIME_MODE_DEFAULT);
        addItem(new WatchUi.ToggleMenuItem(
            STANDARD_TIME_LABEL, 
            null, 
            STANDARD_TIME_PROPERTY, 
            standardTimeEnabled, 
            null
        ));

        var symbolMode = PropertyUtils.getPropertyElseDefault(SYMBOL_PROPERTY, SYMBOL_MODE_DEFAULT);
        var symbol =
            (symbolMode == SYMBOL_MODE_AT) 
            ? Application.loadResource(Rez.Strings.SymbolOptionAt) 
            : Application.loadResource(Rez.Strings.SymbolOptionDot);
        addItem(new WatchUi.MenuItem(
            SYMBOL_LABEL, 
            symbol, 
            SYMBOL_PROPERTY, 
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
        
        if (id.equals(BEATSECONDS_PROPERTY) && item instanceof WatchUi.ToggleMenuItem) {
            Properties.setValue(BEATSECONDS_PROPERTY, item.isEnabled());
        }
        
        if (id.equals(STANDARD_TIME_PROPERTY) && item instanceof WatchUi.ToggleMenuItem) {
            Properties.setValue(STANDARD_TIME_PROPERTY, item.isEnabled());
        }
        
        if (id.equals(SYMBOL_PROPERTY)) {
            var currentMode = PropertyUtils.getPropertyElseDefault(SYMBOL_PROPERTY, SYMBOL_MODE_DEFAULT);
            var newMode = (currentMode +1) % 2;
            Properties.setValue(SYMBOL_PROPERTY, newMode);
            if (newMode == SYMBOL_MODE_AT) {
                item.setSubLabel(Application.loadResource(Rez.Strings.SymbolOptionAt));
            } else {
                item.setSubLabel(Application.loadResource(Rez.Strings.SymbolOptionDot));
            }
        }

    }

    function onBack() {
        WatchUi.popView(WatchUi.SLIDE_IMMEDIATE);
    }

}