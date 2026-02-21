# In /etc/nixos/configuration.nix
{
  config,
  pkgs,
  lib,
  ...
}:

{
  home.file.".config/mango/config.conf".text = ''
    # ===============================================
    # WORKSPACE LAYOUT CONFIGURATION
    # ===============================================
    # Sets default layout for workspaces 1-9 as tiled layout
    tagrule=id:1,layout_name:tile
    tagrule=id:2,layout_name:tile
    tagrule=id:3,layout_name:tile
    tagrule=id:4,layout_name:tile
    tagrule=id:5,layout_name:tile
    tagrule=id:6,layout_name:tile
    tagrule=id:7,layout_name:tile
    tagrule=id:8,layout_name:tile
    tagrule=id:9,layout_name:tile

    # ===============================================
    # WORKSPACE NAVIGATION (Ctrl + Number)
    # ===============================================
    # Switch to specific workspace
    bind=Ctrl,1,view,1,0
    bind=Ctrl,2,view,2,0
    bind=Ctrl,3,view,3,0
    bind=Ctrl,4,view,4,0
    bind=Ctrl,5,view,5,0
    bind=Ctrl,6,view,6,0
    bind=Ctrl,7,view,7,0
    bind=Ctrl,8,view,8,0
    bind=Ctrl,9,view,9,0

    # ===============================================
    # WORKSPACE OVERVIEW (Super + Number)
    # ===============================================
    # Show overview of specific workspace
    bind=SUPER,1,comboview,1
    bind=SUPER,2,comboview,2
    bind=SUPER,3,comboview,3
    bind=SUPER,4,comboview,4
    bind=SUPER,5,comboview,5
    bind=SUPER,6,comboview,6
    bind=SUPER,7,comboview,7
    bind=SUPER,8,comboview,8
    bind=SUPER,9,comboview,9

    # ===============================================
    # WORKSPACE SWITCHING (Arrow Keys)
    # ===============================================
    # Navigate workspaces left/right
    bind=SUPER,Left,viewtoleft,0
    bind=CTRL,Left,viewtoleft_have_client,0
    bind=SUPER,Right,viewtoright,0
    bind=CTRL,Right,viewtoright_have_client,0
    bind=SHIFT+SUPER,Left,tagtoleft,0
    bind=SHIFT+SUPER,Right,tagtoright,0

    # ===============================================
    # WINDOW TAGGING (Alt + Number)
    # ===============================================
    # Move focused window to workspace and follow it
    bind=Alt,1,tag,1,0
    bind=Alt,2,tag,2,0
    bind=Alt,3,tag,3,0
    bind=Alt,4,tag,4,0
    bind=Alt,5,tag,5,0
    bind=Alt,6,tag,6,0
    bind=Alt,7,tag,7,0
    bind=Alt,8,tag,8,0
    bind=Alt,9,tag,9,0

    # ===============================================
    # WINDOW FOCUS NAVIGATION
    # ===============================================
    # Cycle through windows and directional focus
    bind=ALT,Tab,focusstack,next
    bind=ALT,Left,focusdir,left
    bind=ALT,Right,focusdir,right
    bind=ALT,Up,focusdir,up
    bind=ALT,Down,focusdir,down

    # ===============================================
    # WINDOW MOVEMENT & SWAPPING
    # ===============================================
    # Swap focused window with adjacent windows
    bind=ALT+SHIFT,Up,exchange_client,up
    bind=ALT+SHIFT,Down,exchange_client,down
    bind=ALT+SHIFT,Left,exchange_client,left
    bind=ALT+SHIFT,Right,exchange_client,right

    # ===============================================
    # WINDOW MOVEMENT (Keyboard)
    # ===============================================
    # Move floating windows by pixels
    bind=CTRL+SHIFT,Up,movewin,+0,-50
    bind=CTRL+SHIFT,Down,movewin,+0,+50
    bind=CTRL+SHIFT,Left,movewin,-50,+0
    bind=CTRL+SHIFT,Right,movewin,+50,+0

    # ===============================================
    # WINDOW RESIZING (Keyboard)
    # ===============================================
    # Resize floating windows by pixels
    bind=CTRL+ALT,Up,resizewin,+0,-50
    bind=CTRL+ALT,Down,resizewin,+0,+50
    bind=CTRL+ALT,Left,resizewin,-50,+0
    bind=CTRL+ALT,Right,resizewin,+50,+0

    # ===============================================
    # WINDOW STATE TOGGLES
    # ===============================================
    # Toggle window states and modes
    bind=SUPER,g,toggleglobal,
    bind=SUPER,Tab,toggleoverview,
    bind=ALT,backslash,togglefloating,
    bind=ALT,m,togglemaximizescreen,
    bind=ALT,f,togglefullscreen,
    bind=ALT+SHIFT,f,togglefakefullscreen,
    bind=SUPER,i,minimized,
    bind=SUPER,o,toggleoverlay,
    bind=SUPER+SHIFT,I,restore_minimized
    bind=ALT,z,toggle_scratchpad

    # ===============================================
    # LAYOUT & PROPORTION CONTROLS
    # ===============================================
    # Layout manipulation
    bind=ALT,e,set_proportion,1.0
    bind=ALT,x,switch_proportion_preset,
    bind=SUPER,n,switch_layout

    # ===============================================
    # GAPS MANAGEMENT
    # ===============================================
    # Adjust window gaps
    bind=ALT+SHIFT,X,incgaps,1
    bind=ALT+SHIFT,Z,incgaps,-1
    bind=ALT+SHIFT,R,togglegaps

    # ===============================================
    # WINDOW MANAGEMENT & EXIT
    # ===============================================
    # Quit actions
    # bind=SUPER,m,quit
    bind=SUPER,q,killclient,

    # ===============================================
    # CONFIG & LAUNCHER SHORTCUTS
    # ===============================================
    # Reload configuration
    bind=SUPER,r,reload_config

    # Launchers and apps
    bind=SUPER,Return,spawn,kitty
    bind=SUPER,w,spawn,firefox

    # ===============================================
    # MOUSE BINDINGS
    # ===============================================
    # Super + Drag: Move window
    mousebind=SUPER,btn_left,moveresize,curmove
    # Middle click: Toggle maximize
    mousebind=NONE,btn_middle,togglemaximizescreen,0
    # Super + Drag: Resize window  
    mousebind=SUPER,btn_right,moveresize,curresize
    # Overview mode mouse controls
    mousebind=NONE,btn_left,toggleoverview,1
    mousebind=NONE,btn_right,killclient,0

    # ===============================================
    # GESTURES AND AXIS BINDINGS (Touchpad/Trackpad)
    # ===============================================
    axisbind=SUPER,UP,viewtoleft_have_client
    axisbind=SUPER,DOWN,viewtoright_have_client

    # 3-finger: Window focus
    gesturebind=none,right,4,focusdir,left
    gesturebind=none,left,4,focusdir,right
    gesturebind=none,up,3,focusdir,down
    gesturebind=none,down,3,focusdir,up

    # 4-finger: Workspace navigation
    gesturebind=none,right,3,viewtoleft_have_client
    gesturebind=none,left,3,viewtoright_have_client
    gesturebind=none,up,4,toggleoverview
    gesturebind=none,down,4,toggleoverview

    # ===============================================
    # LAPTOP FUNCTION KEYS (F-Keys & Multimedia)
    # ===============================================
    # Audio controls
    bindl=NONE,XF86AudioMute,spawn_shell,dms ipc call audio mute #pamixer --toggle-mute
    bindl=NONE,XF86AudioRaiseVolume,spawn_shell,dms ipc call audio increment 5 #pamixer -i 5
    bindl=NONE,XF86AudioLowerVolume,spawn_shell,dms ipc call audio decrement 5 #pamixer -d 5
    bindl=NONE,XF86AudioPlay,spawn_shell,dms ipc call mpris playPause

    # Brightness controls
    bindl=NONE,XF86MonBrightnessUp,spawn_shell,dms ipc call brightness increment 5 ""
    bindl=NONE,XF86MonBrightnessDown,spawn_shell,dms ipc call brightness decrement 5 ""

    # ===============================================
    # DMS IPC
    # ===============================================
    # Theme and display toggles
    bind=SUPER,t,spawn_shell,dms ipc call theme toggle
    bind=SUPER+SHIFT,s,spawn_shell,dms ipc call inhibit toggle

    # Bar and launcher controls
    bind=SUPER,b,spawn_shell,dms ipc call bar toggle index 0
    bind=ALT,space,spawn_shell,dms ipc call spotlight toggle

    # Clipboard management
    bind=SUPER,v,spawn_shell,dms ipc call clipboard toggle

    # Notifications management
    bind=SUPER+SHIFT,N,spawn_shell,dms ipc call notifications open
    bind=SUPER+SHIFT,C,spawn_shell,dms ipc call notifications clearAll
    bind=SUPER+SHIFT,X,spawn_shell,dms ipc call notifications dismissAllPopups

    # Power and system menus
    bind=SUPER,Escape,spawn_shell,dms ipc call powermenu toggle
    bind=SUPER,C,spawn_shell,dms ipc call control-center toggle

    # Utility windows
    bind=SUPER+SHIFT,P,spawn_shell,dms ipc call processlist open
    bind=SUPER,E,spawn_shell,dms ipc call notepad open

    # Dash controls
    bind=SUPER,d,spawn_shell,dms ipc call dash open "overview"
    bind=SUPER+SHIFT,w,spawn_shell,dms ipc call dash open "wallpaper"

    # Keybind overlays
    bind=SUPER+SHIFT,K,spawn_shell,dms ipc call keybinds toggle mangowc

    # ===============================================
    # MONITOR & DISPLAY CONFIG
    # ===============================================
    # Main display configuration (3840x2400 laptop screen)
    monitorrule=name:eDP-1,width:3840,height:2400,scale:1.4,x:0,y:0,refresh:60

    # ===============================================
    # AUTOSTART & APPEARANCE
    # ===============================================
    # Run autostart script on login
    # exec-once=~/.config/mango/autostart.sh
    exec-once=dms run

    # Visual settings
    border_radius=6
    no_radius_when_single=0
    focused_opacity=1.0
    unfocused_opacity=0.8
    trackpad_natural_scrolling=1
    cursor_size=30

    # ===============================================
    # ENVIRONMENT VARIABLES
    # ===============================================
    # Cursor theme
    env=XCURSOR_SIZE,30

    # Qt applications (Wayland/X11 compatibility)
    # env=QT_QPA_PLATFORMTHEME,qt5ct
    env=QT_QPA_PLATFORMTHEME,gtk3
    env=QT_AUTO_SCREEN_SCALE_FACTOR,1
    env=QT_QPA_PLATFORM,Wayland;xcb
    env=QT_WAYLAND_FORCE_DPI,100


    source=./dms/cursor.conf
    source=./dms/colors.conf
  '';

  # Use xdg.configFile for standard XDG paths (e.g. ~/.config/...)
  # xdg.configFile."anotherapp/config".source = ./files/anotherapp_config;

  # ... other home-manager options
}
