Swizzle (formerly SwitchVPN)

Swizzle is a portable Windows x64 utility designed to quickly run and switch VPN proxy services without installation. The program works from the system tray, displays the current IP address and location, and allows instant switching between supported proxy providers.

Supported VPN / Proxy Services.
Swizzle can launch and manage the following proxies:
- Opera VPN;
- Hola VPN;
- DumbProxy;
- Tor Expert Bundle (via SOCKS5);
- Usque. 
Switching between proxies is done directly from the tray menu.

System Proxy Mode.
Swizzle can act as a system proxy switch:
- Bind Address can be set as the system proxy manually or automatically at startup;
- quick Set as System / Unset as System actions are available from the menu;

Startup & General Settings.
The settings window allows you to:
- choose which proxy starts automatically when Swizzle launches;
- select the download tool:
  - curl (default),
  - wget (not used with TOR);
- test connection speed;
- checking for updates Swizzle and all proxies;
- enable debug mode (proxy console remains visible);
- save all settings for the next run.

Advanced Proxy Configuration.
For each proxy, you can specify:
- Bind address (IP:Port), for example 127.0.0.1:18080;
- additional command-line arguments (separately for Opera, Hola, and DumbProxy).

Tor Support.
Swizzle includes built-in support for Tor Expert Bundle:
- configurable path to tor.exe;
- SOCKS5 address support (default 127.0.0.1:9050).

New!!! Usque Cloudflare WARP client's MASQUE protocol Support.
Swizzle includes built-in support for Usque:
- Port Type (http/socks5);
- Address support (default 127.0.0.1:18080/9050).
Attention! For Usque to work, a "config.json" file is required! You can create it by running the command "./usque register".

Additional Features.
- activity log viewer;
- fully portable operation (no installation required).

Required External Files.
To function properly, Swizzle requires external proxy binaries to be downloaded separately:
- Download Opera VPN proxies and Add to program directory: https://github.com/Alexey71/opera-proxy
- Download Hola VPN proxies and Add to program directory: https://github.com/snawoot-proxies-forks/hola-proxy
- Download Dumb VPN proxies and Add to program directory: https://github.com/SenseUnit/dumbproxy
- Download Usque proxies and Add to program directory: https://github.com/Diniboy1123/usque
- Download Wget and Add to program directory: https://eternallybored.org/misc/wget/
- Download Tor Expert Bundle and set path and port in settings: https://www.torproject.org/download/tor/

Full List of Required Files:
- checkversion.bat,
- config.json (need for usque working),
- delete.ico,
- dumbproxy.windows-amd64.exe,
- hola-proxy.windows-amd64.exe,
- opera-proxy.windows-amd64.exe,
- proxyvpn.DBF,
- settings.DBF,
- speedcurl.bat,
- speedsocs5.bat,
- speedwget.bat,
- switchvpn64.exe,
- swizzle64.ico,
- systray.mpr,
- systray.MPX,
- usque.exe;
- wget.exe.

Swizzle runtime DLL files:
- msvcr100.dll,
- VFPAR.DLL,
- VFPAT.DLL.

Version History:
- 1.2.0 — DumbProxy added, advanced settings introduced.
- 1.2.2 — stability improvements, debug mode added.
- 1.2.3 — minor bug fixes.
- 1.2.4 — system proxy mode, quick proxy on/off switching.
- 1.2.7 - Swizzle — renaming, Curl support, Tor Expert Bundle integration, updated UI.
- 1.3.0 - Windscribe VPN removed, Usque integration, Added checking for updates, stability improvements. 
