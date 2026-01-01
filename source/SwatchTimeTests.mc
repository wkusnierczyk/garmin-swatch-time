using Toybox.Application;
using Toybox.Time;

import Toybox.Lang;


const SWATCH_TIME_TESTS_ID = "SwatchTimeTests";

const TEST_NAME = "name";
const TEST_INPUT = "input";
const TEST_EXPECTED = "expected";

const SWATCH_TIME_TEST_ERROR_TEMPLATE = "Test '$1$ failed: expected '$2$', got '$3$'";


(:test)
function testSwatchTime(logger) {

    var testCases = Application.loadResource(Rez.JsonData.SwatchTimeTests) as Array<Dictionary>;
    for (var i = 0; i < testCases.size(); ++i) {
        var testCase = testCases[i] as Dictionary<String, String>;
        var name = testCase[TEST_NAME] as String;
        var input = new Time.Moment(testCase[TEST_INPUT].toNumber());
        var expected = testCase[TEST_EXPECTED] as String;
        // var beats = SwatchTime.getSwatchTime(input) as String;
        var beats = new SwatchTime(input).beats();
        if (!beats.equals(expected)) {
            var message = Lang.format(SWATCH_TIME_TEST_ERROR_TEMPLATE, [name, expected, beats]);
            logger.error(message);
            return false;
        }
    }
    return true;

}
