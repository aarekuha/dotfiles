# set -g default-terminal "screen-256color"
[ "$XDG_CURRENT_DESKTOP" = "KDE" ] || [ "$XDG_CURRENT_DESKTOP" = "GNOME" ] || export QT_QPA_PLATFORMTHEME="qt5ct"
xset s 0 0
xset -dpms
export LC_ALL=en_US.UTF-8
exec i3
