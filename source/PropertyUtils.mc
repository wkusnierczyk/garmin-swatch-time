using Toybox.Application.Properties;


module PropertyUtils {

    function getPropertyElseDefault(propertyName, defaultValue) {
        try {
            var value = Properties.getValue(propertyName);
            return (value != null) ? value : defaultValue;
        } catch (_) {
            return defaultValue;
        }
    }

}
