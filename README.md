# IdleUp

An OpenTX widget intended for the Jumper T16 and Radiomaster TX16S which displays the current idle-up state and a percentage based throttle value, taking into account your idle value (0% = idle).

## Disclaimer

This script does not rely on telemetry. It does not reflect the actual craft's state and should not be used in situations where reliable data is critical. It is the user's responsibility to check for correct operation before use.

**IF IN DOUBT, DO NOT FLY!**

## Options

| Option    | Description                                                |
| --------- | ---------------------------------------------------------- |
| IdleUp    | Idle-up switch                                             |
| IdleUpMin | Idle-up switch min active value (-100=min; 0=mid; 100=max) |
| IdleUpMax | Idle-up switch max active value (-100=min; 0=mid; 100=max) |
| ActiveClr | Idle-up enabled text color                                 |
| LockedClr | Idle-up disabled text color                                |

## Installation

Clone or download this repository and place the folder on your radio's SD card in the `/WIDGETS/` directory.

## Usage

For the time being, this widget is intended to be used with the 8-cell layout (2 columns, 4 rows).

Simply select the widget, configure the switch you use for enabling idle-up and indicate it's "active" range.
