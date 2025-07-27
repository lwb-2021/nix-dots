{ pkgs, ... }: {
  home.packages = with pkgs;[
    tesseract
    ocrmypdf
    
    calibre
    readest
  ];
}
