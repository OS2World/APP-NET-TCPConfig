Unit TCP_VAR_UNIT;

Interface
USES UString;
CONST
     HELP_INDEX_Interface       =0;     // Number for section in IPF file for the interface wizard
     HELP_INDEX_Routing         =10;    // Number for section in IPF File for the routing wizard
     HELP_Index_BASIC           =50;    // Basic Number for section in IPF (HLP) File
     HELP_INDEX_SETTINGS        =80;    // Number for section in IPF file for program settings notebook
     HELP_Index_Profile         =70;    // Number of section in IPF file for the Profile Manger
     maxRouteEntrys             =10;
     PROG_DLLVersion            =7;
     Fill_Const                 =20;
     ZeroStr                    =' ';
     MaxNFSStringListCount      =20;  {Max amount of entrys for NFS stringlist (Read HOST/Read/Write Host) }
     EF_IPNum                   =0;
     EF_Subnet                  =1;
     EF_Host                    =2;
     MaxFTPDReadWriteDirs       =25;
     {
      Maximum Amount of storeable FTP directorys in the FTP Sever Wizard
      Note : Acording to IBM's java TCPCFG2 the entry field is limited to 255 signs,
      so all directorys togehter must not have more then 255 signs
      }

TYPE
     IPError=record
              Valid:Boolean;
              MissingPoint:Boolean;
              MissingNumber:Boolean;
              PointOverflow:Boolean;
              NumberofPoints:Byte;
              InValidSigns:Boolean;
              InvalidNumber:Boolean;
              End;

     TProgramSettings=record
        editBinText       :String;     {BIN Directory - usaly X:\MPTN\BIN}
        CheckBoxDosWin    :Boolean;    {TRUE: RESOLV File will be written to DOS PATH}
        EditDosWinETCText :String;     {Path to the ETC directory for DOS&WINOS/2}
        NLSFileName       :String;     {Name of Language File}
        ConfigLevel       :integer;    {Configuration Level 0-1 (0=BASIC  / 1=Advanced)}
        BackupPath        :String;     {Directory for Backup}
        BackupCounter     :Byte;       {counter for backup folder}
        ProfilePath       :String;     {Directory for loading/storing profiles}
        cbActivateFixedAliasIP:Boolean; {TRUE : Use fixed ALIAS IP stored in "AliasIPStr" / FALSE do use }
        EditFixedAliasIP  :String;
        cbProgLogo        :Boolean;     {True Splash Screen will be displayed / False no Splash Screen}
        LogoWaitTime      :Byte;                                {Wait Time counter}
        LogoDelayTime     :Longint;
        Autostart         :Boolean;
        IBMCOMPath        :String;      {path to the IBMCOM directory}
        TCPIPBINPath      :String;      {path to the TCPIP\BIN directory}
        ProfileCounter    :Byte;        {Counter for Profile Dirs}
        End;

     Type
         TConfigSysEntry=Record
          LPR_SERVER:String;
          LPR_Printer:String;
     End;


     {TAutostartRec=record
     InetD:Boolean;
     NFSD:Boolean;
     FTPD:Boolean;
     TelnetD:Boolean;
     PCNFSD:Boolean;
     Rex:Boolean;
     RSH:Boolean;
     LPD:Boolean;
     lprportd:Boolean;
     End;}

     TChangeRec=record
     LanInterface     :Boolean;
     DHCP            : Boolean; // 03.02.2007 Must be true when user changes from a DHCP Config to manualy config to force the reboot in order to clear the flags set by dhcp for an interface
     Routing          :Boolean;
     Loopback         :Boolean;
     Hosts            :Boolean;
     ConfigSys        :Boolean;
     Reboot           :Boolean;
     EnvChanged       :Boolean;
     Autostart        ://TAutostartRec;
                        Boolean;
     IFAliasError     :Boolean;
     NFS              :Boolean;
     ClearAll         :Boolean; // 24.10.2006 - Indicates that all settings should be cleared and re-reded
     End;

     TPathRec=Record
     BootPath         :String; // Path where program was bootet from
     BootDrive        :Char;   // Boot Drive
     LanguageFile     :String; // Path&Filename of current loaded language file
     End;

     TAliasRec=Record
     AliasIP         : Array[0..7] of TStrings;
     AliasSubnet     : Array[0..7] of TStrings;
     HomeIP          : String[15];
     HomeSubnet      : String[15];
     End;

     TFTPServerRec=Record
     ReadDir         : TStringlist;
     WriteDir        : TStringlist;
     End;

     TAutoStartRec=Record
     ServName            :String;
     Enabled             :Boolean;
     BackGround          :Boolean;
     ForeGround          :Boolean;
     Symbol              :Boolean;
     Changed             :Boolean;
     Parameter           :String;
     Amount              :Byte;
     InetD               :Boolean;
     InetDProtName       :String;
     PID                 :String[5]; // Postition in der ListBox
     End;

VAR
   Default_IP_Error:IPError;
   WizardEditFlag:Boolean;
   ConfigFile        : TEXT;            {File Handle of file "Setup.cmd"}
   ConfigStr         : String;          {Readed entrys of Setup.cmd are stored here sequencialy}
   ProgramSettingsFile:File of TProgramSettings;
   //ProgramSettings    :TProgramSettings;
   NLS_File           :Text;
   ChangeRec          :TChangeRec;
   OLDConfigSYS       :TConfigSysEntry;
   NFSCOunter         :Longint;
   Config_Line_Counter:Byte;
   NFSHostListArray     :Array[0..MaxNFSStringListCount] of TStringList;
   IFConfigCounter      :Longint;
   ProgPath             :String;
   DebugLog             :Boolean;
   CheckBoxDebugDeleteStyle:Boolean;
   ExceptionHelpString  :String;
   ExceptionHelpByte    :Byte;
   PathRec              :TPathRec;
   AliasRec             :TAliasRec;
   FTPServerRec         :Array[0..25] of TFTPServerRec;
   AutoStartRec         :Array[0..19] of TAutoStartRec;
   DynDNS               :Boolean;     // TRUE DynDNS Installed  - FALSE no DYNDNS found in TCPSTART.CMD

Implementation

Begin
     DebugLog      :=FALSE;
End.



{
 25.09.2006 Neue Variable DynDNS hinzugef�gt welche in TCP_Autostart auf TRUE oder FALSE gesetzt wird
}