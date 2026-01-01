using Toybox.Application;
using Toybox.Application.Properties;
using Toybox.WatchUi;


class SwatchTimeView extends WatchUi.WatchFace {

    function initialize() {
        WatchFace.initialize();
    }

    // Load your resources here
    function onLayout(dc) {
        setLayout(Rez.Layouts.WatchFace(dc));
    }

    // Update the view
    function onUpdate(dc) {

        dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_WHITE);
        dc.fillRectangle(0, 0, dc.getWidth(), dc.getHeight());

        var clockTime = System.getClockTime();
        var swatchTime = new SwatchTime(Time.now());

        var beats = swatchTime.beats();
        var beatseconds = swatchTime.bitseconds();

        var symbolMode = PropertyUtils.getPropertyElseDefault(SYMBOL_PROPERTY, SYMBOL_MODE_DEFAULT);
        var symbol = SYMBOL_DEFAULT;
        var symbolFont = SYMBOL_FONT_DEFAULT;
        switch (symbolMode) {
            case SYMBOL_MODE_AT:
                symbol = SYMBOL_AT;
                symbolFont = AT_FONT;
                break;
            case SYMBOL_MODE_DOT:
                symbol = SYMBOL_DOT;
                symbolFont = BEATS_FONT;
        }

        var beatsecondsEnabled = PropertyUtils.getPropertyElseDefault(BEATSECONDS_PROPERTY, BEATSECONDS_MODE_DEFAULT);

        var width = dc.getWidth();
        var height = dc.getHeight();

        var symbolDimensions = dc.getTextDimensions(symbol, symbolFont);
        var symbolWidth = symbolDimensions[0];
        var symbolHeight = symbolDimensions[1];

        var beatsDimensions = dc.getTextDimensions(beats, BEATS_FONT);
        var beatsWidth = beatsDimensions[0];
        var beatsHeight = beatsDimensions[1];

        var beatsecondsDimensions = dc.getTextDimensions(beatseconds, BEATSECONDS_FONT);
        var beatsecondsWidth = beatsecondsDimensions[0];
        var beatsecondsHeight = beatsecondsDimensions[1];

        var totalWidth = beatsecondsEnabled ? 
                         symbolWidth + beatsWidth + beatsecondsWidth :
                         symbolWidth + beatsWidth;
        
        var currentX = (width - totalWidth) / 2;
        var centerY = height / 2;
        var baseY = 0.95 * centerY;

        dc.setColor(SYMBOL_COLOR, Graphics.COLOR_TRANSPARENT);
        dc.drawText(currentX, baseY, symbolFont, symbol, Graphics.TEXT_JUSTIFY_LEFT | Graphics.TEXT_JUSTIFY_VCENTER);
        // var symbolY = bottomY - symbolHeight / 2;
        // dc.drawText(currentX, symbolY, symbolFont, symbol, Graphics.TEXT_JUSTIFY_LEFT | Graphics.TEXT_JUSTIFY_VCENTER);

        currentX += symbolWidth;
        dc.setColor(BEATS_COLOR, Graphics.COLOR_TRANSPARENT);
        dc.drawText(currentX, baseY, BEATS_FONT, beats, Graphics.TEXT_JUSTIFY_LEFT | Graphics.TEXT_JUSTIFY_VCENTER);
        // var beatsY = bottomY - beatsHeight / 2;
        // dc.drawText(currentX, beatsY, BEATS_FONT, beats, Graphics.TEXT_JUSTIFY_LEFT | Graphics.TEXT_JUSTIFY_VCENTER);
        
        if (beatsecondsEnabled) {
            currentX += beatsWidth;
            dc.setColor(BEATSECONDS_COLOR, Graphics.COLOR_TRANSPARENT);
            // dc.drawText(currentX, centerY, BEATSECONDS_FONT, beatseconds, Graphics.TEXT_JUSTIFY_LEFT | Graphics.TEXT_JUSTIFY_VCENTER);
            var beatsecondsY = baseY + (beatsHeight - beatsecondsHeight) / 3;
            dc.drawText(currentX, beatsecondsY, BEATSECONDS_FONT, beatseconds, Graphics.TEXT_JUSTIFY_LEFT | Graphics.TEXT_JUSTIFY_VCENTER);
        }

        var showStandardTime = PropertyUtils.getPropertyElseDefault(STANDARD_TIME_PROPERTY, STANDARD_TIME_MODE_DEFAULT);

        if (showStandardTime) {
            var standardTime = Lang.format("$1$:$2$:$3$", [
                clockTime.hour.format("%d"),
                clockTime.min.format("%02d"),
                clockTime.sec.format("%02d")
            ]);

            var standardTimeY = baseY + beatsHeight/2;
            dc.setColor(STANDARD_TIME_COLOR, Graphics.COLOR_TRANSPARENT);
            dc.drawText(
                width / 2, 
                standardTimeY,
                STANDARD_TIME_FONT,
                standardTime, 
                Graphics.TEXT_JUSTIFY_CENTER
            );
        }

    }

}