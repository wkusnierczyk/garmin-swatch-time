using Toybox.Graphics;
using Toybox.Time;

import Toybox.Lang;


// TODO: move constants to Constants?
const SECONDS_PER_MINUTE = 60;
const MINUTES_PER_HOUR = 60;
const SECONDS_PER_HOUR = MINUTES_PER_HOUR * SECONDS_PER_MINUTE;
const HOURS_PER_DAY = 24;
const SECONDS_PER_DAY = HOURS_PER_DAY * SECONDS_PER_HOUR;
const BEATS_PER_DAY = 1000;
const SECONDS_PER_BEAT = SECONDS_PER_DAY.toFloat() / BEATS_PER_DAY.toFloat();
const BITSECONDS_PER_BEAT = 100;

class SwatchTime {

    private var _time as Float;
    private var _beats as Number;
    private var _bitseconds as Number;

    public function initialize(moment as Time.Moment) {
        // Get current UTC timestamp in seconds
        // Add 1 hour (3600 seconds) for BMT (UTC+1)
        // Modulo 86400 seconds per day to get seconds elapsed in the current day
        // Calculate swatch time: there are 86.4 seconds in 1 beat (86400 seconds / 1000 beats)
        // Beats: the integer part of the swatch time
        // Beatseconds: the first two decimals of the swatch time
        var now = moment.value(); 
        var secondsIntoDay = (now + SECONDS_PER_HOUR) % SECONDS_PER_DAY;
        _time = (secondsIntoDay.toFloat() / SECONDS_PER_BEAT);
        _beats = _time.toNumber();
        _bitseconds = ((_time - _beats) * 100).toNumber();
    }

    public function beats() {
        return _beats.format("%03d");
    }

    public function bitseconds() {
        return _bitseconds.format("%02d");
    }

}
