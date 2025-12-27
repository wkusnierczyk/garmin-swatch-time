using Toybox.WatchUi;
using Toybox.Graphics;
using Toybox.Lang;
using Toybox.System;
using Toybox.Application;
using Toybox.Application.Properties;

const BEATS_SYMBOL_COLOR = Graphics.COLOR_RED;
const SWATCH_COLOR = Graphics.COLOR_WHITE;
const STANDARD_TIME_COLOR = Graphics.COLOR_DK_GRAY;

const BEATS_SYMBOL_AT = Application.loadResource(Rez.Strings.At);
const BEATS_SYMBOL_DOT = Application.loadResource(Rez.Strings.Dot);
const BEATS_SYMBOL_DEFAULT = BEATS_SYMBOL_AT;

const SWATCH_TIME_FONT = WatchUi.loadResource(Rez.Fonts.SwatchTimeFont);
const AT_FONT = WatchUi.loadResource(Rez.Fonts.AtFont);
const STANDARD_TIME_FONT = WatchUi.loadResource(Rez.Fonts.StandardTimeFont);
const BEATS_FONT_DEFAULT = AT_FONT;

const STANDARD_TIME_YOFFSET = 40;

class SwatchTimeView extends WatchUi.WatchFace {

    function initialize() {
        WatchFace.initialize();
    }

    // Load your resources here
    function onLayout(dc) {
        setLayout(Rez.Layouts.WatchFace(dc));
    }

    // Called when this View is brought to the foreground
    function onShow() {
    }

    // Update the view
    function onUpdate(dc) {

        dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_WHITE);
        dc.fillRectangle(0, 0, dc.getWidth(), dc.getHeight());

        var currentMoment = Time.now();
        var swatchTime = SwatchTime.getSwatchTime(currentMoment);
        var clockTime = System.getClockTime();

        var beatsSymbolMode;
        try {
            beatsSymbolMode = Properties.getValue(BEATS_SYMBOL_PROPERTY);
            if (beatsSymbolMode == null) {
                beatsSymbolMode = BEATS_SYMBOL_MODE_DEFAULT;
            }
        } catch (ex) {
            beatsSymbolMode = BEATS_SYMBOL_MODE_DEFAULT;
        }

        var beatsSymbol = BEATS_SYMBOL_DEFAULT;
        var beatsFont = BEATS_FONT_DEFAULT;
        switch (beatsSymbolMode) {
            case BEATS_SYMBOL_MODE_AT:
                beatsSymbol = BEATS_SYMBOL_AT;
                beatsFont = AT_FONT;
                break;
            case BEATS_SYMBOL_MODE_DOT:
                beatsSymbol = BEATS_SYMBOL_DOT;
                beatsFont = SWATCH_TIME_FONT;
        }

        var width = dc.getWidth();
        var height = dc.getHeight();
        var beatsSymbolWidth = dc.getTextWidthInPixels(beatsSymbol, beatsFont);
        var swatchTimeWidth = dc.getTextWidthInPixels(swatchTime, SWATCH_TIME_FONT);
        var totalWidth = beatsSymbolWidth + swatchTimeWidth;
        
        var currentX = (width - totalWidth) / 2;
        var centerY = height / 2;

        dc.setColor(BEATS_SYMBOL_COLOR, Graphics.COLOR_TRANSPARENT);
        dc.drawText(currentX, centerY, beatsFont, beatsSymbol, Graphics.TEXT_JUSTIFY_LEFT | Graphics.TEXT_JUSTIFY_VCENTER);
        currentX += beatsSymbolWidth;

        dc.setColor(SWATCH_COLOR, Graphics.COLOR_TRANSPARENT);
        dc.drawText(currentX, centerY, SWATCH_TIME_FONT, swatchTime, Graphics.TEXT_JUSTIFY_LEFT | Graphics.TEXT_JUSTIFY_VCENTER);

        var showStandardTime;
        try {
            showStandardTime = Properties.getValue(STANDARD_TIME_PROPERTY);
        } catch (ex) {
            showStandardTime = STANDARD_TIME_MODE_DEFAULT;
        }

        if (showStandardTime) {
            var standardTime = Lang.format("$1$:$2$:$3$", [
                clockTime.hour.format("%d"),
                clockTime.min.format("%02d"),
                clockTime.sec.format("%02d")
            ]);

            dc.setColor(STANDARD_TIME_COLOR, Graphics.COLOR_TRANSPARENT);
            dc.drawText(
                width / 2, 
                (height / 2) + STANDARD_TIME_YOFFSET, 
                STANDARD_TIME_FONT,
                standardTime, 
                Graphics.TEXT_JUSTIFY_CENTER
            );
        }

    }

    function onHide() {
    }

    function onExitSleep() {
    }

    function onEnterSleep() {
    }

}