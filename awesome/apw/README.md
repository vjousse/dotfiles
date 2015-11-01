Note, that…
-----------
…this project is not developed any longer. It still works, though. I do not use it any more, nor do I use awesome. I am willing to merge bug fixes and improvements that do not alter the appearance or behaviour. Breaking changes in this sense, I will not merge.

You are welcome to fork this and I will add a link to it in the README.
Currently known, feature adding forks:
* [seniorivn/apw](https://github.com/seniorivn/apw)

Awesome Pulseaudio Widget
=========================

Awesome Pulseaudio Widget (APW) is a little widget for
[Awesome WM](http://awesome.naquadah.org/), using the awful progressbar widget,
to display default's sink volume and control Pulseaudio.

It's compatible with Awesome 3.5.

First time I'm using Lua. So it might be a little bit quirky.

Get it
------

```sh
cd $XDG_CONFIG_HOME/awesome/
git clone https://github.com/mokasin/apw.git
```

Use it
------

Just put these line to the appropriate places in
*$XDG_CONFIG_HOME/awesome/rc.lua*.

```lua
-- Load the widget.
local APW = require("apw/widget")

-- Example: Add to wibox. Here to the right. Do it the way you like it.
right_layout:add(APW)

-- Configure the hotkeys.
awful.key({ }, "XF86AudioRaiseVolume",  APW.Up),
awful.key({ }, "XF86AudioLowerVolume",  APW.Down),
awful.key({ }, "XF86AudioMute",         APW.ToggleMute),

```

Customize it
------------

### Theme

*Important:* `beautiful.init` must be called before you `require` apw for
theming to work.

Just add these variables to your Beautiful theme.lua file and set them
to whatever colors or gradients you wish:

```lua
--{{{ APW
theme.apw_fg_color = {type = 'linear', from = {0, 0}, to={40,0},
	stops={{0, "#CC8888"}, {.4, "#88CC88"}, {.8, "#8888CC"}}}
theme.apw_bg_color = "#333333"
theme.apw_mute_fg_color = "#CC9393"
theme.apw_mute_bg_color = "#663333"
--}}}

```

### Directly edit widget.lua

You also can customize some properties by editing the configuration variables
directly in `widget.lua` (i.e. add a margin).
It is advisable to customize the source file in an own branch. This makes it
easy to update to a new version of APW via rebasing.

Mixer
----

Right-clicking the widget launches a mixer.  By default this is `pavucontrol`,
but you can set a different command by calling SetMixer() on your APW object:

```lua
local APW = require("apw/widget")
APW:SetMixer("mixer_command -whatever")
```

### Tip
You could update the widget periodically if you'd like. In case, the volume is
changed from somewhere else.

```lua
APWTimer = timer({ timeout = 0.5 }) -- set update interval in s
APWTimer:connect_signal("timeout", APW.Update)
APWTimer:start()
```

Contributing
------------
Just fork it and file a pull request. I'll look into it.
