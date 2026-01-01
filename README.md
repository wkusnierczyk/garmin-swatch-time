# Garmin Swatch Time

A minimalist, elegant, nerdy, typography-focused Garmin Connect IQ watch face that displays the current time as Swatch time.

![Swatch Time](resources/graphics/SwatchTimeHero2-small.png)

Available for installation from [Garmin Connect IQ Developer portal](https://apps.garmin.com/apps/89c9595b-8f78-4647-a703-2103b9f2225b) or through the Connect IQ mobile app.

> **Note**  
> Swatch Time is part of a [collection of unconventional Garmin watch faces](https://github.com/wkusnierczyk/garmin-watch-faces). It has been developed for fun, as a proof of concept, and as a learning experience.
> It is shared _as is_ as an open source project, with no commitment to long term maintenance and further feature development.
>
> Please use [issues](https://github.com/wkusnierczyk/garmin-swatch-time/issues) to provide bug reports or feature requests.  
> Please use [discussions](https://github.com/wkusnierczyk/garmin-swatch-time/discussions) for any other comments.
>
> All feedback is wholeheartedly welcome.

## Contents

* [Swatch time](#swatch-time)
* [Features](#features)
* [Fonts](#fonts)
* [Build, test, deploy](#build-test-deploy)

## Swatch time

In [Swatch Time](https://en.wikipedia.org/wiki/Swatch_Internet_Time) (also known as _Swatch internet time_), "the mean solar day is divided into 1,000 equal parts called _.beats_, meaning each .beat lasts 86.4 seconds (1.440 minutes) in standard time, and an hour lasts for approximately 42 .beats. The time of day always references the amount of time that has passed since midnight (standard time) in Biel, Switzerland."

The Garmin Swatch Time watch face displays the time as _beats_, three-digit numbers from 000 to 999.
Optionally, standard time and _beatseconds_ (one beatsecond is defined here to be 1/000 of a beat) may be enabled.
The user may also choose between two symbols for the Swatch Time: The commonly used `@` (at) or the arguably better looking `.` (dot)

> **Note**  
> The time is specific to the fixed location of **Biel, Switerland**.
> Thus the value `.500` means noon Biel time, _not_ local time at the current device location.

## Features

The Swatch Time watch face supports the following features:

|Screenshot|Description|
|-|:-|
|![](resources/graphics/SwatchTime1.png)|**Swatch time beats**<br /> By default, the watch face shows a red dot, followed by three white digits showing the Swatch time beats (remember, it's time in Biel, Switzerland).|
|![](resources/graphics/SwatchTime2.png)|**Standard time**<br /> A setting in the Customize menu enables the user to toggle the standard time display on and off. The standard time is shown below the Swatch time in smaller, dimmer font.|
|![](resources/graphics/SwatchTime3.png)|**Swatch time symbol**<br />By default, the Swatch time beats are preceded with a dot. A setting in the Customize menu allows the user to toggle between the dot and the at (@) symbol.|
|![](resources/graphics/SwatchTime4.png)|**Beatseconds**<br /> By default, Swatch time is shown as three-digit beats. A setting in the Cutomize menu allows the user to toggle the display of _beatseconds_ on an off.|


## Fonts

The Swatch Time watch face uses custom fonts:

* [Ubuntu](https://fonts.google.com/specimen/Ubuntu) for the Swatch time symbol (bols), beats (bold), beatseconds (regular), and standard time (regular).

> The development of Garmin watch faces motivated the implementation of two useful tools:
> * A TTF to FNT+PNG converter ([`ttf2bmp`](https://github.com/wkusnierczyk/ttf2bmp)).  
> Garmin watches use non-scalable fixed-size bitmap fonts, and cannot handle variable size True Type fonts directly.
> * An font scaler automation tool ([`garmin-font-scaler`](https://github.com/wkusnierczyk/garmin-font-scaler)).  
> Garmin watches come in a variety of shapes and resolutions, and bitmap fonts need to be scaled for each device proportionally to its resolution.


**Note**  
To not appear disproportionately big, the At (`@`) symbol is drawn in a slightly smaller font than the Swatch time itself.

The font development proceeded as follows:

* The fonts were downloaded from [Google Fonts](https://fonts.google.com/) as True Type  (`.ttf`) fonts.
* The fonts were converted to bitmaps as `.fnt` and `.png` pairs using the open source command-line [`ttf2bmp`](https://github.com/wkusnierczyk/ttf2bmp) converter.
* The font sizes were established to match the Garmin Fenix 7X Solar watch 280x280 pixel screen resolution.
* The fonts were then scaled proportionally to match other screen sizes available on Garmin watches using the [`garmin-font-scaler`](https://github.com/wkusnierczyk/garmin-font-scaler) tool.

The table below lists all font sizes provided for the supported screen resolutions.

| Resolution |    Shape     |    Element    |      Font      | Size |
| ---------: | :----------- | :------------ | :------------- | ---: |
|  148 x 205 | rectangle    | At            | Ubuntu bold    |   32 |
|  148 x 205 | rectangle    | Beats         | Ubuntu bold    |   42 |
|  148 x 205 | rectangle    | Beatseconds   | Ubuntu regular |   32 |
|  148 x 205 | rectangle    | Standard time | Ubuntu regular |   16 |
|  176 x 176 | semi-octagon | At            | Ubuntu bold    |   38 |
|  176 x 176 | semi-octagon | Beats         | Ubuntu bold    |   50 |
|  176 x 176 | semi-octagon | Beatseconds   | Ubuntu regular |   38 |
|  176 x 176 | semi-octagon | Standard time | Ubuntu regular |   19 |
|  215 x 180 | semi-round   | At            | Ubuntu bold    |   39 |
|  215 x 180 | semi-round   | Beats         | Ubuntu bold    |   51 |
|  215 x 180 | semi-round   | Beatseconds   | Ubuntu regular |   39 |
|  215 x 180 | semi-round   | Standard time | Ubuntu regular |   19 |
|  218 x 218 | round        | At            | Ubuntu bold    |   47 |
|  218 x 218 | round        | Beats         | Ubuntu bold    |   62 |
|  218 x 218 | round        | Beatseconds   | Ubuntu regular |   47 |
|  218 x 218 | round        | Standard time | Ubuntu regular |   23 |
|  240 x 240 | round        | At            | Ubuntu bold    |   51 |
|  240 x 240 | rectangle    | At            | Ubuntu bold    |   51 |
|  240 x 240 | round        | Beats         | Ubuntu bold    |   69 |
|  240 x 240 | rectangle    | Beats         | Ubuntu bold    |   69 |
|  240 x 240 | round        | Beatseconds   | Ubuntu regular |   51 |
|  240 x 240 | rectangle    | Beatseconds   | Ubuntu regular |   51 |
|  240 x 240 | round        | Standard time | Ubuntu regular |   26 |
|  240 x 240 | rectangle    | Standard time | Ubuntu regular |   26 |
|  260 x 260 | round        | At            | Ubuntu bold    |   56 |
|  260 x 260 | round        | Beats         | Ubuntu bold    |   74 |
|  260 x 260 | round        | Beatseconds   | Ubuntu regular |   56 |
|  260 x 260 | round        | Standard time | Ubuntu regular |   28 |
|  280 x 280 | round        | At            | Ubuntu bold    |   60 |
|  280 x 280 | round        | Beats         | Ubuntu bold    |   80 |
|  280 x 280 | round        | Beatseconds   | Ubuntu regular |   60 |
|  280 x 280 | round        | Standard time | Ubuntu regular |   30 |
|  320 x 360 | rectangle    | At            | Ubuntu bold    |   69 |
|  320 x 360 | rectangle    | Beats         | Ubuntu bold    |   91 |
|  320 x 360 | rectangle    | Beatseconds   | Ubuntu regular |   69 |
|  320 x 360 | rectangle    | Standard time | Ubuntu regular |   34 |
|  360 x 360 | round        | At            | Ubuntu bold    |   77 |
|  360 x 360 | round        | Beats         | Ubuntu bold    |  103 |
|  360 x 360 | round        | Beatseconds   | Ubuntu regular |   77 |
|  360 x 360 | round        | Standard time | Ubuntu regular |   39 |
|  390 x 390 | round        | At            | Ubuntu bold    |   84 |
|  390 x 390 | round        | Beats         | Ubuntu bold    |  111 |
|  390 x 390 | round        | Beatseconds   | Ubuntu regular |   84 |
|  390 x 390 | round        | Standard time | Ubuntu regular |   42 |
|  416 x 416 | round        | At            | Ubuntu bold    |   89 |
|  416 x 416 | round        | Beats         | Ubuntu bold    |  119 |
|  416 x 416 | round        | Beatseconds   | Ubuntu regular |   89 |
|  416 x 416 | round        | Standard time | Ubuntu regular |   45 |
|  454 x 454 | round        | At            | Ubuntu bold    |   97 |
|  454 x 454 | round        | Beats         | Ubuntu bold    |  130 |
|  454 x 454 | round        | Beatseconds   | Ubuntu regular |   97 |
|  454 x 454 | round        | Standard time | Ubuntu regular |   49 |


## Build, test, deploy

To modify and build the sources, you need to have installed:

* [Visual Studio Code](https://code.visualstudio.com/) with [Monkey C extension](https://developer.garmin.com/connect-iq/reference-guides/visual-studio-code-extension/).
* [Garmin Connect IQ SDK](https://developer.garmin.com/connect-iq/sdk/).

Consult [Monkey C Visual Studio Code Extension](https://developer.garmin.com/connect-iq/reference-guides/visual-studio-code-extension/) for how to execute commands such as `build` and `test` to the Monkey C runtime.

You can use the included `Makefile` to conveniently trigger some of the actions from the command line.

```bash
# build binaries from sources
make build

# run unit tests -- note: requires the simulator to be running
make test

# run the simulation 
make run

# clean up the project directory
make clean
```

To sideload your application to your Garmin watch, see [developer.garmin.com/connect-iq/connect-iq-basics/your-first-app](https://developer.garmin.com/connect-iq/connect-iq-basics/your-first-app/).
