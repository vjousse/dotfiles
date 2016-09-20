--[[
     Starbreaker Awesome WM config 0.1
     github.com/demifiend

     Based on...

     Multicolor Awesome WM config 2.0 
     github.com/copycat-killer                              
--]]

theme                               = {}

theme.confdir                       = os.getenv("HOME") .. "/.config/awesome/themes/starbreaker"
--theme.wallpaper                     = theme.confdir .. "/wall.jpg"
theme.wallpaper                     = theme.confdir .. "/journey.jpg"

theme.font                          = "Inconsolata 12"
--theme.taglist_font                =
theme.menu_bg_normal                = "#073642"
theme.menu_bg_focus                 = "#002b36"
theme.bg_normal                     = "#073642"
theme.bg_focus                      = "#002b36"
theme.bg_urgent                     = "#586e75"
theme.fg_normal                     = "#eee8d5"
theme.fg_focus                      = "#fdf6e3"
theme.fg_urgent                     = "#93a1a1"
theme.fg_minimize                   = "#839496"
theme.fg_black                      = "#002b36"
theme.fg_red                        = "#dc322f"
theme.fg_green                      = "#859900"
theme.fg_yellow                     = "#b58900"
theme.fg_blue                       = "#268bd2"
theme.fg_magenta                    = "#d33682"
theme.fg_cyan                       = "#2aa198"
theme.fg_white                      = theme.fg_focus
theme.fg_blu                        = theme.fg_blue
theme.border_width                  = "0"
theme.border_normal                 = theme.fg_normal
theme.border_focus                  = theme.fg_focus
theme.border_marked                 = theme.fg_red
theme.menu_width                    = "150"
theme.menu_border_width             = "0"
theme.menu_fg_normal                = theme.fg_normal
theme.menu_fg_focus                 = theme.fg_focus

theme.submenu_icon                  = theme.confdir .. "/icons/submenu.png"
theme.widget_temp                   = theme.confdir .. "/icons/temp.png"
theme.widget_uptime                 = theme.confdir .. "/icons/ac.png"
theme.widget_cpu                    = theme.confdir .. "/icons/cpu.png"
theme.widget_weather                = theme.confdir .. "/icons/dish.png"
theme.widget_fs                     = theme.confdir .. "/icons/fs.png"
theme.widget_mem                    = theme.confdir .. "/icons/mem.png"
theme.widget_fs                     = theme.confdir .. "/icons/fs.png"
theme.widget_note                   = theme.confdir .. "/icons/note.png"
theme.widget_note_on                = theme.confdir .. "/icons/note_on.png"
theme.widget_netdown                = theme.confdir .. "/icons/net_down.png"
theme.widget_netup                  = theme.confdir .. "/icons/net_up.png"
theme.widget_mail                   = theme.confdir .. "/icons/mail.png"
theme.widget_batt                   = theme.confdir .. "/icons/bat.png"
theme.widget_clock                  = theme.confdir .. "/icons/clock.png"
theme.widget_vol                    = theme.confdir .. "/icons/spkr.png"

theme.taglist_squares_sel           = theme.confdir .. "/icons/square_a.png"
theme.taglist_squares_unsel         = theme.confdir .. "/icons/square_b.png"

theme.tasklist_disable_icon         = true
theme.tasklist_floating             = ""
theme.tasklist_maximized_horizontal = ""
theme.tasklist_maximized_vertical   = ""

theme.layout_tile                   = theme.confdir .. "/icons/tile.png"
theme.layout_tilegaps               = theme.confdir .. "/icons/tilegaps.png"
theme.layout_tileleft               = theme.confdir .. "/icons/tileleft.png"
theme.layout_tilebottom             = theme.confdir .. "/icons/tilebottom.png"
theme.layout_tiletop                = theme.confdir .. "/icons/tiletop.png"
theme.layout_fairv                  = theme.confdir .. "/icons/fairv.png"
theme.layout_fairh                  = theme.confdir .. "/icons/fairh.png"
theme.layout_spiral                 = theme.confdir .. "/icons/spiral.png"
theme.layout_dwindle                = theme.confdir .. "/icons/dwindle.png"
theme.layout_max                    = theme.confdir .. "/icons/max.png"
theme.layout_fullscreen             = theme.confdir .. "/icons/fullscreen.png"
theme.layout_magnifier              = theme.confdir .. "/icons/magnifier.png"
theme.layout_floating               = theme.confdir .. "/icons/floating.png"


return theme
