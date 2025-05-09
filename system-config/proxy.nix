{ config, lib, pkgs, ... }: 
let
  # 定义函数：读取文件并返回行数组（文件不存在时返回空数组）
  readFileLines = path: let
    content = builtins.tryEval (builtins.readFile path);  # 安全尝试读取文件
  in
    if content.success then
      lib.filter (line: line != "")  # 过滤空行
        (lib.splitString "\n" content.value)  # 按换行符分割
    else [];
in {
    services.v2raya = {
        enable = true;
    };
    services.tor = {
        enable = true;
        client.enable = true;
        settings = {
            UseBridges = true;
            ClientTransportPlugin = "webtunnel exec ${pkgs.obfs4}/bin/lyrebird";
            Bridge = readFileLines ../secret/bridges.txt;
        };
    };

}
