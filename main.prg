Lparameters lvn
SET TALK OFF
set notify off
set safety off	
Local lcProgram
public k_drive
lcProgram = Addbs(JustPath(Sys(16)))
k_drive=Addbs(LEFT(lcProgram, RAT("\", lcProgram)-1))
SET DEFAULT TO (["]+k_drive+["])
Set Procedure To proc
On Shutdown do exit
If mListApp('Swizzle64.exe')+mListApp('Swizzle32.exe')>1
	do exit2	
Else
	Public PNameOpera,PNameHola,PNameUsque,PNameDumb,PNameTor,TorMode,Socs5Adr,AdrUsque,UsqueMode,UsqueAdd
	Public LinkOpera,LinkHola,LinkUsque,LinkDumb,LinkTor,LinkSwizzle
	Public LastChOpera,LastChHola,LastChUsque,LastChDumb,LastChTor,LastChSwizzle
	PNameDumb="dumbproxy.windows-amd64.exe"
	PNameOpera="opera-proxy.windows-amd64.exe"
	PNameHola="hola-proxy.windows-amd64.exe"
	PNameUsque="usque.exe"
	PNameTor="tor.exe"
	TorMode=.f.
	Public stray,px
	stray = NEWOBJECT('systray', 'systray.vcx')
	stray.IconFile 	= "Swizzle64.ico"
	stray.MenuText 	= "Systray.mpr"
	stray.MenuTextIsMPR = .T.
	stray.AddIconToSystray() 
	px=CreateObject("wscript.shell")
	ON ERRO do infoerro with erro(),prog(),line(1)
	*
	Public Bindadd,Runstart,ArgOpera,ArgHola,Argdumb,DebugMode,SetSystem,SpeedTest,SpeedFile,fCurl,Argtor,ArgUsque,ChVer,ChDay
	*
	If File(k_drive+'speedcurl.bat')
		SafeDel(k_drive+'speedcurl.bat')
	EndIf	
	If File(k_drive+'speedsocks5.bat')
		SafeDel(k_drive+'speedsocks5.bat')
	EndIf	
	If File(k_drive+'speedsocs5.bat')
		SafeDel(k_drive+'speedsocs5.bat')
	EndIf	
	If File(k_drive+'speedwget.bat')
		SafeDel(k_drive+'speedwget.bat')
	EndIf	
	*
	If !File("settings.dbf")
		Create Table settings free (tset c(30),tvalue c(254))
	Else	
		Select 0
		Use settings
	EndIf	
	Locate for Alltrim(tset)=="curl"
	If !Found()
		Append Blank
		Replace tset with "curl"
		Replace tvalue with "1"
	EndIf
	fCurl=Alltrim(tvalue)	

	Locate for Alltrim(tset)=="debug-mode"
	If !Found()
		Append Blank
		Replace tset with "debug-mode"
		Replace tvalue with "0"
	EndIf
	DebugMode=Alltrim(tvalue)	

	Locate for Alltrim(tset)=="bind-address"
	If !Found()
		Append Blank
		Replace tset with "bind-address"
		Replace tvalue with "127.0.0.1:18080"
	EndIf
	Bindadd=Alltrim(tvalue)	
	
	Locate for Alltrim(tset)=="set-system"
	If !Found()
		Append Blank
		Replace tset with "set-system"
		Replace tvalue with "0"
	EndIf
	SetSystem=Alltrim(tvalue)	

	Locate for Alltrim(tset)=="speed-test"
	If !Found()
		Append Blank
		Replace tset with "speed-test"
		Replace tvalue with "0"
	EndIf
	SpeedTest=Alltrim(tvalue)	

	Locate for Alltrim(tset)=="speed-file"
	If !Found()
		Append Blank
		Replace tset with "speed-file"
		Replace tvalue with [https://proof.ovh.net/files/10Mb.dat]
	EndIf
	SpeedFile=Alltrim(tvalue)	
	
	Locate for Alltrim(tset)=="run-start"
	If !Found()
		Append Blank
		Replace tset with "run-start"
		Replace tvalue with "O"
	EndIf
	Runstart=Alltrim(tvalue)	
	
	Locate for Alltrim(tset)=="arg-opera"
	If !Found()
		Append Blank
		Replace tset with "arg-opera"
		Replace tvalue with ""
	EndIf
	ArgOpera=Alltrim(tvalue)	
	
	Locate for Alltrim(tset)=="arg-hola"
	If !Found()
		Append Blank
		Replace tset with "arg-hola"
		Replace tvalue with ""
	EndIf
	ArgHola=Alltrim(tvalue)	
	
	Locate for Alltrim(tset)=="arg-usque"
	If !Found()
		Append Blank
		Replace tset with "arg-usque"
		Replace tvalue with "1"
	EndIf
	ArgUsque=Alltrim(tvalue)	
	
	Locate for Alltrim(tset)=="address-usque"
	If !Found()
		Append Blank
		Replace tset with "address-usque"
		If ArgUsque="1"
			Replace tvalue with "127.0.0.1:18080"
		Else
			Replace tvalue with "127.0.0.1:9050"
		EndIf	
	EndIf
	AdrUsque=Alltrim(tvalue)	

	Locate for Alltrim(tset)=="add-usque"
	If !Found()
		Append Blank
		Replace tset with "add-usque"
		Replace tvalue with ""
	EndIf
	UsqueAdd=Alltrim(tvalue)	
	
	Locate for Alltrim(tset)=="arg-dumb"
	If !Found()
		Append Blank
		Replace tset with "arg-dumb"
		Replace tvalue with ""
	EndIf
	Argdumb=Alltrim(tvalue)	

	Locate for Alltrim(tset)=="arg-tor"
	If !Found()
		Append Blank
		Replace tset with "arg-tor"
		Replace tvalue with Addbs(k_drive)+"TOR\tor\tor.exe"
	EndIf
	Argtor=Alltrim(tvalue)	
	
	Locate for Alltrim(tset)=="socs5-address"
	If !Found()
		Append Blank
		Replace tset with "socs5-address"
		Replace tvalue with "127.0.0.1:9050"
	EndIf
	Socs5Adr=Alltrim(tvalue)
	
	Locate for Alltrim(tset)=="link-opera"
	If !Found()
		Append Blank 
		Replace tset with "link-opera"
		Replace tvalue with [https://github.com/Alexey71/opera-proxy]
	EndIf
	LinkOpera=Alltrim(tvalue)	

	Locate for Alltrim(tset)=="link-hola"
	If !Found()
		Append Blank 
		Replace tset with "link-hola"
		Replace tvalue with [https://github.com/snawoot-proxies-forks/hola-proxy]
	EndIf	
	LinkHola=Alltrim(tvalue)
	
	Locate for Alltrim(tset)=="link-dumb"
	If !Found()
		Append Blank 
		Replace tset with "link-dumb"
		Replace tvalue with [https://github.com/SenseUnit/dumbproxy]
	EndIf	
    LinkDumb=Alltrim(tvalue)
    
	Locate for Alltrim(tset)=="link-tor"
	If !Found()
		Append Blank 
		Replace tset with "link-tor"
		Replace tvalue with [https://www.torproject.org/download/tor]
	EndIf	
	LinkTor=Alltrim(tvalue)

	Locate for Alltrim(tset)=="link-usque"
	If !Found()
		Append Blank 
		Replace tset with "link-usque"
		Replace tvalue with [https://github.com/Diniboy1123/usque]
	EndIf	
	LinkUsque=Alltrim(tvalue)
	
	LinkSwizzle=[https://github.com/sergrit/Swizzle_fwx64]
	
	Locate for Alltrim(tset)=="ch-ver"
	If !Found()
		Append Blank
		Replace tset with "ch-ver"
		Replace tvalue with "1"
	EndIf
	ChVer=Alltrim(tvalue)	

	Locate for Alltrim(tset)=="ch-day"
	If !Found()
		Append Blank
		Replace tset with "ch-day"
		Replace tvalue with "1"
	EndIf
	ChDay=Alltrim(tvalue)	
	
	Locate for Alltrim(tset)=="lastch-opera"
	If !Found()
		Append Blank 
		Replace tset with "lastch-opera"
		Replace tvalue with Dtoc(Date()-1)
	EndIf
	LastChOpera=Alltrim(tvalue)	

	Locate for Alltrim(tset)=="lastch-hola"
	If !Found()
		Append Blank 
		Replace tset with "lastch-hola"
		Replace tvalue with Dtoc(Date()-1)
	EndIf	
	LastChHola=Alltrim(tvalue)
	
	Locate for Alltrim(tset)=="lastch-dumb"
	If !Found()
		Append Blank 
		Replace tset with "lastch-dumb"
		Replace tvalue with Dtoc(Date()-1)
	EndIf	
    LastChDumb=Alltrim(tvalue)
    
	Locate for Alltrim(tset)=="lastch-tor"
	If !Found()
		Append Blank 
		Replace tset with "lastch-tor"
		Replace tvalue with Dtoc(Date()-1)
	EndIf	
	LastChTor=Alltrim(tvalue)

	Locate for Alltrim(tset)=="lastch-usque"
	If !Found()
		Append Blank 
		Replace tset with "lastch-usque"
		Replace tvalue with Dtoc(Date()-1)
	EndIf	
	LastChUsque=Alltrim(tvalue)
	
	Locate for Alltrim(tset)=="lastch-swizzle"
	If !Found()
		Append Blank 
		Replace tset with "lastch-swizzle"
		Replace tvalue with Dtoc(Date()-1)
	EndIf	
	LastChSwizzle=Alltrim(tvalue)

	use
	*
	If !File("proxyvpn.dbf")
		Create Table proxyvpn free (tp c(1), country c(30),tstr c(254), tdupdate d)
	Else
		Select 0
		Use proxyvpn
	EndIf		
	Do case
		Case Lower(Alltrim(Runstart))=="o"
			RunOpera("EU")
		Case Lower(Alltrim(Runstart))=="h"
			RunHola("en")			
		Case Lower(Alltrim(Runstart))=="u"
			RunUsque()
		Case Lower(Alltrim(Runstart))=="d"
			RunDumb()
		Case Lower(Alltrim(Runstart))=="t"
			RunTor()
		Otherwise
			If SetSystem="1"
				StartRun()
				Setsysproxy()
				LastCheck("-swizzle-")
				EndActLog()
				stray.TipText = [(+) Set Bind Address as System...]
			Else
				lldate=Ctod(LastChSwizzle)
				If Date()-Val(ChDay)+1 > lldate
					StartRun()
					LastCheck("-swizzle-")
					EndActLog()
				EndIf
				stray.TipText = [(+) Do Nothing...]
			EndIf	
	EndCase
	Read events
EndIf	
*---------------------------------------------------

