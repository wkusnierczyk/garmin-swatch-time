using Toybox.Lang;
using Toybox.Time;


const HOUR_SECONDS = 60 * 60;
const DAY_SECONDS = 24 * HOUR_SECONDS;
const BEAT_SECONDS = 86.4;


module SwatchTime {

    function getSwatchTime(moment as Time.Moment) as Lang.String {
        // Get current UTC timestamp in seconds
        // Add 1 hour (3600 seconds) for BMT (UTC+1)
        // Modulo 86400 seconds per day to get seconds elapsed in the current day
        // Calculate beats: there are 86.4 seconds in 1 beat (86400 seconds / 1000 beats)
        var now = moment.value(); 
        var secondsIntoDay = (now + HOUR_SECONDS) % DAY_SECONDS;
        var beats = (secondsIntoDay / BEAT_SECONDS).toNumber();
        var swatchTime = beats.format("%03d");
        return swatchTime;
    }

}

