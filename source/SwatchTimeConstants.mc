using Toybox.Application;
using Toybox.Graphics;


// Settings
const CUSTOMIZE_MENU_TITLE = Application.loadResource(Rez.Strings.SwatchTime);

const STANDARD_TIME_LABEL = Application.loadResource(Rez.Strings.ShowStandardTimeTitle);
const STANDARD_TIME_PROPERTY = "ShowStandardTime";
const STANDARD_TIME_MODE_DEFAULT = false;

const BEATSECONDS_LABEL = Application.loadResource(Rez.Strings.ShowBeatsecondsTitle);
const BEATSECONDS_PROPERTY = "ShowBeatseconds";
const BEATSECONDS_MODE_DEFAULT = false;

const SYMBOL_LABEL = Application.loadResource(Rez.Strings.SymbolTitle);
const SYMBOL_PROPERTY = "BeatsSymbol";
const SYMBOL_MODE_AT = 0;
const SYMBOL_MODE_DOT = 1;
const SYMBOL_MODE_DEFAULT = SYMBOL_MODE_DOT;

const SYMBOL_COLOR = Graphics.COLOR_RED;
const BEATS_COLOR = Graphics.COLOR_WHITE;
const BEATSECONDS_COLOR = Graphics.COLOR_LT_GRAY;
const STANDARD_TIME_COLOR = Graphics.COLOR_DK_GRAY;

const SYMBOL_AT = Application.loadResource(Rez.Strings.At);
const SYMBOL_DOT = Application.loadResource(Rez.Strings.Dot);
const SYMBOL_DEFAULT = SYMBOL_AT;

const BEATS_FONT = Application.loadResource(Rez.Fonts.BeatsFont);
const BEATSECONDS_FONT = Application.loadResource(Rez.Fonts.BeatsecondsFont);
const AT_FONT = Application.loadResource(Rez.Fonts.AtFont);
const STANDARD_TIME_FONT = Application.loadResource(Rez.Fonts.StandardTimeFont);
const SYMBOL_FONT_DEFAULT = AT_FONT;
