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
	Public PNameOpera,PNameHola,PNameWind,PNameDumb,PNameTor,TorMode,Socs5Adr
	PNameDumb="dumbproxy.windows-amd64.exe"
	PNameOpera="opera-proxy.windows-amd64.exe"
	PNameHola="hola-proxy.windows-amd64.exe"
	PNameWind="windscribe-proxy.windows-amd64.exe"
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
	Public Bindadd,Runstart,ArgOpera,ArgHola,Argwind,Argdumb,DebugMode,SetSystem,SpeedTest,fCurl,Argtor
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
	
	Locate for Alltrim(tset)=="socs5-address"
	If !Found()
		Append Blank
		Replace tset with "socs5-address"
		Replace tvalue with "127.0.0.1:9050"
	EndIf
	Socs5Adr=Alltrim(tvalue)	
	
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
	
	Locate for Alltrim(tset)=="arg-wind"
	If !Found()
		Append Blank
		Replace tset with "arg-wind"
		Replace tvalue with ""
	EndIf
	Argwind=Alltrim(tvalue)	
	
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
		Replace tvalue with "c:\Users\TOR\tor\tor.exe"
	EndIf
	Argtor=Alltrim(tvalue)	
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
		Case Lower(Alltrim(Runstart))=="w"
			RunWinds("")
		Case Lower(Alltrim(Runstart))=="d"
			RunDumb()
		Case Lower(Alltrim(Runstart))=="t"
			RunTor()
		Otherwise
			If SetSystem="1"
				StartRun()
				Setsysproxy()
				stray.TipText = [(+) Set Bind Address as System...]
			Else
				stray.TipText = [(+) Do Nothing...]
			EndIf	
	EndCase
	Read events
EndIf	
*---------------------------------------------------

