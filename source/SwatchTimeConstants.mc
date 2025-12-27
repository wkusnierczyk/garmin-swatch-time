using Toybox.Application;


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
