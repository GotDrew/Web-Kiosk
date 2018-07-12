# Web-Kiosk

### Basics
iOS app that looks for a URL in a MDM App Configuration then displays the website.
This is a bit of a jumble of found and repurposed code as its my first iOS app.

We only need the ViewController and a Property List, there are no changes to AppDelegate.

### How it works
It will check for a package config/plist built into the app, then an MDM config (see bellow) and get the URL from whichever it finds. 
I've been setting the plist URL to the company site and the MDM URL to the intended site, that way if the MDM fails for some reason the device still displays something appropriate.

There are also 2 other URL's, mostly for error checking:
1. First is set to Google, means that the app loaded but failed before running the check for MDM or plist.
2. Second is set to Example.com, meaning that there were no URL's in the MDM or plist.
These are done at different stages **before** checking the MDM or plist.

The `Reload` code is a bit ***n00b***...
The refresh function is called then directed to the load page function... I mean... 
> it *works*...
I'll fix when I learn how to do it better.

### Controls
There are 3 controls available to the app user
- Swipe left to right | `Back`
- Swipe right to left | `Forward`
- Swipe top to bottom | `Reloads the Defined URL`

### MDM Setup
MDM App Config Example from Jamf:
```
<dict>
<key>AppURL</key>
<string>https://apple.com.au</string>
</dict>
```
