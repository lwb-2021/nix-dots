{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    slurp
    grim
    ksnip
  ];
  home.file.".config/scripts/screenshot.sh" = {
    text = ''
      #!/usr/bin/env bash
      SCREENSHOT_DIR="$XDG_PICTURES_DIR/Screenshots"
      mkdir -p "$SCREENSHOT_DIR"
      TIMESTAMP=$(date +%Y%m%d_%H%M%S)
      FILE="$SCREENSHOT_DIR/screenshot_$TIMESTAMP.png"
      grim -g "$(slurp)" "$FILE"
      if [ $? -eq 0 ]; then
        notify-send "截图完成" "已保存至 $FILE"
        ksnip $FILE
        wl-copy < $FILE
      fi
    '';
    executable = true;
  };
  wayland.screenshot.exec = "~/.config/scripts/screenshot.sh";
}
