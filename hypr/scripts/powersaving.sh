#!/bin/bash

# Get current states
animState=$(hyprctl getoption animations:enabled -j | jq -r '.int')
blurState=$(hyprctl getoption decoration:blur:enabled -j | jq -r '.int')
shadowState=$(hyprctl getoption decoration:shadow:enabled -j | jq -r '.int')
activeAlphaState=$(hyprctl getoption decoration:active_opacity -j | jq -r '.int')
inactiveAlphaState=$(hyprctl getoption decoration:inactive_opacity -j | jq -r '.int')

# If any are currently enabled
if [[ "$animState" -eq 1 || "$blurState" -eq 1 || "$shadowState" -eq 1 || "$activeAlphaState" -eq 0.8 || "$inactiveAlphaState" -eq 0.8 ]]; then
    hyprctl --batch \
        "keyword decoration:blur:enabled false; \
         keyword decoration:shadow:enabled false; \
         keyword animations:enabled false; \
         keyword decoration:active_opacity 1.0; \
         keyword decoration:inactive_opacity 1.0"
else
    hyprctl --batch \
        "keyword decoration:blur:enabled true; \
         keyword decoration:shadow:enabled true; \
         keyword animations:enabled true; \
         keyword decoration:active_opacity 0.8; \
         keyword decoration:inactive_opacity 0.8"
fi

