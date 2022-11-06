
render_window_title() { 
  xprop -id $(xdotool getwindowfocus) WM_CLASS | awk -F '"' '{print $4}' | sed -E 's/\w+/\u&/g'
}

render_window_title;






