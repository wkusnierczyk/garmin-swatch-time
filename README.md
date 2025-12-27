# Garmin Swatch Time

A minimalist, elegant, typography-focused Garmin Connect IQ watch face that displays the current time as Swatch time.

![Swatch time](resources/graphics/swatch-time-dot.png)
![Swatch time](resources/graphics/swatch-time-dot-standard-time.png)
![Swatch time](resources/graphics/swatch-time-at.png)


## Contents

* [Swatch time](#swatch-time)
* [Project structure](#project-structure)
* [Build, test, deploy](#build-test-deploy)

## Swatch time

In [Swatch Time](https://en.wikipedia.org/wiki/Swatch_Internet_Time) (also known as _Swatch internet time_), "the mean solar day is divided into 1,000 equal parts called _.beats_, meaning each .beat lasts 86.4 seconds (1.440 minutes) in standard time, and an hour lasts for approximately 42 .beats. The time of day always references the amount of time that has passed since midnight (standard time) in Biel, Switzerland."

The Garmin Swatch Time watch face displays the time as `.beats`, 0-999.
Optionally, the user may turn on standard time, displayed in smaller font below the decimal time, using on-watch customization settings.
The user may also choose between two symbols for the _beats_: `@` (at) or `.` (dot)

**Note**  
The time is specific to the fixed location of Biel, Switerland.
Thus the value `.500` means noon Biel time, not watch local time.

The watch face uses custom fonts.
The font presented here is [Ubuntu](https://fonts.google.com/specimen/Ubuntu), available from [Google Fonts](https://fonts.google.com/) as a True Type font (`ttf`).
It has been converted to a bitmap font (`bmp`, `fnt`) using the open source command-line [`ttf2bmp`](https://github.com/wkusnierczyk/ttf2bmp) converter.


## Project structure

```bash
SwatchTime
├── LICENSE                        # MIT license
├── Makefile                       # Convenience makefile
├── manifest.xml
├── monkey.jungle
├── README.md
├── resources
│   ├── drawables
│   │   ├── drawables.xml
│   │   └── launcher_icon.svg
│   ├── fonts
│   │   ├── fonts.xml              # Font map 
│   │   └── [ttf, fnt, png fonts]  # Source (ttf) and converted (fnt, png) fonts
│   ├── layouts
│   │   └── layout.xml
│   └── strings
│       └── strings.xml
└── source
    ├── SwatchTime.mc
    ├── SwatchTimeApp.mc
    ├── SwatchTimeView.mc
    └── SwatchTimeSettings.mc
```

## Build, test, deploy

To modify and build the sources, you need to have installed:

* [Visual Studio Code](https://code.visualstudio.com/) with [Monkey C extension](https://developer.garmin.com/connect-iq/reference-guides/visual-studio-code-extension/).
* [Garmin Connect IQ SDK](https://developer.garmin.com/connect-iq/sdk/).

Consult [Monkey C Visual Studio Code Extension](https://developer.garmin.com/connect-iq/reference-guides/visual-studio-code-extension/) for how to execute commands such as `build` and `test` to the Monkey C runtime.

You can use the included `Makefile` to conveniently trigger some of the actions from the command line.

```bash
# build binaries from sources
make build

# run unit tests
make test

# run the simulation
make run
```

To sideload your application to your Garmin watch, see [developer.garmin.com/connect-iq/connect-iq-basics/your-first-app](https://developer.garmin.com/connect-iq/connect-iq-basics/your-first-app/).
