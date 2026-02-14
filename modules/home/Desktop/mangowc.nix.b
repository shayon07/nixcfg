{
  pkgs,
  ...
}:
# todo: mango wrapper: runtime applications for auto start
# todo: mango wrapper: windowrules for the below applications
let
  # ============================================
  # AUTOSTART APPLICATIONS
  # ============================================
  autostart = ''
    exec-once=~/.config/mango/autostart.sh
  '';

  # ============================================
  # ENVIRONMENT & CURSOR
  # ============================================
  environment = ''
    monitorrule=name:eDP-1,width:3840,height:2400,scale:1.4,x:0,y:0,refresh:60
    env=XCURSOR_SIZE,30
    env=QT_QPA_PLATFORMTHEME,qt5ct
    env=QT_AUTO_SCREEN_SCALE_FACTOR,1
    env=QT_QPA_PLATFORM,Wayland;xcb
    env=QT_WAYLAND_FORCE_DPI,100
  '';

  # ============================================
  # GAMEMODE SETTINGS - Toggle these manually
  # ============================================
  # Normal Mode: animations=1, blur=1, opacity=0.9/0.8, radius=6, border=4, gaps=5/5/10/10
  # Game Mode:   animations=0, blur=0, opacity=1.0/1.0, radius=0, border=1, gaps=0/0/0/0
  # After editing, rebuild with: nixos-rebuild switch
  gamemode = ''
    animations=0              # Game mode: 0
    layer_animations=0        # Game mode: 0
    blur=0                    # Game mode: 0
    focused_opacity=1         # Game mode: 1.0
    unfocused_opacity=1       # Game mode: 1.0
    border_radius=0           # Game mode: 0
    borderpx=1                # Game mode: 0
    gappih=0                  # Game mode: 0
    gappiv=0                  # Game mode: 0
    gappoh=0                  # Game mode: 0
    gappov=0                  # Game mode: 0
  '';

  # ============================================
  # ANIMATIONS
  # ============================================
  # Animation Configuration (support type: zoom, slide)
  # tag_animation_direction: 0-horizontal, 1-vertical
  animations = ''
    animation_type_open=slide
    animation_type_close=slide
    animation_fade_in=1
    animation_fade_out=1
    tag_animation_direction=1
    zoom_initial_ratio=0.3
    zoom_end_ratio=0.8
    fadein_begin_opacity=0.5
    fadeout_begin_opacity=0.8
    animation_duration_move=500
    animation_duration_open=400
    animation_duration_tag=350
    animation_duration_close=800
    animation_duration_focus=0
    animation_curve_open=0.46,1.0,0.29,1
    animation_curve_move=0.46,1.0,0.29,1
    animation_curve_tag=0.46,1.0,0.29,1
    animation_curve_close=0.08,0.92,0,1
    animation_curve_focus=0.46,1.0,0.29,1
  '';

  # ============================================
  # APPEARANCE & VISUAL EFFECTS
  # ============================================
  appearance = ''
    # Blur settings
    blur_layer=0
    blur_optimized=1
    blur_params_num_passes = 2
    blur_params_radius = 5
    blur_params_noise = 0.02
    blur_params_brightness = 0.9
    blur_params_contrast = 0.9
    blur_params_saturation = 1.2

    # Shadow settings
    shadows = 0
    layer_shadows = 0
    shadow_only_floating = 1
    shadows_size = 10
    shadows_blur = 15
    shadows_position_x = 0
    shadows_position_y = 0
    shadowscolor= 0x000000ff

    # Border and radius settings
    no_radius_when_single=0

    # Colors
    rootcolor=0x201b14ff
    bordercolor=0x444444ff
    focuscolor=0xc9b890ff
    maximizescreencolor=0x89aa61ff
    urgentcolor=0xad401fff
    scratchpadcolor=0x516c93ff
    globalcolor=0xb153a7ff
    overlaycolor=0x14a57cff

    # Scratchpad
    scratchpad_width_ratio=1
    scratchpad_height_ratio=1
  '';

  # ============================================
  # LAYOUT SETTINGS
  # ============================================
  layouts = ''
    # Scroller Layout Setting
    scroller_structs = 8
    scroller_default_proportion = 0.9
    scroller_focus_center = 1
    scroller_prefer_center = 1
    edge_scroller_pointer_focus = 1
    scroller_ignore_proportion_single = 0
    scroller_default_proportion_single = 1.0
    scroller_proportion_preset = 0.7,0.9,1.0

    # Master-Stack Layout Setting
    new_is_master=1
    default_mfact=0.5
    default_nmaster=1
    smartgaps=0

    # Overview Setting
    ov_tab_mode=1
    overviewgappi=5
    overviewgappo=15
  '';

  # ============================================
  # INPUT DEVICES
  # ============================================
  input = ''
    # Keyboard
    repeat_rate=25
    repeat_delay=600
    numlockon=0
    xkb_rules_layout=us

    # Trackpad (need relogin to make it apply)
    disable_trackpad=0
    tap_to_click=1
    tap_and_drag=1
    drag_lock=1
    trackpad_natural_scrolling=1
    disable_while_typing=1
    left_handed=0
    middle_button_emulation=0
    swipe_min_threshold=1

    # Mouse (need relogin to make it apply)
    mouse_natural_scrolling=0
  '';

  # ============================================
  # WINDOW BEHAVIOR
  # ============================================
  behavior = ''
    no_border_when_single=0
    axis_bind_apply_timeout=100
    focus_on_activate=0
    # todo: currently doesnt work
    # inhibit_regardless_of_visibility=0
    sloppyfocus=1
    warpcursor=1
    focus_cross_monitor=1
    focus_cross_tag=0
    enable_floating_snap=0
    snap_distance=30
    cursor_size=24
    drag_tile_to_tile=1
    view_current_to_back=1

    # Recommended in https://mangowc.vercel.app/docs/faq
    syncobj_enable=1
  '';

  # ============================================
  # WINDOW RULES
  # ============================================
  windowRules = ''
  '';

  # ============================================
  # LAYER RULES
  # ============================================
  layerRules = ''
    # Layer rules for vicinae
    layerrule=animation_type_open:none,layer_name:vicinae
    layerrule=animation_type_close:none,layer_name:vicinae
    # Layer rules for waybar
    layerrule=noanim:1,noblur:1,layer_name:waybar
  '';

  # ============================================
  # KEYBINDINGS
  # ============================================
  # Key name refer to `xev` or `wev` command output
  # Mod keys name: super,ctrl,alt,shift,none
  keybinds = ''
    # System
    bind=SUPER,r,reload_config
    bind=SUPER,q,killclient,

    # Applications
    bind=SUPER,Return,spawn,kitty
    bind=SUPER,w,spawn,firefox

    # Screenshots and recording
    bind=SUPER,P,spawn,${pkgs.writeScriptBin "screenshot" ''
      #!/usr/bin/env bash
      GEOM=$(slurp) || exit 1
      mkdir -p ~/Pictures/Screenshots
      grim -g "$GEOM" - | satty --filename -
    ''}/bin/screenshot
    bind=SUPER+SHIFT,P,spawn,${pkgs.writeScriptBin "screenrecord-start" ''
      #!/usr/bin/env bash
      mkdir -p ~/Videos/Recordings
      GEOM=$(slurp) || exit 1
      FILENAME=~/Videos/Recordings/$(date +%y%m%d_%Hh%Mm%Ss)_recording.mp4
      wf-recorder -g "$GEOM" -f "$FILENAME" &
      WF_PID=$!
      echo $WF_PID > /tmp/wf-recorder.pid
      notify-send "Recording started" "Saving to $FILENAME"
    ''}/bin/screenrecord-start
    bind=SUPER+SHIFT,O,spawn,${pkgs.writeScriptBin "screenrecord-stop" ''
      #!/usr/bin/env bash
      if [ -f /tmp/wf-recorder.pid ]; then
        kill -INT $(cat /tmp/wf-recorder.pid)
        rm /tmp/wf-recorder.pid
        notify-send "Recording stopped" "Saved to ~/Videos/Recordings/"
      else
        notify-send "No recording in progress" "No PID file found"
      fi
    ''}/bin/screenrecord-stop

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

    # Navigate workspaces left/right
    bind=SUPER,Left,viewtoleft,0
    bind=CTRL,Left,viewtoleft_have_client,0
    bind=SUPER,Right,viewtoright,0
    bind=CTRL,Right,viewtoright_have_client,0
    bind=SHIFT+SUPER,Left,tagtoleft,0
    bind=SHIFT+SUPER,Right,tagtoright,0

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

    # Cycle through windows and directional focus
    bind=ALT,Tab,focusstack,next
    bind=ALT,Left,focusdir,left
    bind=ALT,Right,focusdir,right
    bind=ALT,Up,focusdir,up
    bind=ALT,Down,focusdir,down

    # Swap focused window with adjacent windows
    bind=ALT+SHIFT,Up,exchange_client,up
    bind=ALT+SHIFT,Down,exchange_client,down
    bind=ALT+SHIFT,Left,exchange_client,left
    bind=ALT+SHIFT,Right,exchange_client,right

    # Move floating windows by pixels
    bind=CTRL+SHIFT,Up,movewin,+0,-50
    bind=CTRL+SHIFT,Down,movewin,+0,+50
    bind=CTRL+SHIFT,Left,movewin,-50,+0
    bind=CTRL+SHIFT,Right,movewin,+50,+0
    
    # Resize floating windows by pixels
    bind=CTRL+ALT,Up,resizewin,+0,-50
    bind=CTRL+ALT,Down,resizewin,+0,+50
    bind=CTRL+ALT,Left,resizewin,-50,+0
    bind=CTRL+ALT,Right,resizewin,+50,+0

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

    # Layout manipulation
    bind=ALT,e,set_proportion,1.0
    bind=ALT,x,switch_proportion_preset,
    bind=SUPER,n,switch_layout

    # Adjust window gaps
    bind=ALT+SHIFT,X,incgaps,1
    bind=ALT+SHIFT,Z,incgaps,-1
    bind=ALT+SHIFT,R,togglegaps

    # Super + Drag: Move window
    mousebind=SUPER,btn_left,moveresize,curmove
    # Middle click: Toggle maximize
    mousebind=NONE,btn_middle,togglemaximizescreen,0
    # Super + Drag: Resize window  
    mousebind=SUPER,btn_right,moveresize,curresize
    # Overview mode mouse controls
    mousebind=NONE,btn_left,toggleoverview,1
    mousebind=NONE,btn_right,killclient,0

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

    # Audio controls
    bindl=NONE,XF86AudioMute,spawn_shell,dms ipc call audio mute #pamixer --toggle-mute
    bindl=NONE,XF86AudioRaiseVolume,spawn_shell,dms ipc call audio increment 5 #pamixer -i 5
    bindl=NONE,XF86AudioLowerVolume,spawn_shell,dms ipc call audio decrement 5 #pamixer -d 5
    bindl=NONE,XF86AudioPlay,spawn_shell,dms ipc call mpris playPause

    # Brightness controls
    bindl=NONE,XF86MonBrightnessUp,spawn_shell,dms ipc call brightness increment 5 ""
    bindl=NONE,XF86MonBrightnessDown,spawn_shell,dms ipc call brightness decrement 5 ""

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

  '';

  # ============================================
  # FINAL CONFIG CONCATENATION
  # ============================================
  config = ''
    ${autostart}

    ${environment}

    ${gamemode}

    ${animations}

    ${appearance}

    ${layouts}

    ${input}

    ${behavior}

    ${windowRules}

    ${layerRules}

    ${keybinds}
  '';
in
config
