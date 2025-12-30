using Toybox.Application;
using Toybox.Graphics;


// Settings
const CUSTOMIZE_MENU_TITLE = Application.loadResource(Rez.Strings.SwatchTime);

const STANDARD_TIME_LABEL = Application.loadResource(Rez.Strings.ShowStandardTimeTitle);
const STANDARD_TIME_PROPERTY = "ShowStandardTime";
const STANDARD_TIME_MODE_DEFAULT = false;

const BEATS_SYMBOL_LABEL = Application.loadResource(Rez.Strings.BeatsSymbolTitle);
const BEATS_SYMBOL_PROPERTY = "BeatsSymbol";
const BEATS_SYMBOL_MODE_AT = 0;
const BEATS_SYMBOL_MODE_DOT = 1;
const BEATS_SYMBOL_MODE_DEFAULT = BEATS_SYMBOL_MODE_AT;

const BEATS_SYMBOL_COLOR = Graphics.COLOR_RED;
const SWATCH_COLOR = Graphics.COLOR_WHITE;
const STANDARD_TIME_COLOR = Graphics.COLOR_DK_GRAY;

const BEATS_SYMBOL_AT = Application.loadResource(Rez.Strings.At);
const BEATS_SYMBOL_DOT = Application.loadResource(Rez.Strings.Dot);
const BEATS_SYMBOL_DEFAULT = BEATS_SYMBOL_AT;

const SWATCH_TIME_FONT = Application.loadResource(Rez.Fonts.SwatchTimeFont);
const AT_FONT = Application.loadResource(Rez.Fonts.AtFont);
const STANDARD_TIME_FONT = Application.loadResource(Rez.Fonts.StandardTimeFont);
const BEATS_FONT_DEFAULT = AT_FONT;

