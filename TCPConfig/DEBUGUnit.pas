Unit DEBUGUnit;

Interface

Uses
  Classes, Forms, Graphics, TabCtrls, Buttons, StdCtrls, Spin, ExtCtrls, Dialogs,TCP_inifiles;

Type
  TDebugform = Class (TForm)
      DebugFormx: TTabbedNotebook;
      OkButton: TBitBtn;
    ButtonClearAll: TBitBtn;
    Button4: TButton;
    RadioDHCP: TRadioButton;
    Label77: TLabel;
    LBIpSetupDHCP: TListBox;
    Label76: TLabel;
    lbServicesPasswordCrypted: TListBox;
    Label75: TLabel;
    EditHomeIP: TEdit;
    EditHomeSubnet: TEdit;
    Label51: TLabel;
    Label74: TLabel;
    Label23: TLabel;
    LabelDynDns: TLabel;
    GroupBox22: TGroupBox;
    RadioLan: TRadioButton;
    RadioRouting: TRadioButton;
    RadioLoopback: TRadioButton;
    RadioHosts: TRadioButton;
    RadioConfigSys: TRadioButton;
    RadioNFS: TRadioButton;
    GroupBox21: TGroupBox;
    Button3: TButton;
    ButtonTestAutostartHasChanged: TButton;
    AutostartMemo: TMemo;
    Button2: TButton;
    InetDRefreshButton: TButton;
    GroupBox19: TGroupBox;
    Memo2: TMemo;
    GroupBox20: TGroupBox;
    Memo3: TMemo;
    Button1: TButton;
    lbTest: TListBox;
    Label50: TLabel;
    SpinEdit1: TSpinEdit;
    ButtonRecTest1: TButton;
    SpinEditNetPrintFoundedEntrys: TSpinEdit;
    GroupBox18: TGroupBox;
    EditHostname: TEdit;
    lbDomainsSetup: TListBox;
    lbFilenotfound: TListBox;
    GroupBox17: TGroupBox;
    IFListbox: TListBox;
    Label49: TLabel;
    Edit1: TEdit;
    GroupBox16: TGroupBox;
    EditEnvUseHostsFirst: TEdit;
    Memo1: TMemo;
    DebugButtonSaveLog: TButton;
    SystemSaveDialog1: TSystemSaveDialog;
    Label72: TLabel;
    lbTestAliasSubnet: TListBox;
    Label73: TLabel;
    lbServicesFTPDreadDirectory: TListBox;
    Label57: TLabel;
    lbServicesFTPDcanRead: TListBox;
    Label67: TLabel;
    lbServicesFTPDwriteDirectory: TListBox;
    Label68: TLabel;
    lbServicesFTPDcanWrite: TListBox;
    Label69: TLabel;
    lbServicesFTPDLog: TListBox;
    Label70: TLabel;
    lbServicesFTPDidleTimeout: TListBox;
    Label71: TLabel;
    GroupBox13: TGroupBox;
    lbServicesFTP: TListBox;
    lbServicesTelnet: TListBox;
    Label59: TLabel;
    Label64: TLabel;
    lbServicesRex: TListBox;
    Label65: TLabel;
    lbServicesNFS: TListBox;
    Label66: TLabel;
    lbTelnetDisconnect: TListBox;
    Label55: TLabel;
    lbServicesHomeDir: TListBox;
    Label61: TLabel;
    Label62: TLabel;
    Label63: TLabel;
    lbServicesNFSUSerID: TListBox;
    lbServicesNFSGroupID: TListBox;
    lbServicesTelnetShell: TListBox;
    lbServicesTelnetParamter: TListBox;
    Label58: TLabel;
    lbServicesPassword: TListBox;
    Label60: TLabel;
    lbServicesUserName: TListBox;
    Label52: TLabel;
    lbServicesComments: TListBox;
    Label54: TLabel;
    GroupBox15: TGroupBox;
    GroupBox14: TGroupBox;
    Label56: TLabel;
    lbTestAlias: TListBox;
    SpinTestAlias: TSpinEdit;
    ButtonTestAlias: TButton;
    SpinIFConfigCounter: TSpinEdit;
    Label53: TLabel;
    Label44: TLabel;
    EditNFSCounter: TEdit;
    lbNFSStringlist: TListBox;
    Label45: TLabel;
    lbNFSPublicDir: TListBox;
    Label48: TLabel;
    lbMultiIP: TListBox;
    Label47: TLabel;
    lbNFSDirectory: TListBox;
    lbNFSAlias: TListBox;
    lbNFSComment: TListBox;
    lbNFSRights: TListBox;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label46: TLabel;
    SpinEditNetPrintMaxAmountLPD: TSpinEdit;
    LabelEnvPrintServer: TLabel;
    LabelEnvRemotePrintServer: TLabel;
    GroupBox12: TGroupBox;
    ListBoxNetPrinterOS2SYS: TListBox;
    Label37: TLabel;
    Label38: TLabel;
    editLPR_SERVER: TEdit;
    editLPR_PRINTER: TEdit;
    Label39: TLabel;
    Label40: TLabel;
    lbSOCKSServerpassword: TListBox;
    Label36: TLabel;
    lbSOCKSServerIP: TListBox;
    lbSOCKSServerTargetIP: TListBox;
    Label31: TLabel;
    Label32: TLabel;
    lbSOCKSServerSubnet: TListBox;
    Label33: TLabel;
    lbSOCSKSServerUserID: TListBox;
    Label34: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    lbSocksDirectTargetIP: TListBox;
    lbSocksDirectSubnet: TListBox;
    GroupBox6: TGroupBox;
    LBHostIP: TListBox;
    GroupBox7: TGroupBox;
    LBHostName: TListBox;
    GroupBox8: TGroupBox;
    LBHostAlias: TListBox;
    GroupBox9: TGroupBox;
    LBHostComment: TListBox;
    GroupBox10: TGroupBox;
    Label24: TLabel;
    EditSocksFlag: TEdit;
    Label25: TLabel;
    editSocksUser: TEdit;
    Label26: TLabel;
    EditSocksPassword: TEdit;
    GroupBox11: TGroupBox;
    Label27: TLabel;
    ListBoxSocksDomains: TListBox;
    ListBoxSocksDNS: TListBox;
    Label28: TLabel;
    Label35: TLabel;
    GroupBox1: TGroupBox;
    LBIpSetupIPAdress: TListBox;
    LBIpSetupSubnetmask: TListBox;
    LBIPSetupMetric: TListBox;
    LBIpSetupBroadcast: TListBox;
    LBIPSetupTargetAdress: TListBox;
    LBIPSetupMTU: TListBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    LBIPSetupLanNum: TListBox;
    label_lan1: TLabel;
    EditLocalDomain: TEdit;
    Label14: TLabel;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
    EditIPGate: TEdit;
    lbSpSettingsARP: TListBox;
    lbSpSettingsICMPRED: TListBox;
    lbSpSettingsSNAP: TListBox;
    lbSpSettings802: TListBox;
    lbSpSettingsCANONICAL: TListBox;
    BitBtn1: TBitBtn;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label15: TLabel;
    LBSpSettingsALLRS: TListBox;
    Label19: TLabel;
    lbSpSettingsBRIDGE: TListBox;
    Label20: TLabel;
    lbSpSettingsTRAILERS: TListBox;
    Label8: TLabel;
    LBIpSetupDHCPTime: TListBox;
    Label7: TLabel;
    EditLoopIP: TEdit;
    EditLoopSubnet: TEdit;
    lbDNSSetup: TListBox;
    GroupBox3: TGroupBox;
    GroupBox2: TGroupBox;
    LBRouteTargetAdress: TListBox;
    LBRouteGateway: TListBox;
    LBRouteSubnetmask: TListBox;
    LBRouteNetType: TListBox;
    LBRouteHopCount: TListBox;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Procedure Button4OnClick (Sender: TObject);
    Procedure ButtonClearAllOnClick (Sender: TObject);
    Procedure ButtonTestAutostartHasChangedOnClick (Sender: TObject);
    Procedure Memo3OnSetupShow (Sender: TObject);
    Procedure InetDRefreshButtonOnClick (Sender: TObject);
    Procedure Memo2OnSetupShow (Sender: TObject);
    Procedure ButtonRecTest1OnClick (Sender: TObject);
    Procedure SpinEdit1OnScan (Sender: TObject; Var KeyCode: TKeyCode);
    Procedure DebugButtonSaveLogOnClick (Sender: TObject);
    Procedure GroupBox16OnClick (Sender: TObject);
    Procedure Button1OnClick (Sender: TObject);
    Procedure DebugFormxOnSetupShow (Sender: TObject);
    Procedure Button2OnClick (Sender: TObject);
    Procedure DebugformOnSetupShow (Sender: TObject);
    Procedure lbNFSHostReadOnlyOnItemFocus (Sender: TObject; Index: LongInt);
    Procedure lbNFSCommentOnItemFocus (Sender: TObject; Index: LongInt);
    Procedure lbNFSAliasOnItemFocus (Sender: TObject; Index: LongInt);
    Procedure lbNFSDirectoryOnItemFocus (Sender: TObject; Index: LongInt);
    Procedure NFSListBoxSelect(Index:longint);
    Procedure ClearSetup;
    Private
      {Insert private declarations here}
    Public
      {Insert public declarations here}
      Procedure ClearAll;
  End;

Var
  Debugform: TDebugform;
Implementation
//USES TCPUtilityUnit;
USES TCP_VAR_Unit,Dialogs,TCP_AutoStart,TCP_AutoActivateCOnfig;


Procedure TDebugform.Button4OnClick (Sender: TObject);
VAR INI:TOS2UserIniFile;
Begin
     LBIpSetupDHCP.clear;
End;

Procedure TDebugform.ButtonClearAllOnClick (Sender: TObject);
Begin
     ClearAll;
End;

Procedure TDebugform.ButtonTestAutostartHasChangedOnClick (Sender: TObject);
Begin
    IF AutoStart.HasChanged Then ShowMessage('AutostartRec.HasChanged=TRUE (Eint�ge wurden ge�ndert)')
                               else ShowMessage('AutoStartRec.HasChanged=FALSE (Keine �nderungen vorgenommen)');
End;

Procedure TDebugform.Memo3OnSetupShow (Sender: TObject);
VAR L:Byte;
Begin
    Memo3.Clear;
    For L:=0 to AutoStartRec[0].Amount-1 do
     Begin
     IF AutostartRec[L].INetD then
     Begin
                        Memo3.Lines.add('INETD-Name : '+AutostartRec[L].ServName);
                        Memo3.Lines.add('InetD Protokoll : '+AutoStartRec[l].InetDProtName);
                        Memo3.Lines.add('--------------------------------');
                End;
                
        End;
End;

Procedure TDebugform.InetDRefreshButtonOnClick (Sender: TObject);
Begin
     Memo3.CLear;
     Memo3OnSetupShow(Self);
End;

Procedure TDebugform.Memo2OnSetupShow (Sender: TObject);
VAR L:Byte;
Begin
     Memo2.Clear;
     For L:=0 to AutoStartRec[0].Amount-1 do
        Begin
                Memo2.Lines.add('Eintrag Nummer : '+ToStr(L));
                Memo2.Lines.add('Name : '+AutostartRec[L].ServName);
                Memo2.Lines.Add('Param: '+AutostartRec[l].Parameter);
                Memo2.Lines.Add('PID : '+AutostartRec[l].PID);
                IF AutostartRec[l].Enabled Then Memo2.Lines.Add('Enabled : TRUE')
                                                     else Memo2.Lines.Add('Enabled : FALSE');

                IF AutostartRec[l].Foreground Then Memo2.Lines.Add('Vordergrund : TRUE')
                                                     else Memo2.Lines.Add('Vordergrund : FALSE');

                IF AutostartRec[l].Background Then Memo2.Lines.Add('Hintergrund : TRUE')
                                                        else Memo2.Lines.Add('Hintergrund : FALSE');

                IF AutostartRec[l].Symbol     Then Memo2.Lines.Add('Symbol      : TRUE')
                                                        else Memo2.Lines.Add('Symbol      : FALSE');

                IF AutostartRec[l].InetD      Then Memo2.Lines.Add('InetD       : TRUE')
                                                        else Memo2.Lines.Add('InetD       : FALSE');

                 IF AutostartRec[l].changed      Then Memo2.Lines.Add('changed     : TRUE')
                                                        else Memo2.Lines.Add('changed     : FALSE');

                Memo2.Lines.Add('---------------------------------------------');
        End;


End;


Procedure TDebugform.ButtonRecTest1OnClick (Sender: TObject);
Begin
  lbTest.items:=FtpServerRec[SpinEdit1.Value].ReadDir;
End;

Procedure TDebugform.SpinEdit1OnScan (Sender: TObject; Var KeyCode: TKeyCode);
Begin
   ShowMessage('!');
End;

Procedure TDebugform.ClearAll;
{Clears All Information in DebugForm}
VAR Loop:Byte;
Begin
     With DebugForm do
     Begin
          //Interface
          LBIPSetupLanNum.CLear;
          LBIpSetupIPAdress.Clear;
          LBIpSetupSubnetmask.Clear;
          LBIpSetupBroadcast.Clear;
          LBIPSetupMTU.Clear;
          LBIPSetupMetric.Clear;
          LBIPSetupTargetAdress.CLear;
          lbTestAlias.Clear;
          LBSpSettingsALLRS.Clear;
          lbSpSettingsARP.Clear;
          lbSpSettingsICMPRED.Clear;
          lbSpSettingsSNAP.Clear;
          lbSpSettingsBRIDGE.Clear;
          lbSpSettingsTRAILERS.Clear;
          lbTestAliasSubnet.Clear;
          lbSpSettings802.Clear;
          lbSpSettingsCANONICAL.Clear;
          LBIpSetupDHCPTime.Clear;
          LBIPSetupDHCP.Clear;
          EditLoopIP.Clear;
          EditLoopSubnet.Clear;
          // Routing Fields
          LBRouteTargetAdress.Clear;
          LBRouteGateway.Clear;
          LBRouteSubnetmask.Clear;
          LBRouteNetType.CLear;
          LBRouteHopCount.Clear;
          EditIPGate.Clear;
          // DNS Server
          lbDNSSetup.Clear;
          EditLocalDomain.Clear;
          //HomeIP
          EditHomeIP.Clear;
          EditHomeSubnet.Clear;
          // Hosts
          LBHostIP.Clear;
          LBHostName.Clear;
          lBHostAlias.Clear;
          LBHostComment.Clear;
          EditEnvUseHostsFirst.CLear;
          // Socks
          EditSocksFlag.CLear;
          editSocksUser.CLear;
          EditSocksPassword.Clear;
          ListBoxSocksDomains.CLear;
          ListBoxSocksDNS.CLear;
          lbSocksDirectTargetIP.Clear;
          lbSocksDirectSubnet.Clear;
          lbSOCKSServerIP.Clear;
          lbSOCKSServerTargetIP.Clear;
          lbSOCKSServerSubnet.Clear;
          lbSOCSKSServerUserID.Clear;
          lbSOCKSServerpassword.CLear;
          //Printer
          editLPR_SERVER.CLear;
          editLPR_PRINTER.CLear;
          //NFS
          lbNFSDirectory.Clear;
          lbNFSAlias.CLear;
          lbNFSComment.Clear;
          lbNFSRights.CLear;
          lbNFSPublicDir.Clear;
          EditNFSCounter.Clear;
          // Services
          lbServicesUserName.Clear;
          lbServicesComments.CLear;
          lbServicesPassword.CLear;
          lbServicesHomeDir.CLear;
          lbServicesFTP.CLear;
          lbServicesTelnet.CLear;
          lbServicesRex.CLear;
          lbServicesNFS.Clear;
          // Serice FTP
          lbServicesFTPDreadDirectory.Clear;
          lbServicesFTPDcanRead.Clear;
          lbServicesFTPDwriteDirectory.Clear;
          lbServicesFTPDcanWrite.Clear;
          lbServicesFTPDLog.Clear;
          lbServicesFTPDidleTimeout.CLear;
          lbTest.Clear;
           FOr Loop:=0 to MaxFTPDReadWriteDirs do
           Begin
                TRY
                FTPServerRec[loop].ReadDir.Clear;
                Except Raise EInvalidCast.Create('Procedure "ClearAll" verusachte Schiutzverlzung'+#13+'Zugriff auf FTPServerRec['+ToStr(loop)+'] nicht erlaubt !');Halt;
                End;
                TRY
                FTPServerRec[loop].WriteDir.Clear;
                Except Raise EInvalidCast.Create('Procedure "ClearAll" verusachte Schiutzverlzung'+#13+'Zugriff auf FTPServerRec['+ToStr(loop)+'] nicht erlaubt !');Halt;
                End;
           End;

           lbServicesTelnetShell.Clear;
           lbServicesTelnetParamter.CLear;
           lbTelnetDisconnect.CLear;
           lbServicesNFSUSerID.CLear;
           lbServicesNFSGroupID.Clear;

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

     End;
End;

Procedure TDebugform.CLearSetup;
{
Added 14.08.2005 for profile functions
Clears the Debug Listboxes to avoid storing informations a 2nd time
This would happen if a profil is loaded
}
Begin
     With DebugForm do
     Begin
          LBIPSetupLanNum.Clear;
          LBIpSetupIPAdress.Clear;
          LBIpSetupSubnetmask.Clear;
          LBIpSetupBroadcast.Clear;
          LBIPSetupMTU.Clear;
          LBIPSetupMetric.Clear;
          LBIPSetupTargetAdress.CLear;
          lbTestAlias.Clear;
          LBSpSettingsALLRS.Clear;
          lbSpSettingsARP.Clear;
          lbSpSettingsICMPRED.Clear;
          lbSpSettingsSNAP.Clear;
          lbSpSettingsBRIDGE.Clear;
          lbSpSettingsTRAILERS.Clear;
          lbTestAliasSubnet.Clear;
          lbSpSettings802.Clear;
          lbSpSettingsCANONICAL.Clear;
          LBIpSetupDHCPTime.Clear;
          LBIPSetupDHCP.Clear;
          EditLoopIP.Clear;
          EditLoopSubnet.Clear;
          // Routing Fields
          LBRouteTargetAdress.Clear;
          LBRouteGateway.Clear;
          LBRouteSubnetmask.Clear;
          LBRouteNetType.CLear;
          LBRouteHopCount.Clear;
          EditIPGate.Clear;
          // DNS Server
          lbDNSSetup.Clear;
          EditLocalDomain.Clear;
          //HomeIP
          EditHomeIP.Clear;
          EditHomeSubnet.Clear;
     End;
End;
Procedure TDebugform.DebugButtonSaveLogOnClick (Sender: TObject);
Begin
    SystemSaveDialog1.FileName:='DEBUG.TXT';
    IF SystemSaveDialog1.Execute Then Memo1.lines.saveToFile(SysTemSaveDialog1.FileName);
End;

Procedure TDebugform.GroupBox16OnClick (Sender: TObject);
Begin

End;

Procedure TDebugform.Button1OnClick (Sender: TObject);
Begin
     lbTestAlias.items.clear;
     lbTestAliasSubnet.items.clear;

     lbTestAlias.items:=AliasRec.AliasIP[SpinTestAlias.Value];
     lbTestAliasSubnet.items:=AliasRec.AliasSubnet[SpinTestAlias.Value];
End;

Procedure TDebugform.DebugFormxOnSetupShow (Sender: TObject);
Begin
     SpinIfConfigCounter.Value:=IFConfigCounter;
     Edit1.Text:=Application.ProgramIniFIle.ReadString('Settings','CONFIG_LEVEL','');
     RadioLan.Checked:=ChangeRec.LanInterface;
     RadioRouting.checked:=ChangeRec.Routing;
     RadioLoopback.checked:=ChangeRec.Loopback;
     RadioHosts.Checked:=ChangeRec.Hosts;
     RadioNFS.Checked:=ChangeRec.NFS;
     RadioConfigSys.Checked:=ChangeRec.ConfigSys;
     RadioDHCP.Checked:=ChangeRec.DHCP;

     IF DYNDNS Then LabelDynDNS.Caption:='TRUE' else LabelDynDNS.Caption:='FALSE';
End;

Procedure TDebugform.Button2OnClick (Sender: TObject);
Begin
End;


Procedure TDebugform.DebugformOnSetupShow (Sender: TObject);
Begin
     EditNFSCOunter.text:=ToStr(NFSCounter);
     EditHomeIP.Text:=AliasRec.HomeIP;
     EditHomeSubnet.Text:=AliasRec.HomeSubnet;
End;

Procedure TDebugform.lbNFSHostReadOnlyOnItemFocus (Sender: TObject;
  Index: LongInt);
VAR EntryNum:longint;
Begin
   {  EntryNum:=ToInt(Copy(lbNFSHostReadOnly.items[index],1,2));
     NFSListBoxSelect(EntryNum);}
End;

Procedure TDebugform.NFSListBoxSelect(Index:longint);
Begin
    lbNFSAlias.selected[Index]:=TRUE;
    lbNFSDirectory.selected[Index]:=TRUE;
    lbNFSComment.selected[Index]:=TRUE;
    lbNFSRights.selected[Index]:=TRUE;
    lbNFSPublicDir.selected[Index]:=true;
{    lbNFSStringlist.Clear;
    lbnfsStringlist.items:=NFSHostListArray[Index];}
End;
Procedure TDebugform.lbNFSCommentOnItemFocus (Sender: TObject; Index: LongInt);
Begin
        NFSListBoxSelect(Index);
End;

Procedure TDebugform.lbNFSAliasOnItemFocus (Sender: TObject; Index: LongInt);
Begin
     NFSListBoxSelect(Index);
End;

Procedure TDebugform.lbNFSDirectoryOnItemFocus (Sender: TObject;
  Index: LongInt);
Begin
     NFSListBoxSelect(Index);
End;



Initialization
  RegisterClasses ([TDebugform, TTabbedNotebook, TBitBtn, TGroupBox, TListBox,
    TLabel, TEdit, TSpinEdit, TButton
   , TMemo, TSystemSaveDialog, TRadioButton]);
End.
