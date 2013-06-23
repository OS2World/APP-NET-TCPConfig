Unit Unit1;

Interface

Uses
  Classes, Forms, Graphics, TabCtrls, Buttons, BmpList, StdCtrls, ComCtrls,convertIni,
  EditList, ExtCtrls, FileCtrl, Dialogs,Sysutils,DOS, Spin, OutLine, GlyphBtn,TCP_ProfileManager,
  ListView, PMWIN,PMWP, INet, Grids,BSEDOS,Menus,Color,Messages,ustring,TCP_BackupRestoreWizard,iniFiles,TCP_AutoActivateConfig,
  Hints,TCP_ProgramIni,TCP_ExceptionUnit,process,EaZusatzUnit,TCP_SpecialSettingsNotebook,TCP_Unit_QueryEntrys,TCP_Hostlist,SplashScreen;

Type
  TForm1 = Class (TForm)
    TabbedNotebook1: TTabbedNotebook;
    DebugButton:TButton;
    OKButton: TButton;
    CancelButton: TButton;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItemProgramSettings: TMenuItem;
    MenuItemOptionalSettings: TMenuItem;
    ButtonHelp: TButton;
    TCP1: TTCP;
    Button1: TButton;
    HeaderControlSOCKSServer: THeaderControl;
    lbSOCKSServerIP: TListBox;
    lbSocksServerTargetIP: TListBox;
    lbSOCKSServerSubnet: TListBox;
    lbSOCKSServerUserID: TListBox;
    MenuItem2: TMenuItem;
    Img_ActiveLocalHostname: TImage;
    labActiveLocalHostname: TLabel;
    lbRoutings: tMultiColumnList;
    PopupMenu1: TPopupMenu;
    MenuItemRouteUp: TMenuItem;
    MenuItemRouteDown: TMenuItem;
    MenuItemProfileManager: TMenuItem;
    ButtonDnsDown: TBitBtn;
    ButtonDNSAdd: TButton;
    ButtonDomainDown: TBitBtn;
    ButtonLanDomainAdd: TButton;
    ButtonLanDomainEdit: TButton;
    ButtonLanDomainDelete: TButton;
    ButtonDomainUp: TBitBtn;
    GroupBoxDomainSearchList: TGroupBox;
    ButtonDnsEdit: TButton;
    ButtonDnsDelete: TButton;
    ButtonDNSUp: TBitBtn;
    GroupBoxDNS: TGroupBox;
    MenuItemBackupRestore: TMenuItem;
    NoteBook1: TNoteBook;
    GroupBoxServerServicesFTPD: TGroupBox;
    cbTelnetD: TCheckBox;
    cbRSHD: TCheckBox;
    cbLPD: TCheckBox;
    cbTimeD: TCheckBox;
    cbRexecD: TCheckBox;
    TCPAutostartNotebook: TTabbedNotebook;
    GroupBoxMainInetD: TGroupBox;
    GroupBoxInetD: TGroupBox;
    cbInetD: TCheckBox;
    cbInetdSymbolssize: TCheckBox;
    GroupBoxInetDSelectService: TGroupBox;
    cbInetdAllServer: TCheckBox;
    GroupBoxInetdServices: TGroupBox;
    cbFTPEnabled: TCheckBox;
    Image6: TImage;
    GroupBoxAutostartFTP: TGroupBox;
    GroupBoxParamFTP: TGroupBox;
    EditFTPParam: TEdit;
    GroupBoxParamLPRPortd: TGroupBox;
    EditLPRPortDParam: TEdit;
    GroupBoxParamRouteD: TGroupBox;
    EditRouteDParam: TEdit;
    GroupBoxParamTalkD: TGroupBox;
    EditTalkDParam: TEdit;
    GroupBoxParamPortmap: TGroupBox;
    EditPortmapParam: TEdit;
    GroupBoxparamSendmail: TGroupBox;
    EditSendMailParam: TEdit;
    GroupBoxParamPCNFSD: TGroupBox;
    EditPCNFSDParam: TEdit;
    rbPCNFSDS: TRadioButton;
    rbPCNFSDB: TRadioButton;
    rbPCNFSDF: TRadioButton;
    GroupBoxOptionsPCNFSD: TGroupBox;
    ButtonPCNFSD: TButton;
    Image17: TImage;
    cbPCNfsDEnabled: TCheckBox;
    GroupBoxAutostartPCNFSD: TGroupBox;
    GroupBoxServerServicesPCNFSD: TGroupBox;
    GroupBoxParamNFSD: TGroupBox;
    EditNFSDParam: TEdit;
    rbNFSDS: TRadioButton;
    rbNFSDB: TRadioButton;
    rbNFSDF: TRadioButton;
    GroupBoxOptionsNFSD: TGroupBox;
    ButtonNFSD: TButton;
    Image16: TImage;
    cbNFSDEnabled: TCheckBox;
    GroupBoxAutostartNFSD: TGroupBox;
    GroupBoxServerServicesTelnetD14: TGroupBox;
    GroupBoxParamTimeD: TGroupBox;
    EditTimedParam: TEdit;
    rbTimedS: TRadioButton;
    rbTimedB: TRadioButton;
    rbTimedF: TRadioButton;
    GroupBoxOptionsTimeD: TGroupBox;
    ButtonTimed: TButton;
    Image15: TImage;
    cbTimedEnabled: TCheckBox;
    GroupBoxAutostartTimeD: TGroupBox;
    GroupBoxServerServicesTimeD: TGroupBox;
    GroupBoxParamSyslogD: TGroupBox;
    EditSysLogdParam: TEdit;
    rbSyslogdS: TRadioButton;
    rbSyslogdB: TRadioButton;
    rbSysLogDF: TRadioButton;
    GroupBoxOptionsSyslogD: TGroupBox;
    ButtonSysLOGD: TButton;
    Image14: TImage;
    cbSysLoGDEnabled: TCheckBox;
    GroupBoxAutostartSyslogD: TGroupBox;
    GroupBoxServerServicesTelnetD12: TGroupBox;
    GroupBoxparamRSVPD: TGroupBox;
    EditRSVPDParam: TEdit;
    rbRSVPDS: TRadioButton;
    rbRSVPDB: TRadioButton;
    rbRSVPDF: TRadioButton;
    GroupBoxOptionsRSVPD: TGroupBox;
    ButtonRSVPD: TButton;
    Image13: TImage;
    CBRSVPDEnabled: TCheckBox;
    GroupBoxAutostartRSVPD: TGroupBox;
    GroupBoxServerServicesTelnetD11: TGroupBox;
    rbSendMailS: TRadioButton;
    rbSendMailB: TRadioButton;
    rbSendMailF: TRadioButton;
    GroupBoxOptionsSendMail: TGroupBox;
    ButtonSendmail: TButton;
    Image12: TImage;
    cbSendmailEnabled: TCheckBox;
    GroupBoxAutostartSendMail: TGroupBox;
    GroupBoxServerServicesTelnetD10: TGroupBox;
    rbPortmapS: TRadioButton;
    rbPortmapB: TRadioButton;
    rbPortmapF: TRadioButton;
    GroupBoxOptionsPortmap: TGroupBox;
    ButtonPortmap: TButton;
    Image11: TImage;
    cbPortmapEnabled: TCheckBox;
    GroupBoxAutostartPortmap: TGroupBox;
    GroupBoxServerServicesTelnetD9: TGroupBox;
    rbTalkDS: TRadioButton;
    rbTalkdB: TRadioButton;
    rbTalkDF: TRadioButton;
    GroupBoxOptionsTalkD: TGroupBox;
    ButtonTalkD: TButton;
    Image10: TImage;
    cbTalkDEnabled: TCheckBox;
    GroupBoxAutostartTalkD: TGroupBox;
    GroupBoxServerServicesTalkD: TGroupBox;
    rbRouteDS: TRadioButton;
    rbRouteDB: TRadioButton;
    rbRouteDF: TRadioButton;
    GroupBoxOptionsRouteD: TGroupBox;
    ButtonROuteD: TButton;
    Image9: TImage;
    cbRouteDEnabled: TCheckBox;
    GroupBoxAutostartRouteD: TGroupBox;
    GroupBoxServerServicesTelnetD7: TGroupBox;
    Image18: TImage;
    Image19: TImage;
    Image20: TImage;
    Image21: TImage;
    Image22: TImage;
    rbLPRPortdS: TRadioButton;
    rbLprPortdB: TRadioButton;
    rbLPRPortdF: TRadioButton;
    GroupBoxOptionsLPRPortd: TGroupBox;
    ButtonLPRPortD: TButton;
    Image28: TImage;
    cbLPRPortDEnabled: TCheckBox;
    GroupBoxAutostartLPRPortD: TGroupBox;
    GroupBoxServerServicesLPRD: TGroupBox;
    GroupBoxParamLPD: TGroupBox;
    EditLPDParam: TEdit;
    rbLPDS: TRadioButton;
    rbLPDB: TRadioButton;
    rbLPDF: TRadioButton;
    GroupBoxOptionsLPD: TGroupBox;
    ButtonLPD: TButton;
    Image27: TImage;
    cbLPDEnabled: TCheckBox;
    GroupBoxAutostartLPD: TGroupBox;
    GroupBoxServerServicesLPD: TGroupBox;
    GroupBoxParamRSHD: TGroupBox;
    EditRSHDParam: TEdit;
    rbRSHDs: TRadioButton;
    rbRSHDB: TRadioButton;
    rbRSHDf: TRadioButton;
    GroupBoxOptionsRSHD: TGroupBox;
    ButtonRSHD: TButton;
    Image26: TImage;
    cbRSHDEnabled: TCheckBox;
    GroupBoxAutostartRSHD: TGroupBox;
    GroupBoxServerServicesRSHD: TGroupBox;
    GroupBoxParamRexecd: TGroupBox;
    RexecdParam: TEdit;
    rbRexecdS: TRadioButton;
    rbRexecdB: TRadioButton;
    rbRexecdF: TRadioButton;
    GroupBoxOptionsRexecd: TGroupBox;
    ButtonRexEcD: TButton;
    Image25: TImage;
    cbRexecdEnabled: TCheckBox;
    GroupBoxAutostartRexECD: TGroupBox;
    GroupBoxServerServicesRexECD: TGroupBox;
    GroupBoxParamTFTP: TGroupBox;
    EditTFTPDParam: TEdit;
    rbTFTPDS: TRadioButton;
    rbTftpdB: TRadioButton;
    rbTftpdF: TRadioButton;
    GroupBoxOptionsTFTP: TGroupBox;
    ButtonTFTPD: TButton;
    Image8: TImage;
    cbTFTPDEnabled: TCheckBox;
    GroupBoxAutostartTFTP: TGroupBox;
    GroupBoxServerServicesTelnetD2: TGroupBox;
    GroupBoxParamTelnetD: TGroupBox;
    EditTelnetParam: TEdit;
    BitmapListBox3: TBitmapListBox;
    rbTelnetS: TRadioButton;
    rbTelnetB: TRadioButton;
    rbTelnetF: TRadioButton;
    GroupBoxOptionsTelnet: TGroupBox;
    ButtonTelnet: TButton;
    Image7: TImage;
    cbTelnetEnabled: TCheckBox;
    GroupBoxAutostartTelnet: TGroupBox;
    GroupBoxServerServicesTelnetD: TGroupBox;
    rbFTPB: TRadioButton;
    rbFTPS: TRadioButton;
    ButtonFTPD: TButton;
    rbFTPF: TRadioButton;
    GroupBoxOptionsFTP: TGroupBox;
    Image1: TImage;
    LabelAmountTCPIPProtocols: TLabel;
    LabelAmountTCPIP: TLabel;
    GroupBox4: TGroupBox;
    HeaderControlUSer: THeaderControl;
    lbServicesComment: TListBox;
    GroupBox2: TGroupBox;
    HeaderControlSOCKSDNS: THeaderControl;
    GroupBox3: TGroupBox;
    HeaderControlSOCKSDNS2: THeaderControl;
    SocksNotebook: TTabbedNotebook;
    CheckBoxSocksEnable: TCheckBox;
    RadioSocksSecurity: TRadioGroup;
    GrpBoxSocksSecurity: TGroupBox;
    EditSocksUserID: TEdit;
    LabelSocksUserID: TLabel;
    LabelSocksPassword1: TLabel;
    LabelSOCKSPassword2: TLabel;
    EditSocksPassword1: TEdit;
    EditSocksPassword2: TEdit;
    lbSOCKSDomains: TListBox;
    lbSOCKSNameServer: TListBox;
    ButtonSOCKSDomainAdd: TButton;
    ButtonSOCKSDomainEdit: TButton;
    ButtonSOCKSDomainDelete: TButton;
    ButtonSOCKSDNSADD: TButton;
    ButtonSOCKSDNSEdit: TButton;
    ButtonSOCKSDNSDelete: TButton;
    HeaderControlSOCKSDirect: THeaderControl;
    lbSocksDirect_IP: TListBox;
    lbSocksDIRECTSubnet: TListBox;
    ButtonSocksDirectAdd: TButton;
    ButtonSocksDirectEdit: TButton;
    ButtonSocksDirectDelete: TButton;
    LabelSocksDirectAdd: TLabel;
    LabelSocksDirectEdit: TLabel;
    LabelSocksDirectDelete: TLabel;
    ButtonSocksServerAdd: TButton;
    ButtonSocksServerEdit: TButton;
    ButtonSocksServerDelete: TButton;
    LabelSocksServerAdd: TLabel;
    LabelSocksServerEdit: TLabel;
    LabelSocksServerDelete: TLabel;
    LabelSocksDomainAdd: TLabel;
    LabelSocksDNSAdd: TLabel;
    LabelSocksDomainEdit: TLabel;
    LabelSocksDomainDelete: TLabel;
    LabelSocksDNSEdit: TLabel;
    LabelSocksDNSDelete: TLabel;
    labelCurrentIPAdress: TLabel;
    LabelCurrentIP: TLabel;
    GroupBoxHostListOption: TGroupBox;
    cbuseHostlistfirst: TCheckBox;
    LabelHostlistInfo: TLabel;
    StringGrid1: TStringGrid;
    GroupBoxPrintServer: TGroupBox;
    LabelENV_Server: TLabel;
    GroupBoxPrinter: TGroupBox;
    LabelENV_Printer: TLabel;
    GroupBoxLPD: TGroupBox;
    MaxAmountLPD: TSpinEdit;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Label24: TLabel;
    Edit_LPR_Server: TEdit;
    Edit_LPR_Printer: TEdit;
    img_printer: TImage;
    Img_printserver: TImage;
    GroupBoxEnvNote: TGroupBox;
    LabelEnvNote: TLabel;
    GroupBoxStatus: TGroupBox;
    Bevel1: TBevel;
    LabelInfo1: TLabel;
    LabelInfo2: TLabel;
    BitmapListBox1: TBitmapListBox;
    BitmapListBox2: TBitmapListBox;
    ListBox1: TBitmapListBox;
    duplicateCheckbox: TCheckBox;
    NFS_Rights_Radio: TRadioGroup;
    NFSAddButton: TButton;
    NFSEditButton: TButton;
    NfsDeleteButton: TButton;
    GroupBoxNFSHostlist: TGroupBox;
    HeaderControl4: THeaderControl;
    RadioGroup1: TRadioGroup;
    NFS_Comment: TListBox;
    Image2: TImage;
    labOptional1: TLabel;
    ImageHostname: TImage;
    labOptional2: TLabel;
    lbDNSServers: TBitmapListBox;
    lbLocalDomainSearchlist: TBitmapListBox;
    EditHostname: TEdit;
    GroupBoxHostname: TGroupBox;
    ImageLocalDomain: TImage;
    EditLocalDomain: TEdit;
    GroupBoxLocalDomain: TGroupBox;
    ProductName1: TLabel;
    Version1: TLabel;
    Copyright1: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    LabelDLLVersion: TLabel;
    CheckBoxDebugDeleteSYBFile: TCheckBox;
    ButtonConfigureFTPD: TButton;
    LabelFTPInfo: TLabel;
    GroupBoxFTPD: TGroupBox;
    ButtonConfigureNFS: TButton;
    labelNFSDInfo: TLabel;
    GroupBoxNFSD: TGroupBox;
    labelServicesUserEdit: TLabel;
    labelServicesUserDelete: TLabel;
    labelServicesUserAdd: TLabel;
    ButtonServicesUserDelete: TButton;
    ButtonServicesUSerEdit: TButton;
    ButtonServicesUserAdd: TButton;
    lbServicesUser: TListBox;
    GroupBox17: TGroupBox;
    ButtonConfigureRex: TButton;
    LabelRexecInfo: TLabel;
    GroupBoxRexD: TGroupBox;
    ButtonConfigureTelnetd: TButton;
    LabelTelnetInfo: TLabel;
    GroupBoxTelnetD: TGroupBox;
    GroupBoxNFS: TGroupBox;
    Label37: TLabel;
    NFS_Directory: TListBox;
    GroupBoxNFSHosts: TGroupBox;
    NFS_hosts: TListBox;
    NFS_Alias: TListBox;
    HeaderControlNFS: THeaderControl;
    ButtonRouteAdd: TButton;
    ButtonRouteEdit: TButton;
    ButtonRouteDelete: TButton;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    ButtonHostAdd: TButton;
    ButtonHostEdit: TButton;
    ButtonHostDelete: TButton;
    ButtonIPAdressEdit: TButton;
    LabelRouteButtonAdd: TLabel;
    LabelRouteButtonEdit: TLabel;
    LabelRouteButtonDelete: TLabel;
    ButtonIPAdressDelete: TButton;
    HeaderControl_Interface: THeaderControl;
    ButtonIPAdressAdd: TButton;
    Procedure BitmapListBox2OnItemFocus (Sender: TObject; Index: LongInt);
    Procedure StringGrid1OnSetupShow (Sender: TObject);
    Procedure StringGrid1OnResize (Sender: TObject);
    Procedure lbRoutingsOnItemFocus (Sender: TObject; Index: LongInt);
    Procedure MenuItemRouteDownOnClick (Sender: TObject);
    Procedure MenuItemRouteUpOnClick (Sender: TObject);
    Procedure lbRoutingNetTypeOnItemFocus (Sender: TObject; Index: LongInt);
    Procedure MenuItemProfileManagerOnClick (Sender: TObject);
    Procedure lbSOCKSNameServerOnItemFocus (Sender: TObject; Index: LongInt);
    Procedure lbSOCKSDomainsOnItemFocus (Sender: TObject; Index: LongInt);
    Procedure ButtonDomainDownOnClick (Sender: TObject);
    Procedure ButtonDomainUpOnClick (Sender: TObject);
    Procedure lbLocalDomainSearchlistOnItemFocus (Sender: TObject;
      Index: LongInt);
    Procedure lbLocalDomainSearchlistOnClick (Sender: TObject);
    Procedure ButtonLanDomainEditOnClick (Sender: TObject);
    Procedure ButtonLanDomainAddOnClick (Sender: TObject);
    Procedure lbDNSServersOnItemFocus (Sender: TObject; Index: LongInt);
    Procedure ButtonDnsDeleteOnClick (Sender: TObject);
    Procedure ButtonDnsEditOnClick (Sender: TObject);
    Procedure MenuItem2OnClick (Sender: TObject);
    Procedure Button2OnClick (Sender: TObject);
    Procedure MenuItemBackupRestoreOnClick (Sender: TObject);
    Procedure MenuItemDNSMoveUPOnClick (Sender: TObject);
    Procedure MenuItemDNSMoveDownOnClick (Sender: TObject);
    Procedure ButtonDNSUPOnClick (Sender: TObject);
    Procedure ButtonDNSDownOnClick (Sender: TObject);
    Procedure EditTimedParamOnChange (Sender: TObject);
    Procedure EditSysLogdParamOnChange (Sender: TObject);
    Procedure EditRSVPDParamOnChange (Sender: TObject);
    Procedure EditSendMailParamOnChange (Sender: TObject);
    Procedure EditPortmapParamOnChange (Sender: TObject);
    Procedure EditTalkDParamOnChange (Sender: TObject);
    Procedure EditRouteDParamOnChange (Sender: TObject);
    Procedure EditLPRPortDParamOnChange (Sender: TObject);
    Procedure EditLPDParamOnChange (Sender: TObject);
    Procedure EditRSHDParamOnChange (Sender: TObject);
    Procedure RexecdParamOnChange (Sender: TObject);
    Procedure EditNFSDParamOnChange (Sender: TObject);
    Procedure EditPCNFSDParamOnChange (Sender: TObject);
    Procedure TCPAutostartNotebookOnPageChanged (Sender: TObject);
    Procedure Button1OnClick (Sender: TObject);
    Procedure ButtonDNSAddOnClick (Sender: TObject);
    Procedure ButtonNFSDOnClick (Sender: TObject);
    Procedure ButtonTimedOnClick (Sender: TObject);
    Procedure ButtonSysLOGDOnClick (Sender: TObject);
    Procedure ButtonRSVPDOnClick (Sender: TObject);
    Procedure ButtonSendmailOnClick (Sender: TObject);
    Procedure ButtonPortmapOnClick (Sender: TObject);
    Procedure ButtonTalkDOnClick (Sender: TObject);
    Procedure ButtonROuteDOnClick (Sender: TObject);
    Procedure ButtonLPRPortDOnClick (Sender: TObject);
    Procedure ButtonLPDOnClick (Sender: TObject);
    Procedure ButtonRSHDOnClick (Sender: TObject);
    Procedure EditTelnetParamOnChange (Sender: TObject);
    Procedure ButtonPCNFSDOnClick (Sender: TObject);
    Procedure rbPCNFSDSOnClick (Sender: TObject);
    Procedure rbPCNFSDBOnClick (Sender: TObject);
    Procedure rbPCNFSDFOnClick (Sender: TObject);
    Procedure cbPCNfsDEnabledOnClick (Sender: TObject);
    Procedure rbNFSDSOnClick (Sender: TObject);
    Procedure rbNFSDBOnClick (Sender: TObject);
    Procedure rbNFSDFOnClick (Sender: TObject);
    Procedure cbNFSDEnabledOnClick (Sender: TObject);
    Procedure rbTimedSOnClick (Sender: TObject);
    Procedure rbTimedBOnClick (Sender: TObject);
    Procedure rbTimedFOnClick (Sender: TObject);
    Procedure cbTimedEnabledOnClick (Sender: TObject);
    Procedure rbSyslogdSOnClick (Sender: TObject);
    Procedure rbSyslogdBOnClick (Sender: TObject);
    Procedure rbSysLogDFOnClick (Sender: TObject);
    Procedure cbSysLoGDEnabledOnClick (Sender: TObject);
    Procedure rbRSVPDSOnClick (Sender: TObject);
    Procedure rbRSVPDBOnClick (Sender: TObject);
    Procedure rbRSVPDFOnClick (Sender: TObject);
    Procedure CBRSVPDEnabledOnClick (Sender: TObject);
    Procedure rbSendMailSOnClick (Sender: TObject);
    Procedure rbSendMailBOnClick (Sender: TObject);
    Procedure rbSendMailFOnClick (Sender: TObject);
    Procedure cbSendmailEnabledOnClick (Sender: TObject);
    Procedure rbPortmapSOnClick (Sender: TObject);
    Procedure rbPortmapBOnClick (Sender: TObject);
    Procedure rbPortmapFOnClick (Sender: TObject);
    Procedure cbPortmapEnabledOnClick (Sender: TObject);
    Procedure rbTalkDSOnClick (Sender: TObject);
    Procedure rbTalkdBOnClick (Sender: TObject);
    Procedure rbTalkDFOnClick (Sender: TObject);
    Procedure cbTalkDEnabledOnClick (Sender: TObject);
    Procedure rbRouteDSOnClick (Sender: TObject);
    Procedure rbRouteDBOnClick (Sender: TObject);
    Procedure rbRouteDFOnClick (Sender: TObject);
    Procedure cbRouteDEnabledOnClick (Sender: TObject);
    Procedure cbLPRPortDEnabledOnClick (Sender: TObject);
    Procedure rbLPRPortdSOnClick (Sender: TObject);
    Procedure rbLprPortdBOnClick (Sender: TObject);
    Procedure rbLPRPortdFOnClick (Sender: TObject);
    Procedure cbLPDEnabledOnClick (Sender: TObject);
    Procedure rbLPDSOnClick (Sender: TObject);
    Procedure rbLPDBOnClick (Sender: TObject);
    Procedure rbLPDFOnClick (Sender: TObject);
    Procedure cbRSHDEnabledOnClick (Sender: TObject);
    Procedure rbRSHDsOnClick (Sender: TObject);
    Procedure rbRSHDBOnClick (Sender: TObject);
    Procedure rbRSHDfOnClick (Sender: TObject);
    Procedure rbRexecdSOnClick (Sender: TObject);
    Procedure rbRexecdBOnClick (Sender: TObject);
    Procedure rbRexecdFOnClick (Sender: TObject);
    Procedure ButtonRexEcDOnClick (Sender: TObject);
    Procedure ButtonTFPDOnClick (Sender: TObject);
    Procedure EditTFPDParamOnChange (Sender: TObject);
    Procedure rbTFTPDSOnClick (Sender: TObject);
    Procedure rbTftpdBOnClick (Sender: TObject);
    Procedure rbTftpdFOnClick (Sender: TObject);
    Procedure cbTFTPDEnabledOnClick (Sender: TObject);
    Procedure EditFTPParamOnChange (Sender: TObject);
    Procedure rbFTPSOnClick (Sender: TObject);
    Procedure rbFTPBOnClick (Sender: TObject);
    Procedure rbFTPFOnClick (Sender: TObject);
    Procedure cbFTPEnabledOnClick (Sender: TObject);
    Procedure cbTelnetEnabledOnClick (Sender: TObject);
    Procedure cbRexecdEnabledOnClick (Sender: TObject);
    Procedure ButtonFTPDOnClick (Sender: TObject);
    Procedure rbTelnetSOnClick (Sender: TObject);
    Procedure rbTelnetBOnClick (Sender: TObject);
    Procedure rbTelnetFOnClick (Sender: TObject);
    Procedure ButtonTelnetOnClick (Sender: TObject);
    Procedure BitmapListBox3OnItemFocus (Sender: TObject; Index: LongInt);
    Procedure BitmapListBox3OnSetupShow (Sender: TObject);
    Procedure cbInetdSymbolssizeOnClick (Sender: TObject);
    Procedure cbTimeDOnClick (Sender: TObject);
    Procedure cbRSHDOnClick (Sender: TObject);
    Procedure cbLPDOnClick (Sender: TObject);
    Procedure cbRexecDOnClick (Sender: TObject);
    Procedure cbTelnetDOnClick (Sender: TObject);
    Procedure cbInetDOnClick (Sender: TObject);
    Procedure cbInetdAllServerOnClick (Sender: TObject);
    Procedure TCPAutostartNotebookOnSetupShow (Sender: TObject);
    Procedure GroupBox56OnClick (Sender: TObject);
    Procedure DebugButtonOnClick (Sender: TObject);
    Procedure Form1OnClose (Sender: TObject; Var Action: TCloseAction);
    Procedure Form1OnShow (Sender: TObject);
    Procedure lbServicesUserOnItemFocus (Sender: TObject; Index: LongInt);
    Procedure ButtonSocksServerDeleteOnClick (Sender: TObject);
    Procedure lbSOCKSServerUserIDOnItemFocus (Sender: TObject; Index: LongInt);
    Procedure lbSOCKSServerSubnetOnItemFocus (Sender: TObject; Index: LongInt);
    Procedure lbSocksServerTargetIPOnItemFocus (Sender: TObject;
      Index: LongInt);
    Procedure lbSOCKSServerIPOnItemFocus (Sender: TObject; Index: LongInt);
    Procedure ButtonSocksServerEditOnClick (Sender: TObject);
    Procedure RadioSocksSecurityOnClick (Sender: TObject);
    Procedure SocksNotebookOnSetupShow (Sender: TObject);
    Procedure ButtonIPrefreshOnClick (Sender: TObject);
    Procedure StringGrid1OnSelectCell (Sender: TObject; Col: LongInt;Row: LongInt);
    Procedure LanDomainDeleteOnClick (Sender: TObject);
    Procedure LANDomainEditOnClick (Sender: TObject);
    Procedure LANDomainAddOnClick (Sender: TObject);
    Procedure Edit1OnChange (Sender: TObject);
    Procedure ButtonHelpOnClick (Sender: TObject);
    Procedure Form1OnDestroy (Sender: TObject);
    Procedure BitmapListBox1OnItemFocus (Sender: TObject; Index: LongInt);
    Procedure ListBox1OnItemFocus (Sender: TObject; Index: LongInt);
    Procedure MenuItemOptionalSettingsOnClick (Sender: TObject);
    Procedure NfsHelpButtonOnClick (Sender: TObject);
    Procedure duplicateCheckboxOnClick (Sender: TObject);
    Procedure ListBox6OnItemFocus (Sender: TObject; Index: LongInt);
    Procedure ListBox5OnItemFocus (Sender: TObject; Index: LongInt);
    Procedure Form1OnSetupShow (Sender: TObject);
    Procedure MenuItemProgramSettingsOnClick (Sender: TObject);
    Procedure NfsDeleteButtonOnClick (Sender: TObject);
    Procedure NFSEditButtonOnClick (Sender: TObject);
    Procedure NFS_Rights_RadioOnClick (Sender: TObject);
    Procedure NFS_DirectoryOnItemFocus (Sender: TObject; Index: LongInt);
    Procedure NFSAddButtonOnClick (Sender: TObject);
    Procedure RadioButtonSaveProfileOnClick (Sender: TObject);
    Procedure RadioButtonLoadProfileOnClick (Sender: TObject);
    Procedure ProfilButtonOnClick (Sender: TObject);
    Procedure CancelButtonOnClick (Sender: TObject);
    Procedure OKButtonOnClick (Sender: TObject);
    Procedure OKButtonOnClick2 (Sender: TObject);
    Procedure CheckBoxDebugDeleteSYBFileOnClick (Sender: TObject);
    Procedure ButtonConfigureNFSOnClick (Sender: TObject);
    Procedure ButtonConfigureRexOnClick (Sender: TObject);
    Procedure ButtonConfigureFTPDOnClick (Sender: TObject);
    Procedure ButtonServicesUserDeleteOnClick (Sender: TObject);
    Procedure ButtonServicesUSerEditOnClick (Sender: TObject);
    Procedure ButtonServicesUserAddOnClick (Sender: TObject);
    Procedure ButtonConfigureTelnetdOnClick (Sender: TObject);
    Procedure ListBoxServicesUserOnItemFocus (Sender: TObject; Index: LongInt);
    Procedure TabbedNotebook1OnPageChanged (Sender: TObject);
    Procedure RadioGroupSocksPasswordOnClick (Sender: TObject);
    Procedure CheckBoxSOCKSEnableOnClick (Sender: TObject);
    Procedure ButtonAdvancedOnClick (Sender: TObject);
    Procedure ButtonAliasIPOnClick (Sender: TObject);
    Procedure ButtonSockServerEditOnClick (Sender: TObject);
    Procedure ButtonSockServerDeleteOnClick (Sender: TObject);
    Procedure ButtonSocksServerAddOnClick (Sender: TObject);
    Procedure ButtonSocksDirectDeleteOnClick (Sender: TObject);
    Procedure ButtonSocksDirectEditOnClick (Sender: TObject);
    Procedure BUTTONSocksDirectAddOnClick (Sender: TObject);
    Procedure ButtonSocksDomainDeleteOnClick (Sender: TObject);
    Procedure ButtonSocksDNSdeleteOnClick (Sender: TObject);
    Procedure ButtonSocksDNSeditOnClick (Sender: TObject);
    Procedure ButtonSocksDomainEditOnClick (Sender: TObject);
    Procedure ButtonSocksDNSaddOnClick (Sender: TObject);
    Procedure ButtonSocksDomainAddOnClick (Sender: TObject);
    Procedure EditHostnameOnChange (Sender: TObject);
    Procedure ListBox3OnItemFocus (Sender: TObject; Index: LongInt);
    Procedure Button6OnClick (Sender: TObject);
    Procedure Button4OnClick (Sender: TObject);
    Procedure EditLoopBackSubnetOnChange (Sender: TObject);
    Procedure EditLoopbackIPOnChange (Sender: TObject);
    Procedure Form1OnCreate (Sender: TObject);
    Procedure ButtonHostDeleteOnClick (Sender: TObject);
    Procedure ButtonHostEditOnClick (Sender: TObject);
    Procedure ButtonHostAddOnClick (Sender: TObject);
    Procedure Form1OnCloseQuery (Sender: TObject; Var CanClose: Boolean);
    Procedure ButtonIPAdressEditOnClick (Sender: TObject);
    Procedure ButtonIPAdressDeleteOnClick (Sender: TObject);
    Procedure ButtonIPAdressAddOnClick (Sender: TObject);
    Procedure ButtonRouteDeleteOnClick (Sender: TObject);
    Procedure ButtonRouteEditOnClick (Sender: TObject);
    Procedure ButtonRouteAddOnClick (Sender: TObject);
    Procedure TabbedNotebook1OnSetupShow (Sender: TObject);
    Procedure ProcessParamstring;
  Private
    {Private Deklarationen hier einfgen}

  Public
    {ffentliche Deklarationen hier einfgen}
  Procedure ClearInterfaces(Index:Byte);
  Procedure DisplayInterfaces(NewEntry:Boolean);
  Procedure DisplayRoutings;
  Procedure CLearRoutings(Index:Longint);
  Procedure DisplayPrinter;
  Procedure DisplayDomains;
  Procedure DisplayHostlist;
  Procedure DisplaySocks;
  Procedure DisplayUsers;
  Procedure DisplayServerServices;
  Procedure MoveSettings;
  Procedure DoAutoStartSettings(Index:Longint);
  Function MakeExecString(Index:Longint):String;
  Procedure StartStopServer(Button:TButton);
  Procedure GetProcessInfo(Index:Longint);
  Procedure ButtonCaption(aButton:TButton;Index:Longint);
  Procedure GetAllRunningServerPids;
  Procedure StartAllServers;
  Procedure ClearHomeIP;
  Procedure DisplayDNS;
  Procedure DisplaySocksDNS;
  Procedure CheckEnvironmentVariables;
  Procedure AssignIcons;
  Procedure LanguageSettings;
  Procedure InitVars;
  Procedure StartupCheck;
  Procedure DIsplaySplashScreen;
  Procedure FTPDCHeck;

  End;
USES Dialogs,TCPUtilityUnit,TCP_VAR_Unit,MyMessageBox,TCP_Unit_FileOperation,DebugUnit,
     TCP_Unit_QueryEntrys,TCP_NFSWizard,TCP_Options,TCP_LanguageUnit,TCP_INIFIles,TCP_SettingsNotebook,TCP_STDIOError,TCP_AutoStart,
TCP_ConfigSysAdd,TCP_NewIPWizard,TCP_RoutingWizard,TCP_DNSWizard,TCP_HostListWizard,TCP_HostListWizard,TCP_FinalNoteDialog,TCP_SOcksWizard,TCP_ServerServiceWizard,TCP_UserWizard,TCP_NewINIFile;

            
Var
  Form1: TForm1;
imports
Function DLLVersion:Integer; 'TCPLIB' NAME 'DLLVersion';
Procedure QueryInterfaceAndRoutings; 'TCPLIB' NAME 'QueryInterfaceAndRoutings';
Procedure TestDLL(aString:String;aString2:String); 'TCPLIB' NAME 'DLLTest';
//Procedure QueryProcess(PName:String;Mode:Byte); 'TCPLIB' NAME 'QueryProcessList';
Function TCPStart(Path:String):longint; 'TCPLIB' NAME 'Execute_TCPStart';
Procedure MyTest(test:String;B:Byte); 'TCPLIB' NAME 'teststri2';
Procedure MBox; 'TCPLIB' NAME 'MBox';
Function DLLResultStr:String; 'TCPLIB' NAME 'DllReturnString';
Function DllTerminate:Boolean; 'TCPLIB' NAME 'Terminate';
end;
Implementation

CONST
     Query_PID=0;
     Query_Filename=1;

{$R FORM1}

VAR
     ListBoxEntryString:String;
     {HelpFillStr       :String;}
     CloseAllowed      :Boolean;
     {HostNameChanged   :Boolean;}
     ConfigSYSFile     :TCOnfigSysFile;
     BMP1,BMP2,BMp3,bmp4:TBitmap;
     BMP_IFNew          :TBitmap;
     ICON1,ICON2       :TIcon;
     SplashIndex       : Byte;
     StartupComplete   : Boolean;
     UserINI           : TOS2SystemINiFile;
     NLS_ButtonStri1   :String;
     NLS_ButtonStri2   :String;
     ICO_Warning       : TIcon;
     ICO_HomeIP        : Ticon;
     ICO_IP            : TIcon;
     ICO_Subnet        : TIcon;
     ICO_DHCP          : TIcon;
     ICO_SYSTEM        : TIcon;
     ICO_RouteNet      : TIcon;
     ICO_RouteDefault  : TIcon;
     ICO_RouteHOst     : TIcon;
     BMP_NewInterface  : TBitmap;
     STATUS_Info1      : String;
     STATUS_Info2      : String;

     Procedure SplashInc(VAR Index:byte);
     Begin
          IF StartUPComplete Then exit;
          IF not Application.ProgramIniFile.ReadBool('Settings','SPLASH_SCREEN',TRUE) Then exit;
          SplashScreenForm.ImageList1.GetBitmap(Index,SplashScreenForm.Image1.Bitmap);
          SplashScreenForm.Update;
          Inc(Index);IF Index=29 Then Index:=0;
          SplashScreenForm.Focus;
     End;


{ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
 บ                                                                          บ
 บ    Form1 Events (ON Procedure)                                           บ
 บ                                                                          บ
 บ    This Section : SOCKS                                                  บ
 บ                                                                          บ
 ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ}



Procedure TForm1.BitmapListBox2OnItemFocus (Sender: TObject; Index: LongInt);
Begin
     BitmapListBox3.ItemIndex:=Index;
End;


Procedure TForm1.StringGrid1OnSetupShow (Sender: TObject);
Begin
     StringGrid1.ColWidths[0]:=Application.ProgramIniFile.ReadInteger('Settings','StringGridColWidths0',142);
     StringGrid1.ColWidths[1]:=Application.ProgramIniFile.ReadInteger('Settings','StringGridColWidths1',145);
     StringGrid1.ColWidths[2]:=Application.ProgramIniFile.ReadInteger('Settings','StringGridColWidths2',209);
     StringGrid1.ColWidths[3]:=Application.ProgramIniFile.ReadInteger('Settings','StringGridColWidths3',151);
End;

Procedure TForm1.StringGrid1OnResize (Sender: TObject);
Begin
     Beep(100,100);
End;

Procedure TForm1.lbRoutingsOnItemFocus (Sender: TObject; Index: LongInt);
Begin
      ButtonRouteEdit.Enabled:=TRUE;
     ButtonRouteDelete.Enabled:=TRUE;
End;

Procedure TForm1.MenuItemRouteDownOnClick (Sender: TObject);
VAR Index:Longint;
 Begin
  Index:=lbRoutings.ItemIndex;
     IF Index<>lbRoutings.Items.count-1 Then
     Begin
     DebugForm.LBRouteNetType.items.Move(Index,Index+1);
     DebugForm.LBRouteTargetAdress.Items.Move(Index,Index+1);
     DebugForm.LBRouteGateway.items.Move(Index,Index+1);
     DebugForm.LBRouteSubnetmask.items.Move(Index,Index+1);
     DebugForm.LBRouteHopCount.items.Move(Index,Index+1);
     DisplayRoutings;
     lbRoutings.ItemIndex:=Index-1;
     End;
End;

Procedure TForm1.MenuItemRouteUpOnClick (Sender: TObject);
VAR Index:Longint;
Begin
     Index:=lbRoutings.ItemIndex;
     IF lbRoutings.ItemIndex<>0 Then
     Begin
     DebugForm.LBRouteNetType.items.Move(Index,Index-1);
     DebugForm.LBRouteTargetAdress.Items.Move(Index,Index-1);
     DebugForm.LBRouteGateway.items.Move(Index,Index-1);
     DebugForm.LBRouteSubnetmask.items.Move(Index,Index-1);
     DebugForm.LBRouteHopCount.items.Move(Index,Index-1);
     DisplayRoutings;
     lbRoutings.ItemIndex:=Index-1;
     End;
End;

Procedure TForm1.lbRoutingNetTypeOnItemFocus (Sender: TObject; Index: LongInt);
Begin
   {lbRoutingNetType.ItemIndex:=Index;
   lbRoutingGateway.ItemIndex:=Index;
   lbRoutingSubnet.ItemIndex:=Index;
   lbRoutingMetric.ItemIndex:=Index;
   lbRoutingTargetIP.ItemIndex:=Index;
   ButtonRouteEdit.Enabled:=True;
   ButtonRouteDelete.Enabled:=True;}
End;

Procedure TForm1.MenuItemProfileManagerOnClick (Sender: TObject);
Begin
     ProfileManager.Create(Self);
     If ProfileManager.ShowModal<>cmCancel Then
     Begin
          DebugForm.ClearAll;
          TabbedNotebook1.OnSetupShow(Self);
     End;
     ProfileManager.Destroy;
End;

Procedure TForm1.lbSOCKSNameServerOnItemFocus (Sender: TObject;
  Index: LongInt);
Begin
     ButtonSOCKSDNSDelete.Enabled:=TRUE;
     ButtonSOCKSDNSEdit.Enabled:=True;
End;

Procedure TForm1.lbSOCKSDomainsOnItemFocus (Sender: TObject; Index: LongInt);
Begin
    ButtonSOCKSDomainDelete.Enabled:=True;
    ButtonSOCKSDomainEdit.Enabled:=True;
End;

{ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
 บ                                                                          บ
 บ    Form1 Events (ON Procedure)                                           บ
 บ                                                                          บ
 บ    This Section : DNS & Domain Searchlist                                บ
 บ                                                                          บ
 ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ}


Procedure TForm1.ButtonDnsUpOnClick (Sender: TObject);
VAR Index:Longint;
Begin
    Index:=lbDnsServers.ItemIndex;
     IF lbDnsServers.ItemIndex<>0 Then
     Begin
     DebugForm.lbDNSSetup.items.Move(Index,Index-1);
     DisplayDNS;
     lbDnsServers.ItemIndex:=Index-1;
     End;
End;

Procedure TForm1.ButtonDNSDownOnClick (Sender: TObject);
VAR Index:Byte;
Begin
     Index:=lbDNSServers.ItemIndex;
     IF Index<>LBDnsServers.Items.count-1 Then
     Begin
     DebugForm.lbDNSSetup.items.Move(Index,Index+1);
     DisplayDNS;
     lbDnsServers.ItemIndex:=Index+1;
     End;
End;

Procedure TForm1.ButtonDomainDownOnClick (Sender: TObject);
VAR Index:Longint;
Begin
     Index:=lbLocalDomainSearchlist.ItemIndex;
     IF Index<>lbLocalDomainSearchlist.Items.count-1 Then
     Begin
     DebugForm.lbDomainsSetup.items.Move(Index,Index+1);
     DisplayDomains;
     lbLocalDomainSearchlist.ItemIndex:=Index+1;
     End;
End;

Procedure TForm1.ButtonDomainUpOnClick (Sender: TObject);
VAR Index:Longint;

Begin
     Index:=lbLocalDomainSearchlist.ItemIndex;
     IF Index<>0 Then
     Begin
     DebugForm.lbDomainsSetup.items.Move(Index,Index-1);
     DisplayDomains;
     lbLocalDomainSearchlist.ItemIndex:=Index-1;
     End;
End;

Procedure TForm1.lbLocalDomainSearchlistOnItemFocus (Sender: TObject;
  Index: LongInt);
Begin
     ButtonLanDomainEdit.Enabled:=True;
     ButtonLanDomainDelete.Enabled:=True;
     IF Index=0 Then ButtonDomainUP.Enabled:=FALSE else ButtonDomainUp.Enabled:=TRUE;
     IF Index=lbLocalDomainSearchlist.Items.count-1 Then ButtonDomainDown.Enabled:=FALSE else ButtonDomainDown.Enabled:=TRUE;
End;

Procedure TForm1.lbLocalDomainSearchlistOnClick (Sender: TObject);
Begin

End;

Procedure TForm1.ButtonLanDomainEditOnClick (Sender: TObject);
Begin
     DNSWizard.Create(Self,MODE_DOMAIN);
     DNSWizard.Edit1.Text:=lbLocalDomainSearchlist.items[lbLocalDomainSearchlist.ItemIndex];
     Case DNSWizard.ShowModal of
     cmOK:Begin
               DebugForm.lbDomainsSetup.Items[lbLocalDomainSearchlist.ItemIndex]:=DNSWizard.Edit1.Text;
               DisplayDomains;
          End;
     End;
     DNSWizard.Destroy;
End;

Procedure TForm1.ButtonLanDomainAddOnClick (Sender: TObject);
Begin
     IF lbLocalDomainSearchlist.items.count=3 Then Begin NLSInfoBox('MAX_DOMAINS');Exit;End;
     DNSWizard.Create(Self,MODE_DOMAIN);
     Case DNSWizard.ShowModal of
     cmOK:Begin
               DebugForm.lbDomainsSetup.Items.add(DNSWizard.Edit1.Text);
               DisplayDomains;
          End;
     End;
     DNSWizard.Destroy;
End;

Procedure TForm1.lbDNSServersOnItemFocus (Sender: TObject; Index: LongInt);
VAR Test:Longint;
Begin
     Test:=lbDNSServers.itemIndex;
     ButtonDnsEdit.Enabled:=True;
     ButtonDnsDelete.Enabled:=True;
     IF lbDNSServers.itemIndex=0 Then ButtonDnsUP.Enabled:=FALSE else ButtonDNSUp.Enabled:=TRUE;
     IF lbDNSServers.itemIndex=lbDnsServers.Items.count-1 Then ButtonDnsDown.Enabled:=FALSE else ButtonDNsDown.Enabled:=TRUE;
End;

Procedure TForm1.ButtonDNSAddOnClick (Sender: TObject);
VAR RC:Longint;
Begin

     IF lbDNSServers.items.count=3 Then Begin NLSInfoBox('MAX_DNS');Exit;End;
     DNSWizard.Create(Self,MODE_DNS);
     Case DNSWizard.ShowModal of
     cmOK:Begin
               DebugForm.lbDnsSetup.Items.add(DNSWizard.Edit1.Text);
               DisplayDNS;
          End;
     End;
     DNSWizard.Destroy;
End;

Procedure TForm1.ButtonDnsEditOnClick (Sender: TObject);
Begin
     DNSWizard.Create(Self,MODE_DNS);
     DNSWizard.Edit1.Text:=lbDNSServers.items[lbDNSServers.ItemIndex];
     Case DNSWizard.ShowModal of
     cmOK:Begin
               DebugForm.lbDnsSetup.Items[lbDNSServers.ItemIndex]:=DNSWizard.Edit1.Text;
               DisplayDNS;
          End;
     End;
     DNSWizard.Destroy;
End;

Procedure TForm1.ButtonDnsDeleteOnClick (Sender: TObject);
Begin
     DebugForm.lbDNSSetup.Items.Delete(lbDNSServers.ItemIndex);
     DisplayDNS;
End;


{ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
 บ                                                                          บ
 บ    Form1 Events (ON Procedure)                                           บ
 บ                                                                          บ
 บ    This Section : Interface                                              บ
 บ                                                                          บ
 ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ}

Procedure TForm1.ButtonIPAdressAddOnClick (Sender: TObject);
VAR
   Index:Integer;
   RC   :Longint;
Begin
     IF Listbox1.Items.count+1>QueryAmountInterfaces Then Begin MyInfoBox(GetNlsString('Message','NOMORE_INTERFACES'));Exit;End;
     NewIPWizard.Create(Self);
     NewIPWizard.RadioIPSelect.ItemIndex:=0;
     NewIPWizard.ButtonNext.Enabled:=True;
     NewIPWizard.NewEntryFlag:=TRUE;
     RC:=NewIPWizard.ShowModal;
     NewIPWizard.Destroy;
     IF RC<>CMCancel Then
     Begin
          DisplayInterfaces(TRUE);
          CHangeRec.LanInterface:=TRUE;
     End;
End;


Procedure TForm1.ButtonIPAdressEditOnClick (Sender: TObject);
VAR Index,RC:longint;
Begin
   Index:=ListBox1.ItemIndex;IF Index=-1 Then exit;
      NewIPWizard.Create(Self);
     NewIPWizard.NewEntryFlag:=FALSE;
     NewIPWizard.EntryIndex:=ListBox1.ItemIndex;
     RC:=NewIPWizard.ShowModal;
     NewIPWizard.Destroy;
     IF RC<>CMCancel Then
     Begin
          DisplayInterfaces(False);
          ListBox1OnItemFocus(Self,Index);
          ChangeRec.LanInterface:=TRUE;
     End;
End;

Procedure TForm1.ButtonIPAdressDeleteOnClick (Sender: TObject);
VAR Index:Longint;
Begin
     ClearHomeIP;
     Index:=ListBox1.ItemIndex;
     ClearInterfaces(Index);
     DisplayInterfaces(FALSE);

End;




Procedure TForm1.MenuItem2OnClick (Sender: TObject);
Begin
   Convert_ProgramIni;
End;

Procedure TForm1.ClearHomeIP;
VAR POSI:Longint;S:String;
Begin
     // try to find the homeip in current IP adress
     IF BitmapListBox1.Items[BitmapListBox1.ItemIndex]=ALiasRec.HomeIP Then
     Begin
          AliasRec.HomeIP:='';
          AliasRec.HomeSubnet:='';
     End;
     Posi:=ALiasRec.AliasIP[BitMapListBox1.ItemIndex].Indexof(AliasRec.HomeIP);
     IF Posi<>-1 Then
     Begin
          AliasRec.HomeIP:='';
          AliasRec.HomeSubnet:='';
     End;
End;

Procedure TForm1.Button2OnClick (Sender: TObject);
Begin
End;

Procedure TForm1.MenuItemBackupRestoreOnClick (Sender: TObject);
Begin
     BackupRestoreWizard.Create(Self);
     IF BackupRestoreWizard.ShowModal<>CmCancel Then
     Begin
          DebugForm.ClearAll;
          TabbedNotebook1.OnSetupShow(Self);
     End;
     BackupRestoreWizard.Destroy;
End;

Procedure TForm1.MenuItemDNSMoveUPOnClick (Sender: TObject);
Begin
     ButtonDNSUPOnClick(Self);
End;

Procedure TForm1.MenuItemDNSMoveDownOnClick (Sender: TObject);
Begin
     ButtonDNSDownOnClick(self);
End;



{ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
 บ                                                                          บ
 บ     This Section :  Autostart Services                                   บ
 บ                                                                          บ
 บ     Version 2 20-24.11.2005 - last changed 29.11.2005                    บ
 บ                                                                          บ
 ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ}


Procedure TForm1.EditTimedParamOnChange (Sender: TObject);
Begin
    AutoStartRec[BitmapListBox3.ItemIndex+1].Parameter:=EditTimeDParam.Text;
    AutoStartRec[BitmapListBox3.ItemIndex+1].CHanged:=TRUE;
End;

Procedure TForm1.EditSysLogdParamOnChange (Sender: TObject);
Begin
    AutoStartRec[BitmapListBox3.ItemIndex+1].Parameter:=EditSysLoGDParam.Text;
    AutoStartRec[BitmapListBox3.ItemIndex+1].CHanged:=TRUE;
End;

Procedure TForm1.EditRSVPDParamOnChange (Sender: TObject);
Begin
    AutoStartRec[BitmapListBox3.ItemIndex+1].Parameter:=EditRSVPDParam.Text;
    AutoStartRec[BitmapListBox3.ItemIndex+1].CHanged:=TRUE;
End;

Procedure TForm1.EditSendMailParamOnChange (Sender: TObject);
Begin
    AutoStartRec[BitmapListBox3.ItemIndex+1].Parameter:=EditSendMailParam.Text;
    AutoStartRec[BitmapListBox3.ItemIndex+1].CHanged:=TRUE;
End;

Procedure TForm1.EditPortmapParamOnChange (Sender: TObject);
Begin
    AutoStartRec[BitmapListBox3.ItemIndex+1].Parameter:=EditPortmapParam.Text;
    AutoStartRec[BitmapListBox3.ItemIndex+1].CHanged:=TRUE;
End;

Procedure TForm1.EditTalkDParamOnChange (Sender: TObject);
Begin
    AutoStartRec[BitmapListBox3.ItemIndex+1].Parameter:=EditTalkDParam.Text;
    AutoStartRec[BitmapListBox3.ItemIndex+1].CHanged:=TRUE;
End;

Procedure TForm1.EditRouteDParamOnChange (Sender: TObject);
Begin
    AutoStartRec[BitmapListBox3.ItemIndex+1].Parameter:=EditRouteDParam.Text;
    AutoStartRec[BitmapListBox3.ItemIndex+1].CHanged:=TRUE;
End;

Procedure TForm1.EditLPRPortDParamOnChange (Sender: TObject);
Begin
    AutoStartRec[BitmapListBox3.ItemIndex+1].Parameter:=EditLPRPortDParam.Text;
    AutoStartRec[BitmapListBox3.ItemIndex+1].CHanged:=TRUE;
End;

Procedure TForm1.EditLPDParamOnChange (Sender: TObject);
Begin
    AutoStartRec[BitmapListBox3.ItemIndex+1].Parameter:=EditLPDParam.Text;
    AutoStartRec[BitmapListBox3.ItemIndex+1].CHanged:=TRUE;
End;

Procedure TForm1.EditRSHDParamOnChange (Sender: TObject);
Begin
    AutoStartRec[BitmapListBox3.ItemIndex+1].Parameter:=EditRSHDParam.Text;
    AutoStartRec[BitmapListBox3.ItemIndex+1].CHanged:=TRUE;
End;

Procedure TForm1.RexecdParamOnChange (Sender: TObject);
Begin
    AutoStartRec[BitmapListBox3.ItemIndex+1].Parameter:=RexECDParam.Text;
    AutoStartRec[BitmapListBox3.ItemIndex+1].CHanged:=TRUE;
End;

Procedure TForm1.EditNFSDParamOnChange (Sender: TObject);
Begin
    AutoStartRec[BitmapListBox3.ItemIndex+1].Parameter:=EditNFSDParam.Text;
    AutoStartRec[BitmapListBox3.ItemIndex+1].CHanged:=TRUE;
End;

Procedure TForm1.EditPCNFSDParamOnChange (Sender: TObject);
Begin
    AutoStartRec[BitmapListBox3.ItemIndex+1].Parameter:=EditPCNFSDParam.Text;
    AutoStartRec[BitmapListBox3.ItemIndex+1].CHanged:=TRUE;
End;

Procedure TForm1.TCPAutostartNotebookOnPageChanged (Sender: TObject);
Begin
End;

Procedure TForm1.Button1OnClick (Sender: TObject);
VAR
Dummy:String;
Zahl:Longint;
INI:TOS2UserIniFile;
Begin
{     TabbedNotebook1.Pages.Insert(2,'HOST-Liste');
     TabbedNotebook1.Pages.Insert(4,'SOCKS');
     TabbedNotebook1.Pages.Insert(5,'Drucker');
     TabbedNotebook1.Pages.Insert(6,'NFS');
     TabbedNotebook1.Pages.Insert(7,'Benutzer');
     TabbedNotebook1.Pages.Insert(8,'Auto');}
     //WriteFileEaData('C:\TCPIP\BIN\FTPD.EXE','IBM FTPD');
     //ShowMessage(GetFileEaData('C:\TCPIP\BIN\FTPD.EXE',TRUE,Dummy));
     {If InputQuery('HexZahl','Zahl :',Dummy) Then
     begin
          Zahl:=Hex2Dec(Dummy);
          ShowMessage(ToStr(zahl));
     ENd;}
End;

Procedure TForm1.GetAllRunningServerPIDS;
VAR PIDLoop:Byte;
     ProcessList:TStringlist;
     ProcessName:String;
     PID:String;
Begin
     Cursor:=CrHourGlass;
     ProcessList.Create;
     GetProcessList(ProcessList);

     FOr PIDLoop:=0 to AutostartRec[0].Amount-1 do
     Begin
          IF AutoStartRec[PIDLoop].Enabled Then
          Begin
               {QueryProcess(AutoStartRec[PIDLoop].ServName,Query_PID);}
               IF FindMultiValueListItem(AutoStartRec[PIDLoop].ServName,ProcessList)<>-1 Then
               Begin
                   // AutoStartRec[PIDLoop].Pid:=DllResultStr;
                   ShowMessage('Gefunden !');
               End;
          END;
     End;

     Cursor:=CrDefault;
End;

Procedure TForm1.StartAllServers;
VAR
   ServerLoop:Byte;
   RC:Longint;
   PID:String;
   ResultStr:String;
Begin
     DebugForm.AutostartMemo.clear;
     For ServerLoop:=0 to AutoStartRec[0].Amount-1 do
     Begin
            Cursor:=CrHourGlass;
            application.processMessages;
            IF AutoStartRec[ServerLoop].Enabled Then // only start Servers wich are marked as on (enabled)
            Begin
                 // Feststellen ob der Dienst nicht schon zuvor gestaret wurde
                Pid:=NewQueryProcess(AutoStartRec[ServerLoop].ServName,Query_PID);
                 IF PID='-1' Then
                 Begin
                      RC:=Execute_TCPServer(MakeExecString(ServerLoop));IF RC<>0 Then Begin FileCreateError(RC,'TCPHLP.CMD');Exit;End; // TCPHLP.CMD file could not be created or written to
                      DebugForm.AutostartMemo.lines.add('Ausfhren / Starten von : '+MakeExecString(ServerLoop)+#13+ToStr(Serverloop) );
                 End
                    else DebugForm.AutoStartMemo.lines.add('Dienst ist bereits gestaret : '+AutoStartRec[ServerLoop].ServName);
            End else
            Begin
                 // Prozess PID einholen von Servern die nicht gestartet werden sollen ..
                 Pid:=NewQueryProcess(AutoStartRec[ServerLoop].ServName,Query_PID);
                 IF PID<>'-1' Then
                 begin
                      // Dieser Dienst luft gerade, also beende ihn
                      DebugForm.AutoStartMemo.Lines.add('Beenden von PID : '+PID+' '+AutoStartRec[ServerLoop].ServName);
                      //showmessage('Beenden von PID : '+PID+' '+AutoStartRec[ServerLoop].ServName);
                      MyKillProcess(PID);
                 End;
            End;
     End;
Cursor:=Crdefault;;
End;

Procedure TForm1.ButtonNFSDOnClick (Sender: TObject);
Begin
  StartStopServer(ButtonNFSD);
End;

Procedure TForm1.ButtonTimedOnClick (Sender: TObject);
Begin
  StartStopServer(ButtonTimed);
End;

Procedure TForm1.ButtonSysLOGDOnClick (Sender: TObject);
Begin
  StartStopServer(ButtonSysLogD);
End;

Procedure TForm1.ButtonRSVPDOnClick (Sender: TObject);
Begin
     StartStopServer(ButtonRSVPD);
End;

Procedure TForm1.ButtonSendmailOnClick (Sender: TObject);
Begin
  StartStopServer(ButtonSendMail);
End;

Procedure TForm1.ButtonPortmapOnClick (Sender: TObject);
Begin
  StartStopServer(ButtonPortMap);
End;

Procedure TForm1.ButtonTalkDOnClick (Sender: TObject);
Begin
  StartStopServer(ButtonTalkD);
End;

Procedure TForm1.ButtonROuteDOnClick (Sender: TObject);
Begin
  StartStopServer(ButtonRouteD);
End;

Procedure TForm1.ButtonLPRPortDOnClick (Sender: TObject);
Begin
  StartStopServer(ButtonLPRPortD);
End;

Procedure TForm1.ButtonLPDOnClick (Sender: TObject);
Begin
  StartStopServer(ButtonLPD);
End;

Procedure TForm1.ButtonRSHDOnClick (Sender: TObject);
Begin
     StartStopServer(ButtonRSHD);
End;

Procedure TForm1.ButtonTelnetOnClick (Sender: TObject);
Begin
  StartStopServer(ButtonTelnet);
End;

Procedure TForm1.ButtonFTPDOnClick (Sender: TObject);
Begin
    StartStopServer(ButtonFTPD);
End;

Procedure TForm1.EditTelnetParamOnChange (Sender: TObject);
Begin
     AutoStartRec[BitmapListBox3.ItemIndex+1].Parameter:=EditTelnetParam.Text;
     AutoStartRec[BitmapListBox3.ItemIndex+1].CHanged:=TRUE;
End;

Procedure TForm1.ButtonPCNFSDOnClick (Sender: TObject);
Begin
     StartStopServer(ButtonPCNFSD);
End;


Procedure TForm1.ButtonCaption(aButton:TButton;Index:Longint);
Begin
     {IF DllResultStr<>'-1' Then Begin AutoStartRec[Index].PID:=DllResultStr;aButton.Caption:=NLS_ButtonStri2;End
                           else aButton.Caption:=NLS_ButtonStri1;}
     IF AutoStartRec[Index].PID<>'-1' Then Begin aButton.Caption:=NLS_ButtonStri2;End
                           else aButton.Caption:=NLS_ButtonStri1;
End;

Procedure TForm1.GetProcessInfo(Index:Longint);
Begin
           Self.Cursor:=crHourGlass;
          { IF AutoStartRec[Index].ServName='FTPD' Then
           Begin
                //QueryProcess(ProgramSettings.TCPIPBINPath+'\'+AutoStartRec[Index].ServName+'.EXE',Query_PID);
                QueryProcess(Application.ProgramIniFIle.ReadString('Settings','TCPIP_BIN_PATH','')+AutoStartRec[Index].ServName+'.EXE',Query_PID)

           End else QueryProcess(AutoStartRec[Index].ServName,Query_PID);
           AutoStartRec[Index].PID:=DllResultStr;}
            {IF AutoStartRec[Index].ServName='FTPD' Then
           Begin
                AutoStartRec[Index].PID:=NewQueryProcess(Application.ProgramIniFIle.ReadString('Settings','TCPIP_BIN_PATH','')+'\'+AutoStartRec[Index].ServName+'.EXE',Query_PID)

           End else}
           AutostartRec[Index].Pid:=NewQueryProcess(AutoStartRec[Index].ServName,Query_PID);
           //ShowMessage(AutostartRec[Index].PID);
           Cursor:=crDefault;
End;

Procedure TForm1.StartStopServer(Button:TButton);
VAR RC:Longint;
Begin
     // STOP Server
     IF AutoStartRec[BitmapListBox3.ItemIndex+1].PID<>'-1' Then
     Begin
          MyKillProcess(AutoStartRec[BitmapListBox3.ItemIndex+1].PID); // Kill the running program by his PID
          Button.Caption:=NLS_ButtonStri1;                             // Update Button Caption
          AutoStartRec[BitmapListBox3.ItemIndex+1].PID:='-1';          // Store PID -1 (not started)
     End else
     // Start Server
     Begin
           RC:=Execute_TCPServer( MakeExecString(BitmapListBox3.ItemIndex+1) );IF RC<>0 Then Begin FileCreateError(RC,'TCPHLP.CMD');Exit;End; // TCPHLP.CMD file could not be created or written to
           {Update the Button Caption and wait 200 ms before querying PID}
           Button.Caption:=NLS_ButtonStri2;Delay(200);
           {Query the PID of the executed program}
           //QueryProcess(AutoStartRec[BitmapListBox3.ItemIndex+1].ServName,Query_PID);AutoStartRec[BitmapListBox3.ItemIndex+1].Pid:=DllResultStr;
           AutoStartRec[BitmapListBox3.ItemIndex+1].Pid:=NewQueryProcess(AutoStartRec[BitmapListBox3.ItemIndex+1].ServName,Query_PID);
           //IF DllResultStr='-1' Then MyErrorBox('Fehler ! Server Dienst wurde nicht mehr in Prozessliste gefunden !');
           If AutoStartRec[BitmapListBox3.ItemIndex+1].Pid='-1' Then MyErrorBox('Fehler ! Server Dienst wurde nicht mehr in Prozessliste gefunden !');

     End;
End;



Procedure TForm1.rbPCNFSDSOnClick (Sender: TObject);
Begin
    AutoStartRec[BitMapListBox3.ItemIndex+1].ForeGround:=rbPCNFSDF.Checked;
     AutoStartRec[BitMapListBox3.ItemIndex+1].BackGround:=rbPCNFSDB.CHecked;
     AutoStartRec[BitMapListBox3.ItemIndex+1].Symbol:=rbPCNFSDS.checked;
     AutoStartRec[BitMapListBox3.ItemIndex+1].changed:=TRUE;
End;

Procedure TForm1.rbPCNFSDBOnClick (Sender: TObject);
Begin
  AutoStartRec[BitMapListBox3.ItemIndex+1].ForeGround:=rbPCNFSDF.Checked;
     AutoStartRec[BitMapListBox3.ItemIndex+1].BackGround:=rbPCNFSDB.CHecked;
     AutoStartRec[BitMapListBox3.ItemIndex+1].Symbol:=rbPCNFSDS.checked;
     AutoStartRec[BitMapListBox3.ItemIndex+1].changed:=TRUE;
End;

Procedure TForm1.rbPCNFSDFOnClick (Sender: TObject);
Begin
    AutoStartRec[BitMapListBox3.ItemIndex+1].ForeGround:=rbPCNFSDF.Checked;
     AutoStartRec[BitMapListBox3.ItemIndex+1].BackGround:=rbPCNFSDB.CHecked;
     AutoStartRec[BitMapListBox3.ItemIndex+1].Symbol:=rbPCNFSDS.checked;
     AutoStartRec[BitMapListBox3.ItemIndex+1].changed:=TRUE;
End;

Procedure TForm1.cbPCNfsDEnabledOnClick (Sender: TObject);
Begin
     AutoStartRec[BitMapListBox3.ItemIndex+1].Enabled:=cbPCNFSDEnabled.checked;
     AutoStartRec[BitMapListBox3.ItemIndex+1].changed:=TRUE;

End;

Procedure TForm1.rbNFSDSOnClick (Sender: TObject);
Begin
     AutoStartRec[BitMapListBox3.ItemIndex+1].ForeGround:=rbNFSDF.Checked;
     AutoStartRec[BitMapListBox3.ItemIndex+1].BackGround:=rbNFSDB.CHecked;
     AutoStartRec[BitMapListBox3.ItemIndex+1].Symbol:=rbNFSDS.checked;
     AutoStartRec[BitMapListBox3.ItemIndex+1].changed:=TRUE;
End;

Procedure TForm1.rbNFSDBOnClick (Sender: TObject);
Begin
     AutoStartRec[BitMapListBox3.ItemIndex+1].ForeGround:=rbNFSDF.Checked;
     AutoStartRec[BitMapListBox3.ItemIndex+1].BackGround:=rbNFSDB.CHecked;
     AutoStartRec[BitMapListBox3.ItemIndex+1].Symbol:=rbNFSDS.checked;
     AutoStartRec[BitMapListBox3.ItemIndex+1].changed:=TRUE;
End;

Procedure TForm1.rbNFSDFOnClick (Sender: TObject);
Begin
     AutoStartRec[BitMapListBox3.ItemIndex+1].ForeGround:=rbNFSDF.Checked;
     AutoStartRec[BitMapListBox3.ItemIndex+1].BackGround:=rbNFSDB.CHecked;
     AutoStartRec[BitMapListBox3.ItemIndex+1].Symbol:=rbNFSDS.checked;
     AutoStartRec[BitMapListBox3.ItemIndex+1].changed:=TRUE;
End;

Procedure TForm1.cbNFSDEnabledOnClick (Sender: TObject);
Begin
 AutoStartRec[BitMapListBox3.ItemIndex+1].Enabled:=cbNFSDEnabled.checked;
 AutoStartRec[BitMapListBox3.ItemIndex+1].changed:=TRUE;
End;

Procedure TForm1.rbTimedSOnClick (Sender: TObject);
Begin
     AutoStartRec[BitMapListBox3.ItemIndex+1].ForeGround:=rbTimeDF.Checked;
     AutoStartRec[BitMapListBox3.ItemIndex+1].BackGround:=rbTimeDB.CHecked;
     AutoStartRec[BitMapListBox3.ItemIndex+1].Symbol:=rbTimeDS.checked;
     AutoStartRec[BitMapListBox3.ItemIndex+1].changed:=TRUE;
End;

Procedure TForm1.rbTimedBOnClick (Sender: TObject);
Begin
      AutoStartRec[BitMapListBox3.ItemIndex+1].ForeGround:=rbTimeDF.Checked;
     AutoStartRec[BitMapListBox3.ItemIndex+1].BackGround:=rbTimeDB.CHecked;
     AutoStartRec[BitMapListBox3.ItemIndex+1].Symbol:=rbTimeDS.checked;
     AutoStartRec[BitMapListBox3.ItemIndex+1].changed:=TRUE;
End;

Procedure TForm1.rbTimedFOnClick (Sender: TObject);
Begin
      AutoStartRec[BitMapListBox3.ItemIndex+1].ForeGround:=rbTimeDF.Checked;
     AutoStartRec[BitMapListBox3.ItemIndex+1].BackGround:=rbTimeDB.CHecked;
     AutoStartRec[BitMapListBox3.ItemIndex+1].Symbol:=rbTimeDS.checked;
     AutoStartRec[BitMapListBox3.ItemIndex+1].changed:=TRUE;
End;

Procedure TForm1.cbTimedEnabledOnClick (Sender: TObject);
Begin
    AutoStartRec[BitMapListBox3.ItemIndex+1].Enabled:=cbTimeDEnabled.checked;
    AutoStartRec[BitMapListBox3.ItemIndex+1].changed:=TRUE;
End;

Procedure TForm1.rbSyslogdSOnClick (Sender: TObject);
Begin
     AutoStartRec[BitMapListBox3.ItemIndex+1].ForeGround:=rbSyslogDF.Checked;
     AutoStartRec[BitMapListBox3.ItemIndex+1].BackGround:=rbSyslogDB.CHecked;
     AutoStartRec[BitMapListBox3.ItemIndex+1].Symbol:=rbSyslogDS.checked;
     AutoStartRec[BitMapListBox3.ItemIndex+1].changed:=TRUE;
End;

Procedure TForm1.rbSyslogdBOnClick (Sender: TObject);
Begin
     AutoStartRec[BitMapListBox3.ItemIndex+1].ForeGround:=rbSyslogDF.Checked;
     AutoStartRec[BitMapListBox3.ItemIndex+1].BackGround:=rbSyslogDB.CHecked;
     AutoStartRec[BitMapListBox3.ItemIndex+1].Symbol:=rbSyslogDS.checked;
     AutoStartRec[BitMapListBox3.ItemIndex+1].changed:=TRUE;
End;

Procedure TForm1.rbSysLogDFOnClick (Sender: TObject);
Begin
     AutoStartRec[BitMapListBox3.ItemIndex+1].ForeGround:=rbSyslogDF.Checked;
     AutoStartRec[BitMapListBox3.ItemIndex+1].BackGround:=rbSyslogDB.CHecked;
     AutoStartRec[BitMapListBox3.ItemIndex+1].Symbol:=rbSyslogDS.checked;
     AutoStartRec[BitMapListBox3.ItemIndex+1].changed:=TRUE;
End;

Procedure TForm1.cbSysLoGDEnabledOnClick (Sender: TObject);
Begin
     AutoStartRec[BitMapListBox3.ItemIndex+1].Enabled:=cbSysLogDEnabled.checked;
     AutoStartRec[BitMapListBox3.ItemIndex+1].changed:=TRUE;
End;

Procedure TForm1.rbRSVPDSOnClick (Sender: TObject);
Begin
     AutoStartRec[BitMapListBox3.ItemIndex+1].ForeGround:=rbRSVPDF.Checked;
     AutoStartRec[BitMapListBox3.ItemIndex+1].BackGround:=rbRSVPDB.CHecked;
     AutoStartRec[BitMapListBox3.ItemIndex+1].Symbol:=rbRSVPDS.checked;
     AutoStartRec[BitMapListBox3.ItemIndex+1].changed:=TRUE;
End;

Procedure TForm1.rbRSVPDBOnClick (Sender: TObject);
Begin
 AutoStartRec[BitMapListBox3.ItemIndex+1].ForeGround:=rbRSVPDF.Checked;
     AutoStartRec[BitMapListBox3.ItemIndex+1].BackGround:=rbRSVPDB.CHecked;
     AutoStartRec[BitMapListBox3.ItemIndex+1].Symbol:=rbRSVPDS.checked;
     AutoStartRec[BitMapListBox3.ItemIndex+1].changed:=TRUE;
End;

Procedure TForm1.rbRSVPDFOnClick (Sender: TObject);
Begin
     AutoStartRec[BitMapListBox3.ItemIndex+1].ForeGround:=rbRSVPDF.Checked;
     AutoStartRec[BitMapListBox3.ItemIndex+1].BackGround:=rbRSVPDB.CHecked;
     AutoStartRec[BitMapListBox3.ItemIndex+1].Symbol:=rbRSVPDS.checked;
     AutoStartRec[BitMapListBox3.ItemIndex+1].changed:=TRUE;
End;

Procedure TForm1.CBRSVPDEnabledOnClick (Sender: TObject);
Begin
    AutoStartRec[BitMapListBox3.ItemIndex+1].Enabled:=cbRSVPDEnabled.Checked;
    AutoStartRec[BitMapListBox3.ItemIndex+1].changed:=TRUE;
End;

Procedure TForm1.rbSendMailSOnClick (Sender: TObject);
Begin
    AutoStartRec[BitMapListBox3.ItemIndex+1].ForeGround:=rbSendMailF.Checked;
     AutoStartRec[BitMapListBox3.ItemIndex+1].BackGround:=rbSendMailB.CHecked;
     AutoStartRec[BitMapListBox3.ItemIndex+1].Symbol:=rbSendMailS.checked;
     AutoStartRec[BitMapListBox3.ItemIndex+1].changed:=TRUE;
End;

Procedure TForm1.rbSendMailBOnClick (Sender: TObject);
Begin
    AutoStartRec[BitMapListBox3.ItemIndex+1].ForeGround:=rbSendMailF.Checked;
     AutoStartRec[BitMapListBox3.ItemIndex+1].BackGround:=rbSendMailB.CHecked;
     AutoStartRec[BitMapListBox3.ItemIndex+1].Symbol:=rbSendMailS.checked;
     AutoStartRec[BitMapListBox3.ItemIndex+1].changed:=TRUE;
End;

Procedure TForm1.rbSendMailFOnClick (Sender: TObject);
Begin
    AutoStartRec[BitMapListBox3.ItemIndex+1].ForeGround:=rbSendMailF.Checked;
     AutoStartRec[BitMapListBox3.ItemIndex+1].BackGround:=rbSendMailB.CHecked;
     AutoStartRec[BitMapListBox3.ItemIndex+1].Symbol:=rbSendMailS.checked;
     AutoStartRec[BitMapListBox3.ItemIndex+1].changed:=TRUE;
End;

Procedure TForm1.cbSendmailEnabledOnClick (Sender: TObject);
Begin
    AutoStartRec[BitMapListBox3.ItemIndex+1].Enabled:=cbSendMailEnabled.checked;
    AutoStartRec[BitMapListBox3.ItemIndex+1].changed:=TRUE;
End;

Procedure TForm1.rbPortmapSOnClick (Sender: TObject);
Begin
    AutoStartRec[BitMapListBox3.ItemIndex+1].ForeGround:=rbPortMapF.Checked;
     AutoStartRec[BitMapListBox3.ItemIndex+1].BackGround:=rbPortmapB.CHecked;
     AutoStartRec[BitMapListBox3.ItemIndex+1].Symbol:=rbPortMapS.checked;
     AutoStartRec[BitMapListBox3.ItemIndex+1].changed:=TRUE;
End;

Procedure TForm1.rbPortmapBOnClick (Sender: TObject);
Begin
    AutoStartRec[BitMapListBox3.ItemIndex+1].ForeGround:=rbPortMapF.Checked;
     AutoStartRec[BitMapListBox3.ItemIndex+1].BackGround:=rbPortmapB.CHecked;
     AutoStartRec[BitMapListBox3.ItemIndex+1].Symbol:=rbPortMapS.checked;
     AutoStartRec[BitMapListBox3.ItemIndex+1].changed:=TRUE;
End;

Procedure TForm1.rbPortmapFOnClick (Sender: TObject);
Begin
    AutoStartRec[BitMapListBox3.ItemIndex+1].ForeGround:=rbPortMapF.Checked;
     AutoStartRec[BitMapListBox3.ItemIndex+1].BackGround:=rbPortmapB.CHecked;
     AutoStartRec[BitMapListBox3.ItemIndex+1].Symbol:=rbPortMapS.checked;
     AutoStartRec[BitMapListBox3.ItemIndex+1].changed:=TRUE;
End;

Procedure TForm1.cbPortmapEnabledOnClick (Sender: TObject);
Begin
    AutoStartRec[BitMapListBox3.ItemIndex+1].Enabled:=cbPortMapEnabled.checked;
    AutoStartRec[BitMapListBox3.ItemIndex+1].changed:=TRUE;
End;

Procedure TForm1.rbTalkDSOnClick (Sender: TObject);
Begin
     AutoStartRec[BitMapListBox3.ItemIndex+1].ForeGround:=rbTalkDF.Checked;
     AutoStartRec[BitMapListBox3.ItemIndex+1].BackGround:=rbTalkDB.CHecked;
     AutoStartRec[BitMapListBox3.ItemIndex+1].Symbol:=rbTalkDS.checked;
     AutoStartRec[BitMapListBox3.ItemIndex+1].changed:=TRUE;
End;

Procedure TForm1.rbTalkdBOnClick (Sender: TObject);
Begin
     AutoStartRec[BitMapListBox3.ItemIndex+1].ForeGround:=rbTalkDF.Checked;
     AutoStartRec[BitMapListBox3.ItemIndex+1].BackGround:=rbTalkDB.CHecked;
     AutoStartRec[BitMapListBox3.ItemIndex+1].Symbol:=rbTalkDS.checked;
     AutoStartRec[BitMapListBox3.ItemIndex+1].changed:=TRUE;
End;

Procedure TForm1.rbTalkDFOnClick (Sender: TObject);
Begin
     AutoStartRec[BitMapListBox3.ItemIndex+1].ForeGround:=rbTalkDF.Checked;
     AutoStartRec[BitMapListBox3.ItemIndex+1].BackGround:=rbTalkDB.CHecked;
     AutoStartRec[BitMapListBox3.ItemIndex+1].Symbol:=rbTalkDS.checked;
     AutoStartRec[BitMapListBox3.ItemIndex+1].changed:=TRUE;
End;

Procedure TForm1.cbTalkDEnabledOnClick (Sender: TObject);
Begin
     AutoStartRec[BitMapListBox3.ItemIndex+1].Enabled:=cbTalkDEnabled.checked;
    AutoStartRec[BitMapListBox3.ItemIndex+1].changed:=TRUE;
End;

Procedure TForm1.rbRouteDSOnClick (Sender: TObject);
Begin
   AutoStartRec[BitMapListBox3.ItemIndex+1].ForeGround:=rbRouteDF.Checked;
     AutoStartRec[BitMapListBox3.ItemIndex+1].BackGround:=rbRouteDB.CHecked;
     AutoStartRec[BitMapListBox3.ItemIndex+1].Symbol:=rbRouteDS.checked;
     AutoStartRec[BitMapListBox3.ItemIndex+1].changed:=TRUE;
End;

Procedure TForm1.rbRouteDBOnClick (Sender: TObject);
Begin
     AutoStartRec[BitMapListBox3.ItemIndex+1].ForeGround:=rbRouteDF.Checked;
     AutoStartRec[BitMapListBox3.ItemIndex+1].BackGround:=rbRouteDB.CHecked;
     AutoStartRec[BitMapListBox3.ItemIndex+1].Symbol:=rbRouteDS.checked;
     AutoStartRec[BitMapListBox3.ItemIndex+1].changed:=TRUE;
End;

Procedure TForm1.rbRouteDFOnClick (Sender: TObject);
Begin
     AutoStartRec[BitMapListBox3.ItemIndex+1].ForeGround:=rbRouteDF.Checked;
     AutoStartRec[BitMapListBox3.ItemIndex+1].BackGround:=rbRouteDB.CHecked;
     AutoStartRec[BitMapListBox3.ItemIndex+1].Symbol:=rbRouteDS.checked;
     AutoStartRec[BitMapListBox3.ItemIndex+1].changed:=TRUE;
End;

Procedure TForm1.cbRouteDEnabledOnClick (Sender: TObject);
Begin
    AutoStartRec[BitMapListBox3.ItemIndex+1].Enabled:=cbRouteDEnabled.checked;
    AutoStartRec[BitMapListBox3.ItemIndex+1].changed:=TRUE;
End;

Procedure TForm1.cbLPRPortDEnabledOnClick (Sender: TObject);
Begin
     AutoStartRec[BitMapListBox3.ItemIndex+1].Enabled:=cbLPRPortDEnabled.checked;
     AutoStartRec[BitMapListBox3.ItemIndex+1].changed:=TRUE;
End;

Procedure TForm1.rbLPRPortdSOnClick (Sender: TObject);
Begin
     AutoStartRec[BitMapListBox3.ItemIndex+1].ForeGround:=rbLprPortDF.Checked;
     AutoStartRec[BitMapListBox3.ItemIndex+1].BackGround:=rbLprPortDB.CHecked;
     AutoStartRec[BitMapListBox3.ItemIndex+1].Symbol:=rbLprPortDS.checked;
     AutoStartRec[BitMapListBox3.ItemIndex+1].changed:=TRUE;
End;

Procedure TForm1.rbLprPortdBOnClick (Sender: TObject);
Begin
   AutoStartRec[BitMapListBox3.ItemIndex+1].ForeGround:=rbLprPortDF.Checked;
     AutoStartRec[BitMapListBox3.ItemIndex+1].BackGround:=rbLprPortDB.CHecked;
     AutoStartRec[BitMapListBox3.ItemIndex+1].Symbol:=rbLprPortDS.checked;
     AutoStartRec[BitMapListBox3.ItemIndex+1].changed:=TRUE;
End;

Procedure TForm1.rbLPRPortdFOnClick (Sender: TObject);
Begin
   AutoStartRec[BitMapListBox3.ItemIndex+1].ForeGround:=rbLprPortDF.Checked;
     AutoStartRec[BitMapListBox3.ItemIndex+1].BackGround:=rbLprPortDB.CHecked;
     AutoStartRec[BitMapListBox3.ItemIndex+1].Symbol:=rbLprPortDS.checked;
     AutoStartRec[BitMapListBox3.ItemIndex+1].changed:=TRUE;
End;

Procedure TForm1.cbLPDEnabledOnClick (Sender: TObject);
Begin
    AutoStartRec[BitMapListBox3.ItemIndex+1].Enabled:=cbLPDEnabled.checked;
    AutoStartRec[BitMapListBox3.ItemIndex+1].changed:=TRUE;
End;

Procedure TForm1.rbLPDSOnClick (Sender: TObject);
Begin
     AutoStartRec[BitMapListBox3.ItemIndex+1].ForeGround:=rbLPDF.Checked;
     AutoStartRec[BitMapListBox3.ItemIndex+1].BackGround:=rbLPDB.CHecked;
     AutoStartRec[BitMapListBox3.ItemIndex+1].Symbol:=rbLPDS.checked;
     AutoStartRec[BitMapListBox3.ItemIndex+1].changed:=TRUE;
End;

Procedure TForm1.rbLPDBOnClick (Sender: TObject);
Begin
    AutoStartRec[BitMapListBox3.ItemIndex+1].ForeGround:=rbLPDF.Checked;
     AutoStartRec[BitMapListBox3.ItemIndex+1].BackGround:=rbLPDB.CHecked;
     AutoStartRec[BitMapListBox3.ItemIndex+1].Symbol:=rbLPDS.checked;
     AutoStartRec[BitMapListBox3.ItemIndex+1].changed:=TRUE;
End;

Procedure TForm1.rbLPDFOnClick (Sender: TObject);
Begin
    AutoStartRec[BitMapListBox3.ItemIndex+1].ForeGround:=rbLPDF.Checked;
     AutoStartRec[BitMapListBox3.ItemIndex+1].BackGround:=rbLPDB.CHecked;
     AutoStartRec[BitMapListBox3.ItemIndex+1].Symbol:=rbLPDS.checked;
     AutoStartRec[BitMapListBox3.ItemIndex+1].changed:=TRUE;
End;

Procedure TForm1.cbRSHDEnabledOnClick (Sender: TObject);
Begin
    AutoStartRec[BitMapListBox3.ItemIndex+1].Enabled:=cbRSHDEnabled.checked;
    AutoStartRec[BitMapListBox3.ItemIndex+1].changed:=TRUE;
End;

Procedure TForm1.rbRSHDsOnClick (Sender: TObject);
Begin
     AutoStartRec[BitMapListBox3.ItemIndex+1].ForeGround:=rbRshDF.Checked;
     AutoStartRec[BitMapListBox3.ItemIndex+1].BackGround:=rbRshDB.CHecked;
     AutoStartRec[BitMapListBox3.ItemIndex+1].Symbol:=rbRshDS.checked;
     AutoStartRec[BitMapListBox3.ItemIndex+1].changed:=TRUE;
End;

Procedure TForm1.rbRSHDBOnClick (Sender: TObject);
Begin
AutoStartRec[BitMapListBox3.ItemIndex+1].ForeGround:=rbRshDF.Checked;
     AutoStartRec[BitMapListBox3.ItemIndex+1].BackGround:=rbRshDB.CHecked;
     AutoStartRec[BitMapListBox3.ItemIndex+1].Symbol:=rbRshDS.checked;
     AutoStartRec[BitMapListBox3.ItemIndex+1].changed:=TRUE;
End;

Procedure TForm1.rbRSHDfOnClick (Sender: TObject);
Begin
AutoStartRec[BitMapListBox3.ItemIndex+1].ForeGround:=rbRshDF.Checked;
     AutoStartRec[BitMapListBox3.ItemIndex+1].BackGround:=rbRshDB.CHecked;
     AutoStartRec[BitMapListBox3.ItemIndex+1].Symbol:=rbRshDS.checked;
     AutoStartRec[BitMapListBox3.ItemIndex+1].changed:=TRUE;
End;

Procedure TForm1.rbRexecdSOnClick (Sender: TObject);
Begin
     AutoStartRec[BitMapListBox3.ItemIndex+1].ForeGround:=rbRexEcDF.Checked;
     AutoStartRec[BitMapListBox3.ItemIndex+1].BackGround:=rbRexECDB.CHecked;
     AutoStartRec[BitMapListBox3.ItemIndex+1].Symbol:=rbRExeCDS.checked;
     AutoStartRec[BitMapListBox3.ItemIndex+1].changed:=TRUE;
End;

Procedure TForm1.rbRexecdBOnClick (Sender: TObject);
Begin
   AutoStartRec[BitMapListBox3.ItemIndex+1].ForeGround:=rbRexEcDF.Checked;
     AutoStartRec[BitMapListBox3.ItemIndex+1].BackGround:=rbRexECDB.CHecked;
     AutoStartRec[BitMapListBox3.ItemIndex+1].Symbol:=rbRExeCDS.checked;
     AutoStartRec[BitMapListBox3.ItemIndex+1].changed:=TRUE;
End;

Procedure TForm1.rbRexecdFOnClick (Sender: TObject);
Begin
   AutoStartRec[BitMapListBox3.ItemIndex+1].ForeGround:=rbRexEcDF.Checked;
     AutoStartRec[BitMapListBox3.ItemIndex+1].BackGround:=rbRexECDB.CHecked;
     AutoStartRec[BitMapListBox3.ItemIndex+1].Symbol:=rbRExeCDS.checked;
     AutoStartRec[BitMapListBox3.ItemIndex+1].changed:=TRUE;
End;

Procedure TForm1.ButtonRexEcDOnClick (Sender: TObject);
Begin
     StartStopServer(ButtonRexEcd);
End;

Procedure TForm1.ButtonTFPDOnClick (Sender: TObject);
Begin
       StartStopServer(ButtonTFTPD);
End;

Procedure TForm1.EditTFPDParamOnChange (Sender: TObject);
Begin
      AutoStartRec[BitmapListBox3.ItemIndex+1].Parameter:=EditTFTPDParam.Text;
      AutoStartRec[BitmapListBox3.ItemIndex+1].CHanged:=TRUE;
End;

Procedure TForm1.rbTFTPDSOnClick (Sender: TObject);
Begin
   AutoStartRec[BitmapListBox3.ItemIndex+1].Enabled:=rbTFTPDS.checked;
End;

Procedure TForm1.rbTftpdBOnClick (Sender: TObject);
Begin
   AutoStartRec[BitmapListBox3.ItemIndex+1].BackGround:=rbTFTPDB.checked;
End;

Procedure TForm1.rbTftpdFOnClick (Sender: TObject);
Begin
   AutoStartRec[BitmapListBox3.ItemIndex+1].ForeGround:=rbTFTPDF.checked;
End;

Procedure TForm1.cbTFTPDEnabledOnClick (Sender: TObject);
Begin
   AutoStartRec[BitmapListBox3.ItemIndex+1].Enabled:=cbTFTPDEnabled.checked;
   AutoStartRec[BitmapListBox3.ItemIndex+1].CHanged:=TRUE;
End;

Procedure TForm1.EditFTPParamOnChange (Sender: TObject);
Begin
   AutoStartRec[BitmapListBox3.ItemIndex+1].Parameter:=EditFTPParam.Text;
   AutoStartRec[BitmapListBox3.ItemIndex+1].CHanged:=TRUE;
End;

Procedure TForm1.rbFTPSOnClick (Sender: TObject);
Begin
   AutoStartRec[BitmapListBox3.ItemIndex+1].Symbol:=rbFTPS.checked;
End;

Procedure TForm1.rbFTPBOnClick (Sender: TObject);
Begin
   AutoStartRec[BitmapListBox3.ItemIndex+1].Enabled:=rbFTPB.checked;
End;

Procedure TForm1.rbFTPFOnClick (Sender: TObject);
Begin
     AutoStartRec[BitmapListBox3.ItemIndex+1].ForeGround:=rbFTPF.checked;
End;

Procedure TForm1.cbFTPEnabledOnClick (Sender: TObject);
Begin
    AutoStartRec[BitmapListBox3.ItemIndex+1].Enabled:=cbFTPEnabled.checked;
    AutoStartRec[BitMapListBox3.ItemIndex+1].Changed:=TRUE;
End;

Procedure TForm1.cbTelnetEnabledOnClick (Sender: TObject);
Begin
     AutoStartRec[BitmapListBox3.ItemIndex+1].Enabled:=cbTelnetEnabled.checked;
     AutoStartRec[BitmapListBox3.ItemIndex+1].Changed:=TRUE;
End;

Procedure TForm1.cbRexecdEnabledOnClick (Sender: TObject);
Begin
     AutoStartRec[BitmapListBox3.ItemIndex+1].Enabled:=cbRexecdEnabled.checked;
     AutoStartRec[BitmapListBox3.ItemIndex+1].CHanged:=TRUE;
End;


Procedure TForm1.rbTelnetSOnClick (Sender: TObject);
Begin
     AutoStartRec[BitMapListBox3.ItemIndex+1].ForeGround:=RBTelnetF.CHecked;
     AutoStartRec[BitMapListBox3.ItemIndex+1].BackGround:=RBTelnetB.CHecked;
     AutoStartRec[BitMapListBox3.ItemIndex+1].Symbol:=RBTelnetS.CHecked;
End;

Procedure TForm1.rbTelnetBOnClick (Sender: TObject);
Begin
    AutoStartRec[BitMapListBox3.ItemIndex+1].ForeGround:=RBTelnetF.CHecked;
     AutoStartRec[BitMapListBox3.ItemIndex+1].BackGround:=RBTelnetB.CHecked;
     AutoStartRec[BitMapListBox3.ItemIndex+1].Symbol:=RBTelnetS.CHecked;
End;

Procedure TForm1.rbTelnetFOnClick (Sender: TObject);
Begin
     AutoStartRec[BitMapListBox3.ItemIndex+1].ForeGround:=RBTelnetF.CHecked;
     AutoStartRec[BitMapListBox3.ItemIndex+1].BackGround:=RBTelnetB.CHecked;
     AutoStartRec[BitMapListBox3.ItemIndex+1].Symbol:=RBTelnetS.CHecked;
End;

Function TForm1.MakeExecString(Index:Longint):String;
{Erzeugt den korrekten Befehl zum starten eines Dienstes
 INDEX : Index im Record AutostartRec um auf die Eigenschaften des Records zugreifen zu knnen
}
VAR
   Symbol,ForeGround:String;

Begin
     Symbol:='/min';
     ForeGround:='/max';
     IF AutoStartRec[Index].Symbol Then Result:='START /C '+Symbol+' '+AutoStartRec[Index].ServName+' '+AutoStartRec[Index].Parameter;
     IF AutoStartRec[Index].ForeGround Then Result:='START /C '+ForeGround+' '+AutoStartRec[Index].ServName+' '+AutoStartRec[Index].Parameter;
     IF AutoStartRec[Index].BackGround Then Result:='DETACH '+AutoStartRec[Index].ServName+' '+AutoStartRec[Index].Parameter;
End;



Procedure TForm1.BitmapListBox3OnItemFocus (Sender: TObject; Index: LongInt);
VAR NotebookIndex:Longint;
Begin
   NotebookIndex:=Notebook1.Pages.Indexof(AutoStartRec[Index+1].ServName);
   IF NotebookIndex=-1 Then Raise Exception.Create('BUG ! Wert von "NotebookIndex" ist -1 (Server Name wurde nicht gefunden) Fehler in TCP_Unit1 -> BitmapListBox3onItemFocus');
   //DebugLabelAutoStartRec.Caption:=ToStr(Index+1)+'=('+AutoStartRec[Index+1].ServName+')';
   //DebugLabelNotebookPageName.Caption:=ToStr(NotebookIndex)+'= ('+Notebook1.Pages[NotebookIndex]+')';
   Notebook1.PageIndex:=NotebookIndex;
   DoAutoStartSettings(NotebookIndex+1);
End;



Procedure TForm1.DoAutoStartSettings(Index:Longint);
VAR S:String;
Begin
     S:='TAB-Autostart';
     {TelnetD}
     Case Index of
          1:Begin
                 cbTelnetEnabled.Checked:=AutoStartRec[Index].Enabled;
                 cbTelnetEnabled.Caption:=GetNlsString(S,'Enabled');

                 rbTelnetF.Checked:=AutoStartRec[Index].ForeGround;
                 rbTelnetF.Caption:=GetNlsString(S,'Foreground');

                 rbTelnetB.CHecked:=AutoStartRec[Index].Background;
                 rbTelnetB.Caption:=GetNlsString(S,'Background');

                 rbTelnetS.Checked:=AutoStartRec[Index].Symbol;
                 rbTelnetS.Caption:=GetNlsString(S,'Symbol');

                 EditTelnetParam.Text:=AutoStartRec[Index].Parameter;
                 GroupBoxParamTelnetD.Caption:=GetNlsString(S,'Parameter');
                 groupboxAutostarttelnet.caption:=Getnlsstring(s,'Autostart');
                 GroupboxOptionstelnet.caption:=Getnlsstring(s,'options');
                 GetProcessInfo(Index);ButtonCaption(ButtonTelnet,Index);

            End;

        2:  Begin {FTP}
                cbFTPEnabled.Checked:=AutoStartRec[Index].Enabled;
                cbFTPEnabled.Caption:=GetNlsString(S,'Enabled');

                rbFtpF.Checked:=AutoStartRec[Index].ForeGround;
                rbFTpF.Caption:=GetNlsString(S,'Foreground');

                rbFTPB.CHecked:=AutoStartRec[Index].Background;
                rbFTPB.Caption:=GetNlsString(S,'Background');

                rbFTPS.Checked:=AutoStartRec[Index].Symbol;
                rbFTPS.Caption:=GetNlsString(S,'Symbol');

                GroupBoxParamFTP.Caption:=GetNlsString(S,'Parameter');
                GroupBoxOptionsFTP.Caption:=GetNlsString(S,'Options');
                GroupBoxAutoStartFTP.Caption:=GetNlsString(S,'Autostart');

                EditFTPParam.Text:=AutoStartRec[Index].Parameter;
                GetProcessInfo(Index);ButtonCaption(ButtonFTPD,Index);
              End;
     3:Begin
     {TFTP}
           cbTFTPDEnabled.Checked:=AutoStartRec[Index].Enabled;
           cbTFTPDEnabled.Caption:=GetNlsString(S,'Enabled');


           rbTFtpDF.Checked:=AutoStartRec[Index].ForeGround;
           rbTFTPDF.Caption:=GetNlsString(S,'Foreground');

           rbTFTPDB.CHecked:=AutoStartRec[Index].Background;
           rbTFTPDB.Caption:=GetNLSString(S,'Background');

           rbTFTPDS.Checked:=AutoStartRec[Index].Symbol;
           rbTFTPDS.Caption:=GetNlsString(S,'Symbol');

           EditTFTPDParam.Text:=AutoStartRec[Index].Parameter;
           GroupBoxAutostartTFTP.Caption:=GetNlsString(S,'Autostart');
           GroupBoxOptionsTFTP.Caption:=GetNlsString(S,'Options');
           GroupBoxParamTFTP.Caption:=GetNlsString(S,'Parameter');
           GetProcessInfo(Index);ButtonCaption(ButtonTFTPD,Index);
       End;

     4:Begin
     {REXECD}
           cbRexeCDEnabled.Checked:=AutoStartRec[Index].Enabled;
           cbRexECDEnabled.Caption:=GetNlsString(S,'Enabled');
           GroupBoxAutostartRexecd.Caption:=GetNLSString(S,'Autostart');

           rbRexeCDf.Checked:=AutoStartRec[Index].ForeGround;
           rbRexeCDF.Caption:=GetNlsString(S,'Foreground');

           rbRexeCDb.CHecked:=AutoStartRec[Index].Background;
           rbRexeCDB.Caption:=GetNlsString(S,'Background');

           rbRexeCDs.Checked:=AutoStartRec[Index].Symbol;
           rbRexeCDS.Caption:=GetNLSString(S,'Symbol');

           GroupBoxOptionsRexecd.Caption:=GetNLSString(S,'Options');

           RexeCDParam.Text:=AutoStartRec[Index].Parameter;
           GroupBoxParamRexecd.Caption:=GetNLSString(S,'Parameter');
           GetProcessInfo(Index);ButtonCaption(ButtonRexecd,Index);
       End;
      5:Begin
       {RSHD}
           GroupBoxAutostartRSHD.Caption:=GetNlsString(S,'Autostart');
           cbRSHDEnabled.Checked:=AutoStartRec[Index].Enabled;
           cbRSHDEnabled.Caption:=GetNlsString(S,'Enabled');

           GroupBoxOptionsRSHD.Caption:=GetNLSString(S,'Options');

           rbRSHDf.Checked:=AutoStartRec[Index].ForeGround;
           rbRSHDF.Caption:=GetNLSString(S,'Foreground');

           rbRSHDb.CHecked:=AutoStartRec[Index].Background;
           rbRSHDB.Caption:=GetNLSString(S,'Background');

           rbRSHDs.Checked:=AutoStartRec[Index].Symbol;
           rbRSHDS.Caption:=GetNLSString(S,'Symbol');

           EditRSHDParam.Text:=AutoStartRec[Index].Parameter;
           GroupBoxParamRSHD.Caption:=GetNlsString(S,'Parameter');
           GetProcessInfo(Index);ButtonCaption(ButtonRSHD,Index);
       End;
       6:Begin
       {LPD}
           GroupBoxAutoStartLPD.Caption:=GetNLSString(S,'Autostart');
           cbLPDEnabled.Checked:=AutoStartRec[Index].Enabled;
           cbLPDEnabled.Caption:=GetNLSString(S,'Enabled');

           rbLPDf.Checked:=AutoStartRec[Index].ForeGround;
           rbLPDF.Caption:=GetNLSString(S,'Foreground');

           rbLPDb.CHecked:=AutoStartRec[Index].Background;
           rbLPDB.Caption:=GetNLSString(S,'Background');

           rbLPDs.Checked:=AutoStartRec[Index].Symbol;
           rbLPDS.Caption:=GetNLSString(S,'Symbol');

           GroupBoxOptionsLPD.Caption:=GetNLSString(S,'Options');
           EditLPDParam.Text:=AutoStartRec[Index].Parameter;
           GroupBoxParamLPD.Caption:=GetNLSString(S,'Parameter');

           GetProcessInfo(Index);ButtonCaption(ButtonLPD,Index);
         End;
       7:Begin
       {LPRPortD}
           GroupBoxAutostartLPRPortD.Caption:=GetNlsString(S,'Autostart');

           cbLPRPortDEnabled.Checked:=AutoStartRec[Index].Enabled;
           cbLPRPortDEnabled.Caption:=GetNlsString(S,'Enabled');

           rbLPRPortDf.Checked:=AutoStartRec[Index].ForeGround;
           rbLPRPortDF.Caption:=GetNlsString(S,'Foreground');

           rbLPRPortDb.CHecked:=AutoStartRec[Index].Background;
           rbLPRPortDB.Caption:=GetNlsString(S,'Background');

           rbLPRPortDs.Checked:=AutoStartRec[Index].Symbol;
           rbLPRPortDS.Caption:=GetNlsString(S,'Symbol');

           GroupBoxOptionsLPRPortD.Caption:=GetNlsString(S,'Options');
           EditLPRPortDParam.Text:=AutoStartRec[Index].Parameter;
           GroupBoxParamLPRPortD.Caption:=GetNlsString(S,'Parameter');
           GetProcessInfo(Index);ButtonCaption(ButtonLPRPortD,Index);
       End;

       8:Begin
       {ROuteD}
           GroupBoxAutostartRouted.Caption:=GetNlsString(S,'Autostart');
           cbRouteDEnabled.Checked:=AutoStartRec[Index].Enabled;
           cbROuteDEnabled.Caption:=GetNlsString(S,'Enabled');

           rbRouteDf.Checked:=AutoStartRec[Index].ForeGround;
           rBRouteDF.Caption:=GetNlsString(S,'Foreground');

           rbRouteDb.CHecked:=AutoStartRec[Index].Background;
           rbRouteDB.Caption:=GetNlsString(S,'Background');

           rbRouteDs.Checked:=AutoStartRec[Index].Symbol;
           rbRouteDS.Caption:=GetNlsString(S,'Symbol');
           GroupBoxOptionsRouteD.Caption:=GetNlsString(S,'Options');
           EditRouteDParam.Text:=AutoStartRec[Index].Parameter;
           GroupBoxParamROuteD.Caption:=GetNlsString(S,'Parameter');
           GetProcessInfo(Index);ButtonCaption(ButtonRouteD,Index);
       End;
        9:Begin
       {TalkD}
           GroupBoxAutostartTalkD.Caption:=GetNlsString(S,'Autostart');
           cbTalkDEnabled.Checked:=AutoStartRec[Index].Enabled;
           cbTalkDEnabled.Caption:=GetNlsString(S,'Enabled');

           rbTalkDf.Checked:=AutoStartRec[Index].ForeGround;
           rbTalkDF.Caption:=GetNLSString(S,'Foreground');

           rbTalkDb.CHecked:=AutoStartRec[Index].Background;
           rbTalkDB.Caption:=GetNlsString(S,'Background');

           rbTalkDs.Checked:=AutoStartRec[Index].Symbol;
           rbTalkDS.Caption:=GetNlsString(S,'Symbol');

           GroupBoxOptionsTalkD.Caption:=GetNlsString(S,'Options');

           EditTalkDParam.Text:=AutoStartRec[Index].Parameter;
           GroupBoxParamTalkd.Caption:=GetNlsString(S,'Parameter');
           GetProcessInfo(Index);ButtonCaption(ButtonTalkD,Index);
       End;
       10:Begin
       {Portmap}
           GroupBoxAutostartPortmap.Caption:=GetNlsString(S,'Autostart');
           cbPortmapEnabled.Checked:=AutoStartRec[Index].Enabled;
           cbPortmapEnabled.Caption:=GetNlsString(S,'Enabled');

           rbPortmapf.Checked:=AutoStartRec[Index].ForeGround;
           rbPortmapF.Caption:=GetNlsString(S,'ForeGround');

           rbPortmapb.CHecked:=AutoStartRec[Index].Background;
           rbPortmapB.Caption:=GetNlsString(S,'Background');

           rbPortmaps.Checked:=AutoStartRec[Index].Symbol;
           rbPortmapS.Caption:=GetNlsString(S,'Symbol');

           GroupBoxOptionsPortMap.Caption:=GetNlsString(S,'Options');
           EditPortmapParam.Text:=AutoStartRec[Index].Parameter;
           GroupBoxParamPortMap.Caption:=getNlsString(S,'Parameter');

           GetProcessInfo(Index);ButtonCaption(ButtonPortmap,Index);
       End;
        11:Begin
           {SendMail}
           GroupBoxAutostartSendmail.Caption:=GetNlsString(S,'Autostart');
           cbSendMailEnabled.Checked:=AutoStartRec[Index].Enabled;
           cbSendMailEnabled.Caption:=GetNlsString(S,'Enabled');
           rbSendMailf.Checked:=AutoStartRec[Index].ForeGround;
           rbSendMailF.Caption:=GetNlsString(S,'Foreground');

           rbSendMailb.CHecked:=AutoStartRec[Index].Background;
           rbSendMailB.Caption:=GetNlsString(S,'Background');
           rbSendMails.Checked:=AutoStartRec[Index].Symbol;
           rbSendMails.Caption:=GetNlsString(S,'Symbol');
           GroupBoxOptionsSendMail.Caption:=GetNlsString(S,'Options');
           EditSendMailParam.Text:=AutoStartRec[Index].Parameter;
           GroupBoxParamSendMail.Caption:=GetNlsString(S,'Parameter');
           GetProcessInfo(Index);ButtonCaption(ButtonSendMail,Index);
        End;
        12:Begin
           {RSVPD}
           GroupBoxAutostartRSVPD.Caption:=GetNlsString(S,'Autostart');
           cbRSVPDEnabled.Checked:=AutoStartRec[Index].Enabled;
           cbRSVPDEnabled.Caption:=GetNlsString(S,'Enabled');

           rbRSVPDf.Checked:=AutoStartRec[Index].ForeGround;
           rbRSVPDF.Caption:=GetNlsString(S,'Foreground');

           rbRSVPDb.CHecked:=AutoStartRec[Index].Background;
           rbRSVPDB.Caption:=GetNlsString(S,'Background');

           rbRSVPDs.Checked:=AutoStartRec[Index].Symbol;
           rbRSVPDs.Caption:=GetNlsString(S,'Symbol');
           GroupBoxOptionsRSVPD.Caption:=GetNLsString(S,'Options');

           EditRSVPDParam.Text:=AutoStartRec[Index].Parameter;

           GroupBoxParamRSVPD.Caption:=GetNlsString(S,'Parameter');
           GetProcessInfo(Index);ButtonCaption(ButtonRSVPD,Index);
           End;
        13:Begin
           {SyslogD}
           GroupBoxAutostartSysLOGD.Caption:=GetNlsString(S,'Autostart');
           cbSysLOGDEnabled.Checked:=AutoStartRec[Index].Enabled;
           cbSysLOGDEnabled.Caption:=GetNlsString(S,'Enabled');

           rbSysLOGDf.Checked:=AutoStartRec[Index].ForeGround;
           rbSysLOGDF.Caption:=GetNlsString(S,'ForeGround');

           rbSysLOGDb.CHecked:=AutoStartRec[Index].Background;
           rbSysLOGDB.Caption:=GetNLSString(S,'Background');
           rbSysLOGDs.Checked:=AutoStartRec[Index].Symbol;
           rbSysLOGDS.Caption:=GetNlsString(S,'Symbol');
           EditSysLOGDParam.Text:=AutoStartRec[Index].Parameter;
           GroupBoxOptionsSyslogD.Caption:=GetNlsString(S,'Options');
           GetProcessInfo(Index);ButtonCaption(ButtonSysLogD,Index);
           GroupBoxParamSyslogD.Caption:=GetNlsString(S,'Parameter');
           End;
        14:Begin
           {Timed}
           GroupBoxAutostartTimed.Caption:=GetNlsString(S,'Autostart');

           cbTimedEnabled.Checked:=AutoStartRec[Index].Enabled;
           cbTimedEnabled.Caption:=GetNlsString(S,'Enabled');
           rbTimedf.Checked:=AutoStartRec[Index].ForeGround;
           rbTimedF.Caption:=GetNlsString(S,'Foreground');
           rbTimedb.CHecked:=AutoStartRec[Index].Background;
           rbTimedB.Caption:=GetNlsString(S,'Background');
           rbTimeds.Checked:=AutoStartRec[Index].Symbol;
           rbTimeDS.Caption:=GetNlsString(S,'Symbol');
           EditTimedParam.Text:=AutoStartRec[Index].Parameter;
           GroupBoxOptionsTimed.Caption:=GetNlsString(S,'Options');
           GetProcessInfo(Index);ButtonCaption(ButtonTimed,Index);
           GroupBoxParamTimed.Caption:=GetNlsString(S,'Parameter');
           End;
    15:Begin
       {NFSD}
           GroupBoxAutostartNFSD.Caption:=GetNlsString(S,'Autostart');
           cbNFSDEnabled.Checked:=AutoStartRec[Index].Enabled;
           cbNFSDEnabled.Caption:=GetNlsString(S,'Enabled');
           rbNFSDf.Checked:=AutoStartRec[Index].ForeGround;
           rbNFSDF.Caption:=GetNlsString(S,'ForeGround');
           rbNFSDb.CHecked:=AutoStartRec[Index].Background;
           rbNFSDB.Caption:=GetNlsString(S,'Background');
           rbNFSDs.Checked:=AutoStartRec[Index].Symbol;
           rbNFSDS.Caption:=GetNlsString(S,'Symbol');
           EditNFSDParam.Text:=AutoStartRec[Index].Parameter;
           GroupBoxOptionsNFSD.Caption:=GetNlsString(S,'Options');
           GetProcessInfo(Index);ButtonCaption(ButtonNFSD,Index);
           GroupBoxParamNFSD.Caption:=GetNlsString(S,'Parameter');
       END;

    16:Begin
       {PCNFSD}
           GroupBoxAutostartPCNFSD.Caption:=GetNlsString(S,'Autostart');
           cbPCNFSDEnabled.Checked:=AutoStartRec[Index].Enabled;
           cbPCNFSDEnabled.Caption:=GetNlsString(S,'Enabled');
           rbPCNFSDf.Checked:=AutoStartRec[Index].ForeGround;
           rbPCNFSDF.Caption:=GetNlsString(S,'ForeGround');
           rbPCNFSDb.CHecked:=AutoStartRec[Index].Background;
           rbPCNFSDB.Caption:=GetNlsString(S,'BackGround');
           rbPCNFSDs.Checked:=AutoStartRec[Index].Symbol;
           RBPCNFSDS.Caption:=GetNLSString(S,'Symbol');
           EditPCNFSDParam.Text:=AutoStartRec[Index].Parameter;
           GroupBoxOptionsPCNFSD.Caption:=GetNlsString(S,'Options');
           GetProcessInfo(Index);ButtonCaption(ButtonPCNFSD,Index);
           GroupBoxParamPCNFSD.Caption:=GetNlsString(S,'Parameter');
        END;
       End;{case}
AutoStart.ResetChanged;
End;

Procedure TForm1.BitmapListBox3OnSetupShow (Sender: TObject);
VAR
    Loop:Byte;
    aIcon:TIcon;
    s:String;
Begin
     IF ParamStr(1)='\DEBUG' Then BitMapListBox3.Bottom:=61;
   FOr Loop:=1 TO AutostartRec[0].Amount-1 do
     Begin
          S:=AutoStartRec[loop].ServName;
          aIcon.Create;
          TRY
          aIcon.LoadFromResourceName(AutoStartRec[Loop].ServName);
          EXCEPT
          ON EInvalidBitmap DO Raise EInvalidBitmap.Create('Bitmapname : '+AutoStartRec[loop].ServName);
          ON EInvalidIcon DO Raise EInvalidIcon.Create('Ungtiges ICON ! Icon Name : '+AutoStartRec[loop].ServName);
          else Raise Exception.Create('BUG in TCP_UNIT1 - Resource Name : '+AutoStartRec[loop].ServName+' ist nicht in der Resourcen Liste vorhanden !');
          End;
          BitmapListBox3.AddBitmap(AutoStartRec[loop].ServName,aICON);
         aIcon.Destroy;
     End;
Autostart.resetchanged;
End;

Procedure TForm1.cbInetdSymbolssizeOnClick (Sender: TObject);
Begin
  AutoStartRec[0].Symbol:=cbInetDSymbolsSize.checked;
End;

Procedure TForm1.cbTimeDOnClick (Sender: TObject);
Begin
     AutostartRec[Autostart.RECIndex('TIMED')].InetD:=cbTimeD.checked;
     AutostartRec[Autostart.RECIndex('TIMED')].changed:=TRUE;
     IF cbTimeD.checked Then
     Begin
          AutoStartRec[AutoStart.RecIndex('TIMED')].Enabled:=FALSE;
          CbTimedEnabled.Checked:=FALSE;
          GroupBoxServerServicesTimed.enabled:=False;
     End else GroupBoxServerServicesTimed.enabled:=true;
End;

Procedure TForm1.cbRSHDOnClick (Sender: TObject);
Begin
     AutostartRec[Autostart.RECIndex('RSHD')].InetD:=cbRSHD.checked;
     AutostartRec[Autostart.RECIndex('RSHD')].changed:=TRUE;
     IF cbRSHD.checked then
     Begin
          AutoStartRec[AutoStart.RecIndex('RSHD')].Enabled:=FALSE;
          CbRSHDEnabled.Checked:=FALSE;
          GroupBoxServerServicesRSHD.enabled:=False
      End else
     GroupBoxServerServicesRSHD.enabled:=true;
End;

Procedure TForm1.cbLPDOnClick (Sender: TObject);
Begin
     AutostartRec[Autostart.RECIndex('LPD')].InetD:=cbLPD.checked;
     AutostartRec[Autostart.RECIndex('LPD')].changed:=TRUE;
     IF cbLPD.checked then
     Begin
          AutoStartRec[AutoStart.RecIndex('LPD')].Enabled:=FALSE;
          CbLPDEnabled.Checked:=FALSE;
          GroupBoxServerServicesLPD.enabled:=False;
     End
     else GroupBoxServerServicesLPD.enabled:=true;
End;

Procedure TForm1.cbRexecDOnClick (Sender: TObject);
Begin
     AutostartRec[Autostart.RECIndex('REXECD')].InetD:=cbRexecD.checked;
     AutostartRec[Autostart.RECIndex('REXECD')].changed:=TRUE;
    IF cbRexecd.checked then
    Begin
         AutoStartRec[AutoStart.RecIndex('REXECD')].Enabled:=FALSE;
         CbRexecdEnabled.Checked:=FALSE;
         GroupBoxServerServicesRexECD.enabled:=False;
     End
     else GroupBoxServerServicesRexECD.enabled:=true;

End;

Procedure TForm1.cbTelnetDOnClick (Sender: TObject);
Begin
             AutoStartRec[AutoStart.RecIndex('TELNETD')].INETD:=cbTelnetD.checked;
             AutoStartRec[AutoStart.RecIndex('TELNETD')].Changed:=TRUE;
             IF cbTelnetD.checked Then
             Begin
             AutoStartRec[AutoStart.RecIndex('TELNETD')].Enabled:=FALSE;
             GroupBoxServerServicesTelnetd.enabled:=False;
             End
             else GroupBoxServerServicesTelnetd.enabled:=true;

End;


Procedure TForm1.cbInetDOnClick (Sender: TObject);
Begin
  IF cbInetD.Checked Then
  Begin
       GroupBoxInetDSelectService.Enabled:=TRUE;
       GroupBoxInetDSelectService.PenColor:=clWindowText;
       cbTelnetDOnclick(Self);
       cbRexecDOnClick(Self);
       cbLPDOnClick(Self);
       cbRSHDOnClick(Self);
       cbTimedOnClick(Self);
  End else
  Begin
       GroupBoxInetDSelectService.Enabled:=FALSE;
       GroupBoxInetDSelectService.PenColor:=clGray;
       GroupBoxServerServicesTelnetD.enabled:=TRUE;
       GroupBoxServerServicesRexECD.enabled:=true;
       GroupBoxServerServicesLPD.enabled:=True;
       GroupBoxServerServicesRSHD.enabled:=true;
       GroupBoxServerServicesTimed.enabled:=true;
  End;
   AutoStartRec[0].Changed:=True;
   AutoStartRec[0].Enabled:=cbInetD.Checked;

End;

Procedure TForm1.cbInetdAllServerOnClick (Sender: TObject);
Begin
  cbRexecD.checked:=cbInetdAllServer.Checked;cbRexecD.OnCLick(Self);
  cbTelnetD.checked:=cbInetdAllServer.checked;cbTelnetD.OnClick(Self);
  cbLPD.CHecked:=cbInetdAllServer.checked;cbLPD.onClick(Self);
  cbRSHD.checked:=cbInetdAllServer.checked;cbRSHD.OnClick(Self);
  cbTimed.checked:=cbInetdAllServer.checked;cbTimed.Onclick(Self);

End;

Procedure TForm1.TCPAutostartNotebookOnSetupShow (Sender: TObject);
CONST
     S='TAB-Autostart';
Begin
     cbInetD.Checked:=AutoStartRec[0].Enabled;
     cbInetdSymbolssize.Checked:=AutoStartRec[0].Symbol;
     cbTelnetD.checked:=AUtoStartRec[AutoStart.RecIndex('TELNETD')].InetD;
     cbRexecd.Checked:=AutoStartRec[AutoStart.RECIndex('REXECD')].InetD;
     cbLPD.Checked:=AutoStartRec[AutoStart.RecIndex('LPD')].InetD;
     cbRSHD.Checked:=AutoStartRec[AutoStart.RecIndex('RSHD')].Inetd;
     cbTimeD.Checked:=AutoStartRec[AutoStart.RecIndex('TIMED')].InetD;

       cbTelnetDOnclick(Self);
       cbRexecDOnClick(Self);
       cbLPDOnClick(Self);
       cbRSHDOnClick(Self);
       cbTimedOnClick(Self);
       AutoStart.ResetChanged;

       NLS_ButtonStri1:=GetNlsString('TAB-Autostart','ButtonStart');
       NLS_ButtonStri2:=GetNlsString('TAB-Autostart','ButtonStop');

      BitmapListBox3.ItemIndex:=0;
      GroupBoxInetDSelectService.Enabled:=AutoStartRec[0].Enabled;
      // NLS Settings
      GroupBoxInetD.Caption:=GetNlsString(S,'GrpBoxInetdStatus');
      GroupBoxInetDSelectService.Caption:=GetNLsString(S,'GrpoxInetDActivate');
      GroupBoxInetdServices.Caption:=GetNlsString(S,'GrpBoxInetdService');

      cbInetD.Caption:=GetNlsString(S,'cbINETD');
      cbInetdSymbolssize.caption:=getnlsstring(s,'cbInetdSymbolssize');
      cbInetdAllServer.Caption:=getNlsString(S,'CBInetDAll');
      cbTelnetD.Caption:=GetNlsString(S,'INETD-Telnet');
      cbLPD.Caption:=GetNlsString(S,'INETD-LPD');
      cbRexecD.Caption:=GetNlsString(S,'INETD-RexECD');
      cbRSHD.Caption:=GetNlsString(S,'INETD-RSHD');
      cbTimeD.Caption:=GetNLSString(S,'INETD-TimeD');
      TCPAutostartNotebook.Pages[0]:=GetNlsString(S,'TAB#0');
      TCPAutostartNotebook.Pages[1]:=GetNlsString(S,'TAB#1');
      //TCPAutostartNotebook.Pages[2]:=GetNlsString('Socks_Notebook','TAB3');
End;

Procedure TForm1.GroupBox56OnClick (Sender: TObject);
Begin

End;

Procedure TForm1.Form1OnClose (Sender: TObject; Var Action: TCloseAction);
Begin
     // Do not store Stringgrid settings in ini file when config level is 0
     IF Application.ProgramIniFile.ReadString('Settings','CONFIG_LEVEL','-1')='0' Then exit;
     Application.ProgramIniFile.WriteInteger('Settings','StringGridColWidths0',StringGrid1.colWidths[0]);
     Application.ProgramIniFile.WriteInteger('Settings','StringGridColWidths1',StringGrid1.colWidths[1]);
     Application.ProgramIniFile.WriteInteger('Settings','StringGridColWidths2',StringGrid1.colWidths[2]);
     Application.ProgramIniFile.WriteInteger('Settings','StringGridColWidths3',StringGrid1.colWidths[3]);
End;

Procedure TForm1.Form1OnShow (Sender: TObject);
Begin

   IF Application.ProgramIniFile.ReadBOOL('Settings','SPLASH_SCREEN',TRUE) Then
   Begin
        TRY
        SplashScreenForm.Destroy;
        Except
        End;
        Form1.Focus;
   End;
End;

{ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
 บ                                                                          บ
 บ     This Section :  Server Services                                      บ
 บ                                                                          บ
 บ     Version 2 17.10.2005                                                 บ
 บ                                                                          บ
 ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ}


Procedure TForm1.lbServicesUserOnItemFocus (Sender: TObject; Index: LongInt);
Begin
   LBServicesUser.ItemIndex:=Index;
   LbServicesComment.ItemIndex:=Index;
   DisplayServerServices;
End;

Procedure TForm1.DisplayUsers;
Begin
         IF paramstr(1)='\DEBUG' Then CheckBoxDebugDeleteSYBFile.Visible:=true else CheckBoxDebugDeleteSYBFile.visible:=False;
         {Setup Users and comments}
         lbServicesUser.Items:=DebugForm.lbServicesUserName.Items;
         lbServicesComment.Items:=DebugForm.lbServicesComments.Items;
    End;

    Procedure TForm1.DisplayServerServices;
    Begin
         IF lbServicesUser.ItemIndex=-1 Then
         Begin
              Form1.LabelFTPInfo.caption:=GetNLSString('TAB-USER','inactive');
              Form1.LabelTelnetInfo.Caption:=GetNLSString('TAB-USER','inactive');
              Form1.LabelRexecInfo.Caption:=GetNLSString('TAB-USER','inactive');
              Form1.LabelNFSDInfo.Caption:=GetNLSString('TAB-USER','inactive');
         End else
         Begin
               ButtonConfigureFTPD.Enabled:=True;
               ButtonConfigureTelnetD.Enabled:=True;
               ButtonCOnfigureNFS.Enabled:=True;
               ButtonConfigureRex.Enabled:=True;

              IF DebugForm.lbServicesFTP.items[lbServicesUser.ItemIndex]='true' then LabelFTPInfo.caption:=GetNLSString('TAB-USER','active') else
                                                                       LabelFTPInfo.caption:=GetNLSString('TAB-USER','inactive');

              IF DebugForm.lbServicesTelnet.items[lbServicesUser.ItemIndex]='true' Then LabelTelnetInfo.Caption:=GetNLSString('TAB-USER','active')
                                                                 else LabelTelnetInfo.Caption:=GetNLSString('TAB-USER','inactive');

              IF DebugForm.lbServicesRex.Items[lbServicesUser.ItemIndex]='true' Then LabelRexecInfo.Caption:=GetNLSString('TAB-USER','active')
                                                         else LabelRexecInfo.Caption:=GetNLSString('TAB-USER','inactive');

              IF DebugForm.lbServicesNFS.Items[lbServicesUser.ItemIndex]='true' Then LabelNFSDInfo.Caption:=GetNLSString('TAB-USER','active')
                                                                                else LabelNFSDInfo.Caption:=GetNLSString('TAB-USER','inactive')
         End;
End;

{ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
 บ                                                                          บ
 บ     This Section :  SOCKS SUB Notebook                                   บ
 บ                                                                          บ
 บ     Version 2 14.10.2005                                                 บ
 บ                                                                          บ
 ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ}
Procedure TForm1.ButtonSocksServerDeleteOnClick (Sender: TObject);
Begin
   IF lbSocksServerIP.ItemIndex=-1 Then exit;
   DebugForm.lbSOCKSServerIP.Items.delete(lbSocksServerIP.ItemIndex);
   DebugForm.lbSocksServerTargetIP.Items.Delete(lbSocksServerIP.ItemIndex);
   DebugForm.lbSocksServerSubnet.items.Delete(lbSocksServerIP.ItemIndex);
   DebugForm.lbSOCSKSServerUserID.Items.Delete(lbSocksServerIP.ItemIndex);
   DebugForm.lbSocksServerPassword.Items.Delete(lbSocksServerIP.ItemIndex);
   DisplaySocks;
End;

Procedure TForm1.ButtonSocksDirectDeleteOnClick (Sender: TObject);
Begin
   IF lbSocksDirect_IP.ItemIndex=-1 Then exit;
   DebugForm.lbSocksDirectTargetIP.Items.delete(lbSocksDirect_IP.ItemIndex);
   DebugForm.lbSocksDirectSubnet.Items.Delete(lbSocksDirect_IP.ItemIndex);
   DisplaySocks;
End;

Procedure TForm1.ButtonSocksDirectEditOnClick (Sender: TObject);
Begin
     SocksWizard.Create(NIL);
     Sockswizard.socksDirectFlag:=True;
     SocksWizard.SocksEntryFlag:=FALSE;
     IF SocksWizard.ShowModal=cmOK Then DisplaySocks;
     SocksWizard.Destroy;
End;

Procedure TForm1.ButtonSocksDirectAddOnClick (Sender: TObject);
Begin
     SocksWizard.Create(NIL);
     Sockswizard.socksDirectFlag:=True;
     SocksWizard.SocksEntryFlag:=True;
     IF SocksWizard.ShowModal=cmOK Then DisplaySocks;
     SocksWizard.Destroy;
End;

Procedure TForm1.lbSOCKSServerUserIDOnItemFocus (Sender: TObject;
  Index: LongInt);
Begin
     lbSOCKSServerIP.ItemIndex:=Index;
     lbSocksServerTargetIP.ItemIndex:=Index;
     lbSOCKSServerSubnet.itemIndex:=Index;
     lbSOCKSServerUserID.itemIndex:=Index;

End;

Procedure TForm1.lbSOCKSServerSubnetOnItemFocus (Sender: TObject;
  Index: LongInt);
Begin
 lbSOCKSServerIP.ItemIndex:=Index;
     lbSocksServerTargetIP.ItemIndex:=Index;
     lbSOCKSServerSubnet.itemIndex:=Index;
     lbSOCKSServerUserID.itemIndex:=Index;
End;

Procedure TForm1.lbSocksServerTargetIPOnItemFocus (Sender: TObject;
  Index: LongInt);
Begin
     lbSOCKSServerIP.ItemIndex:=Index;
     lbSocksServerTargetIP.ItemIndex:=Index;
     lbSOCKSServerSubnet.itemIndex:=Index;
     lbSOCKSServerUserID.itemIndex:=Index;
End;

Procedure TForm1.lbSOCKSServerIPOnItemFocus (Sender: TObject; Index: LongInt);
Begin
     lbSOCKSServerIP.ItemIndex:=Index;
     lbSocksServerTargetIP.ItemIndex:=Index;
     lbSOCKSServerSubnet.itemIndex:=Index;
     lbSOCKSServerUserID.itemIndex:=Index;
End;

Procedure TForm1.ButtonSocksServerAddOnClick (Sender: TObject);
Begin
     SocksWizard.Create(NIL);
     Sockswizard.socksserverflag:=true;
     SocksWizard.SocksEntryFlag:=True;
     IF SocksWizard.ShowModal=cmOK Then DisplaySocks;
     SocksWizard.Destroy;
End;

Procedure TForm1.ButtonSocksServerEditOnClick (Sender: TObject);
Begin
     IF lbSOCKSServerIP.ItemIndex=-1 Then exit;
     SocksWizard.Create(NIL);
     SocksWizard.SocksEntryFlag:=FALSE;
     sockswizard.socksserverflag:=true;
     SocksWizard.SocksEntryIndex:=lbSOCKSServerIP.ItemIndex;
     IF SocksWizard.ShowModal=cmOK Then DisplaySocks;
     SocksWizard.Destroy;
End;

Procedure TForm1.DisplaySocksDNS;
Begin
     {Disable Edit&Delete Buttons}
    ButtonSOCKSDomainEdit.Enabled:=False;
    ButtonSOCKSDomainDelete.Enabled:=FALSE;
    ButtonSOCKSDNSEdit.Enabled:=FALSE;
    ButtonSOCKSDNSDelete.Enabled:=FALSE;

    lbSOCKSDomains.items:=DebugForm.ListBoxSocksDomains.items;
    lbSOCKSNameServer.items:=DebugForm.ListBoxSocksDNS.Items;
End;


Procedure TForm1.DisplaySOCKS;
Begin
     DisplaySocksDNS;

   lbSOCKSDomains.items:=DebugForm.ListBoxSocksDomains.items;
   lbSOCKSNameServer.items:=DebugForm.ListBoxSocksDNS.Items;
   lbSocksDIRECT_IP.items:=DebugForm.lbSocksDirectTargetIP.items;
   lbSocksDIRECTSubnet.Items:=DebugForm.lbSocksDirectSubnet.items;
   lbSOCKSServerIP.Items:=DebugForm.lbSOCKSServerIP.items;
   lbSOCKSServerTargetIP.items:=DebugForm.lbSOCKSServerTargetIP.items;
   lbSOCKSServerSubnet.items:=DebugForm.lbSOCKSServerSubnet.items;
   lbSOCKSServerUserID.Items:=DebugForm.lbSOCSKSServerUserID.Items;
   IF MyUpcaseStr(DebugForm.EditSocksFlag.Text)='ON' then CheckBoxSocksEnable.checked:=True else CheckBoxSocksEnable.Checked:=FALSE;
   EditSocksUserID.Text:=DebugForm.editSocksUser.Text;
   EditSocksPassword1.Text:=DebugForm.editSocksPassword.Text;
   IF EditSocksUserID.Text<>'' Then RadioSocksSecurity.itemIndex:=0 else RadioSocksSecurity.ItemIndex:=1;
   RadioSocksSecurityOnClick(Self);
End;

Procedure TForm1.RadioSocksSecurityOnClick (Sender: TObject);
Begin
   IF RadioSocksSecurity.itemindex=1 Then Begin GrpBoxSocksSecurity.Enabled:=FALSE;GrpBoxSocksSecurity.PenColor:=clgray;End
                                           else Begin GrpBoxSocksSecurity.Enabled:=TRUE;GrpBoxSocksSecurity.PenColor:=clWindowtext;ENd;
End;

Procedure TForm1.SocksNotebookOnSetupShow (Sender: TObject);
Begin
     // IF ProgramSettings.ConfigLevel=0 Then exit;
     IF Application.ProgramIniFile.ReadInteger('Settings','CONFIG_LEVEL',0)=0 Then exit;

     IF ListBox1.items.Count=0 Then
     Begin
        LabelInfo1.Caption:=GetNLSString('TAB-Interface','NO_INTERFACE_#1');
        LabelInfo2.Caption:=GetNlsString('TAB-Interface','NO_INTERFACE_#2');
     End;
     SocksNotebook.Pages[0]:=GetNlsString('Socks_Notebook','TAB1');
     SocksNotebook.Pages[1]:=GetNlsString('Socks_Notebook','TAB2');
     SocksNotebook.Pages[2]:=GetNlsString('Socks_Notebook','TAB3');
     SocksNotebook.Pages[3]:=GetNlsString('Socks_Notebook','TAB4');

     HeaderControlSOCKSDNS.Sections.Items[0].Text:=GetNlsString('Socks_Notebook','Header_Caption#0');
     HeaderControlSOCKSDNS2.Sections.Items[0].Text:=GetNlsString('Socks_Notebook','Header_Caption#1');
     HeaderControlSOCKSDirect.Sections.Items[0].Text:=GetNlsString('SOCKS_Notebook','Header_Caption#2');
     HeaderControlSOCKSDirect.Sections.Items[1].Text:=GetNlsString('Socks_Notebook','Header_Caption#3');
     HeaderControlSOCKSServer.Sections.Items[0].Text:=GetNlsString('Socks_Notebook','Header_Caption#4');
     HeaderControlSOCKSServer.Sections.Items[1].Text:=GetNlsString('Socks_Notebook','Header_Caption#5');
     HeaderControlSOCKSServer.Sections.Items[2].Text:=GetNlsString('Socks_Notebook','Header_Caption#6');
     HeaderControlSOCKSServer.Sections.Items[3].Text:=GetNlsString('Socks_Notebook','Header_Caption#7');

     CheckBoxSocksEnable.Caption:=getNlsString('TAB-SOCKS1','CheckBoxSocks');
     GrpBoxSocksSecurity.Caption:=GetNlsString('TAB-SOCKS1','GroupBoxSocksBasic');
     RadioSocksSecurity.Caption:=GetNlsString('TAB-SOCKS1','RadioSockSecureCaption');
     RadioSocksSecurity.Items[0]:=getNlsString('TAB-SOCKS1','RadioSockSecureItem#0');
     RadioSocksSecurity.Items[1]:=GetNLSString('TAB-SOCKS1','RadioSockSecureItem#1');
     SplashInc(SPlashIndex);
     labelSocksUserID.Caption:=GetNlsString('TAB-SOCKS1','LabelSocksUserID');
     LabelSOCKSPassword1.Caption:=GetNLSString('TAB-SOCKS1','LabelPassword1');
     LabelSOCKSPassword2.Caption:=getNlsString('TAB-SOCKS1','LabelPassword2');
     SplashInc(SPlashIndex);


     ButtonSocksDomainAdd.Caption:=GetNlsString('TAB-SOCKS2','ButtonAdd');
     ButtonSocksDomainEdit.Caption:=GetNlsString('TAB-SOCKS2','ButtonEdit');
     ButtonSocksDomainDelete.Caption:=GetNlsString('TAB-SOCKS2','ButtonDelete');
     LabelSocksDomainAdd.Caption:=GetNlsString('TAB-SOCKS2','LabelSockHintAdd');
     LabelSocksDomainEdit.Caption:=GetNlsString('TAB-SOCKS2','LabelSockHintEdit');
     LabelSocksDomainDelete.Caption:=GetNlsString('TAB-SOCKS2','LabelSockHintDel');

     SplashInc(SPlashIndex);

     ButtonSocksDNSadd.Caption:=GetNlsString('TAB-SOCKS2','ButtonAdd');
     ButtonSocksDNSEdit.Caption:=GetNlsString('TAB-SOCKS2','ButtonEdit');
     ButtonSocksDNSDelete.Caption:=GetNlsString('TAB-SOCKS2','Buttondelete');
     LabelSocksDNSadd.Caption:=GetNLsString('TAB-SOCKS2','LabelDNSHintAdd');
     LabelSocksDNSEdit.Caption:=GetNLsString('TAB-SOCKS2','LabelDNSHintEdit');
     LabelSocksDNSDelete.Caption:=GetNLsString('TAB-SOCKS2','LabelDNSHintDel');

     SplashInc(SPlashIndex);


     BUTTONSocksDirectAdd.Caption:=GetNLSString('TAB-SOCKS3','ButtonAdd');
     BUTTONSocksDirectEdit.Caption:=GetNLSString('TAB-SOCKS3','ButtonEdit');
     BUTTONSocksDirectDelete.Caption:=GetNLSString('TAB-SOCKS3','ButtonDelete');
     SplashInc(SPlashIndex);
     LabelSocksDirectAdd.Caption:=GetNLSString('TAB-SOCKS3','LabelAddInfo');
     LabelSocksDirectEdit.Caption:=GetNLSString('TAB-SOCKS3','LabelEditInfo');
     LabelSocksDirectDelete.Caption:=GetNLSString('TAB-SOCKS3','LabelDelInfo');
     //LabelSocksServerInfo.Caption:=GetNlsString('TAB-SOCKS4','LabelInfo');

     SplashInc(SPlashIndex);
     ButtonSocksServerAdd.Caption:=GetNLSString('TAB-SOCKS4','ButtonAdd');
     ButtonSocksServerEdit.Caption:=GetNLSString('TAB-SOCKS4','ButtonEdit');
     ButtonSocksServerDelete.Caption:=GetNLSString('TAB-SOCKS4','ButtonDelete');
     LabelSocksServerAdd.Caption:=GetNlsString('TAB-SOCKS4','LabelAddInfo');
     LabelSockSServerEdit.Caption:=GetNlsString('TAB-SOCKS4','LabelEditInfo');
     LabelSockSServerDelete.Caption:=GetNlsString('TAB-SOCKS4','LabelDelInfo');
End;

{ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
 บ                                                                          บ
 บ     This Section :                                                       บ
 บ                                                                          บ
 บ     Display Hostlist   Version 1 23.09.2005                              บ
 บ                                                                          บ
 ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ}



Procedure TForm1.ButtonIPrefreshOnClick (Sender: TObject);
Begin
  LabelCurrentIP.Caption:=TCP1.LocalIP;
End;

Procedure TForm1.DisplayHostList;
VAr Loop:longint;


Begin
    StringGrid1.cells[0,0]:=GetNlsString('TAB-HostList','Header_Caption#0');
    StringGrid1.cells[1,0]:=GetNlsString('TAB-HostList','Header_Caption#1');
    StringGrid1.cells[2,0]:=GetNlsString('TAB-HostList','Header_Caption#2');
    StringGrid1.cells[3,0]:=GetNlsString('TAB-HostList','Header_Caption#3');
    StringGrid1.RowCount:=DebugForm.lbHOSTIP.Items.count+1;
    For Loop:=0 to DebugForm.lbHostIP.Items.count-1 do
    Begin
         StringGrid1.Cells[0,1+loop]:=DebugForm.lbhostIP.items[loop];
         StringGrid1.Cells[1,1+loop]:=DebugForm.lbhostName.items[loop];
         StringGrid1.Cells[2,1+loop]:=DebugForm.lbHostAlias.items[loop];
         StringGrid1.Cells[3,1+loop]:=DebugForm.lbhostComment.items[loop];
    End;
        StringGrid1.Row:=1;
    IF getEnv('USE_HOSTS_FIRST')='1' then cbuseHostlistfirst.checked:=True else cbuseHostlistfirst.checked:=FALSE;
End;


Procedure TForm1.StringGrid1OnSelectCell (Sender: TObject; Col: LongInt;
  Row: LongInt);
Begin
   {StringGrid1.row:=row;
   StringGrid1.col:=1;}
    IF StringGrid1.RowCount>1 Then
    Begin
         ButtonHostEdit.enabled:=TRUE;
         ButtonHostDelete.Enabled:=TRUE;
    End;

End;

Procedure TForm1.LanDomainDeleteOnClick (Sender: TObject);
Begin
   DebugForm.lbDomainsSetup.Items.delete(lblocalDomainSearchList.ItemIndex);
   DisplayDomains;
End;

Procedure TForm1.LANDomainEditOnClick (Sender: TObject);
VAR RC:Longint;
Begin
    IF lblocalDomainSearchList.ItemIndex=-1 Then exit;

     {DNSWizard.Create(nil);
     DNSWizard.NLSSection:='DOMAIN-Wizard';
     DNSWizard.DNSEntryFlag:=FALSE;
     DNSWizard.EntryIndex:=lblocalDomainSearchList.ItemIndex;
     RC:=DNSWizard.ShowModal;
     DNSWizard.Destroy;
     IF RC<>CmCancel Then DisplayLanDomains;}
End;

Procedure TForm1.LANDomainAddOnClick (Sender: TObject);
VAR RC:Longword;
Begin
{     DnsWizard.Create(Nil);}
     {DNSWizard.NLSSection:='DOMAIN-Wizard';
     DNSWizard.DNSEntryFLag:=True;
     RC:=DNSWizard.ShowModal;
     DNSWizard.Destroy;
     IF RC<>CmCancel Then DisplayLanDomains;}

End;






Procedure TForm1.ButtonHostEditOnClick (Sender: TObject);
VAR RC:Longint;Index:Longint;
Begin
     HostListWizard.Create(NIL);HostListWizard.HostlistEntryFlag:=FALSE;Index:=Stringgrid1.Row-1;
     HostListWizard.EntryIndex:=Index;
     RC:=HostListWizard.ShowModal;
     HostListWizard.Destroy;
     IF RC<>CmCancel Then
     begin
         //0 StringGrid1.Destroy;
          //IF HostListWizard.HostListEntryFlag Then StringGrid1.RowCount:=DebugForm.lbHOSTIP.Items.count;
          StringGrid1.Cells[0,Stringgrid1.row]:=DebugForm.lbhostIP.items[Index];
          StringGrid1.Cells[1,StringGrid1.row]:=DebugForm.lbHostname.items[Index];
          StringGrid1.Cells[2,StringGrid1.row]:=DebugForm.lbhostalias.items[Index];
          StringGrid1.Cells[3,StringGrid1.row]:=DebugForm.lbhostcomment.items[Index];
          StringGrid1.col:=0;StringGrid1.col:=1;StringGrid1.Col:=2;StringGrid1.col:=3;
      End;
End;

Procedure TForm1.Edit1OnChange (Sender: TObject);
Begin

End;


Procedure TForm1.ButtonHelpOnClick (Sender: TObject);
Begin
    //IF ProgramSettings.ConfigLevel=1 Then
    IF Application.ProgramIniFile.ReadInteger('Settings','CONFIG_LEVEL',0)=1 Then
    Begin
    IF TabbedNotebook1.PageIndex=4 Then ViewHelp(help_INDEX_BASIC+40+SocksNotebook.PageIndex) else
    ViewHelp(Help_Index_BASIC+TabbedNotebook1.PageIndex);
    End else
    Begin
         Case TabbedNotebook1.PageIndex of
         0:ViewHelp(Help_Index_BASIC+TabbedNotebook1.PageIndex);
         1:ViewHelp(Help_Index_BASIC+TabbedNotebook1.PageIndex);
         2:ViewHelp(Help_Index_BASIC+TabbedNotebook1.PageIndex+1);
         End;
    End;
End;



Procedure TForm1.Form1OnDestroy (Sender: TObject);
VAR Loop:Byte;
Begin
     //Beep(1000,1000);
     FOr Loop:=0 to 7 do
     begin
          AliasRec.AliasIP[loop].Destroy;
          AliasRec.AliasSubnet[loop].Destroy;
     End;
     For Loop:=0 to 25 do
     Begin
           FTPServerRec[loop].ReadDir.Destroy;
           FTPServerRec[loop].WriteDir.Destroy;
     End;

     BMP1.Destroy;
     BMP2.Destroy;
     BMP3.Destroy;
     ICO_HomeIP.Destroy;
     ICO_IP.Destroy;
     ICO_DHCP.Destroy;
     ICO_System.Destroy;
     ICO_RouteNet.Destroy;
     ICO_RouteHost.Destroy;
     ICO_RouteDefault.Destroy;

     BMP_IFNew.Destroy;
     NlsIni.Destroy;

End;


Procedure TForm1.BitmapListBox1OnItemFocus (Sender: TObject; Index: LongInt);
Begin
     BitmapListBox2.ItemIndex:=Index;
End;

Procedure TForm1.DisplayPrinter;
VAR RC_SERVER,RC_Printer:longint;Test:String;
Begin
     ConfigSysFile.Create;
     RC_SERVER:=ConfigSysFile.FindEntry('SET LPR_SERVER');
     RC_Printer:=ConfigSysFile.FindEntry('SET LPR_PRINTER');

     //Test:=GetEnvString(ConfigSysFile.CFG_Items.items[RC_Server]);

     IF RC_Server<>-1 then Edit_LPR_Server.Text:=GetEnvString(ConfigSysFile.CFG_Items.items[RC_Server]);

     IF RC_Printer<>-1 Then Edit_LPR_printer.Text:=GetEnvString(ConfigSysFile.CFG_Items.items[RC_printer]);

     // Feststellen ob umgebungs Variablen aktiv sind
     IF GetEnv('LPR_SERVER')=Edit_LPR_Server.Text Then Begin img_printServer.visible:=false;labelenv_server.Caption:=GetNLSString('MESSAGE','ENV_SERVER_ACTIVE');End
                                             else Begin img_printServer.visible:=True;LabelENV_Server.Caption:=GetNLSString('MESSAGE','ENV_SERVER_INACTIVE');End;

     IF GetEnv('LPR_PRINTER')=Edit_LPR_PRINTER.Text Then Begin img_printer.visible:=false;labelenv_printer.Caption:=GetNLSString('MESSAGE','ENV_printer_ACTIVE');End
                                                  else Begin img_printer.visible:=True;LabelENV_printer.Caption:=GetNLSString('MESSAGE','ENV_printer_INACTIVE');End;
     IF Edit_LPR_Server.Text='' Then Begin img_printServer.visible:=True;LabelENV_Server.Caption:=GetNLSString('MESSAGE','ENV_SERVER_INACTIVE');End;
     IF Edit_LPR_printer.Text='' Then Begin img_printer.visible:=True;LabelENV_printer.Caption:=GetNLSString('MESSAGE','ENV_printer_INACTIVE');End;

     ConfigSysFile.Destroy;
End;


{ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
 บ                                                                          บ
 บ     Display Procedures                                                   บ
 บ                                                                          บ
 บ     This Section : DisplayInterfaces                                     บ
 บ                                                                          บ
 ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ}


Procedure TForm1.DisplayInterfaces(NewEntry:Boolean);
VAR
   LanCounter:Byte;


         Procedure DisplayActive;
         Begin
               TRY {aktive Schnittstelle anzeigen}
               ListBox1.AddBitmap(DebugFOrm.LBIPSETUPLANNUM.ITEMS[lanCOunter],BMP1);
               Except Raise EInvalidCast.Create('Exception in TCP_Unit1 bei DisplayInterfaces : Zugriff auf DebugFOrm.LBIPSETUPLANNUM.ITEMS[lanCOunter]');Halt;
               End;
         End;

         Procedure DisplayInactive;
         Begin
               TRY {inactive Schnittstelle anzeigen}
               ListBox1.AddBitmap(DebugFOrm.LBIPSETUPLANNUM.ITEMS[lanCOunter],BMP2);
               Except Raise EInvalidCast.Create('Exception in TCP_Unit1 bei DisplayInterfaces : Zugriff auf DebugFOrm.LBIPSETUPLANNUM.ITEMS[lanCOunter]');Halt;
               End;
         End;

         Procedure DisplayNewINterface;
         VAR Index:ShortInt;
         Begin
               ListBox1.BeginUpdate;
               Index:=ListBox1.Items.count-1;
               TRY
               ListBox1.Items.Delete(ListBox1.Items.count-1);
               Except Raise EInvalidCast.Create('Exception in TCP_Unit1 bei DisplayNewInterface : Lschen eines Eintrages Liestbox lste exception aus');Halt;
               End;
               TRY {inactive Schnittstelle anzeigen}
               ListBox1.AddBitmap(DebugFOrm.LBIPSETUPLANNUM.ITEMS[Index],BMP_IFNew);
               Except Raise EInvalidCast.Create('Exception in TCP_Unit1 bei DisplayNewInterfaces : Zugriff auf DebugFOrm.LBIPSETUPLANNUM.ITEMS[ListBox1.Items.count-1]'+'Wert : '+ToStr(ListBox1.items.count-1));Halt;
               End;
               ListBox1.EndUpdate;
         End;

         Procedure DisplayHomeIp;
         Begin
              TRY
               BitmapListBox1.addBitmap(DebugForm.LBIpSetupIPAdress.items[lanCounter],ICO_HomeIP);
               Except Raise EInvalidCast.Create('Exception in TCP_Unit1 bei DisplayInterfaces , Fehler bei Lese Zugriff auf "DebugForm.LBIpSetupIPAdress.items[lanCounter]"');Halt;
               ENd;

               TRY
               BitmapListBox2.addBitmap(DebugForm.LBIpSetupSubnetmask.items[lanCounter],BMP3);
               Except Raise EInvalidCast.Create('Exception in TCP_Unit1 bei DisplayInterfaces , Fehler bei Lese Zugriff auf "DebugForm.LBIpSetupSubnetmask.items[lanCounter]"');Halt;
               ENd;
         End;

         Procedure DisplayDHCP;
         Begin
              TRY
               BitmapListBox1.addBitmap(DebugForm.LBIpSetupIPAdress.items[lanCounter]+' (DHCP)',ICO_DHCP);
               Except Raise EInvalidCast.Create('Exception in TCP_Unit1 bei DisplayInterfaces , Fehler bei Lese Zugriff auf "DebugForm.LBIpSetupIPAdress.items[lanCounter]"');Halt;
               ENd;

               TRY
               BitmapListBox2.addBitmap(DebugForm.LBIpSetupSubnetmask.items[lanCounter],BMP3);
               Except Raise EInvalidCast.Create('Exception in TCP_Unit1 bei DisplayInterfaces , Fehler bei Lese Zugriff auf "DebugForm.LBIpSetupSubnetmask.items[lanCounter]"');Halt;
               ENd;
         End;

         Procedure DisplayNoneHomeIP;
         VAR Loop:Byte;
         Begin
              TRY
               BitmapListBox1.addBitmap(DebugForm.LBIpSetupIPAdress.items[lanCounter],ICO_IP);
               Except Raise EInvalidCast.Create('Exception in TCP_Unit1 bei DisplayInterfaces , Fehler bei Lese Zugriff auf "DebugForm.LBIpSetupIPAdress.items[lanCounter]"');Halt;
               ENd;

               TRY
               BitmapListBox2.addBitmap(DebugForm.LBIpSetupSubnetmask.items[lanCounter],BMP3);
               Except Raise EInvalidCast.Create('Exception in TCP_Unit1 bei DisplayInterfaces , Fehler bei Lese Zugriff auf "DebugForm.LBIpSetupSubnetmask.items[lanCounter]"');Halt;
               ENd;


         End;
Begin
     ListBox1.Clear;
     BitmapListBox1.Clear;
     BitmapListBox2.Clear;

     {Prfen ob Schnittstelle vorhanden ist }
     IF DebugForm.LBIPSetupLanNum.items.count=0 then exit;
     For LanCounter:=0 to DebugForm.LBIPSetupLanNum.items.count-1 do
     Begin
          {Prfen ob Schnittstelle aktiv ist oder ob neuer Interface EIntrag erstellt wurde}
          ListBox1.BeginUpdate;

          IF ActiveInterFace(LanCOunter) Then DisplayActive else DisplayInactive;

          ListBox1.EndUpdate;

           IF DebugForm.LBIPSetupDHCP.items[lanCounter]='TRUE' Then
           Begin
                DisplayDHCP;
           End else
           Begin
                {Home IP - IP Adresse und Subnetmaske hinzufgen}
                IF AliasRec.HomeIP=DebugForm.LBIpSetupIPAdress.items[lanCounter] Then
                Begin
                     DisplayHomeIP;
                End else
                Begin
                     DisplayNoneHomeIP;
                End;
          End;

     End; // for

     IF NewEntry Then DisplayNewInterface;
End;

{ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
 บ                                                                          บ
 บ     Interface Procedures                                                 บ
 บ                                                                          บ
 บ     This Section : ClearInterfaces                                       บ
 บ     Deletes all entrys that belongs to an interface                      บ
 บ     Version 1 10.09.2005 - last modified 14.10.2006                      บ
 บ     20.11.07 Lschen von  DHCP hinzugefgt                               บ
 ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ}

Procedure TForm1.ClearInterfaces(Index:Byte);
Begin
          {Delete the LAN Interface}
          ListBox1.Items.delete(Index);
          DebugForm.LBIPSetupLanNum.items.delete(Index);
          {Delete the IP-Adress}
          BitmapListBox1.Items.delete(Index);
          DebugForm.LBIpSetupIPAdress.items.delete(Index);
          {Delete the Subnet}
          BitmapListBox2.Items.delete(Index);
          DebugForm.LBIpSetupSubnetmask.items.delete(Index);
          {Delete Alias IP }
          AliasRec.AliasIP[Index].clear;
          {Delete Alias Subnet}
          AliasRec.AliasSubnet[Index].Clear;
          {Delete Broadcsat IP's}
          DebugForm.LBIpSetupBroadcast.items.delete(Index);
          {Delete MTU Size}
          DebugForm.LBIPSetupMTU.Items.delete(Index);
          {Delete Metric}
          DebugForm.LBIPSetupMetric.Items.delete(Index);
          {Delete Destination IP Adress}
          DebugForm.LBIPSetupTargetAdress.items.delete(Index);
          {Delete ALLRS}
          DebugForm.LBSpSettingsALLRS.Items.delete(Index);
          {Delete icmpred}
          DebugForm.lbSpSettingsARP.Items.delete(Index);
          {Delete Snap}
          DebugForm.lbSpSettingsSnap.Items.delete(Index);
          {Delete bridge}
          DebugForm.lbSpSettingsBridge.Items.delete(Index);
          {Delete trailers}
          DebugForm.lbSpSettingsTrailers.items.delete(Index);
          {Delete 802.3}
          DebugForm.lbSpSettings802.items.delete(Index);
          {Delete Canonical}
          DebugForm.lbSpSettingsCanonical.items.delete(Index);
          {Delete DHCP Time}
          DebugForm.LBIpSetupDHCPTime.items.delete(Index);
          {Delete ICMPred}
          DebugForm.lbSpSettingsICMPRED.items.delete(Index);
          {Delete DHCP}
          DebugForm.lbIPSetupDHCP.items.delete(Index);
          ChangeRec.LanInterface:=TRUE;
End;

{ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
 บ                                                                          บ
 บ     This Section :                                                       บ
 บ                                                                          บ
 บ     ROUTING   Functions                                                  บ
 บ                                                                          บ
 ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ}
 Procedure TForm1.DisplayRoutings;
 VAR Counter:Byte;S:String;
 Begin

      lbRoutings.Clear;
      IF DebugForm.LBRouteNetType.items.count=0 Then exit;
      lbRoutings.BeginUpdate;
     For Counter:=0 To DebugForm.LBRouteNetType.items.count-1 do
     Begin
          S:=DebugForm.LBRouteGateway.items[Counter]+'|'+DebugForm.LBRouteSubnetmask.items[Counter]+'|'+DebugForm.LBRouteHopCount.items[Counter]+'|'+DebugForm.LBRouteTargetAdress.items[Counter];
          IF DebugForm.LBRouteNetType.Items[Counter]='default' Then lbRoutings.AddObject('dummy|default|'+S,ICO_RouteDefault);
          IF DebugForm.LBRouteNetType.Items[Counter]='net' Then lbRoutings.AddObject('dummy|net|'+S,ICO_RouteNet);
          IF DebugForm.LBRouteNetType.Items[Counter]='host' Then lbRoutings.AddObject('dummy|host|'+S,ICO_RouteHost);
     End;
     lbRoutings.EndUpdate;
 End;

 Procedure TForm1.ClearRoutings(Index:Longint);
 Begin
     DebugForm.LBRouteTargetAdress.items.delete(Index);
     DebugForm.LBRouteGateway.items.delete(Index);
     DebugForm.LBRouteSubnetmask.items.delete(Index);
     DebugForm.LBRouteNetType.items.delete(Index);
     DebugForm.LBRouteHopCount.items.delete(Index);
     {lbRoutingTargetIP.Items.delete(Index);
     lbRoutingGateway.items.delete(Index);
     lbRoutingSubnet.items.delete(Index);
     lbRoutingNetType.items.delete(Index);
     lbRoutingMetric.items.delete(Index);}
     ChangeRec.Routing:=TRUE;
     IF DebugForm.lbRouteTargetAdress.Items.Count=0 Then
     Begin
          ButtonRouteEdit.Enabled:=FALSE;
          ButtonRouteDelete.Enabled:=FALSE;
     End;
 End;



Procedure TForm1.DisplayDNS;
Label Ausgang;

    VAR Loop:Byte;
    Begin
         lbDNSServers.Clear;

         IF DebugForm.LbDNSSetup.Items.count=0 Then Goto Ausgang;

         FOr Loop:=0 to DebugForm.lbDNSSetup.items.count-1 do
         Begin
              TRY
              lbDNSServers.AddBitmap(DebugForm.lbDNSSetup.items[loop],ICO_IP);
              Except Raise Exception.Create('Exception in Unit TCP_Unit1 bei DisplayDNS'+#13+'Fehler bei Zugriff auf DebugForm.lbDNSSetup');Halt;
              ENd;
         End;
         Ausgang:
          ButtonDnsEdit.Enabled:=False;
          ButtonDnsDelete.Enabled:=False;
    End;

{ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
 บ                                                                          บ
 บ     This Section : LAN.DOMAINS                                           บ
 บ                                                                          บ
 บ                                                                          บ
 บ                                                                          บ
 ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ}

 Procedure TForm1.DisplayDomains;
 VAR Loop:Byte;
 Begin

      lbLocalDomainSearchList.Clear;
      IF DebugForm.lbDomainsSetup.items.count<>0 Then
      Begin
           For Loop:=0 to DebugForm.lbDomainsSetup.items.count-1 do
           Begin
                lblocalDomainSearchList.AddBitmap(DebugForm.lbDomainsSetup.items[Loop],ICO_IP);
           End;
      End;

      EditLocalDomain.Text:=DebugForm.EditLocalDomain.Text;
      EditHostname.Text:=DebugForm.EditHostname.Text;
      ButtonLanDomainEdit.Enabled:=FALSE;
      ButtonLanDomainDelete.Enabled:=FALSE;
 End;

Procedure TForm1.ListBox1OnItemFocus (Sender: TObject; Index: LongInt);
Begin
BitmapListBox2.ItemIndex:=Index;
BitmapListBox1.ItemIndex:=Index;

ListBox1.ItemIndex:=Index;

//MyIndex:=DebugForm.ListBox1.Items.Indexof('
IF ActiveInterFace(Index) Then
Begin
     LabelInfo1.Caption:=GetNLSString('TAB-Interface','INTERFACE_UP#1');
     LabelInfo2.Caption:=GetNlsString('TAB-Interface','INTERFACE_UP#2');
End
   else
Begin
     LabelInfo1.Caption:=GetNLSString('TAB-Interface','INTERFACE_DOWN#1');
     LabelInfo2.Caption:=GetNlsString('TAB-Interface','INTERFACE_DOWN#2');
 End;
End;


Procedure TForm1.MenuItemOptionalSettingsOnClick (Sender: TObject);
Begin
    TCPSpecialSettingsNotebook.Create(Nil);
    TCPSpecialSettingsNotebook.Create(Nil);
    TCPSpecialSettingsNotebook.ShowModal;
    TCPSpecialSettingsNotebook.Destroy;
End;

Procedure TForm1.NfsHelpButtonOnClick (Sender: TObject);
Begin
    application.Help(8);
End;

Procedure TForm1.duplicateCheckboxOnClick (Sender: TObject);
VAR L:longint;
Begin
  IF duplicateCheckBox.checked then
  Begin
       For L:=0 to debugform.lbnfsdirectory.items.count-1 do
       Begin
            IF debugform.lbnfsrights.items[l]='P' then nfs_directory.items.delete(l);
       End;

  End else Begin
                 NFS_Directory.Items:=DebugForm.lbNFSDirectory.items;
                 NFS_Alias.items:=DebugFOrm.lbNFSAlias.items;
                 NFS_Comment.items:=DebugForm.lbnfsComment.Items;
            End;
End;

Procedure TForm1.ListBox6OnItemFocus (Sender: TObject; Index: LongInt);
Begin
     {lbAliasIP.ItemIndex:=Index;}
End;

Procedure TForm1.ListBox5OnItemFocus (Sender: TObject; Index: LongInt);
Begin
     {lbAliasSubnet.ItemIndex:=Index;}
End;

Procedure TForm1.MenuItemProgramSettingsOnClick (Sender: TObject);
VAr
   OldLanguageFile:String;

Begin
    OLDLanguageFile:=Application.ProgramIniFile.ReadString('Settings','NLS_FILENAME','');

    ProgrammSettingsNotebook.Create(Self);

    IF ProgrammSettingsNotebook.Execute Then
    Begin
         //startupcomplete:=true;
          IF  OLDLanguageFile<>Application.ProgramIniFile.ReadString('Settings','NLS_FILENAME','') Then
              Begin
                   Cursor:=CrHourGlass;
                   NlsIni.Destroy;
                   NLSIni.Create(PathRec.BootPath+PathRec.LanguageFile);
                   LanguageSettings;
                   Cursor:=CrDefault;
                   IF ListBox1.ItemIndex>0 Then ListBox1OnItemFocus(Self,ListBox1.ItemIndex);   // refresh the Infoline for the selected language
                   IF Application.ProgramIniFile.ReadInteger('Settings','CONFIG_LEVEL',0)=1 Then
                   Begin
                        SocksNotebook.OnSetupShow(Self);
                        TCPAutostartNotebook.OnSetupShow(Self);
                        //BitmapListBox3OnSetupShow(Self);
                   End;
              End;
    End;
    Try
    ProgrammSettingsNotebook.Destroy;
    Except
    End;
End;

{ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
 บ                                                                          บ
 บ     This Section : NFS Routines                                          บ
 บ                                                                          บ
 บ     Version 2 17.08.2005                                                 บ
 บ                                                                          บ
 ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ}

Procedure TForm1.NfsDeleteButtonOnClick (Sender: TObject);
Begin
     IF NFS_Directory.ItemIndex=-1 Then exit;
     DebugForm.lbnfsDirectory.Items.delete(NFS_Directory.ItemIndex);
     DebugForm.lbnfsAlias.items.delete(NFS_Directory.ItemIndex);
     DebugForm.lbNFSComment.items.delete(NFS_Directory.ItemIndex);
     DebugForm.lbNFSRights.items.delete(NFS_Directory.ItemIndex);
     DebugForm.lbNFSPublicDir.Items.delete(NFS_Directory.itemindex);
     NFSHostListArray[NFS_Directory.ItemIndex].clear;
         NFS_Directory.Items:=DebugForm.lbNFSDirectory.items;
         NFS_Alias.items:=DebugFOrm.lbNFSAlias.items;
         NFS_Comment.items:=DebugForm.lbnfsComment.Items;
         NFS_Hosts.Items.Clear;
         IF DebugForm.lbnfsDirectory.items.count=0 Then Begin NfsDeleteButton.enabled:=False;NFSEditButton.Enabled:=FALSE;End;
End;

Procedure TForm1.NFSEditButtonOnClick (Sender: TObject);
Begin
    IF NFS_Directory.ItemIndex=-1 Then exit;
    NFSWizard.Create(Nil);
    NfsWizard.EditFlag:=True;
    NFSWizard.EditIndex:=NFS_Directory.ItemIndex;
    NFSWizard.ShowModal;
     IF NFSWizard.ModalResult<>CmCancel Then
     Begin
         NFS_Directory.Items:=DebugForm.lbNFSDirectory.items;
         NFS_Alias.items:=DebugFOrm.lbNFSAlias.items;
         NFS_Comment.items:=DebugForm.lbnfsComment.Items;
         IF NFS_HOSTS.items.count<>0 Then
         Begin
              NFS_Hosts.items:=NfsHostListArray[NFS_Directory.items.count-1];
         End;
     End;
    NFSWizard.Destroy;
End;

Procedure TForm1.NFS_Rights_RadioOnClick (Sender: TObject);
Begin

End;

Procedure TForm1.NFS_DirectoryOnItemFocus (Sender: TObject; Index: LongInt);
Begin
         NFS_Hosts.Clear;
         IF DebugForm.lbNFSRights.items[Index]='HW' Then
                                                   Begin
                                                        NFS_Rights_Radio.ItemIndex:=1;
                                                        NFS_hosts.items:=NFSHostListArray[Index];
                                                    End;
         IF DebugForm.lbNFSRights.items[Index]='HR' Then
                                                       Begin
                                                            NFS_Rights_Radio.ItemIndex:=0;
                                                            NFS_hosts.items:=NFSHostListArray[Index];
                                                       End;
         IF DebugForm.lbNFSRights.items[Index]='PR' Then
                                                       Begin
                                                            NFS_Rights_Radio.ItemIndex:=2;
                                                       End;
         IF DebugForm.lbNFSRights.items[Index]='PW' Then
                                                   Begin
                                                        NFS_Rights_Radio.ItemIndex:=3;
                                                    End;

         IF DebugForm.lbNFSRights.items[Index]='H' Then Begin NFS_Rights_Radio.ItemIndex:=2;NFS_Hosts.Items.clear;End;
         NFS_Alias.Selected[Index]:=True;
         NFS_Comment.Selected[Index]:=True;
         NFSDeleteButton.Enabled:=TRUE;
         NFSEditButton.Enabled:=True;

End;

Procedure TForm1.NFSAddButtonOnClick (Sender: TObject);
Begin
     NFSWizard.Create(Nil);
     NFSWizard.EditFlag:=False;
     NfsWizard.ShowModal;
     IF NFSWizard.ModalResult<>CmCancel Then
     Begin
         NFS_Directory.Items:=DebugForm.lbNFSDirectory.items;
         NFS_Alias.items:=DebugFOrm.lbNFSAlias.items;
         NFS_Comment.items:=DebugForm.lbnfsComment.Items;
         NFS_Hosts.items:=NfsHostListArray[NFS_Directory.items.count-1];
     End;
     //ShowMessage(NFSReadListArray[DebugForm.lbNFSDirectory.items.count][0]);
     NFS_Directory.ItemIndex:=NFS_Directory.items.count-1;
     NFSWizard.Destroy;
End;
{ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
 บ                                                                          บ
 บ     This Section Startup NLS Function                                    บ
 บ                                                                          บ
 บ     Version 2 22.08.2005 last changed 07.09.05                           บ
 บ                                                                          บ
 ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ}

Procedure TForm1.Form1OnSetupShow (Sender: TObject);
Begin
     IF Application.ProgramIniFile.ReadBool('Settings','SPLASH_SCREEN',TRUE) Then DisplaySplashScreen;
     LanguageSettings;

End;




Procedure TForm1.RadioButtonSaveProfileOnClick (Sender: TObject);
Begin
         //ProfilWizard.Notebook1.PageIndex:=0;
         //ProfilWizard.ShowModal;
End;

Procedure TForm1.RadioButtonLoadProfileOnClick (Sender: TObject);
Begin
         //ProfilWizard.Notebook1.PageIndex:=1;
         //ProfilWizard.ShowModal;
End;

Procedure TForm1.ProfilButtonOnClick (Sender: TObject);
Begin
  //FOrm2.SHowmodal;
End;

Procedure TForm1.DebugButtonOnClick (Sender: TObject);
Begin
     DebugFOrm.SHowModal;
End;



Procedure TForm1.CancelButtonOnClick (Sender: TObject);
Begin
  CLoseAllowed:=False;
  Close;
End;


Procedure TForm1.OKButtonOnClick2 (Sender: TObject);
Begin
End;



{ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
 บ                                                                          บ
 บ     This Section :   Ok (Save) Button                                    บ
 บ                                                                          บ
 บ     Version 2 11.10.2005                                                 บ
 บ                                                                          บ
 ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ}

Function FinalCheck:Boolean;
Begin
     Result:=True;
     //IF ProgramSettings.ConfigLevel=0 Then exit;
     IF Application.ProgramIniFile.ReadInteger('Settings','CONFIG_LEVEL',0)=0 Then exit;

     If Form1.RadioSocksSecurity.ItemIndex=0 Then
     Begin
         IF (Form1.EditSocksPassword1.Text<>Form1.EditSocksPassword2.Text) Then
         Begin
              Form1.TabbedNotebook1.PageIndex:=4;
              Form1.EditSocksPassword1.Focus;
              MyInfoBox(GetNlsString('Message','Socks_INVPassword'));
              Result:=False;Exit;

         End;

         IF Form1.EditSocksPassword1.Text='' Then
         Begin
              Form1.TabbedNotebook1.PageIndex:=4;
              Form1.EditSocksPassword1.Focus;
              MyInfoBox(GetNlsString('Message','Socks_EmptyPassword'));
              Result:=False;Exit;
         End;

         IF Form1.EditSocksUserID.Text='' Then
         Begin
              Form1.TabbedNotebook1.PageIndex:=4;
              Form1.EditSocksUserID.Focus;
              MyInfoBox(GetNlsString('Message','NO_SOCKS_User'));
              Result:=FALSE;Exit;
         End;

     End;

     IF Form1.CheckBoxSocksEnable.checked Then
       Begin
            IF Form1.lbSOCKSDomains.items.count=0 Then
            Begin
                 MyInfoBox(GetNLSString('Message','NO_SOCKS_NameServer'));
                 Result:=FALSE;Exit;
            End;
        End;

End;

Procedure TForm1.MoveSettings;
// Kopiert die Einstellungen von Form1 in die entsprechenden DebugForm Felder
Begin
     // Always Copy Domain
            DebugForm.EditLocalDomain.Text:=EditLocalDomain.Text;
            DebugForm.EditHostname.Text:=EditHostname.Text;

     //Case ProgramSettings.ConfigLevel of
     Case Application.ProgramIniFile.ReadInteger('Settings','CONFIG_LEVEL',0) of
     1:Begin
            // Copy LPR Settings
            DebugForm.editLPR_SERVER.Text:=Edit_LPR_Server.Text;
            DebugForm.editLPR_PRINTER.Text:=Edit_LPR_Printer.Text;
            // Copy Socks
            DebugForm.EditSocksPassword.Text:=EditSocksPassword1.Text;    // copy socks password to debug field
            DebugForm.editSocksUser.Text:=EditSOCKSUserID.Text;           // copy SOCKS userID to debugfield
       End;
     End;
End;


Procedure SaveSettings;
Begin
                   BackupRestoreWizard.Create(NIL);
                   BackupRestoreWizard.Memo1.Lines.add('Automaticaly generated backup');
                   BackupRestoreWizard.ExecuteBackup;
                   BackupRestoreWizard.Destroy;

                   SaveEntrys;                  // SAVE BASIC Settings
                   SaveDNS(1);                  // SAVE DNS Servers
                   SaveHostName;                // SAVE HOSTNAME

                   //IF ProgramSettings.CheckBoxDosWIN Then SaveDNS(2); // SAVE DNS for DOS & WIN/OS2
                   IF Application.ProgramIniFile.ReadBool('Settings','DOS_WIN31_Resolv',FALSE) Then SaveDNS(2);

                   //IF ProgramSettings.ConfigLevel=1 Then
                   IF Application.ProgramIniFile.ReadInteger('Settings','CONFIG_LEVEL',0)=1 Then

                   Begin
                         SaveUseHostsFirst(Form1.cbuseHostlistfirst.checked);
                         SaveHostList(1);                // SAVE HOSTNAMES
                         //IF ProgramSettings.CheckBoxDosWin Then SaveHostList(2);
                        SaveSOCKS_Env;
                        SaveSocks_CFG;
                        SaveNetworkPrinter;
                        SaveNFS;
                        SaveServices;

                        //AutoStart.Create(ProgramSettings.TCPIPBINPath+'\TCPSTART.CMD',Create_Mode);
                        AutoStart.Create(Application.ProgramIniFile.ReadString('Settings','TCPIP_BIN_PATH','')+'\TCPSTART.CMD',Create_Mode);

                        // if programsettings.Autostart then Form1.StartAllServers;
                        IF Application.ProgramIniFile.ReadBool('Settings','AUTOSTART',FALSE) Then Form1.StartAllServers;

                        IF Form1.MaxAmountLPD.Value>DebugForm.SpinEditNetPrintFoundedEntrys.Value Then AddOS2SYSEntry(Form1.MaxAmountLPD.Value);
                        IF Form1.MaxAmountLPD.Value<DebugForm.SpinEditNetPrintFoundedEntrys.Value Then begin RemoveOS2SYSEntry(Form1.MaxAmountLPD.Value);End;

                        {IF ChangeRec.NFS Then // IF NFS Entry has changed, update running NFSD Server
                         Begin
                              QueryProcess(ProgramSettings.TCPIPBINPath+'\NFSD.EXE',Query_PID); // Query if NFSD is running
                              IF DLLResultStr<>'-1' Then
                              Begin
                                   MyKillProcess(DLLResultStr);
                              End;
                         End;}
                   End;
End;

Procedure TForm1.OKButtonOnClick (Sender: TObject);
VAR LoopCount:Byte;
Begin
       IF ListBox1.items.count=0 Then Begin MyInfoBox(GetNLSString('MESSAGE','NO_SETUPED_INTERFACE'));exit;End; // check if at least 1 interface is setuped

        MoveSettings;IF not FinalCheck then exit;

        IF NlsDialog('DLG_Save') Then
        Begin
             Hide;
                  SaveSettings;

                   IF (ChangeRec.LanInterface) or (ChangeRec.Routing)  then
                   Begin
                        ExecuteForm.Create;
                        IF Paramstr(1)='\DEBUG' Then ExecuteForm.ShowModal;
                        ExecuteForm.Execute;
                        ExecuteForm.Destroy;
                   End;

                FormFinalNote.ShowModal;
                CloseAllowed:=True;
                Close;
           End else
           Begin
               CLoseAllowed:=FALSE;exit;
           End;
End;





{ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
 บ                                                                          บ
 บ     This Section :   USER & Server Services                              บ
 บ                                                                          บ
 บ     Version 2 17.10.2005                                                 บ
 บ                                                                          บ
 ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ}



Procedure TForm1.CheckBoxDebugDeleteSYBFileOnClick (Sender: TObject);
Begin
    CheckBoxDebugDeleteStyle:=CheckBoxDebugDeleteSYBFile.checked;
End;

Procedure TForm1.ButtonConfigureNFSOnClick (Sender: TObject);
Begin
    IF lbServicesUser.itemindex=-1 Then exit;
    ServerServiceWizard.Create(nil,Mode_NFS,lbServicesUser.ItemIndex);
    IF ServerServiceWizard.ShowModal = cmOK Then DisplayServerServices;
    ServerServiceWizard.Destroy;
End;


Procedure TForm1.ButtonConfigureRexOnClick (Sender: TObject);
Begin
     IF lbServicesUser.itemindex=-1 Then exit;
    ServerServiceWizard.Create(nil,Mode_REX,lbServicesUser.ItemIndex);
    IF ServerServiceWizard.ShowModal = cmOK Then DisplayServerServices;
    ServerServiceWizard.Destroy;
End;

Procedure TForm1.ButtonConfigureFTPDOnClick (Sender: TObject);
Begin
    IF lbServicesUser.itemindex=-1 Then exit;
    ServerServiceWizard.Create(nil,Mode_FTP,lbServicesUser.ItemIndex);
    IF ServerServiceWizard.ShowModal = cmOK Then DisplayServerServices;
    ServerServiceWizard.Destroy;

End;

Procedure TForm1.ButtonConfigureTelnetdOnClick (Sender: TObject);
Begin
     IF lbServicesUser.itemindex=-1 Then exit;
     ServerServiceWizard.Create(nil,Mode_Telnet,lbServicesUser.ItemIndex);
     IF ServerServiceWizard.ShowModal = cmOK Then DisplayServerServices;
     ServerServiceWizard.Destroy;
End;

Procedure TForm1.ButtonServicesUserDeleteOnClick (Sender: TObject);
VAR Index:integer;
Begin
    INdex:=lbServicesUser.ItemIndex;
    If Index=-1 Then exit;
       lbServicesUser.Items.delete(Index);
       lbServicesComment.Items.delete(Index);
       DebugForm.lbServicesUserName.items.delete(Index);
       DebugForm.lbServicesComments.items.delete(Index);
       DebugForm.lbServicesPassword.items.delete(index);
       DebugForm.lbServicesHomeDir.items.delete(index);
       DebugForm.lbServicesFTP.items.delete(index);
       DebugFOrm.lbServicesTelnet.items.delete(index);
       DebugForm.lbServicesRex.items.delete(index);
       DebugForm.lbServicesNFS.items.delete(index);
       DebugForm.lbServicesFTPDreadDirectory.items.delete(index);
       DebugForm.lbServicesFTPDcanRead.items.delete(index);
       DebugForm.lbServicesFTPDwriteDirectory.items.delete(Index);
       DebugForm.lbServicesFTPDcanWrite.items.delete(Index);
       DebugForm.lbServicesFTPDLog.items.delete(Index);
       DebugForm.lbServicesFTPDidleTimeout.items.delete(index);
       DebugForm.lbServicesTelnetShell.items.delete(Index);
       DebugForm.lbServicesTelnetParamter.items.delete(Index);
       DebugForm.lbTelnetDisconnect.items.delete(Index);
       DebugForm.lbServicesNFSUSerID.items.delete(Index);
       DebugForm.lbServicesNFSGroupID.items.delete(index);
End;

Procedure TForm1.ButtonServicesUSerEditOnClick (Sender: TObject);
Begin
     IF lbServicesUser.ItemIndex=-1 Then exit;
     USerWizard.Create(Nil,False,lbServicesUser.ItemIndex);
     IF UserWizard.ShowModal=cmOK Then DisplayUsers;
     UserWizard.Destroy;
ENd;



Procedure TForm1.ButtonServicesUserAddOnClick (Sender: TObject);
Begin
     USerWizard.Create(Nil,TRUE,0);
     IF UserWizard.ShowModal=cmOK Then DisplayUsers;
     UserWizard.Destroy;
End;



Procedure TForm1.ListBoxServicesUserOnItemFocus (Sender: TObject;
  Index: LongInt);
Begin
        ButtonConfigureFTPD.enabled:=True;
        ButtonConfigureTelnetd.enabled:=True;
        ButtonConfigureRex.enabled:=True;
        ButtonConfigureNFS.enabled:=True;
        IF DebugForm.lbServicesFTP.items[Index]='true' then LabelFTPInfo.caption:=GetNLSString('TAB-USER','Active') else LabelFTPInfo.Caption:=GetNLSString('TAB-USer','inactive');
        IF DebugForm.lbServicesTelnet.items[Index]='true' then LabelTelnetInfo.caption:=GetNLSString('TAB-USER','Active') else LabelTelnetInfo.Caption:=GetNLSString('TAB-USER','inactive');
        IF DebugForm.lbServicesRex.items[Index]='true' then LabelRexecInfo.Caption:=GetNLSString('TAB-USER','Active') else LabelRexecInfo.Caption:=GetNLSString('TAB-USER','inactive');
        IF DebugForm.lbServicesNFS.items[Index]='true' then LabelNFSDInfo.Caption:=GetNLSString('TAB-USER','Active') else labelNFSDInfo.Caption:=GetNLSString('TAB-USER','inactive');
End;

Procedure TForm1.TabbedNotebook1OnPageChanged (Sender: TObject);
Begin

End;

Procedure TForm1.RadioGroupSocksPasswordOnClick (Sender: TObject);
Begin

End;

Procedure TForm1.CheckBoxSOCKSEnableOnClick (Sender: TObject);
Begin
  IF CheckBoxSocksEnable.checked then DebugForm.EditSocksFlag.TEXT:='on'
                          else DebugForm.EditSocksFlag.Text:='off';
End;


Procedure TForm1.ButtonAdvancedOnClick (Sender: TObject);
VAR Loop:Longint;
Begin
  {AdvancedSettings.ShowModal;
  ListBox5.Clear;ListBox6.Clear;
                  For Loop:=0 to IPAliasListArray[ListBox1.ItemIndex].count-1 do
                  Begin
                       ListBox5.items.add(IPAliasListArray[ListBox1.ItemIndex][loop]);
                       ListBox6.items.add(IPAliasSubnetListArray[ListBox1.ItemIndex][loop]);
                  End;}
End;

Procedure TForm1.ButtonAliasIPOnClick (Sender: TObject);
Begin
End;



Procedure TForm1.ButtonSockServerEditOnClick (Sender: TObject);
VAr Index:Longint;
Begin
  {    Index:=SocksServerListBox.ItemIndex;
      IF Index=-1 then exit;
      FormSocksServerWizard.EditFlag:=False;
      FormSocksServerWizard.Inx:=Index;
      Case FormSocksServerWizard.ShowModal of
      cmok:begin
                QuerySocksServerSettings(Index);
                MakeListBoxSocksServerEntry(Index);
                SocksServerListBox.items[Index]:=ListBoxEntryString;
           End;
      End;}
End;

Procedure TForm1.ButtonSockServerDeleteOnClick (Sender: TObject);
VAR Index:Longint;
Begin
     {Index:=SocksServerListBox.ItemIndex;IF Index=-1 Then Exit;
     SocksServerListBox.items.delete(Index);}
End;




Procedure TForm1.ButtonSocksDomainDeleteOnClick (Sender: TObject);
VAR Index:longint;
Begin
     Index:=lbSOCKSDomains.ItemIndex;
     DEBUGFORM.ListBoxSocksDOmains.Items.delete(Index);
     DisplaySocksDNS;
End;

Procedure TForm1.ButtonSocksDNSdeleteOnClick (Sender: TObject);
VAR Index:longint;
Begin
     Index:=lbSOCKSNameServer.ItemIndex;
     DebugForm.ListBoxSocksDNS.Items.delete(Index);
     DisplaySocksDNS;
End;


Procedure TForm1.ButtonSocksDNSeditOnClick (Sender: TObject);
Begin
     DNSWizard.Create(Self,Mode_SocksDNS);
     DNSWizard.Edit1.Text:=DebugForm.ListBoxSocksDNS.items[lbSOCKSNameServer.ItemIndex];
     IF DNSWizard.ShowModal=cmOK Then
     Begin
          DebugForm.ListBoxSocksDNS.items[lbSOCKSNameServer.ItemIndex]:=DnsWizard.Edit1.Text;
          DisplaySocksDNS;
     End;
     DnsWizard.Destroy;
End;

    Procedure TForm1.ButtonSocksDomainEditOnClick (Sender: TObject);
    Begin
         DNSWizard.Create(Self,MODE_SocksDomain);
          DnsWizard.Edit1.Text:=lbSOCKSDomains.Items[lbSOCKSDomains.ItemIndex];
           IF DNSWizard.ShowModal=cmOK Then
            Begin
                 DebugForm.ListBoxSocksDomains.items[lbSOCKSDomains.ItemIndex]:=DNSWizard.Edit1.Text;
                 DisplaySocksDNS;
            End;
           DnsWizard.Destroy;
    End;


Procedure TForm1.ButtonSocksDNSaddOnClick (Sender: TObject);
Begin
     DNSWizard.Create(Self,Mode_SOCKSDns);
      IF DNSWizard.ShowModal=cmOK Then
      Begin
           DebugForm.ListBoxSocksDNS.items.add(DNSWizard.Edit1.Text);
           DIsplaySocksDNS;
      End;
DnsWizard.Destroy;
End;

Procedure TForm1.ButtonSocksDomainAddOnClick (Sender: TObject);
Begin
IF LbSocksDomains.items.count=3 then Begin MyInfoBox(GetNLSString('MESSAGE','MAX_SOCKS_DOMAINS'));Exit;End;
DNSWizard.Create(Self,Mode_SocksDomain);
IF DNSWizard.ShowModal=cmOK Then
Begin
     DebugForm.ListBoxSocksDomains.items.Add(DNSWizard.Edit1.Text);
     DisplaySocksDNS;
End;
DnsWizard.Destroy;

End;


Procedure TForm1.EditHostnameOnChange (Sender: TObject);
Begin
    //HostNameChanged:=TRUE;
End;

Procedure TForm1.ListBox3OnItemFocus (Sender: TObject; Index: LongInt);
Begin
     //ListBox3.hint:=DebugForm.LBHostIP.items[Index]+' '+DebugForm.LBHostName.items[Index]+' '+DebugForm.LBHostAlias.items[Index]+' '+DebugForm.LBHostComment.items[Index];
End;

Procedure TForm1.Button6OnClick (Sender: TObject);
Begin

End;



Procedure TForm1.Button4OnClick (Sender: TObject);
Begin

End;

Procedure TForm1.EditLoopBackSubnetOnChange (Sender: TObject);
Begin
End;

Procedure TForm1.EditLoopbackIPOnChange (Sender: TObject);
Begin
End;





Procedure TForm1.ButtonHostDeleteOnClick (Sender: TObject);
VAR Index:Longint;
Begin
       IF StringGrid1.rowcount=0 Then exit;
       Index:=StringGrid1.Row-1;
       DebugForm.LBHostIP.items.delete(Index);
       DebugForm.LBHostName.items.delete(Index);
       DebugForm.LBHostAlias.items.delete(Index);
       DebugForm.LBHostComment.items.delete(Index);
       DisplayHostList;
       ChangeRec.HOSTS:=True;
       IF StringGrid1.RowCount=1 Then
       begin
            ButtonHostDelete.Enabled:=FALSE;
            ButtonHostEdit.Enabled:=FALSE;
       End;
 // End;
End;




Procedure TForm1.Form1OnCloseQuery (Sender: TObject; Var CanClose: Boolean);
Begin
     IF CloseAllowed Then begin CanClose:=TRUE;Exit;End;
     IF NLSDialog('DLG_PROG_CLOSE') Then CanClose:=TRUE else CanCLose:=FALSE;
End;







Procedure TForm1.ButtonRouteDeleteOnClick (Sender: TObject);
VAR Index:Longint;
Begin
     ClearRoutings(lbRoutings.ItemIndex);
     DisplayRoutings;
End;



Procedure Startup;

Begin
     ProgPath:=FileSplit(paramstr(0),1);
     //CheckProtocolINI;
     //IF TCPfileOpen(1) then readSettings;
     QueryInterfaceSettings;
     //IF TCPFileOpen(1) Then QuerySetupCmd;
     IF TCPFileOpen(2) then readDNS;
     IF TCPFileOpen(3) Then QueryHostList;
     IF TCPFileOpen(4) Then ReadSOCKS_ENV;
     IF TCPFileOpen(5) Then ReadSOCKS_CFG;
     IF TCPFileOpen(6) then QueryNFS;
     IF TCPFileOpen(7) Then ReadServices;
     //AutoStart.Create(ProgramSettings.TcpipBinPath+'\TCPSTART.CMD',OPEN_Mode);
     AutoStart.Create(Application.ProgramIniFile.ReadString('Settings','TCPIP_BIN_PATH','')+'\TCPSTART.CMD',OPEN_Mode);;
     {READ OS2SYS.INI for Network Printer}
     QueryNetworkPrinter;
     CloseAllowed:=FALSE;
     Form1.LabelCurrentIP.Caption:=Form1.TCP1.LocalIP;
End;



Procedure TForm1.ButtonRouteEditOnClick (Sender: TObject);
VAR RC:Longint;
Begin
  RoutingWizard.Create(Nil);
  RoutingWizard.NewEntryFlag:=FALSE;
  RoutingWizard.EntryIndex:=lbRoutings.ItemIndex;
  RC:=RoutingWizard.ShowModal;
  RoutingWizard.Destroy;
  IF Rc<>CmCancel Then DIsplayRoutings;
End;

Procedure TForm1.ButtonRouteAddOnClick (Sender: TObject);
VAR RC:Longint;
Begin
  RoutingWizard.Create(Nil);
  RoutingWizard.NewEntryFlag:=TRUE;
  RC:=RoutingWizard.ShowModal;
  RoutingWizard.Destroy;
  IF Rc<>CmCancel Then DIsplayRoutings;
End;



Procedure TForm1.TabbedNotebook1OnSetupShow (Sender: TObject);
VAR BMP1,BMP2:TBitmap;


    Procedure SetupNFS;
    Begin
         NFS_Directory.Items:=DebugForm.lbNFSDirectory.items;
         NFS_Alias.items:=DebugFOrm.lbNFSAlias.items;
         NFS_Comment.items:=DebugForm.lbnfsComment.Items;
    End;



Begin
     Startup;   // Start reading all TCP/IP Settings

     DisplayInterfaces(FALSE);
     DisplayDNS;
     DisplayDomains;
     DisplayRoutings;
     DisplayDNS;

     IF Application.ProgramIniFile.ReadInteger('Settings','CONFIG_LEVEL',0)=1 Then
     Begin
          DisplayPrinter;
          DisplayHostList;
          DisplaySocks;
          SetupNFS;
          DisplayUsers;
          DisplayServerServices;
          MaxAmountLPD.Value:=DebugForm.SpinEditNetPrintFoundedEntrys.Value;
     End;

     AssignIcons;
     CheckEnvironmentVariables;

End;


Procedure TForm1.ButtonHostAddOnClick (Sender: TObject);
VAR RC,Index:Longint;Debug:Longint;
Begin
     HostListWizard.Create(NIL);
     HostListWizard.HostlistEntryFlag:=TRUE;
     RC:=HostListWizard.ShowModal;
     IF RC<>CmCancel Then
     begin
          StringGrid1.RowCount:=DebugForm.lbHOSTIP.Items.count+1;
          Index:=DebugForm.lbHOSTIP.Items.count-1;
          StringGrid1.Row:=DebugForm.lbHOSTIP.Items.count;
          Debug:=StringGrid1.row;
          StringGrid1.Cells[0,Stringgrid1.row]:=DebugForm.lbhostIP.items[Index];
          StringGrid1.Cells[1,StringGrid1.row]:=DebugForm.lbHostname.items[Index];
          StringGrid1.Cells[2,StringGrid1.row]:=DebugForm.lbhostalias.items[Index];
          StringGrid1.Cells[3,StringGrid1.row]:=DebugForm.lbhostcomment.items[Index];
          StringGrid1.col:=0;StringGrid1.col:=1;StringGrid1.Col:=2;StringGrid1.col:=3;
      End;
     HostListWizard.Destroy;
End;

{ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
 บ                                                                          บ
 บ                                                                          บ
 บ                                                                          บ
 บ     This Section : TForm1.OnCreate                                       บ
 บ                                                                          บ
 ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ}


Procedure TForm1.Form1OnCreate (Sender: TObject);
VAr Loop:Byte;
Begin
     CheckProgramIniFIle;

     // Create Alias IP Stringlist REC
     For Loop:=0 to 7 do
     Begin
          AliasRec.AliasIP[loop]:=TStringList.Create;
          AliasRec.AliasSubnet[loop]:=TStringList.Create;
     End;

    For Loop:=0 to MaxFTPDReadWriteDirs do
    Begin
          FTPServerRec[Loop].ReadDir:=TStringList.Create;
          FTPServerRec[Loop].WriteDir:=TStringList.Create;
    End;

      BMP1:=TBitmap.Create;
      BMP2:=TBitmap.Create;
      BMP3:=TBitmap.Create;
      BMP_IFNew:=TBitmap.Create;
      ICON1.Create;
      ICON2.Create;
      Ico_Warning.Create;
      Ico_HomeIP.Create;
      ICO_IP.Create;
      ICO_Subnet.Create;
      ICO_DHCP.Create;
      ICO_System.Create;
      ICO_RouteNet.Create;
      ICO_RouteHost.Create;
      ICO_RouteDefault.Create;

      BMP1.LoadFromResourceName('IF_OK');
      BMP2.LoadFromResourceName('IF_ERROR');
      BMP_IFNew.LoadFromResourceName('IF_NEW');
      ICON1.LoadFromResourceName('ICO_SERVER');
      ICON2.LoadFromResourceName('ICO_PRINTER');
      ICO_Warning.LoadFromResourceName('ICO_Warning');
      ICO_HomeIP.LoadFromResourceName('HomeIP');
      ICO_IP.LoadFromResourceName('IPWorld');
      ICO_Subnet.LoadFromResourceName('Subnet');
      ICO_DHCP.LoadFromResourceName('DHCP');
      ICO_System.LoadFromResourceName('System');
      ICO_RouteNet.LoadFromResourceName('Phone');
      ICO_RouteDefault.LoadFromResourceName('Default');
      ICO_RouteHost.LoadFromResourceName('Computer');


      DebugForm.Create(NIL);

      FormFinalNote.Create(Nil);

      DeleteOs2IniKey;    // Delete the OLD Regitsry Keys
      QueryInterfaceAndRoutings;         // Scan aviable Interfaces

      //OpenProgIniFile;   // Opens the Program Ini File

      //CheckProgramIniFile;

      StartUpCheck;     // Check if the needed programs are aviable

      InitVars;        // Reset global Variables

      //NLSIni.Create(PathRec.BootPath+PathRec.LanguageFile);
      NLSIni.Create(Application.ProgramIniFile.ReadString('Settings','NLS_FILENAME',''));

      ProcessParamString;     // check for parameter

      IF Application.ProgramIniFile.ReadBOOL('Settings','SPLASH_SCREEN',TRUE) Then
       Begin
            SplashScreenForm.Create(Self);
            SplashScreenForm.Show;
       End;

       //FTPDCHeck; // check if FTPD.EXE contains EA Data
End;



      Procedure TForm1.AssignIcons;
      Begin
                   IF Application.ProgramIniFile.ReadInteger('Settings','CONFIG_LEVEL',0)=1 Then
                   Begin
                   Image4.Bitmap:=Icon1;
                   Image5.Bitmap:=Icon1;
                   Image3.Bitmap:=Icon2;
                   Img_printserver.Bitmap:=ICO_Warning;
                   img_printer.Bitmap:=ICO_Warning;
                   End;
                   ImageLocalDOmain.Bitmap:=ICO_System;
                   ImageHostName.Bitmap:=ICO_System;
                   IMG_ActiveLocalHostname.Bitmap:=ICO_Warning;
      End;

      Procedure TForm1.CheckEnvironmentVariables;
      Begin
                IF GetEnvFromConfigSys('HOSTNAME')<>GetEnv('HOSTNAME') Then Begin Img_ActiveLocalHostname.Visible:=TRUE;labActiveLocalHostname.Visible:=True;End
                                                                       else Begin Img_ActiveLocalHostname.Visible:=FALSE;labActiveLocalHostname.Visible:=FALSE;End;
      End;

 Procedure TForm1.LanguageSettings;
 VAR S:STring;Dummy:Byte;


      Procedure Tab_Interface;
      Begin
           {TAB 0 - Interface}
           S:='TAB-Interface';
           //Header Control
           HeaderControl_Interface.Sections.Items[0].Text:=GetNlsString(S,'Header_Number');
           HeaderControl_Interface.Sections.Items[1].Text:=GetNlsString(S,'Header_IP');
           HeaderControl_Interface.Sections.Items[2].Text:=GetNlsString(S,'Header_Subnet');
             // GroupBoxes
             GroupBoxStatus.Caption:=getNlsString(S,'GroupBoxStatus');
             // Buttons
             ButtonIPAdressAdd.Caption    :=GetNLSString(S,'Button_Add');
             ButtonIPAdressAdd.Hint       :=GetNlsString(S,'Button_Add_Info');
             ButtonIPAdressEdit.Caption   :=GetNlsString(S,'Button_Edit');
             ButtonIPAdressEdit.Hint      :=GetNlsString(S,'Button_Edit_Info');
             ButtonIPAdressDelete.Caption:=GetNlsString(S,'Button_Delete');
             ButtonIPAdressDelete.Hint   :=GetNlsString(S,'Button_Delete_Info');
             LabelInfo1.Caption           :=GetNLsString(S,'Interface_Default');
             LabelInfo2.Caption           :='';
      End;

      Procedure TAB_DNS;
      Begin
           { TAB 1 - DNS }
             S:='TAB-DNS';
             // GroupBoxes
             GroupBoxDNS              .Caption:=GetNlsString(S,'GroupBoxDNS');
             GroupBoxDomainSearchList .Caption:=GetNLSString(S,'GroupBoxDomainSearchList');
             GroupBoxLocalDomain      .Caption:=GetNlsString(S,'GroupBoxLocalDomain');
             GroupBoxHostname         .Caption:=GetNlsString(S,'GroupBoxHostname');
             // Labels
             labOptional1             .Caption:=GetNlsString(S,'labOptional1');
             labOptional2             .Caption:=GetNlsString(S,'labOptional2');
             labActiveLocalHostname   .Caption:=GetNlsString(S,'labActiveLocalHostname');
        //   Buttons
             ButtonDNSAdd             .Caption:=GetNlsString(S,'ButtonAdd');
             ButtonDNSEdit            .Caption:=GetNlsString(S,'ButtonEdit');
             ButtonDNSDelete          .Caption:=GetNlsString(S,'ButtonDelete');
             ButtonLanDomainAdd       .Caption:=GetNlsString(S,'ButtonAdd');
             ButtonLanDomainEdit      .Caption:=GetNlsString(S,'ButtonEdit');
             ButtonLanDomainDelete    .Caption:=GetNlsString(S,'ButtonDelete');
      End;

      Procedure TAB_Routings;
      Begin
            {TAB 3 - Routing}
             S:='TAB-Routing';
             //Buttons
             ButtonRouteAdd          .Caption:=GetNlsString(S,'ButtonAdd');
             ButtonRouteEdit         .Caption:=GetNlsString(S,'ButtonEdit');
             ButtonRouteDelete       .Caption:=GetNlsString(S,'ButtonDelete');
             //Header in MultiColumnListbox
             lbRoutings.Sections.items[0].Text:=GetNlsString(S,'Header_Caption#0');
             lbRoutings.Sections.items[1].Text:=GetNlsString(S,'Header_Caption#1');
             lbRoutings.Sections.items[2].Text:=GetNlsString(S,'Header_Caption#2');
             lbRoutings.Sections.items[3].Text:=GetNlsString(S,'Header_Caption#3');
             lbRoutings.Sections.items[4].Text:=GetNlsString(S,'Header_Caption#4');
             lbRoutings.Sections.items[5].Text:=GetNlsString(S,'Header_Caption#5');
             // Labels
             LabelRouteButtonAdd      .Caption:=GetNlsString(S,'LabelAdd');
             LabelRouteButtonEdit     .Caption:=GetNlsString(S,'LabelEdit');
             LabelRouteButtonDelete   .Caption:=GetNlsString(S,'LabelDelete');
      End;

      Procedure TAB_Information;
      Begin
           {TAB 9 - Information}
             S:='TAB-Information';
             //Labels
             LabelAmountTCPIP.Caption  :=ToStr(QueryAmountInterfaces);
             //LabelDLLVersion.Caption   :=TOStr(DLLVersion);

             LabelAmountTCPIPProtocols.Caption:=GetNlsString(S,'labAmountProtocols');
             labelCurrentIPAdress     .Caption:=GetNlsString(S,'labCurrentIP');
             SplashInc(SPlashIndex);
      End;

      {Global Language Settings}
      Begin
           S:='TCPConfig';
           Caption                  :=GetNLSString(S,'Caption');
           OKButton.Caption         :=GetNlsString(S,'Button_OK');
           CancelButton.Caption     :=GetNlsString(S,'Button_Cancel');
           ButtonHelp.Caption       :=GetNLSString(S,'Button_Help');


      IF Application.ProgramIniFile.ReadInteger('Settings','CONFIG_LEVEL',1)=1 Then
      begin
           // Language Settings for the Tabs
           TabbedNotebook1.Pages[0]:=GetNlsString(S,'TAB_Interface');
           TabbedNotebook1.Pages[1]:=GetNlsString(S,'TAB_DNS');
           TabbedNotebook1.Pages[2]:=GetNlsString(S,'TAB_Hostlist');
           TabbedNotebook1.Pages[3]:=GetNlsString(S,'TAB_Gateway');
           TabbedNotebook1.Pages[4]:=GetNlsString(S,'TAB_Socks');
           TabbedNotebook1.Pages[5]:=GetNlsString(S,'TAB_Printer');
           TabbedNotebook1.Pages[6]:=GetNlsString(S,'TAB_NFS');
           TabbedNotebook1.Pages[7]:=GetNlsString(S,'TAB_USER');
           TabbedNotebook1.Pages[8]:=GetNlsString(S,'TAB_Autostart');
           TabbedNotebook1.Pages[9]:=GetNlsString(S,'TAB_Info');

               TAB_Interface;
               SplashInc(SPlashIndex);
               Tab_DNS;
               SplashInc(SPlashIndex);

             {TAB 2 - Hostliste}
             S:='TAB-Hostlist';
             //Buttons
             ButtonHostAdd           .Caption:=GetNlsString(S,'ButtonAdd');
             ButtonHostEdit          .Caption:=GetNlsString(S,'ButtonEdit');
             ButtonHostDelete        .Caption:=GetNlsString(S,'ButtonDelete');
             // GroupBoxes
             GroupBoxHostListOption  .Caption:=GetNlsString(S,'GroupBoxOptions');
             // Labels
             LabelHostlistInfo       .Caption:=GetNlsString(S,'LabelHostlistInfo');
             //checkboxes
             cbUseHostlistFirst      .Caption:=GetNlsString(S,'CHeckBoxHostList');
             // Stringgrids
             StringGrid1.cells[0,0]:=GetNlsString('TAB-HostList','Header_Caption#0');
             StringGrid1.cells[1,0]:=GetNlsString('TAB-HostList','Header_Caption#1');
             StringGrid1.cells[2,0]:=GetNlsString('TAB-HostList','Header_Caption#2');
             StringGrid1.cells[3,0]:=GetNlsString('TAB-HostList','Header_Caption#3');
             SplashInc(SPlashIndex);

             {TAB 3 - Routings}
             TAB_Routings;
             {TAB 4 - Socks}
             SplashInc(SPlashIndex);
             /*
             Socks Language Settings in SocksNotebook.onSetupShow
             */
             {TAB 5 - Printer}
             S:='TAB-Printer';
             // GroupBox
             GroupBoxPrintServer      .Caption:=GetNlsString(S,'PrintServer');
             GroupBoxPrinter          .Caption:=GetNlsString(S,'Printer');
             GroupBoxLPD              .Caption:=GetNlsString(S,'LPD');
             GroupBoxEnvNote          .Caption:=GetNlsString(S,'EnvNote');
             // Labels
             LabelEnvNote             .Caption:=GetNlsString(S,'Note');
             SplashInc(SPlashIndex);

             {TAB 6 - NFS}
             S:='TAB-NFS';
             //GroupBox
             GroupBoxNFS              .Caption:=GetNlsString(S,'Directory');
             NFS_hosts                .Caption:=GetNlsString(S,'Hostlist');
             // HeaderControl
             HeaderControlNFS.Sections[0].Text:=GetNlsString(S,'Header_Caption#0');
             HeaderControlNFS.Sections[1].Text:=GetNlsString(S,'Header_Caption#1');
             HeaderControlNFS.Sections[2].Text:=GetNlsString(S,'Header_Caption#2');
             //checkbox
             DuplicateCheckbox   .Caption:=GetNlsString(S,'PubEntry');
             // RadioBox
             NFS_Rights_Radio.Items[0]        :=GetNlsString(S,'RadioRightsItem#0');
             NFS_Rights_Radio.Items[1]        :=GetNlsString(S,'RadioRightsItem#1');
             NFS_Rights_Radio.Items[2]        :=GetNlsString(S,'RadioRightsItem#2');
             NFS_Rights_Radio.Items[3]        :=GetNlsString(S,'RadioRightsItem#3');
             //Buttons
             NFSAddButton         .Caption:=GetNlsString(S,'ButtonAdd');
             NFSEditButton        .Caption:=GetNlsString(S,'ButtonEdit');
             NFSDeleteButton      .Caption:=GetNlsString(S,'ButtonDelete');
             SplashInc(SPlashIndex);

             {Tab 7 - User}
             S:='TAB-User';
             // Header
             HeaderControlUSer.Sections[0].Text:=GetNlsString(S,'Header_Caption#0');
             HeaderControlUser.Sections[1].Text:=GetNlsString(S,'Header_Caption#1');
             //Buttons
             ButtonServicesUserAdd   .Caption:=GetNlsString(S,'ButtonAdd');
             ButtonServicesUSerEdit  .Caption:=GetNlsString(S,'ButtonEdit');
             ButtonServicesUserDelete.Caption:=GetNlsString(S,'ButtonDelete');
             ButtonConfigureFTPD     .Caption:=GetNlsString(S,'ButtonConfigure');
             // Labels
             labelServicesUserAdd    .Caption:=GetNlsString(S,'LabelInfoAdd');
             LabelServicesUserEdit   .Caption:=GetNlsString(S,'LabelInfoEdit');
             LabelServicesUserDelete .Caption:=GetNlsString(S,'LabelInfoDel');
             SplashInc(SPlashIndex);

             {Tab 8 - Autostart}
                    /*
                    Autostart Language Settings in TCPAutostartNotebookOnSetupShow
                    */
             {TAB9-Information}
             TAB_Information;
        End;

       {Main Menu}
       S:='MainMenu';
       MenuItem1.Caption:=GetNLSString(S,'Entry#0');
       MenuItemProgramSettings.Caption:=GetNLSString(S,'Entry#1');
       MenuItemOptionalSettings.Caption:=GetNLSString(S,'Entry#2');
       SplashInc(SPlashIndex);

     IF Application.ProgramIniFile.Readinteger('Settings','CONFIG_LEVEL',0)=0  Then
     Begin
           IF TabbedNotebook1.Pages.count>4 Then
           Begin
                TabbedNotebook1.Pages.Delete(2);       // Delete Hostlist Tab
                TabbedNotebook1.Pages.Delete(3);       // Delete Socks Tab
                TabbedNotebook1.Pages.Delete(3);       // Delete Printer Tab
                TabbedNotebook1.Pages.Delete(3);       // Delete NFS Tab
                TabbedNotebook1.Pages.Delete(3);       // Delete User Tab
                TabbedNotebook1.Pages.Delete(3);       // Delete Autostart Tab
           End;

           // Language Settings for the Tabs
           S:='TCPConfig';
           TabbedNotebook1.Pages[0]:=GetNlsString(S,'TAB_Interface');
           TabbedNotebook1.Pages[1]:=GetNlsString(S,'TAB_DNS');
           TabbedNotebook1.Pages[2]:=GetNlsString(S,'TAB_Gateway');
           TabbedNotebook1.Pages[3]:=GetNlsString(S,'TAB_Info');
           TAB_Interface;
           TAB_DNS;
           TAB_Routings;
           TAB_Information;

     End;


     StartupComplete:=True;

     End;

  Procedure TForm1.InitVars;
  {For the very first time reset some variables to default values}
  Begin
       TabbedNotebook1.PageIndex:=0;            // Set Pageindex of Main Notebook to Page 0
       TCPAutostartNotebook.PageIndex:=0;       // Set Autostart Notebook to Page 0
       DynDNS:=FALSE;
       ChangeRec.LanInterface:=False;
       ChangeRec.Routing:=False;
       ChangeRec.Loopback:=False;
       ChangeRec.Hosts:=False;
       ChangeRec.ConfigSys:=FALSE;
       ChangeRec.Reboot:=False;
       ChangeRec.EnvChanged:=FALSE;
       ChangeRec.Autostart:=FALSE;
       ChangeRec.IFAliasError:=FALSE;
       ChangeRec.NFS:=FALSE;
       ChangeRec.CLearAll:=FALSE;
  End;

  Procedure TForm1.StartUpCheck;
  {Check for needed Programs as well as correct DLL Version}
  VAR Dummy:String;
  Begin
       // Check DLL Version
       //IF PROG_DLLVersion<>DLLVersion Then Begin MyErrorBox('The Version of TCPLIB.DLL ('+ToStr(DLLVersion) +') is not valid for this program.'+#13+'You need Version '+ToStr(Prog_DLLVersion));Halt;End;

       // Check for IFCONFIG.EXE
       //IF not FileExists (ProgramSettings.editBinText+'\IFConfig.EXE') Then
       IF not FileExists (Application.ProgramIniFile.ReadString('Settings','MPTN_BIN_PATH','')+'\IFCONFIG.EXE') Then
      Begin
           ErrorBox('The OS/2 / eCS interface setup program "IFCONFIG.EXE" is missing, be sure to have them in the \MPTN\BIN directory');
           Halt;
      ENd;

      // check if FTPD.EXE exists
  End;

  Procedure TForm1.FTPDCHeck;
  VAR Dummy:String;
  Begin
         IF FileExists(Application.ProgramIniFile.ReadString('Settings','TCPIP_BIN_PATH','')+'\FTPD.EXE') Then
      Begin
           // check if EA is already setuped
           IF GetFileEaData(Application.ProgramIniFile.ReadString('Settings','TCPIP_BIN_PATH','')+'\FTPD.EXE',FALSE,DUMMY) <>'IBM FTPD' Then
           Begin
                // NO EA Data, check if FTPD.EXE is IBM FTPD.EXE
           {     IF IsFtpdIBM Then}
                   Begin
                        // FTPD.EXE is IBM FTP Server, write new EA DATA
                        WriteFileEaData(Application.ProgramIniFile.ReadString('Settings','TCPIP_BIN_PATH','')+'\FTPD.EXE','IBM FTPD')
                   End;
           End;
      End;
  End;

  Procedure TForm1.ProcessParamString;
  {This will process the Parameter Strings}
  Begin

      IF ParamSTR(1)='\DEBUG' Then DebugButton.visible:=TRUE;
      IF ParamStr(1)='\TEST' then DebugLog:=True;IF ParamStr(2)='\TEST' Then DebugLog:=TRUE;

       IF paramstr(1)='IPCONFIG' Then
      Begin
           ExecuteForm.Create;
           ExecuteForm.Execute;
           ExecuteForm.Destroy;
           Halt;
      End;

      IF ParamStr(1)='\PROFILE' Then
      Begin
           IF Paramcount=1 Then begin MyInfoBox('Missing parameter for \PROFILE'+#13+'Syntax : TCPCOFNIG \PROFILE <ProfileName>');Halt;ENd;
           ProfileManager.Create(Self);
           ProfileManager.Execute;
           ProfileManager.Destroy;

           If ChangeRec.IFAliasError Then
           Begin
                FormFinalNote.Create(Self);
                FormFinalNote.ShowModal;
                FormFinalNote.Destroy;
           End;
           Halt;
      End;

  End;

  Procedure TForm1.DisplaySplashScreen;
  VAR Dummy:Byte;
  Begin
     For Dummy:=0 to Application.ProgramIniFile.ReadInteger('Settings','SPLASH_SCREEN_WAITTIME',45) do
     Begin
           SplashInc(SPlashIndex);
           //DosSleep(ProgramSettings.LogoDelayTime);
           Delay(Application.ProgramIniFile.ReadInteger('Settings','SPLASH_SCREEN_DELAYTIME',30));
     End;
  End;

  {23.10.2006
             Unterteilung des Programmstart in mehere Prozeduren
             * Neue Prozedure - Language Settings
             * Neue Prozedure - Process ParamString
             * Neue Prozedure - IniVars
             * Neue Procedure - AssignIcons

   24.10.2006 - Programm Neustart nach erfolgreicher Wiederherstellung einer Aufzeichnung.
   25.10.2006 - Einbau des neuen Profile paramaters.
   25.10.2006 - Acess Violation bei erneuren tabbedNotebook1.onsetupshow behobwn , wenn config level 0 (easy) eingestellt ist
   , es wurde versucht auf Form Eintrge zuzugreifen die im config modus 0 bereits gelscht wurden, und daher nicht vorhanden sind.
   28.10.2006 Start des Umbaus des INI Files auf TAppliction.ProgramIni
   29.10.2006 * Neue Procedure - DisplaySplashScreen
   29.10.2006  Fehler behoben wenn Sprache in Einstellungen Gendert wurde, aber splash screen aktiviert war wurde das Programm fr die
              dauer des Splash Screen angehlaten, obwohl dieser nicht Sichtbar war.
   04.11.2006 Umbau INI Files abgeschlossen.
   21.11.2006 Einbau von EA (Erweiterten Attributen) fr Abfrage des FTPD Servers
   10.12.2006 Korrekter StartAllServers, verwendung von NewQueryProcess anstatt QueryProcess (wurde aus DLL entfernt)
   20.01.2007 nderung in "DisplayInterfaces" Abfrage fr DHCP gendert, sowie Wort "(DHCP)" hinter IP Adresse anziegen wenn DHCP festgestellt wurde
}
  Initialization
  SplashIndex:=0;StartupComplete:=FALSE;
  RegisterClasses ([TForm1, TTabbedNotebook, TListBox, TLabel,TButton, THeaderControl, TGroupBox, TEdit, TCheckBox, TRadioGroup,
    TImage, TMainMenu, TMenuItem, TBitmapListBox, TBevel,TSpinEdit, TStringGrid, TTCP, TRadioButton, TNoteBook
   , TBitBtn, TPopupMenu, tMultiColumnList]);
End.
