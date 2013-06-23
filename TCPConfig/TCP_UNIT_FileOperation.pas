{浜様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様融
 �                                                                          �
 �     TCP_Unit_Fileoperation                                               �
 �                                                                          �
 �     Version ? creates sometimes 2003 - last changed 15.11.2005           �
 �                                                                          �
 藩様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様夕}

Unit TCP_UNIT_FileOperation;

Interface
         // Procedure ReadInterfaceHelpFile; REM Out of order
         Procedure SaveUseHostsFirst(Status:boolean);
         Procedure SaveDNS(param:Byte);
         Procedure SaveEntrys;
         //Function ReadSettings:Boolean;
         Function TCPFileOpen(param:byte):Boolean;
         Procedure ReadDNS;
         Procedure SaveHostList(Param:byte);
         Procedure SaveHostName;
         Procedure ReadHosts;
         Procedure ReadSocks_ENV;
         Procedure ReadSocks_CFG;
         Procedure SaveSocks_Env;
         Procedure SaveSocks_CFG;
         Procedure SaveNetWorkPrinter;
         //Procedure ReadNFS;
         Procedure SaveNFS;
         Procedure ReadServices;
         Procedure SaveServices;
         Procedure ExecuteSettings;
         Procedure CloseServer(ServerName:String);
         Procedure StartServer(ServerName,Param:String);
//         Function IsFtpdIBM:Boolean;
imports
Function Execute_TCPServer(Path:String):Longint; 'TCPLIB' NAME 'Execute_TCPServer';
Function DLLResultStr:String; 'TCPLIB' NAME 'DllReturnString';
end;
Implementation


USES DOS,BSEDOS,TCP_VAR_Unit,TCP_Unit_QueryEntrys,DEBUGUnit,MYMessageBox,Sysutils,TCPUtilityUnit,Dialogs,Classes,TCP_ExceptionUnit,TCP_IniFiles,TCP_LanguageUnit,TCP_ConfigSysAdd,TCP_StdIOError,ustring,FOrms,Sysutils;

VAR
   AUtoTXT:String;
   AutoExecFile:TAutoExecFile;

//
Imports
Function ExecDLL(aString:String;aString2:String):Longint; 'TCPLIB' NAME 'DLLExecutePrg';
End;


Procedure DosCopyError(ErrCode:Longword;FileName:String);
Var aString:String;
Begin
     case ErrCode of
       0:         Exit;
       2:         aString:='ERROR_FILE_NOT_FOUND';
       3:          aString:='ERROR_PATH_NOT_FOUND';
       5:         aString:='ERROR_ACCESS_DENIED';
       26:        aString:='ERROR_NOT_DOS_DISK';
       32:        aString:='ERROR_SHARING_VIOLATION';
       36:        aString:='ERROR_SHARING_BUFFER_EXCEEDED';
       87:        aString:='ERROR_INVALID_PARAMETER';
       108:       astring:='ERROR_DRIVE_LOCKED';
       112:       aString:='ERROR_DISK_FULL';
       206:       aString:='ERROR_FILENAME_EXCED_RANGE';
       267:       aString:='ERROR_DIRECTORY';
       282:       aString:='ERROR_EAS_NOT_SUPPORTED';
       283:       aString:='ERROR_NEED_EAS_FOUND';
     ENd;
     MyErrorBox(GetNLSString('ERRORS','CPY_BACKUP_FAILED')+#13+GetNLSString('ERRORS','CPY_FILENAME')+' '+Filename+' '+GetNLSString('ERRORS','CPY_ERRORMESSAGE')+' '+aString);

End;


Procedure ReadSocks_ENV;
Label Ausgang;
{changed 14.10.2006 :
  changed delete,1,13 to delete 1,14 to prevent space sign
  Added configStr<>'' to prevent adding space sign
  }
Begin
     {$I-}
          {flag (on/off) }
          Readln(ConfigFile,ConfigStr);
          IF EOF(ConfigFile) Then Begin DebugForm.EditSocksFlag.Text:='off';goto Ausgang;End;
          DebugForm.EditSocksFlag.Text:=COpy(ConfigStr,13,length(ConfigSTr));
          {user name}
          Readln(COnfigFile,ConfigStr);
          DebugForm.EditSocksUser.Text:=Copy(ConfigStr,13,length(ConfigStr));
          {Password}
          Readln(COnfigFile,ConfigStr);
          DebugForm.EditSocksPassword.Text:=Copy(ConfigStr,17,length(COnfigStr));
          {Domain}
          Readln(ConfigFile,ConfigStr);
          Delete(COnfigStr,1,14);
          IF ConfigStr<>'' Then MultiSocksString(ConfigStr,DebugForm.ListBoxSocksDomains.items,',');
          Readln(ConfigFile,ConfigStr);
          {DNS (Name Server)}
          Delete(COnfigStr,1,10);
          IF ConfigStr<>'' Then MultiSocksString(ConfigStr,DebugForm.ListBoxSocksDNS.items,',');
     Ausgang:
     Close(ConfigFile);
     {$I+}
End;

Procedure ReadSocks_CFG;
Begin
     {$I-}
          While not eof(COnfigFile) do
          begin
               Readln(ConfigFile,ConfigStr);
               QuerySocksDirect;
               QuerySocksServer;
          End;
          Close(ConfigFile);
     {$I+}
End;

Procedure SaveSocks_CFG;
VAr Loop:Byte;IOError:Longint;
Begin
DebugForm.Memo1.Lines.add('executing Procedure SaveSocks_CFG');
Assign(ConfigFile,GetEnv('ETC')+'\SOCKS.CFG');ReWrite(ConfigFile);IOError:=IoResult;
IF IoError<>0 Then Begin myErrorBox(GetNLSString('ERRORS','EXPCreateFailed'));Halt;End;

IF DebugLOG Then ShowMessage('Executing SaveSocks_CFG');

IF  DebugForm.lbSocksDirectTargetIP.items.count>0 Then
Begin
    TRY
       FOr Loop:=0 to DebugForm.lbSocksDirectTargetIP.items.count-1 do
       Begin
            TRY
            COnfigStr:='direct '+DebugForm.lbSocksDirectTargetIP.Items[loop]+' '+DebugForm.lbSocksDirectSubnet.items[loop];
            Except DIsplayException(180);
            End;
            Writeln(ConfigFile,ConfigStr);
            If DebugLog Then DebugForm.Memo1.Lines.add('saving SOCKS-DIRECT entry : '+configStr);
       End;
       Except DIsplayException(201);
       End;
  ENd else IF DebugLog Then DebugForm.memo1.lines.add('SOCKS direct listbox is empty, no items to save');

    IF DebugFOrm.lbSocksServerIP.items.count>0 Then
    Begin
         TRY
         For Loop:=0 to DebugForm.lbSOCKSServerIP.items.count-1 do
         Begin
            TRY
              ConfigStr:='sockd @='+DebugForm.lbSOCKSServerIP.items[loop]+' '+DebugForm.lbSOCKSServerTargetIP.items[loop]+' '+DebugForm.lbSOCKSServerSubnet.items[loop]+'  *='+
                                    DebugForm.lbSOCSKSServerUserID.items[loop]+'  *='+DebugForm.lbSOCKSServerpassword.items[loop];
              Except DisplayException(181);
              End;
              Writeln(ConfigFile,ConfigStr);
              IF DebugLog Then DebugForm.Memo1.lines.add('saving SOCKS Server entry : '+ConfigStr);
         End;
         Except DisplayException(202);
         End;
    End;
    CLose(ConfigFile);
    DebugForm.Memo1.lines.add('successfully done procedure SaveSocks_CFG');
End;


Procedure SaveSocks_ENV;
Label Weiter,ende;
VAR loop:Byte;IOError:Longint;
    debug:integer;

Begin
     {$I+}
     IF DebugLog Then DebugForm.Memo1.lines.add('executing Procedure SaveSocks_ENV');
     Assign(ConfigFile,GetEnv('ETC')+'\SOCKS.ENV');ReWrite(ConfigFile);IOError:=IoResult;
     IF IoError<>0 Then Begin myErrorBox(GetNlsString('ERRORS','SOCKSCFGFailedCreate'));Halt;End;
     TRY
     ConfigStr:='socks_flag  '+DebugFOrm.EditSocksFlag.Text;
     Except DisplayException(203);
     End;

     Writeln(ConfigFile,ConfigStr);
     TRY
     ConfigStr:='socks_user  '+DebugForm.EditSocksUser.Text;
     Except DisplayException(204);
     End;
     Writeln(ConfigFile,ConfigStr);
     TRY
          ConfigStr:='socks_password  '+DebugForm.EditSocksPassword.text;
          Writeln(COnfigFile,ConfigStr);
     Except DisplayException(205);
     End;

                        
     ConfigStr:='socks_domain  ';

     Debug:=DebugForm.ListBoxSocksDomains.items.count-1;
     TRY
     Case DebugForm.ListBoxSocksDomains.items.count-1 of
         -1:Begin Writeln(ConfigFile,COnfigStr);DebugForm.Memo1.lines.add('listbox socks_domain is empty');End;
          0:Begin
                 TRY
                 COnfigStr:=ConfigStr+DebugForm.ListBoxSocksDomains.items[0];
                 Except DIsplayException(181);
                 End;
                Writeln(ConfigFile,ConfigStr);
                DebugForm.Memo1.lines.add('saveing SOCKS domain #1: '+ConfigStr);
          End;
          1:Begin
                TRY
                COnfigStr:=ConfigStr+DebugForm.ListBoxSocksDomains.items[0];
                COnfigStr:=ConfigStr+', '+DebugForm.ListBoxSocksDomains.items[1];
                Except DisplayException(182);
                End;
                Writeln(ConfigFile,ConfigStr);
                DebugForm.Memo1.lines.add('saving SOCKS domain #1,#2: '+ConfigStr);
            End;
          2:Begin
                 TRY
                 COnfigStr:=ConfigStr+DebugForm.ListBoxSocksDomains.items[0];
                 COnfigStr:=ConfigStr+', '+DebugForm.ListBoxSocksDomains.items[1];
                 COnfigStr:=ConfigStr+', '+DebugForm.ListBoxSocksDomains.items[2];
                 Except DisplayException(183);
                 End;
                 Writeln(ConfigFile,ConfigStr);
                 DebugForm.Memo1.lines.add('saving SOCKS domain #1,#2,#3: '+ConfigStr);
            End;
     End;
     Except DisplayException(206);
     End;
     Weiter:
     ConfigStr:='socks_ns  ';
     TRY
     Case DebugForm.ListBoxSocksDNS.items.count-1 of
         -1:Begin Writeln(ConfigFile,ConfigStr);DebugForm.Memo1.lines.add('listbox SOCKS nameserver is empty');End;
          0:Begin
                 TRY
                 COnfigStr:=ConfigStr+DebugForm.ListBoxSocksDns.items[0];
                 Except DisplayException(184);
                 End;
                Writeln(ConfigFile,ConfigStr);
                DebugForm.Memo1.lines.add('saving SOCKS DNS #1: '+ConfigStr);
          End;
          1:Begin
                TRY
                COnfigStr:=ConfigStr+DebugForm.ListBoxSocksDns.items[0];
                COnfigStr:=ConfigStr+', '+DebugForm.ListBoxSocksDns.items[1];
                Except DisplayException(185);
                End;
                Writeln(ConfigFile,ConfigStr);
                DebugForm.Memo1.lines.add('saving SOCKS DNS #1,#2: '+ConfigStr);
            End;
          2:Begin
                 TRY
                 COnfigStr:=ConfigStr+DebugForm.ListBoxSocksDns.items[0];
                 COnfigStr:=ConfigStr+', '+DebugForm.ListBoxSocksDns.items[1];
                 COnfigStr:=ConfigStr+', '+DebugForm.ListBoxSocksDns.items[2];
                 Except DisplayException(235);
                 ENd;
                 Writeln(ConfigFile,ConfigStr);
                 DebugForm.Memo1.lines.add('saving SOCKS DNS #1,#2,#3: '+ConfigStr);
            End;
     End;
     Except DisplayException(207);
     End;
     Ende:


     Close(ConfigFIle);
     {$I+}
     DebugForm.Memo1.Lines.Add('successfully done procedure SaveSocks_ENV');
End;





Function TCPFileOpen(param:byte):Boolean;
Label Start;
VAR ErrorFile:String;FileName:String;IOError:Longint;
Begin
     {$I-}
     Case Param of
     //1: FileName:=ProgramSettings.EditBinText+'\SETUP.CMD';
     1:FIleName:=Application.ProgramIniFile.ReadString('Settings','MPTN_BIN_PATH','')+'\SETUP.CMD';
     2: FileName:=GetEnv('ETC')+'\RESOLV2';
     3: FileName:=getenv('ETC')+'\HOSTS';
     4: FileName:=GetEnv('ETC')+'\SOCKS.ENV';
     5: FileName:=GetEnv('ETC')+'\SOCKS.CFG';
     6: FileName:=GetEnv('ETC')+'\EXPORTS';
     7: FileName:=GetEnv('ETC')+'\TCPNBK.LST';
     8: FileName:=getEnv('ETC')+'\INETD.LST';
     //9: FileName:=ProgramSettings.TCPIPBINPath+'\tcpstart.CMD';
     9:FileName:=Application.ProgramIniFile.ReadString('Settings','TCPIP_BIN_PATH','')+'\TCPSTART.CMD';
     End;
     START:
     Assign(ConfigFile,FileName);
     ReSet(COnfigFile);IOError:=IoResult;
     {$i+}
     IF IoError=5 Then
     Begin
          Case MessageBox(FileName+' is locked by another application/program or has READ ONLY Attribute',mtInformation,[mbretry,mbcancel]) of
          mrretry:Begin Close(ConfigFIle);Goto start;End;
          mrCancel:Begin CLose(ConfigFile);Halt;End;
          End;
     End;
     IF IoError<>0 then
     Begin
          Result:=FALSE;
          //FormIOError.ListBox1.items.add(FileSplit(FileName,2)+'->'+SysErrorMessage(IOError));
          DebugForm.lbFilenotfound.items.add(FileSplit(FileName,2)+'->'+SysErrorMessage(IOError));
          Rewrite(ConfigFile);CLose(ConfigFile);
          Exit;
     End;
     Result:=TRUE;
     IF Param=3 Then Close(ConfigFile);
End;

Procedure ReadHosts2;
Begin
     {$I-}
     While not EOF(ConfigFile) do
     Begin
          Readln(COnfigFile,ConfigStr);
          IF ConfigStr<>'' Then
          Begin
               {Note : first line contains a empty string , seems IBM java prog makes a mistake here}
               QueryHOSTIP;
               QueryHOSTName;
               QueryHOSTAlias;
               QueryHostComment;
          End;


     End;
     {$I+}
Close(ConfigFile);
End;

Procedure ReadHosts;
Begin
     ReadHostFile;
End;


Procedure ReadDNS;
VAR loop:Byte;
{
Ge�ndert 10.10.2006
Routine f�gte leeren Eintrag hinzu
}

Begin
     {$I-}
     While not Eof(ConfigFile) do
     begin
          Readln(ConfigFIle,ConfigStr);IF IOResult<>0 Then Begin MyErrorBox(GetNLSString('ERRORS','ReadErr_Resolv2'));Break;End;
          IF copy(COnfigStr,1,10)='nameserver' then
          Begin
               IF GetIPAdressfromString(ConfigStr,12)<>'' Then DebugForm.lbDNSSetup.Items.add(GetIPAdressfromString(ConfigStr,12));
         End;
          IF Copy(ConfigStr,1,6)='domain' Then DebugForm.EditLocalDomain.Text:=Copy(ConfigStr,8,length(ConfigStr)-7);
          QueryDomains;
     End;
     Close(ConfigFIle);IF IoResult<>0 then MyErrorBox('!');
     {$I+}
     DebugForm.EditHostname.Text:=GetEnvFromConfigSys('HOSTNAME');
End;

Function OpenFileForWriting:Boolean;
Begin
End;



Procedure WriteAddionalSettings(loop:longint);
Begin
     If DebugForm.LBSpSettingsALLRS.items.count=0 Then exit;

     TRY
     IF DebugForm.LBSpSettingsALLRS.items[loop]='true' Then ConfigStr:=ConfigStr+' -allrs';
     Except DisplayException(210);
     End;


     TRY
     IF DebugForm.lbSpSettingsARP.items[loop]='true' then ConfigStr:=ConfigStr+' -arp';
     Except DisplayException(211);
     End;


     TRY
     IF DebugForm.lbSpSettingsICMPRED.items[loop]='true' then ConfigStr:=ConfigStr+' icmpred';
     Except DisplayException(212);
     End;

     TRY
     IF DebugForm.lbSpSettingsSNAP.items[loop]='true' then ConfigStr:=ConfigStr+' -snap';
     Except DisplayException(213);
     End;

     TRY
     if DebugForm.lbSpSettingsBRIDGE.items[loop]='true' then ConfigStr:=ConfigStr+' -bridge';
     Except DisplayException(214);
     End;

     TRY
     IF DebugForm.lbSpSettingsTRAILERS.items[loop]='true' then ConfigStr:=ConfigStr+' trailers';
     Except DisplayException(215);
     End;

     TRY
     IF DebugForm.lbSpSettings802.items[loop]='true' then configStr:=ConfigStr+' 802.3';
     Except DisplayException(216);
     End;

     TRY
     IF DebugForm.lbSpSettingsCANONICAL.items[loop]='true' then ConfigStr:=ConfigStr+' canonical';
     Except DisplayException(217);
     End;
End;

Procedure SaveEntrys;
VAR loop,IOError:longint;

          Procedure FirstEntrys;
          Begin
               IF DebugLog then DebugForm.Memo1.lines.add('executing SUB Procedure FirstEntrys');
               ConfigStr:='route -fh';Writeln(ConfigFile,ConfigStr);

               ConfigStr:='arp -f';Writeln(ConfigFile,ConfigStr);

               IF DebugLog Then DebugForm.Memo1.lines.add('successfuly done SUB procedure');
          End;

          Procedure WriteLoopback;
          Begin
               IF DebugLog Then DebugForm.Memo1.lines.add('executing SUB Procedure WriteLoopback');
               TRY
               ConfigStr:='ifconfig lo '+DebugForm.EditLoopIP.text;
               EXCEPT Begin ShowMessage('Exception - WriteLoopBack #1');Halt;End;
               End;


               Try
               IF DebugForm.EditLoopSubnet.Text<>'' then ConfigStr:=ConfigStr+' netmask '+DebugForm.EditLoopSubnet.Text;
               Except Begin ShowMessage('Exception - WriteLoopBack #4');Halt;End;
               End;

               Writeln(ConfigFile,ConfigStr);
               IF DebugLog then DebugForm.Memo1.Lines.add('successfully done SUB Procedure');
          End;

          Procedure WriteIPGate;
          Begin
               IF DebugLog then DebugForm.Memo1.lines.add('executing SUB Procedure WriteIpGate');

               ConfigStr:=DebugForm.EditIPGate.Text;
               Writeln(ConfigFile,ConfigStr);


               IF DebugLog Then DebugForm.memo1.lines.add('successfully done SUB procedure');
          End;

          Procedure WriteManualyIp;
          VAR T:String;
          Begin
               IF DebugLog then DebugForm.Memo1.lines.add('executing SUB Procedure WriteManualyIP');
               TRY
               ConfigStr:='ifconfig '+DebugForm.LBIPSetupLanNum.items[loop]+' '+DebugForm.LBIpSetupIPAdress.items[loop];
               Except DisplayException(150);
               End;

               TRY
               IF MyUpCaseStr(DebugForm.LBIPSetupTargetAdress.items[loop])<>'NIL' Then ConfigStr:=ConfigStr+' '+DebugForm.LBIPSetupTargetAdress.items[loop];
               Except DisplayException(151);
               End;

               TRY
               COnfigStr:=COnfigStr+' netmask '+DebugForm.LBIpSetupSubnetmask.items[loop];
               Except DisplayException(152);
               End;

               TRY
               IF MyUpCaseStr(DebugForm.LBIpSetupBroadcast.items[loop])<>'NIL' then COnfigStr:=ConfigStr+' broadcast '+DebugForm.LBIpSetupBroadcast.items[loop];
               Except DisplayException(153);
               End;

               TRY
               ConfigStr:=ConfigStr+' metric '+DebugForm.LBIPSetupMetric.items[loop]+' mtu '+DebugForm.LBIPSetupMTU.items[loop];
               Except DisplayException(154);
               End;

               TRY
               T:=DebugForm.LBIPSetupMTU.items[loop];
               Except DisplayException(155);
               End;

               WriteAddionalSettings(loop);

               IF DebugLog Then DebugForm.Memo1.lines.add('successfully done SUB Procedure');
          End;

          Procedure WriteDHCP;
          {USAGE: dhcpstrt [ -d maxwait] [-i lan<#>] }
          Begin
               IF DebugLog then DebugForm.Memo1.lines.add('executing Procedure WriteDHCP');
               IF DebugForm.LBIpSetupDHCPTime.items[loop]<>'Nil' Then ConfigStr:='dhcpstrt -d '+DebugForm.LBIpSetupDHCPTime.items[loop]+' -i '+DebugForm.LBIPSetupLanNum.items[loop]
                                                                 else ConfigStr:='dhcpstrt -i '+DebugForm.LBIPSetupLanNum.items[loop];

          IF DebugForm.LBIpSetupDHCPTime.items[loop]<>'Nil' Then
          Begin

               IF DebugLog Then DebugForm.Memo1.lines.add('successfully leaving Procedure');
          ENd;
         End;

          Procedure WriteDefaultType;
          Begin
               IF DebugLog Then DebugForm.Memo1.lines.add('executing Procedure WriteDefualtType');
               ConfigStr:='route add default '+DebugForm.LBRouteGateway.items[loop]+' -hopcount '+DebugForm.LBRouteHopCount.items[loop];


               IF DebugLOG Then DebugForm.Memo1.lines.add('successfully leaving Procedure');
          End;

          Procedure WriteNetType;
          VAR ListString:String;
          Begin
                IF DebugLog Then DebugForm.Memo1.lines.add('executing Procedure WriteNetType');


                ListString:='add -net '+DebugForm.LBRouteTargetAdress.items[loop]+' '+DebugForm.LBRouteGateway.items[loop];

                IF DebugForm.LBRouteSubnetmask.items[loop]<>'' Then ListString:=ListString+' -netmask '+DebugForm.LBRouteSubnetmask.items[loop];

                 ListString:=ListString+' -hopcount '+DebugForm.LBRouteHopCount.items[loop];

               ConfigStr:='route add -net '+DebugForm.LBRouteTargetAdress.items[loop]+' '+DebugForm.LBRouteGateway.items[loop];

               IF DebugForm.lbRouteSubnetmask.items[loop]<>'' then COnfigStr:=ConfigStr+' -netmask '+DebugForm.lbRouteSubnetmask.items[loop];

               ConfigStr:=ConfigStr+' -hopcount '+DebugForm.LBRouteHopCount.items[loop];
               IF DebugLOG Then DebugForm.Memo1.lines.add('successfully leaving Procedure');
          End;

          Procedure WriteHostType;
          Begin
                IF DebugLog Then DebugForm.Memo1.lines.add('executing Procedure WriteHostType');
               ConfigStr:='route add -host '+DebugForm.LBRouteTargetAdress.items[loop]+' '+DebugForm.LBRouteGateway.items[loop]+' -hopcount '+DebugForm.LBRouteHopCount.items[loop];
               IF DebugLOG Then DebugForm.Memo1.lines.add('successfully leaving Procedure');
          End;

          Procedure WriteAliasIPs;
          VAR StrArrayCounter:Byte;
          Begin
               //tstringlist
               IF DebugLog Then DebugForm.Memo1.lines.add('executing Procedure WriteAliasIP');
               TRY
               For StrArrayCounter:=0 to AliasRec.AliasIP[loop].count-1 do
               begin
                    TRY
                    ConfigStr:='ifconfig '+DebugForm.LBIPSetupLanNum.items[loop]+' alias '+AliasRec.AliasIP[loop].Strings[StrArrayCounter]+' netmask '+AliasRec.AliasSubnet[loop].Strings[StrArrayCounter];
                    Except DisplayException(170);
                    End;

                    Writeln(COnfigFile,ConfigStr);

               End;
              Except DisplayException(230);
              End;
              IF DebugLog Then DebugForm.Memo1.lines.add('successfully leaving Procedure');
          End;

VAR UIni:TOs2UserIniFile;

Begin
   IF DebugLog Then DebugForm.Memo1.lines.add('executing prcoedure saveentrys');
   COnfigStr:='';
   {$I-}
    Assign(ConfigFile,Application.ProgramINiFile.ReadString('Settings','MPTN_BIN_PATH','')+'\SETUP.CMD');

    ReWrite(ConfigFile);IoError:=IOResult;
    IF IOError<>0 Then Begin ErrorBox2('Error trying creating File : '+Application.ProgramINiFile.ReadString('Settings','MPTN_BIN_PATH','')+'\SETUP.CMD'+#13+'Fehlercode :'+ToStr(IOError)) ;exit;End;
    {$I-}
     IF DebugLog Then ShowMessage('execute Procedure firstEntrys');
     FirstEntrys;
     IF DebugLog Then ShowMessage('Procedure sucessfuly executed !');

     IF DebugLog then SHowMessage('execute Procedure WriteLoopBack');
     WriteLoopBack;
     IF DebugLog Then SHowMessage('Procedure successfuly executed !');

     IF DebugLog Then ShowMessage('Setting up LAN Interface');
     TRY
     For loop:=0 to DebugForm.LBIPSetupLanNum.items.count-1 do
     Begin
          TRY
          IF DebugForm.LBIpSetupDHCP.items[loop]='TRUE' Then WriteDHCP else WriteManualyIP;
          Except DisplayException(173);
          End;

          Writeln(COnfigFile,COnfigStr);

          TRY
          //IF  IPAliasListArray[loop].count>0 Then WriteAliasIPs;
          IF AliasRec.AliasIP[loop].count>0 Then WriteAliasIPs;
          Except DisplayException(174);
          End;
     End;
     Except DisplayException(208);
     End;
     IF DebugLog Then ShowMessage('LAN interface successfuly setuped');

     if DebugLog then ShowMessage('Setting up routing type');

     TRY
     For Loop:=0 to DebugForm.LBRouteNetType.items.count-1 do
     begin
          TRY
          IF DebugForm.LBRouteNetType.items[loop]='default' Then WriteDefaultType;
          Except DisplayException(175);
          End;

          TRY
          IF DebugForm.LBRouteNetType.items[loop]='net' Then WriteNetType;
          Except DisplayException(176);
          End;

          TRY
          IF DebugForm.LBRouteNetType.items[loop]='host' Then WriteHostType;
          Except DisplayException(177);
          End;

          Writeln(COnfigfile,configSTr);
     End;
     Except DisplayException(209);
     End;
     WriteIPGate;
     Close(ConfigFile);
     IF DebugLog Then
                     begin
                          ShowMessage('SETUP.CMD file successfuly written');
                          DebugForm.Memo1.lines.Add('successfully leaving procedure - SETUP.CMD successfully writen');
                     End;
   UIni.Create;
   Uini.WriteString('TCPConfig','HomeIP',AliasRec.HomeIP);
   Uini.WriteString('TCPConfig','HomeSubnet',AliasRec.HomeSubnet);
   end;

{浜様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様融
 �                                                                          �
 �     This Section : DNS Saving                                            �
 �                                                                          �
 �     Version 2 20.09.2005 - last modified 21.09.2005                      �
 �     modified for DOS TCPIP incl Autoeexec.bat settings 2006/11/01        �
 藩様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様夕}
Procedure SaveDNS;
VAR
   loop   :Byte;
   IOError:longint;
   DomainEntry     :String;
   Debug  :String;
   d1,d2  :String;
   Index  :LongInt;

      Procedure WriteEntrys;
      Begin

                IF DebugForm.lbDNSSetup.items.count>0 Then
                // Write Name Server - if setuped
                Begin
                     For loop:=0 to DebugForm.lbDNSSetup.items.count-1 do
                     begin
                     Try
                        Writeln(ConfigFile,'nameserver ',DebugForm.lbDNSSetup.items[loop]);
                        Except DisplayException(218);
                        End;

                     End;
                End;

                // Write search domains - Domain Entry 0
                TRY
                DomainEntry:='search '+DebugForm.lbDomainsSetup.items[0];
                Except Begin { No Domain on this entry } End;
                End;

                TRY
                DomainEntry:=DomainEntry+' '+DebugForm.lbDomainsSetup.items[1];
                Except Begin { No Domain on this entry } End;
                End;

                TRY
                DomainEntry:=DomainEntry+' '+DebugForm.lbDomainsSetup.items[2];
                Except Begin { No Domain on this entry } End;
                End;

                IF DebugForm.lbDomainsSetup.items.count<>0 Then Writeln(ConfigFile,DomainEntry);


                // Write Local Domain - IF Setuped
                IF DebugForm.EditLocalDomain.Text<>'' Then
                Begin
                     Writeln(CONFIGFile,'domain ',DebugForm.EditLocalDomain.Text);
                End;
      End;

Begin
      {$I-}
      Assign(ConfigFile,GetEnv('ETC')+'\RESOLV2');

        ReWrite(ConfigFile);IOError:=IOResult;

        IF IOResult<>0 Then Begin ErrorBox2('Unable to create RESOLV2 file !'+#13+SysErrorMessage(IOError));Halt;End;

       WriteEntrys;

      Close(COnfigFile);

      IF not Application.ProgramIniFile.ReadBool('Settings','DOS_WIN31_RESOLV',FALSE) Then exit;

      Debug:=GetTCPIPDosPath(Application.ProgramIniFIle.ReadString('Settings','TCPIP_BIN_PATH',''));

       IF FileExists(Debug) Then // check if the (usaly \TCPIP\DOS\ETC) exists
       Begin
            Assign(ConfigFile,Debug+'\RESOLV');

            ReWrite(ConfigFile);IOError:=IOResult;

        IF IOResult<>0 Then Begin ErrorBox2('Unable to create RESOLV file !'+#13+SysErrorMessage(IOError));Halt;End;

        IF DebugForm.EditLocalDomain.Text='' Then
        Begin
             DebugForm.EditLocalDomain.Text:='""'; // Note : unlike RESOLV2 file for OS/2 , DOS version MUST contain a domain entry (just any) - if not no name can be resolved over DNS
        End;
        WriteEntrys;

       CLose(COnfigFIle);
       IF FileExists(QueryBootDrive+':\AUTOEXEC.BAT') Then
          Begin
               D2:='SET ETC='+Uppercase(Debug);

                    AutoExecFile.Create;
                    Index:=AutoExecFile.FindEntry('SET ETC');IF Index<>-1 Then
                    Begin
                         AutoExecFile.ReplaceLine(Index,D2);
                    End else AutoExecFile.AddLine(D2);
                    IF not AutoExecFile.SaveFile Then Halt;
                    AutoExecFile.Destroy;
          End;
     End;
    {$I+}
End;


{浜様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様融
 �                                                                          �
 �     This Section : Save DNS 1                                            �
 �                                                                          �
 �     somewhere Jan 2004 - last modified ?                                 �
 �                                                                          �
 藩様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様夕}
{Procedure SaveOldDNS(Param:byte);
VAR loop:Byte;IOError:longint;
Begin
    IF DebugLog Then ShowMessage('Executing Procedure SaveDNS Parameter = '+ToStr(Param));
    case param of
    1:Assign(ConfigFile,GetEnv('ETC')+'\RESOLV2');
    2:Assign(ConfigFile,ProgramSettings.EditDosWinETCText+'\RESOLV');
    End;
    //Assign(ConfigFile,GetEnv('ETC')+'\RESOLV2');
    ReWrite(ConfigFile);IF IOResult<>0 Then Begin ErrorBox('unable to create RESOLV2 file');halt;END;

    TRY
    ConfigStr:='nameserver '+DebugForm.lbDNSSetup.items[0];writeln(ConfigFile,ConfigStr);
    Except DisplayException(218);
    End;

    TRY
    ConfigStr:='nameserver '+DebugForm.lbDNSSetup.items[1];writeln(ConfigFile,ConfigStr);
    Except DisplayException(219);
    End;

    TRY
    ConfigStr:='nameserver '+DebugForm.lbDNSSetup.items[2];writeln(ConfigFile,ConfigStr);
    Except DisplayException(220);
    End;

    TRY
    ConfigStr:='domain '+DebugForm.EditlocalDomain.text;Writeln(ConfigFile,ConfigStr);
    Except DisplayException(221);
    End;

    TRY
    IF DebugForm.lbDomainsSetup.Items[0]<>'' Then
    Begin
         ConfigStr:='search '+DebugForm.lbDomainsSetup.items[0]+' '+DebugForm.lbDomainsSetup.Items[1]+' '+DebugForm.lbDomainsSetup.items[2];
    End;
    Except DisplayException(222);
    End;

    Writeln(ConfigFIle,ConfigStr);

    IOERROR:=IOResult;
    If IoError<>0 Then MyErrorBox(GetNLSString('ERRORS','WriteErr_Resolv2')+#13+SysErrorMessage(IoError));
    Close(configFile);
    IF DebugLog then
    Begin
         ShowMessage('RESOLV / RESOLV 2 File succesfully written');
         DebugForm.Memo1.lines.add('succesfully leaving procedure');
    End;

End;}

Procedure SaveHostList(Param:Byte);
VAR loop:Byte;IOError:longint;HelpStr:String;
Begin
     IF DebugLog Then DebugForm.Memo1.lines.add('executing procedure saveHosts');
     Case Param of
     1:Assign(ConFigFile,getenv('ETC')+'\HOSTS');
     2:Assign(ConfigFile,GetTCPIPDOSPath(Application.ProgramIniFIle.ReadString('Settings','TCPIP_BIN_PATH','')+'\HOSTS'));
     End;
     //Assign(ConFigFile,getenv('ETC')+'\HOSTS');
     {$I-}
     Rewrite(ConfigFile);IOError:=IOResult;IF IoError<>0 Then begin MyErrorBox(GetNLSString('ERRORS','HOSTFailedCreate'));Exit;End;
     IF DebugForm.LBHostIP.items.Count<>0 Then
     Begin
          TRY
          For Loop:=0 to DebugForm.LBHostIP.items.count-1 do
          Begin
               // IP Adress
               Try
                  HelpStr:=FillStr(DebugForm.LBHostIP.items[loop],21);
                  Except DisplayException(50);
               End;
               // Host name
              Try
                 HelpStr:=HelpStr+' '+DebugForm.LBHostName.items[loop];
                 Except DisplayException(51);
                 End;
                 if length(helpStr)<48 then
                 Begin
                      HelpStr:=FillStr(HelpStr,47);
                      //ShowMessage(toStr(Length(HelpStr))+#13+HelpStr);
                  End;
              // Alias
              Try
                 HelpStr:=HelpStr+' '+DebugForm.LBHostAlias.items[loop];
                 Except DisplayException(52);
              End;
              // Comment
              Try
                 HelpStr:=HelpStr+' # '+DebugForm.LBHostComment.items[loop];
                 Except DisplayException(53);
              End;
           Writeln(ConfigFile,HelpStr);IOError:=IoResult;IF IoError<>0 Then Begin MyErrorBox(GetNLSString('ERRORS','HOSTwriteFailed'));break;End;
          End; {Loop}
       Except DisplayException(223);
       End;
     End; {IF}
Close(ConfigFile);
{$I+}
     IF DebugLog Then
     begin
     ShowMessage('HOST File successfully written');
     DebugForm.Memo1.lines.add('successfully leaving procedure');
     End;
End;




{浜様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様融
 �                                                                          �
 �     Procedure Network Printer Save                                       �
 �                                                                          �
 �     Version 2 20.09.2005                                                 �
 �                                                                          �
 �     Saves the network Printer settings into the OS2SYS.INI               �
 �                                                                          �
 藩様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様夕}




Procedure SaveNetWorkPrinter;
Label NextStep;
VAr
   ConfigSys:TCOnfigSysFIle;
   RC:Longint;
   aList:TStringlist;
   NeedSave:Boolean;
   ConfigSysPrinter:String;

Begin
     ConfigSys.Create;

     RC:=ConfigSys.FindEntry('SET LPR_SERVER=');
     IF RC<>-1 Then
     Begin
          ConfigSysPrinter:=GetEnvString(ConfigSys.cfg_Items.Items[RC]);
          If Uppercase(ConfigSysPrinter)=Uppercase(DebugForm.editLPR_SERVER.Text) Then
          Begin
               Goto NextStep;
          End else
          Begin
               ConfigSys.ReplaceLine(RC,'SET LPR_SERVER='+DebugForm.editLPR_SERVER.Text);
               ConfigSys.SaveFile;
               ChangeRec.Reboot:=TRue;
          End;

     End else
     Begin
          ConfigSys.AddLine('SET LPR_SERVER='+DebugForm.editLPR_SERVER.Text);
          ConfigSys.SaveFile;
          ChangeRec.Reboot:=TRue;
     End;

     NextStep:

     RC:=ConfigSys.FindEntry('SET LPR_PRINTER');
     IF RC<>-1 Then
     Begin
          ConfigSysPrinter:=GetEnvString(ConfigSys.cfg_Items.Items[RC]);
          IF Uppercase(ConfigSysPrinter)=UpperCase(DebugForm.editLPR_PRINTER.Text) Then
          Begin
               ConfigSys.Destroy;
               Exit;
          End else
          Begin
               ConfigSys.ReplaceLine(RC,'SET LPR_PRINTER='+DebugForm.editLPR_PRINTER.Text)
          End;

    End else
    Begin
         ConfigSys.AddLine('SET LPR_PRINTER='+DebugForm.editLPR_Printer.Text);
    End;

    ConfigSys.SaveFile;

    ChangeRec.Reboot:=TRue;

    COnfigSys.Destroy;


End;

{浜様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様融
 �                                                                          �
 �     This Section NFS Save Routine                                        �
 �                                                                          �
 �     Version 1.5 22.08.2005 Last modified 28.08.2005                      �
 �                                                                          �
 藩様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様夕}

Procedure SaveNFS;
VAR NFS_Loop:Longint;
    NFS_Copy:Text;
    NFS_Text:String;

                Procedure MakeAliasStr(LoopCounter:longint);
                VAR S:String;
                Begin
                        TRY
                        IF DebugForm.lbNFSAlias.items[loopCounter]<>'' Then
                        Begin
                                S:='-alias '+DebugForm.lbNFSAlias.items[loopCOunter];
                                ConfigStr:=ConfigStr+S;
                                ConfigStr:=ConfigStr+' ';
                        End;
                        Except ErrorBox('Unit Fileoperation Zeile 884 Schutzverltzung');
                        End;
                End;


                Procedure MakeRightsStr(LoopCounter:Longint);
                Begin
                        TRY
                        IF DebugForm.lbNFSRights.Items[LoopCounter]='HR' Then  ConfigStr:=ConfigStr+'-ro';
                        Except ErrorBox('Unit Fileoperation Zeile 898 Schutzverletzung');
                        End;

                        TRY
                        IF DebugForm.lbNFSRights.Items[LoopCounter]='HW' Then  ConfigStr:=ConfigStr+'-rw';
                        Except ErrorBox('Unit FileOperation Zeile 902 Schutzverletzung');
                        End;

                        TRY
                        IF DebugForm.lbNFSRights.Items[LoopCounter]='PW' Then  ConfigStr:=ConfigStr+'-rw';
                        Except ErrorBox('Unit FileOperation Zeile 902 Schutzverletzung');
                        End;

                        TRY
                        IF DebugForm.lbNFSRights.Items[LoopCounter]='PR' Then  ConfigStr:=ConfigStr+'-ro';
                        Except ErrorBox('Unit FileOperation Zeile 902 Schutzverletzung');
                        End;

                        Try
                        IF DebugForm.lbNFSRights.Items[LoopCounter]='P' Then  ConfigStr:=ConfigStr+'public';
                        Except ErrorBox('Unit FileOperation Zeile 906 Schutzverltzung');
                        End;
                End;

                Procedure MakeHostsStr(loopCounter:Longint);
                VAR S:String;Counter:Longint;

                Begin
                        IF NFSHostListArray[LoopCOunter].count<>0 Then
                        Begin
                                For Counter:=0 to NFSHostListArray[LoopCounter].count -1 do
                                Begin
                                        TRY
                                        S:=NFSHostListArray[LoopCounter][counter];
                                        Except Begin ErrorBox('Fehler bei Host Listen Array ! LoopCounter = '+ToStr(LoopCounter)+'Counter = '+ToStr(Counter));Halt;End;
                                        End;
                                        Configstr:=ConfigStr+' '+S;
                                End;
                        End;
                End;

        Procedure MakeCommentStr(LoopCounter:Longint);
        Begin
                IF DebugFOrm.lbNFSComment.Items[LoopCounter]<>'' Then ConfigStr:=ConfigStr+' # '+DebugForm.lbNFSComment.Items[LoopCounter];
        End;

        Begin
                {$I-}
                Assign(ConfigFile,GetENV('ETC')+'\EXPORTS');
                Assign(NFS_COpy,GetEnv('ETC')+'\MYEXPORTS');
                Rewrite(NFS_COpy);IF IoResult<>0 Then Begin MyErrorBox(GetNLSString('Message','EXP_SAVE_FAILED')+#13+'MyExports!!');Exit;End;
                Rewrite(COnfigFile);IF IoResult<>0 Then Begin MyErrorBox(GetNLSString('Message','EXP_SAVE_FAILED'));Exit;End;
                TRY
                For NFS_Loop:=0 to DebugForm.lbNFSDirectory.Items.count-1 do
                Begin
                        //Writeln('Sichere Zeile : ',NFS_loop);
                        TRY
                        ConfigStr:=DebugForm.lbNFSDirectory.items[NFS_Loop]+' ';
                        Except ErrorBox('Unit Fileoperation Zeile 1154 Schutzverletzung');
                        End;
                        MakeAliasStr(NFS_loop);
                        MakeRightsStr(NFS_Loop);
                        MakeHostsStr(Nfs_loop);
                        MakeCommentStr(NFS_loop);
                        Writeln(ConfigFile,COnfigStr);
                        Writeln(NFS_COpy,COnfigStr);
                End;
                Except
                ErrorBox('Unit Fileoperation Zeile 1164 Schutzverletzung');
                End;
                Close(ConfigFile);
                //Writeln('Sichern als MyExport unter ',path,' wurde Erfolgreich abgeschlossen');
                Close(NFS_COpy);
    End;



{
浜様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様�
�                                                                           �
� Version : 1 written 01.03.2004 last modified : 04.03.2004                 �
�                                                                           �
� This section: Read Routine for FTP / TELNET / REXEC / NFS Servers         �
�                                                                           �
� readed from file :\ETC\TCPNBK.LST                                         �
�                                                                           �
藩様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様�}
Procedure ReadServices;
Begin
     Repeat
           Readln(ConfigFIle,ConfigStr);
           QueryServerUsers;
           QueryServerComments;
           QueryServerPassword;
           QueryServerHomeDir;
           QueryServerNFSUserID;
           QUeryServerNFSGroupID;
           QueryServerTelnetShell;
           QueryServerServices;
     UNTIL Eof(ConfigFile);
     Close(ConfigFile);
End;

Procedure SaveServices;
VAR loop:Byte;rc:Longint;
    ExecuteStr:String;

Begin
     DebugFOrm.Memo1.lines.add('executing procedure SaveServices');
     IF DebugForm.lbServicesUserName.items.count=0 then Begin DebugForm.Memo1.lines.add('no users setuped, leaving procedure save services');exit;End;
     Assign(ConFigFile,getenv('ETC')+'\TCPNBK.LST');
     {$I-}
     ReWrite(ConfigFile);IF IoResult<>0 Then Begin MyErrorBox(GetNLSString('ERRORS','CreateFailedSYB'));exit;End;
     For loop:=0 to DebugFOrm.lbServicesUserName.items.count-1 do
     Begin
           COnfigStr:='SRVRUSR=(';
           Writeln(COnfigFile,ConfigStr);If IoResult<>0 then Begin MyErrorBox(GetNLSString('ERRORS','CreateFailedSYB'));close(ConfigFile);exit;End;


           TRY
           ConfigStr:='      USERID='+DebugForm.lbServicesUserName.items[loop];
           Except DisplayException(250);
           End;
           Writeln(COnfigFile,ConfigStr);If IoResult<>0 then Begin MyErrorBox(GetNLSString('ERRORS','CreateFailedSYB'));close(ConfigFile);exit;End;
           DebugForm.Memo1.lines.add('Saving User ID : '+DebugForm.lbServicesUserName.items[loop]);

           TRY
           ConfigStr:='      password='+DebugForm.lbServicesPasswordCrypted.items[loop];
           Except DisplayException(251);
           End;


           Writeln(COnfigFile,ConfigStr);If IoResult<>0 then Begin MyErrorBox(GetNLSString('ERRORS','CreateFailedSYB'));close(ConfigFile);exit;End;
           DebugForm.Memo1.lines.add('Saving Password : '+DLLResultStr);

           TRY
           ConfigStr:='      comment='+DebugForm.lbServicesComments.items[loop];
           Except DisplayException(252);
           End;
           Writeln(COnfigFile,ConfigStr);If IoResult<>0 then Begin MyErrorBox(GetNLSString('ERRORS','CreateFailedSYB'));close(ConfigFile);exit;End;
           DebugForm.Memo1.lines.add('Saving Comment : '+DebugForm.lbServicesComments.items[loop]);


           IF DebugForm.lbServicesNFSUSerID.items[loop]<>'NIL' Then
           Begin
                TRY
                ConfigStr:='      uid='+DebugForm.lbServicesNFSUSerID.items[loop];
                Writeln(COnfigFile,ConfigStr);If IoResult<>0 then Begin MyErrorBox(GetNLSString('ERRORS','CreateFailedSYB'));close(ConfigFile);exit;End;
                DebugForm.Memo1.lines.add('Saving NFS USER-ID : '+DebugForm.lbServicesNFSUSERID.items[loop]);
                Except DisplayException(253);
           End;
           End;

           IF DebugForm.lbServicesNFSGroupID.Items[Loop]<>'NIL' then
           Begin
           TRY
           ConfigStr:='      gid='+DebugForm.lbServicesNFSGroupID.items[loop];
           Except DisplayException(254);
           End;
           Writeln(COnfigFile,ConfigStr);If IoResult<>0 then Begin MyErrorBox(GetNLSString('ERRORS','CreateFailedSYB'));close(ConfigFile);exit;End;
           DebugForm.Memo1.lines.add('Saving NFS Group-ID : '+DebugForm.lbServicesNFSGroupID.items[loop]);
           End;

           Try
           COnfigStr:='      shell= '+DebugForm.lbServicesTelnetShell.Items[loop]+' '+DebugFOrm.lbServicesTelnetParamter.items[loop];
           Except DisplayException(254);
           End;
           IF DebugForm.lbTelnetDisconnect.items[loop]='true' then COnfigStr:='      shell=/C '+DebugForm.lbServicesTelnetShell.Items[loop]+' '+DebugFOrm.lbServicesTelnetParamter.items[loop];
           Writeln(COnfigFile,ConfigStr);If IoResult<>0 then Begin MyErrorBox(GetNLSString('ERRORS','CreateFailedSYB'));close(ConfigFile);exit;End;
           DebugForm.Memo1.lines.add('Saving Telnet disconect : '+ConfigStr);

           TRY
           ConfigStr:='      homedir='+DebugForm.lbServicesHomeDir.items[loop];
           Except DisplayException(255);
           End;
           Writeln(COnfigFile,ConfigStr);If IoResult<>0 then Begin MyErrorBox(GetNLSString('ERRORS','CreateFailedSYB'));close(ConfigFile);exit;End;
           DebugForm.Memo1.lines.add('Saving Home Dir : '+ConfigStr);

           ConfigStr:='      FTPD=(';
           Writeln(COnfigFile,ConfigStr);If IoResult<>0 then Begin MyErrorBox(GetNLSString('ERRORS','CreateFailedSYB'));close(ConfigFile);exit;End;
           TRY
           If DebugForm.lbServicesFTP.items[loop]='true' then ConfigStr:='           active=1'
                                                                 else  ConfigStr:='           active=0';
           Except DisplayException(256);
           End;
           Writeln(COnfigFile,ConfigStr);If IoResult<>0 then Begin MyErrorBox(GetNLSString('ERRORS','CreateFailedSYB'));close(ConfigFile);exit;End;
           DebugForm.Memo1.lines.add('Saving FTPD Status : '+ConfigStr);
           TRY
           COnfigStr:='           read='+DebugForm.lbServicesFTPDreadDirectory.items[loop];
           Except DIsplayException(257);
           ENd;
           Writeln(COnfigFile,ConfigStr);If IoResult<>0 then Begin MyErrorBox(GetNLSString('ERRORS','CreateFailedSYB'));close(ConfigFile);exit;End;

           TRY
           IF DebugFOrm.lbServicesFTPDcanRead.items[loop]='true' then ConfigStr:='           canread=0'
                                                                 else ConfigStr:='           canread=1';
           Except DisplayException(258);
           End;
           Writeln(COnfigFile,ConfigStr);If IoResult<>0 then Begin MyErrorBox(GetNLSString('ERRORS','CreateFailedSYB'));close(ConfigFile);exit;End;
           DebugForm.Memo1.lines.add('saving read rights '+ConfigStr);

           TRY
           ConfigStr:='           write='+DebugForm.lbServicesFTPDwriteDirectory.items[loop];
           Except DisplayException(259);
           End;
           Writeln(COnfigFile,ConfigStr);If IoResult<>0 then Begin MyErrorBox(GetNLSString('ERRORS','CreateFailedSYB'));close(ConfigFile);exit;End;

           TRY
           IF DebugFOrm.lbServicesFTPDcanWrite.items[loop]='true' then ConfigStr:='           canwrite=0'
                                                                 else ConfigStr:='           canwrite=1';
           Except DisplayException(260);
           End;
           Writeln(COnfigFile,ConfigStr);If IoResult<>0 then Begin MyErrorBox(GetNLSString('ERRORS','CreateFailedSYB'));close(ConfigFile);exit;End;
           DebugForm.Memo1.lines.add('saving write rights '+ConfigStr);

           TRY
           ConfigStr:='           log='+DebugFOrm.lbServicesFTPDLog.items[loop];
           Except DisplayException(261);
           End;
           Writeln(COnfigFile,ConfigStr);If IoResult<>0 then Begin MyErrorBox(GetNLSString('ERRORS','CreateFailedSYB'));close(ConfigFile);exit;End;
           DebugForm.Memo1.lines.add('saving log '+ConfigStr);

           TRY
           ConfigStr:='           idletimeout='+DebugForm.lbServicesFTPDidleTimeout.items[loop];
           Except DIsplayException(262);
           End;
           Writeln(COnfigFile,ConfigStr);If IoResult<>0 then Begin MyErrorBox(GetNLSString('ERRORS','CreateFailedSYB'));close(ConfigFile);exit;End;
           DebugForm.Memo1.lines.add('saving IdleTimeout'+ConfigStr);

           ConfigStr:='      )';
           Writeln(COnfigFile,ConfigStr);If IoResult<>0 then Begin MyErrorBox(GetNLSString('ERRORS','CreateFailedSYB'));close(ConfigFile);exit;End;

           ConfigStr:='      TELNETD=(';
           Writeln(COnfigFile,ConfigStr);If IoResult<>0 then Begin MyErrorBox(GetNLSString('ERRORS','CreateFailedSYB'));close(ConfigFile);exit;End;
           DebugForm.Memo1.lines.add('saving TelnetD '+ConfigStr);

           TRY
           IF DebugForm.lbServicesTelnet.items[loop]='true' Then ConfigStr:='           active=1' else ConfigStr:='           active=0'
           Except DisplayException(263);
           End;
           Writeln(COnfigFile,ConfigStr);If IoResult<>0 then Begin MyErrorBox(GetNLSString('ERRORS','CreateFailedSYB'));close(ConfigFile);exit;End;
           DebugForm.Memo1.lines.add('saving Telnet active '+ConfigStr);

           ConfigStr:='      )';
           Writeln(COnfigFile,ConfigStr);If IoResult<>0 then Begin MyErrorBox(GetNLSString('ERRORS','CreateFailedSYB'));close(ConfigFile);exit;End;

           ConfigStr:='      rexecd=(';
           Writeln(COnfigFile,ConfigStr);If IoResult<>0 then Begin MyErrorBox(GetNLSString('ERRORS','CreateFailedSYB'));close(ConfigFile);exit;End;
           DebugForm.Memo1.lines.add('saving REXECD '+ConfigStr);

           TRY
           IF DebugForm.lbServicesRex.items[loop]='true' Then ConfigStr:='           active=1' else ConfigStr:='           active=0'
           Except DisplayException(264);
           End;
           Writeln(COnfigFile,ConfigStr);If IoResult<>0 then Begin MyErrorBox(GetNLSString('ERRORS','CreateFailedSYB'));close(ConfigFile);exit;End;
           DebugForm.Memo1.lines.add('saving RexecD active '+ConfigStr);

           ConfigStr:='      )';
           Writeln(COnfigFile,ConfigStr);If IoResult<>0 then Begin MyErrorBox(GetNLSString('ERRORS','CreateFailedSYB'));close(ConfigFile);exit;End;

           ConfigStr:='      nfsd=(';
           Writeln(COnfigFile,ConfigStr);If IoResult<>0 then Begin MyErrorBox(GetNLSString('ERRORS','CreateFailedSYB'));close(ConfigFile);exit;End;
           DebugForm.Memo1.lines.add('saving NFSD'+ConfigStr);

           TRY
           IF DebugForm.lbServicesNFS.items[loop]='true' Then ConfigStr:='           active=1' else ConfigStr:='           active=0'
           Except DisplayException(265);
           End;
           Writeln(COnfigFile,ConfigStr);If IoResult<>0 then Begin MyErrorBox(GetNLSString('ERRORS','CreateFailedSYB'));close(ConfigFile);exit;End;
           DebugForm.Memo1.lines.add('saving NFSD active '+ConfigStr);

           ConfigStr:='      )';
           Writeln(COnfigFile,ConfigStr);If IoResult<>0 then Begin MyErrorBox(GetNLSString('ERRORS','CreateFailedSYB'));close(ConfigFile);exit;End;

           
           ConfigStr:=')';
           Writeln(COnfigFile,ConfigStr);If IoResult<>0 then Begin MyErrorBox(GetNLSString('ERRORS','CreateFailedSYB'));close(ConfigFile);exit;End;
     End;

           Close(COnfigFile);
           {$I+}
End;

{浜様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様融
 �                                                                          �
 �     Procedure Use Hosts First                                            �
 �                                                                          �
 �     Version 1 24.09.2005                                                 �
 �                                                                          �
 �     Saves the Setting "SET USE_HOSTS_FIRST" into the config.sys file     �
 �                                                                          �
 藩様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様夕}
Procedure SaveUseHostsFirst(Status:boolean);
VAR
   ConfigSysFIle:TConfigSysFile;
   Index:Longint;
   EnvStr:String;
Begin

          EnvStr:='SET USE_HOSTS_FIRST=';
          Case Status of
          TRUE: IF getENV('USE_HOSTS_FIRST')='1' then exit;
          FALSE: IF getENV('USE_HOSTS_FIRST')='' Then exit; // Keine �nderungen notwendig
          End;
          ConfigSysFile.Create;
          Case Status of
          TRUE: Begin
                     Index:=ConfigSysFile.FindEntry(ENVStr+'1');
                     IF Index=-1 Then ConfigSysFile.AddLine(ENVStr+'1');
                End;
          FALSE:Begin
                     Index:=ConfigSysFile.FIndEntry(EnvStr);
                     IF Index<>-1 Then ConfigSysFile.DeleteLine(Index);
                End;
          End;

              ConfigSysFile.SaveFile;
               //MyInfoBox(GetNLSString('MESSAGE','CONFIG_SYS_CHANGE'));
               ChangeRec.Reboot:=True;
          COnfigSysFile.Destroy;

End;

{浜様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様融
 �                                                                          �
 �     Procedure Hostname Save (Config.SYS change)                          �
 �                                                                          �
 �     Version 2 11.09.2005 - changed 23.10.2006                            �
 �                                                                          �
 �     Saves or changes the ENV Hostname into CONFIG.SYS                    �
 �                                                                          �
 藩様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様夕}

 Procedure SaveHostName;
 Label Ausgang;

  VAR
     ConfigSysFile:TCOnfigSysFIle;
     Index:Longint;
     ConfigSysHostName:String;
 Begin
        ConfigSysFile.Create;
        // Try to find the entry Set Hostname
        Index:=ConfigSysFile.FindEntry('SET HOSTNAME');
        IF Index<>-1 Then
        Begin
             ConfigSysHostname:=GetEnvString(ConfigSysFile.CFG_Items.items[Index]);
             IF Uppercase(ConfigSysHostname)=Uppercase(DebugForm.EditHostname.Text) Then
             Begin
                  ConfigSysFile.Destroy;
                  Exit;
             End
             else
             Begin
                  ConfigSysFile.ReplaceLine(Index,'SET HOSTNAME='+DebugForm.EditHostname.Text); // replace the entry with the new line
             End;
        End else
        Begin
             // This Entry does not exists currently , so add it to the config,sys file
             //ConfigSysFile.Backup;
             ConfigSysFile.AddLine('SET HOSTNAME='+DebugForm.EditHostname.Text);
        End;

        ConfigSysFile.SaveFile;

        ChangeRec.Reboot:=True;         // Reboot requiered to became changes active

        Ausgang:
        ConfigSysFile.Destroy;
 End;



Procedure ExecuteSettings;
 VAR
    Loop:Byte;
    RC:Longint;

 Begin
         {For loop:=0 to DebugExecForm.ListBoxProg.items.count-1 do
         Begin
            //ShowMessage('Executing Command :'+#13+DebugExecForm.ListBoxProg.items[loop]+' '+DebugExecForm.ListBoxParam.items[loop]);
            RC:=ExecDll(DebugExecForm.ListBoxProg.items[loop],DebugExecForm.ListBoxParam.items[loop]);
            IF RC<>0 Then
            Begin
                 MyErrorBox(GetNlsString('ERRORS','EXEC_Error')+#13+SysErrorMessage(RC));Halt;
            End;
         End;}
 End;

Procedure CloseServer(ServerName:String);
VAR
   OS2Ini:TOs2UserIniFile;
   PID,Path:STring;
Begin
     IF not Application.ProgramINIFile.ReadBool('Settings','AUTOSTART',FALSE) Then Exit;
     OS2INI.Create;
     // Check if a FTPD Server is running ...
     IF Uppercase(ServerName)='FTPD' Then
     Begin
         Path:=OS2INI.ReadString('TCPConfig','FTPD_PATH','-1');
         IF PATH='-1' Then Exit; // NO FTPD Server is runnimg
         IF Path<>Uppercase(Application.ProgramIniFIle.ReadString('Settings','TCPIP_BIN_PATH','')+'\FTPD.EXE') Then exit;
     End;

     PID:=OS2INi.ReadString('TCPConfig',Uppercase(ServerName),'-1');
     IF PID='-1' Then Begin OS2Ini.Destroy;Exit;End;
     Delete(PiD,1,1);
     //ShowMessage('Killen von '+ServerName+' PID='+PID);
     OS2INI.Destroy;
     DosError:=DosKillProcess(1,Hex2Dec(PID));
     IF DOsError<>0 Then MYErrorBox('failed to kill : '+ServerName+#13+'ErrorCode : '+toStr(DosError));

End;

Procedure StartServer(ServerName,Param:String);
VAR OS2INI:TOs2UserIniFile;PID:String;RC:Longint;
Begin
     IF not Application.ProgramIniFile.ReadBool('Settings','AUTOSTART',FALSE) Then exit;
     OS2INI.Create;
     PID:=OS2INi.ReadString('TCPConfig',Uppercase(ServerName),'-1');
     IF PID='-1' Then
                     Begin
                         // ShowMessage('Neuer Dienst wird gestartet '+ServerName);
                          OS2Ini.Destroy;
                          RC:=Execute_TCPServer(Param);
                          IF RC<>0 Then ErrorBox('Fehler beim starten von Server : '+ServerName+#13+'Error Code : '+ToStr(RC));
                          Exit;
                     End;
    // ShowMessage('DIenst bereits gestartet : '+ServerName);
     OS2INI.Destroy;
End;




End.
{23.10.2006 SaveHostname speicherte keine �nderungen wenn man den Hostnamen verk�rtzte oder nur verl�ngertre
            �nderungen wurden nur gesichert wenn einen komplett unterschiedlicher Name angegeben wurde
01.11.2006 TCPFileOpen - �nderungen auf OS/2 Ini Format
01.11.2006 Save_DNS    - Umbau wegen DOS RESOLV FIle, einbau von schreiben "SET ETC=\TCPIP\DOS\ETC'" in Autoexec.bat
04.11.2006 SAVE_DNS  -   Fix: Beim Schreiben von search domains wurde immer am ende des Eintrages ein leerzeichen geschriben
22.11.2006 Neue Funktion : IsFtpdIBM - Testet ob der FTPD Server von IBM ist welcher im lieferumfang von OS/2 dabei ist.
24.11.2006 �nderung beim Sichern des Passwortes f�r Benutzer, Passwort wird nun w�hrend des hinzuf�gens verschl�sselt
Kein erneutes Einlesen und verschl�sseln nach dem Schreiben mehr notwendig (�nderung in DLL)
20.01.2007 : �nderung bei Abfrage von DHCP Server beim sichern
}