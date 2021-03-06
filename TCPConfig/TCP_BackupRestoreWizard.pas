

{浜様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様融
 �                                                                          �
 �    TCP_BackupRestoreWizard                                               �
 �                                                                          �
 �    Version 2 29.09.2006 - 08.09.2006                                     �
 �                                                                          �
 �    Letzte �nderzung : 08.10.06                                           �
 藩様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様夕}

Unit TCP_BackupRestoreWizard;

Interface
                              
Uses
  Classes, Forms, Graphics, ExtCtrls, StdCtrls, Buttons, TabCtrls,TCP_IniFIles,TCPUtilityUnit, ustring,TCP_VAR_Unit,DOS,MyMessageBox,TCPUtilityUnit,BSEDOS,Messages,
  ComCtrls, ListView,SysUtils,DateTimeUnit,MyMessageBox,TCP_LanguageUnit,DirChangeDlg,FileDialog,TCP_AutoActivateConfig,TCP_FinalNoteDialog,
  Hints;

Type
  TBackupRestoreWizard = Class (TForm)
    NoteBook1: TNoteBook;
    Image1: TImage;
    Dummy: TGroupBox;
    LabelWelcome: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    ButtonPrev: TButton;
    ButtonCancel: TButton;
    ButtonNext: TButton;
    cbRestoreInetD: TCheckBox;
    MemoInfo: TMemo;
    LabelInfo: TLabel;
    RadioChanges: TRadioGroup;
    Image4: TImage;
    LabelWarning: TLabel;
    LabelError: TLabel;
    Label32: TLabel;
    Image3: TImage;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    LabelDummyPage13: TLabel;
    rgFunction: TRadioGroup;
    Memo1: TMemo;
    LabelDestination: TLabel;
    DestinationPathInfo: TLabel;
    LabelDummyPage6: TLabel;
    Image2: TImage;
    LabelBackupFin: TLabel;
    LabelBackupFinInfo: TLabel;
    rbOther: TRadioButton;
    Edit2: TEdit;
    ButtonBrowse: TButton;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label41: TLabel;
    GroupBox14: TGroupBox;
    Label17: TLabel;
    Label18: TLabel;
    GroupBox13: TGroupBox;
    cbRestoreInterface: TCheckBox;
    cbRestoreDNS: TCheckBox;
    cbRestoreHostList: TCheckBox;
    cbRestoreSocks: TCheckBox;
    cbRestoreNFS: TCheckBox;
    cbRestoreUser: TCheckBox;
    cbRestoreAutostart: TCheckBox;
    cbRestoreConfigSys: TCheckBox;
    cbRestoreAll: TCheckBox;
    Label34: TLabel;
    GroupBox12: TGroupBox;
    gbRestoreInfo: TGroupBox;
    Memo2: TMemo;
    LabelCreateDate: TLabel;
    DateValue: TLabel;
    LabelCreateTime: TLabel;
    TimeValue: TLabel;
    Label33: TLabel;
    Label26: TLabel;
    GroupBox10: TGroupBox;
    Label11: TLabel;
    Label12: TLabel;
    gbRestore: TGroupBox;
    rbRestoreBackupDir: TRadioButton;
    rbRestoreOther: TRadioButton;
    Edit1: TEdit;
    Button2: TButton;
    gbRestoreOverview: TGroupBox;
    ListView1: TListView;
    Label23: TLabel;
    GroupBox2: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    gbSummary: TGroupBox;
    GroupBox8: TGroupBox;
    gbDestination: TGroupBox;
    rbDefault: TRadioButton;
    GroupBox6: TGroupBox;
    gbInfo: TGroupBox;
    GroupBox4: TGroupBox;
    Procedure RadioChangesOnClick (Sender: TObject);
    Procedure rbRestoreOtherOnClick (Sender: TObject);
    Procedure rbRestoreBackupDirOnClick (Sender: TObject);
    Procedure cbRestoreInetDOnClick (Sender: TObject);
    Procedure Button2OnClick (Sender: TObject);
    Procedure ButtonBrowseOnClick (Sender: TObject);
    Procedure cbRestoreConfigSysOnClick (Sender: TObject);
    Procedure cbRestoreAutostartOnClick (Sender: TObject);
    Procedure cbRestoreUserOnClick (Sender: TObject);
    Procedure cbRestoreNFSOnClick (Sender: TObject);
    Procedure cbRestoreSocksOnClick (Sender: TObject);
    Procedure cbRestoreHostListOnClick (Sender: TObject);
    Procedure cbRestoreDNSOnClick (Sender: TObject);
    Procedure cbRestoreInterfaceOnClick (Sender: TObject);
    Procedure ListView1OnItemSelect (Sender: TObject; Index: LongInt);
    Procedure BackupRestoreWizardOnCreate (Sender: TObject);
    Procedure BackupRestoreWizardOnDestroy (Sender: TObject);
    Procedure BackupRestoreWizardOnDismissDlg (Sender: TObject);
    Procedure cbRestoreAllOnClick (Sender: TObject);
    Procedure RadioButton4OnClick (Sender: TObject);
    Procedure RadioButton3OnClick (Sender: TObject);
    Procedure ButtonCancelOnClick (Sender: TObject);
    Procedure ButtonPrevOnClick (Sender: TObject);
    Procedure ButtonNextOnClick (Sender: TObject);
    Procedure BackupRestoreWizardOnSetupShow (Sender: TObject);
    Procedure NoteBook1OnPageChanged (Sender: TObject);
    Procedure Label19OnClick (Sender: TObject);
    Procedure RadioButton1OnClick (Sender: TObject);
    Procedure DisplayRestoreOverview;
    Procedure RestoreBackup;
    Procedure CheckBackupFile;
    Procedure DisableAll;
    Procedure GetBackupInfo;
    Procedure LanguageSettings;
    IcoBackup:TIcon;
    ButtonChecked:Boolean;
    DefaultInfoString:String;
    FinishCaption:String;
  Function AmountButtonChecked:Byte;
  Private
    {Private Deklarationen hier einf�gen}

  Public
    {�ffentliche Deklarationen hier einf�gen}
   Procedure ExecuteBackup;
  End;

Var
  BackupRestoreWizard: TBackupRestoreWizard;
  BackupRestoreFile:TIniFiles;
  FileListBackup:TStringlist;
  FileListRestore:TStringlist;
  SourcePath:String;          // Path from wehre to restore the files
  Filename:String;

 Procedure AutoBackup(Param:Byte);
Implementation
VAR
   UIni:TOs2UserIniFile;
   SOCKS1:Boolean;
   Socks2:Boolean;
   Interf:Boolean;  // True indicates interface has changed, on restore display selection radio buttons
   HintStr:String; // contains the string for the hint message  - e.g. "File : config.sys"

   Function FilenotExistsOrZeroSize(SourceFileName:String):Boolean;
   {
   checks if source file exists, and if it has zero byte size
   Input : SourceFilename Filename of the source file (with or without path)
   Output : TRUE if file does not exists or if file has zero size
   Remark : Since faAnyfile is used, all files will be found (including hidden and system)  
 }
   VAR 
        DirInfo:TSearchRec;
        RC:Longint;

Begin
        RC:=Sysutils.FindFirst(SourceFilename,faAnyfile,DirInfo);
        FindClose(DirInfo);
        IF RC<>0 Then Begin Result:=TRUE;exit;End; // File does not exists
        // FIle exists
       IF DirInfo.Size=0 Then Begin Result:=True;Exit;End; // File has 0 Bytesize
        Result:=FALSE;
End;



{$R BackupRestore}



Procedure TBackupRestoreWizard.RadioChangesOnClick (Sender: TObject);
Begin
     if cbRestoreConfigSys.CHecked Then
     Begin
          IF RadioChanges.ItemIndex=0 Then NlsInfoBox('CFGSysRestore');
          RadioChanges.ItemIndex:=1;
    ENd;
End;

Procedure TBackupRestoreWizard.rbRestoreOtherOnClick (Sender: TObject);
Begin
     Edit1.Enabled:=TRUE;
     Button2.Enabled:=TRUE;
    IF Length(Edit1.Text)=0 Then ButtonNext.Enabled:=False else ButtonNext.Enabled:=True;
End;

Procedure TBackupRestoreWizard.rbRestoreBackupDirOnClick (Sender: TObject);
Begin
   Edit1.Enabled:=FALSE;
   Button2.Enabled:=FALSE;
End;

Procedure TBackupRestoreWizard.DisableAll;
Begin
     cbRestoreInterface.enabled:=FALSE;
     cbRestoreDNS.enabled:=FALSE;
     cbRestoreHostList.enabled:=FALSE;
     cbRestoreSocks.enabled:=FALSE;
     cbRestoreNFS.enabled:=FALSE;
     cbRestoreUser.enabled:=FALSE;
     cbRestoreAutostart.Enabled:=FALSE;
     cbRestoreConfigSys.Enabled:=FALSE;
     cbRestoreInetD.Enabled:=FALSE;
End;

Procedure TBackupRestoreWizard.CheckBackupFile;
VAR Loop:Byte;
    RestFile:String;
Begin
     DisableAll;
     For Loop:=0 to FileListRestore.Count-1 do
     Begin
          RestFile:=Filesplit(  UpperCase ( FileListRestore[loop] ),2 );
          IF RestFile='SETUP.CMD' Then Begin cbRestoreInterface.enabled:=TRUE;Interf:=TRUE;End else Interf:=FALSE;
          IF RestFile='RESOLV2' Then cbRestoreDNS.enabled:=True;
          IF RestFile='HOSTS' Then cbRestoreHostList.Enabled:=True;
          IF RestFile='SOCKS.ENV' Then Begin cbRestoreSocks.enabled:=True;Socks1:=True;End else Socks1:=FALSE;
          IF RestFile='SOCKS.CFG' Then Begin cbRestoreSocks.enabled:=True;Socks2:=TRUE;End else SOCKS2:=FALSE;
          IF RestFile='EXPORTS' Then cbRestoreNFS.enabled:=TRUE;
          IF RestFile='TCPNBK.LST' Then cbRestoreUser.enabled:=TRUE;
          IF RestFile='TCPSTART.CMD' Then cbRestoreAutoStart.enabled:=TRUE;
          IF RestFile='INETD.LST' Then cbRestoreInetD.Enabled:=True;
          IF RestFile='CONFIG.SYS' Then cbRestoreConfigSys.Enabled:=TRUE;
     End;
End;

Procedure TBackupRestoreWizard.Button2OnClick (Sender: TObject);
VAR
   aIni:TIniFiles;

Begin
  IF FileDialogWork.Execute Then
  Begin
  Edit1.Text:=FileDialogWork.FIleName;
  aINI.Create(FileDialogWork.FileName);
  IF not aIni.ContainSection('INFORMATION') Then
  Begin
       NlsErrorBox('IllegalBackupFile');ButtonNext.Enabled:=FALSE;
  End else ButtonNext.Enabled:=True;
  AIni.Destroy;
  End;
End;

Procedure TBackupRestoreWizard.ButtonBrowseOnClick (Sender: TObject);
Begin
     DirDialog.Create;
     IF DirDialog.Execute Then
     Begin
     IF Length(DirDialog.Directory)=3 Then Delete(DirDialog.Directory,3,1);
     Edit2.Text:=DirDialog.Directory;
     End;
     DirDialog.Destroy;
End;

Function TBackupRestoreWizard.AmountButtonChecked:Byte;
VAR Amount:integer;
Begin
     Amount:=0;
     IF cbRestoreInterface.checked Then inc(Amount);
     IF cbRestoreDNS.checked Then inc(Amount);
     if cbRestoreHostList.checked Then inc(Amount);
     IF cbRestoreSocks.checked Then inc(Amount);
     IF cbRestoreNFS.checked Then inc(Amount);
     if cbRestoreUser.checked Then Inc(Amount);
     IF cbRestoreAutostart.checked Then Inc(Amount);
     IF cbRestoreConfigSys.checked Then Inc(Amount);

     Result:=Amount;
ENd;

Procedure TBackupRestoreWizard.cbRestoreInetDOnClick (Sender: TObject);
Begin
     IF AmountButtonChecked>0 Then ButtonNext.Enabled:=True else ButtonNext.Enabled:=FALSE;
End;

Procedure TBackupRestoreWizard.cbRestoreConfigSysOnClick (Sender: TObject);
Begin
     IF AmountButtonChecked>0 Then ButtonNext.Enabled:=True else ButtonNext.Enabled:=FALSE;
End;

Procedure TBackupRestoreWizard.cbRestoreAutostartOnClick (Sender: TObject);
Begin
       IF AmountButtonChecked>0 Then ButtonNext.Enabled:=True else ButtonNext.Enabled:=FALSE;
End;

Procedure TBackupRestoreWizard.cbRestoreUserOnClick (Sender: TObject);
Begin
     IF AmountButtonChecked>0 Then ButtonNext.Enabled:=True else ButtonNext.Enabled:=FALSE;
End;

Procedure TBackupRestoreWizard.cbRestoreNFSOnClick (Sender: TObject);
Begin
     IF AmountButtonChecked>0 Then ButtonNext.Enabled:=True else ButtonNext.Enabled:=FALSE;
End;

Procedure TBackupRestoreWizard.cbRestoreSocksOnClick (Sender: TObject);
Begin
     IF AmountButtonChecked>0 Then ButtonNext.Enabled:=True else ButtonNext.Enabled:=FALSE;
End;

Procedure TBackupRestoreWizard.cbRestoreHostListOnClick (Sender: TObject);
Begin
     IF AmountButtonChecked>0 Then ButtonNext.Enabled:=True else ButtonNext.Enabled:=FALSE;
End;

Procedure TBackupRestoreWizard.cbRestoreDNSOnClick (Sender: TObject);
Begin
     IF AmountButtonChecked>0 Then ButtonNext.Enabled:=True else ButtonNext.Enabled:=FALSE;
End;

Procedure TBackupRestoreWizard.cbRestoreInterfaceOnClick (Sender: TObject);
Begin
     IF AmountButtonChecked>0 Then Begin ButtonNext.Enabled:=True;Interf:=True;End else begin ButtonNext.Enabled:=FALSE;Interf:=FALSE;End;
End;

Procedure TBackupRestoreWizard.ListView1OnItemSelect (Sender: TObject;
  Index: LongInt);
Begin
    Notebook1.PageIndex:=10;
End;

Procedure TBackupRestoreWizard.BackupRestoreWizardOnCreate (Sender: TObject);
Begin
     IcoBackup.Create;
     DateAndTime1.Create;
     FileListBackup.Create;
     FileListRestore.Create;
     IcoBackup.LoadFromResourceName('Backup');
     FileDialogWork.Create(Self);
End;

Procedure TBackupRestoreWizard.BackupRestoreWizardOnDestroy (Sender: TObject);
Begin
     IcoBackup.Destroy;
     DateAndTime1.Destroy;
     FileListBackup.Destroy;
     FileListRestore.Destroy;
     {FileList.Destroy;
     FileListRestore.Destroy;}
     //FileDialogWork.Destroy;
End;

Procedure TBackupRestoreWizard.BackupRestoreWizardOnDismissDlg (Sender: TObject);
Begin

End;

Procedure TBackupRestoreWizard.DisplayRestoreOverview;
VAR RC:Integer;DirInfo:TSearchRec;
Begin
     ListView1.Clear;
     RC:=SysUtils.FindFirst(Application.ProgramIniFile.ReadString('Settings','BACKUP_PATH','')+'\BKP*.*',directory shl 8 OR AnyFile,DirInfo);
     While RC=0 do
     Begin
          DateAndTime1.GetFileDateTime(DirInfo);

          IF (DirInfo.Name<>'.') and (DirInfo.Name<>'..') Then
          Begin
               ListView1.Add(DirInfo.Name+#13+' '+DateAndTime1.DateStr+#13+' '+DateandTime1.TimeStr,Nil,ICOBackup);
               FileListBackup.Add(DirInfo.Name);
          End;
          RC:=SysUtils.FindNext(DirInfo);
     End;
     IF FileListBackup.count=0 Then ButtonNext.Enabled:=FALSE;
End;

Procedure TBackupRestoreWizard.GetBackupInfo;
VAR S:String;
Begin

     //IF Not FileExists(ProgramSettings.BackupPath+'\'+FileName+'\Backup.INI') Then Begin MyErrorBox(SysErrorMessage(02));halt;End;

     BackupRestoreFile.Create(FileName);
     BackupRestoreFile.ReadStrings('INFORMATION','Text',Memo2.Lines);
     S:=BackupRestoreFile.ReadString('DATETIME','Date','-1');IF S='-1' Then Begin MyInfoBox('Section "DATETIME" wurde in BACKUP.INI nicht gefunden !');Halt;ENd;
     DateValue.Caption:=S;
     S:=BackupRestoreFile.ReadString('DATETIME','Time','-1');IF S='-1' Then Begin MyInfoBox('Section "DATETIME" wurde in BACKUP.INI nicht gefunden !');Halt;ENd;
     TimeValue.Caption:=S;
     FileListRestore.Clear;
     BackupRestoreFile.ReadPathStrings('FILELIST','File',FilelistRestore);
     BackupRestoreFile.Destroy;
End;

Procedure TBackupRestoreWizard.cbRestoreAllOnClick (Sender: TObject);
Begin
     IF cbRestoreAll.Checked Then
     Begin
          if cbRestoreInterface.enabled then Begin cbRestoreInterface.checked:=True;Interf:=TRUE;End;
          if cbRestoreDNS.enabled Then cbRestoreDNS.checked:=True;
          if cbRestoreHostlist.enabled Then cbRestoreHostlist.checked:=True;
          if cbRestoreSocks.enabled Then cbRestoreSocks.checked:=True;
          if cbRestoreNFS.enabled then cbRestoreNFS.checked:=True;
          if cbRestoreUser.enabled Then cbRestoreUser.checked:=True;
          if cbRestoreAutostart.enabled Then cbRestoreAutostart.checked:=True;
          if cbRestoreCOnfigSys.enabled Then cbRestoreConfigSys.checked:=True;
          IF cbRestoreinetd.enabled Then cbRestoreinetd.checked:=True;
          ButtonNext.Enabled:=True;
     End else
     Begin
          cbRestoreInterface.checked:=False;Interf:=FALSE;
          cbRestoreDNS.checked:=false;
          cbRestoreHostlist.checked:=false;
          cbRestoreSocks.checked:=false;
          cbRestoreNFS.checked:=false;
          cbRestoreUser.checked:=false;
          cbRestoreAutostart.checked:=false;
          cbRestoreConfigSys.checked:=false;
          cbRestoreinetd.checked:=False;
          ButtonNext.Enabled:=FALSE;
     End;
End;

Procedure TBackupRestoreWizard.RadioButton4OnClick (Sender: TObject);
Begin
  Edit2.Enabled:=TRUE;
End;

Procedure TBackupRestoreWizard.RadioButton3OnClick (Sender: TObject);
Begin
     IF RbDefault.Checked Then Edit2.Enabled:=FALSE;
End;

Procedure TBackupRestoreWizard.ButtonCancelOnClick (Sender: TObject);
Begin

End;

Procedure TBackupRestoreWizard.ButtonPrevOnClick (Sender: TObject);
Begin
  Notebook1.PageIndex:=Notebook1.PageIndex-1;
End;

Procedure TBackupRestoreWizard.ButtonNextOnClick (Sender: TObject);
Begin
     Notebook1.PageIndex:=Notebook1.PageIndex+1;
End;

Procedure TBackupRestoreWizard.BackupRestoreWizardOnSetupShow (Sender: TObject);
Begin
     NoteBook1.PageIndex:=0;LanguageSettings;
     rgFunction.ItemIndex:=0;
     IF not FileExists(Application.ProgramINiFile.ReadString('Settings','BACKUP_PATH','')) Then Begin rbRestoreBackupDir.Enabled:=FALSE;ButtonNext.Enabled:=FALSE;End
                                                                                           else Begin rbRestoreBackupDir.Enabled:=True;ButtonNext.Enabled:=True;End;
End;

Procedure TBackupRestoreWizard.RestoreBackup;
VAR Stri:String;
Begin

    IF rbRestoreBackupDir.checked Then
    Begin
         TRY
         SourcePath:=Application.ProgramIniFile.ReadString('Settings','BACKUP_PATH','')+'\'+FileListBackup[ListView1.ItemIndex]+'\';
         Except Raise Exception.Create('Exception in "TCP_BackupRestoreWizard.RestoreBackup"'+#13+'Konnte nicht auf "ListView1.ItemIndex" zugreifen !'+#13+'Wert von ItemIndex : '+ToStr(ListView1.ItemIndex));Halt;
         End;
    End else
    Begin
        SourcePath:=FileSplit(Edit1.Text,1);
        IF Length(SourcePath)>3 Then SourcePath:=SourcePath+'\';
    End;

    IF cbRestoreInterface.checked Then
    Begin
          IF not FileCopy(SourcePath+'SETUP.CMD',Application.ProgramIniFile.ReadString('Settings','MPTN_BIN_PATH','')+'\SETUP.CMD') Then Notebook1.PageIndex:=14;
    End;

    IF cbRestoreDNS.Checked Then
    Begin
         IF not FileCOpy(SourcePath+'RESOLV2',GetEnv('ETC')+'\RESOLV2') Then Notebook1.PageIndex:=14;
    End;

    IF cbRestoreHostList.checked Then
    Begin
         IF not FileCopy(SourcePath+'HOSTS',Getenv('ETC')+'\HOSTS') Then Notebook1.PageIndex:=14;
    End;

   IF cbRestoreSocks.checked Then
   Begin
        IF SOCKS1 Then IF not FileCopy(SourcePath+'SOCKS.ENV',GetEnv('ETC')+'\SOCKS.ENV') Then Notebook1.PageIndex:=14;
        IF SOCKS2 Then IF not FileCopy(SourcePath+'SOCKS.CFG',GetEnv('ETC')+'\SOCKS.CFG') Then Notebook1.PageIndex:=14;
   End;

   IF cbRestoreNFS.checked Then
   Begin
       IF not FileCopy(SourcePath+'EXPORTS',GetENV('ETC')+'\EXPORTS') Then Notebook1.PageIndex:=14;
   End;

   IF cbRestoreUser.checked Then
   Begin
        IF Not FileCopy(SourcePath+'TCPNBK.LST',GetENV('ETC')+'\TCPNBK.LST') Then Notebook1.PageIndex:=14;
   ENd;

   IF cbRestoreInetd.checked Then
   Begin
          If not FileCopy(SourcePath+'INETD.LST',GetEnv('ETC')+'\INETD.LST') Then Notebook1.PageIndex:=14;
   End;

   IF cbRestoreAutostart.checked Then
   Begin
        If not FileCOpy(SourcePath+'TCPSTART.CMD',Application.ProgramIniFile.ReadString('Settings','TCPIP_BIN_PATH','')+'\tcpstart.CMD') Then Notebook1.PageIndex:=14;
   End;

  IF cbRestoreConfigSys.checked Then
  begin
  IF not FileCopy(SourcePath+'Config.Sys',QueryBootDrive+':\CONFIG.SYS') Then Notebook1.PageIndex:=14;
  End;


      BackupRestoreFile.Create(FileName);
      UIni.Create;

     Stri:=BackupRestoreFile.ReadString('HomeIP','HomeIP','-1');
     UIni.WriteString('TCPConfig','HomeIP',Stri);

     Stri:=BackupRestoreFile.ReadString('HomeIP','HomeSubnet','-1');
     Uini.WriteString('TCPConfig','HomeSubnet',Stri);

  BackupRestoreFile.Destroy;
  UIni.Destroy;
End;

Procedure TBackupRestoreWizard.ExecuteBackup;
VAR
   SourceStr,DestinationStr:String;
   CopyCOunter:Byte;
   IOError:Longint;
   BoolHelp:Boolean;

Begin
     {Add all file here that should be backuped}
     FileListBackup.Clear;
     If not FilenotExistsOrZeroSize(Application.ProgramIniFile.ReadString('Settings','MPTN_BIN_PATH','')+'\SETUP.CMD') Then FileListBackup.Add(Application.ProgramIniFIle.ReadString('Settings','MPTN_BIN_PATH','')+'\SETUP.CMD');
     If not FilenotExistsOrZeroSize(GetEnv('ETC')+'\RESOLV2') Then FileListBackup.Add(GetEnv('ETC')+'\RESOLV2');
     If not FilenotExistsOrZeroSize(Getenv('ETC')+'\HOSTS') Then FileListBackup.Add(Getenv('ETC')+'\HOSTS');
     If not FilenotExistsOrZeroSize(GetEnv('ETC')+'\SOCKS.ENV') Then FileListBackup.Add(GetEnv('ETC')+'\SOCKS.ENV');
     IF not FilenotExistsOrZeroSize(GetEnv('ETC')+'\SOCKS.CFG') Then FileListBackup.Add(GetEnv('ETC')+'\SOCKS.CFG');
     IF not FilenotExistsOrZeroSize(GetENV('ETC')+'\EXPORTS') Then FileListBackup.Add(GetENV('ETC')+'\EXPORTS');
     IF not FilenotExistsOrZeroSize(GetENV('ETC')+'\TCPNBK.LST') Then FileListBackup.Add(GetENV('ETC')+'\TCPNBK.LST');
     If not FilenotExistsOrZeroSize(GetEnv('ETC')+'\INETD.LST') Then FileListBackup.Add(GetEnv('ETC')+'\INETD.LST');
     IF not FilenotExistsOrZeroSize(Application.ProgramIniFile.ReadString('Settings','TCPIP_BIN_PATH','')+'\tcpstart.CMD') then FileListBackup.Add(Application.ProgramIniFile.ReadString('Settings','TCPIP_BIN_PATH','')+'\tcpstart.CMD');
     IF not FilenotExistsOrZeroSize(QueryBootdrive+':\CONFIG.SYS') then FileListBackup.Add(QueryBootDrive+':\CONFIG.SYS');

     DateAndTime1.GetDateTime;

     For CopyCounter:=0 to FileListBackup.count-1 do
     Begin
          TRY
          SourceStr:=FileListBackup[CopyCounter];
          Except MyErrorBox('Excption bei Zugiff auf "FileListBackup" Stringliste - Fehler in TCP_BackupRestoreWizard');Halt;
          End;
          {Destin Path is Programs BKP folder}
            IF rbDefault.checked Then
            Begin
                DestinationStr:=BackupFolder+'\'+FileSplit(FileListBackup[CopyCounter],2);

            End;

          {Destin Path is user specified}
          IF rbOther.checked Then
          Begin
               {$I-}MKDir(Edit2.Text+'\TCPBKP');IOError:=IOResult;
               IF IOResult<>0 Then Begin NLSErrorBox('NewDir_Failed');DisMissDlg(CMOK);End;
               DestinationStr:=Edit2.Text+'\'+'TCPBKP\'+FileSplit(FileListBackup[CopyCounter],2);
          End;
          FileCOpy(SourceStr,DestinationStr);
     End; // Loop

      IF rbDefault.checked Then BackupRestoreFile.Create(BackupFolder+'\BACKUP.INI')
                          else BackupRestoreFile.Create(Edit2.Text+'\'+'TCPBKP\BACKUP.INI');

     BackupRestoreFile.WriteStrings('INFORMATION','Text',Memo1.lines);
     BackupRestoreFile.WriteString('DATETIME','Date',DateAndTime1.DateStr);
     BackupRestoreFile.WriteString('DATETIME','Time',DateAndTime1.TimeStr);
     BackupRestoreFile.WriteStrings('FILELIST','File',FileListBackup);

     // Backup Information if Alias IP is enabled or not
     BackupRestoreFile.WriteString('HomeIP','HomeIP',AliasRec.HomeIP);
     BackupRestoreFile.WriteString('HomeIP','HomeSubnet',AliasRec.HomeSubnet);

     BackupRestoreFile.Destroy;

     IncIniCounter('BACKUP_COUNTER');
End;

Procedure TBackupRestoreWizard.NoteBook1OnPageChanged (Sender: TObject);
Begin
     case Notebook1.PageIndex of
     0:Begin
            ButtonNext.Caption:=GetNlsString(Name,'ButtonNext');FileListBackup.Clear;
            ButtonPrev.Enabled:=FALSE;ButtonNext.Enabled:=True;RGFunction.ItemIndex:=0;ButtonCancel.Enabled:=TRUE;
     ENd;
     1:Begin ButtonPrev.Enabled:=True;End;
     2:begin
           Memo1.Lines.Clear;
           Memo1.Lines.add(DefaultInfoString);
           IF RGFunction.ItemIndex=1 Then Notebook1.PageIndex:=8;
       end;
     3:IF rbDefault.Checked Then Begin Edit2.Enabled:=FALSE;End;
     4:Begin
            IF rbDefault.checked Then DestinationPathInfo.Caption:=Application.ProgramIniFIle.ReadString('Settings','BACKUP_PATH','');
            IF rbOther.checked Then DestinationPathInfo.Caption:=Edit2.Text;
            MemoInfo.Lines:=Memo1.Lines;
       End;
     5:Begin
            ButtonPrev.Enabled:=FALSE;ButtonNext.Caption:=FinishCaption;
            ButtonCancel.Enabled:=FALSE;
            ExecuteBackup;
       End;
     6:DisMissDlg(CMOK);
     7:Notebook1.PageIndex:=1;
     9:Begin
            IF rbRestoreBackupDir.checked Then
            Begin
                 ButtonNext.Enabled:=FALSE;
                 DisplayRestoreOverview;
                 IF ListView1.itemcount>-1 Then ButtonNext.Enabled:=True;
            End;
            IF rbRestoreOther.checked Then
            Begin
                 ButtonNext.Enabled:=FALSE;
                 NoteBook1.PageIndex:=10;
            End;
        End;

     10:Begin
             ButtonNext.Enabled:=TRUE;
             IF rbRestoreBackupDir.checked then FileName:=Application.ProgramIniFile.ReadString('Settings','BACKUP_PATH','')+'\'+FileListBackup[ListView1.ItemIndex]+'\Backup.Ini';
             IF rbRestoreOther.Checked Then FileName:=Edit1.Text;
             GetBackupInfo;
        End;
     11:Begin
             CheckBackupFile;
             ButtonNext.Enabled:=False;
        End;
     12:Begin
             RestoreBackup;
             ButtonPrev.Enabled:=FALSE;
             ButtonCancel.Enabled:=FALSE;
             IF not Interf Then Begin RadioChanges.Visible:=FALSE;RadioChanges.ItemIndex:=1;End
                           else Begin RadioChanges.Visible:=True;RadioChanges.ItemIndex:=0;End;
             IF cbRestoreConfigSys.checked Then RadioChanges.ItemIndex:=1;
             ButtonNext.Caption:=FinishCaption;
         End;
     13:Begin
             IF RadioChanges.ItemIndex=0 Then
                                         Begin
                                              DIsMissDlg(CMOK);
                                              ExecuteForm.Create;
                                              IF ParamStr(1)='\DEBUG' Then ExecuteForm.ShowModal;
                                              ExecuteForm.Execute;
                                              ExecuteForm.Destroy;
                                              FormFinalNote.Create(Self);
                                              FormFinalNote.ShowModal;
                                              FormFinalNote.Destroy;
                                              ChangeRec.ClearAll:=True;
                                         End;
             If RadioChanges.ItemIndex=1 Then DisMissDlg(CMOK);
         End;
     14:Begin
             ButtonPrev.Enabled:=FALSE;
             ButtonNext.Caption:=FinishCaption;
        End;
     15:DisMissDlg(CMOK);
     End;
End;

Procedure TBackupRestoreWizard.Label19OnClick (Sender: TObject);
Begin

End;

Procedure TBackupRestoreWizard.RadioButton1OnClick (Sender: TObject);
Begin

End;


Procedure TBackupRestoreWizard.LanguageSettings;
Begin
     Caption:=GetNlsString(Self.Name,'Caption');
     LabelWelcome.Caption:=GetNlsString(Name,'Welcome');
     Label1.Caption:=GetNlsString(Name,'Label1');
     Label2.Caption:=GetNlsString(Name,'Label2');
     Label3.Caption:=GetNlsString(Name,'Label3');
     Label4.Caption:=GetNlsString(Name,'Label4');
     Label5.Caption:=GetNlsString(Name,'Label5');
     Label6.Caption:=GetNlsString(Name,'Label6');
     Label7.Caption:=GetNlsString(Name,'Label7');
     Label8.Caption:=GetNlsString(Name,'Label8');
     Label9.Caption:=GetNlsString(Name,'Label9');
     LabelBackupFin.Caption:=GetNlsString(Name,'LabelBackupFin');
     LabelBackupFinInfo.Caption:=GetNlsString(Name,'LabelBackupFInInfo');
     Label10.Caption:=GetNlsString(Name,'Label10');
     Label11.Caption:=GetNlsString(Name,'Label11');
     Label12.Caption:=GetNlsString(Name,'Label12');
     Label13.Caption:=GetNlsString(Name,'Label13');
     Label14.Caption:=GetNlsString(Name,'Label14');
     Label15.Caption:=GetNlsString(Name,'Label15');
     Label16.Caption:=GetNlsString(Name,'Label16');
     Label17.Caption:=GetNlsString(Name,'Label17');
     Label18.Caption:=GetNlsString(Name,'Label18');
     Label19.Caption:=GetNlsString(Name,'Label19');
     Label20.Caption:=GetNlsString(Name,'Label20');
     Label21.Caption:=GetNlsString(Name,'Label21');
     LabelWarning.Caption:=GetNLSString(Name,'LabelWarning');
     LabelError.Caption:=GetNlsString(Name,'LabelError');
     RGFunction.Caption:=GetNlsString(Name,'RGFunction');
     gbInfo.Caption:=GetNlsString(Name,'gbInfo');
     DefaultInfoString:=GetNlsString(Name,'DefaultInfo');
     gbDestination.Caption:=GetNlsString(Name,'gbDestination');
     rbDefault.Caption:=GetNlsString(Name,'rbDefault');
     rbOther.Caption:=GetNlsString(Name,'rbOther');
     gbSummary.Caption:=GetNlsString(Name,'gbSummary');
     LabelDestination.Caption:=GetNlsString(Name,'LabelDestination');
     LabelInfo.Caption:=GetNlsString(Name,'LabelInfo');
     gbRestore.Caption:=GetNlsString(Name,'gbRestore');
     rbRestoreBackupDir.Caption:=GetNlsString(Name,'rbRestoreBackupDir');
     rbRestoreOther.Caption:=GetNlsString(Name,'rbRestoreOther');
     gbRestoreOverview.Caption:=GetNlsString(Name,'gbRestoreOverview');
     LabelCreateDate.Caption:=GetNlsString(Name,'LabelCreateDate');
     LabelCreateTime.Caption:=GetNlsString(Name,'LabelCreateTime');
     gbRestoreInfo.Caption:=GetNlsString(Name,'gbRestoreInfo');
     gbRestore.Caption:=GetNlsString(Name,'gbRestore');
     rbRestoreBackupDir.Caption:=GetNlsString(Name,'rbRestoreBackupDir');
     rbRestoreOther.Caption:=GetNlsString(Name,'rbRestoreOther');
     gbRestoreOverview.Caption:=GetNlsString(Name,'gbRestoreOverview');
     LabelCreateDate.Caption:=GetNlsString(Name,'LabelCreateDate');
     LabelCreateTime.Caption:=GetNlsString(Name,'LabelCreateTime');
     gbRestoreInfo.Caption:=GetNlsString(Name,'gbRestoreInfo');
     cbRestoreInterface.Caption:=GetNlsString(Name,'cbRestoreInterface');
     cbRestoreDNS.Caption:=GetNlsString(Name,'cbRestoreDNS');
     cbRestoreHostList.Caption:=GetNlsString(Name,'cbRestoreHostList');
     cbRestoreSocks.Caption:=GetNlsString(Name,'cbRestoreSocks');
     cbRestoreNFS.Caption:=GetNlsString(Name,'cbRestoreNFS');
     cbRestoreUser.Caption:=GetNlsString(Name,'cbRestoreUser');
     cbRestoreAutostart.Caption:=GetNlsString(Name,'cbRestoreAutostart');
     cbRestoreInetD.Caption:=GetNlsString(Name,'cbRestoreInetD');
     cbRestoreConfigSys.Caption:=GetNlsString(Name,'cbRestoreConfigSys');
     cbRestoreAll.Caption:=GetNlsString(Name,'cbRestoreAll');
     RadioChanges.Caption:=GetNlsString(Name,'RadioChanges');
     RadioChanges.Items.Clear;
     RadioChanges.items.add(GetNlsString(Name,'Item#1'));
     RadioChanges.items.add(GetNlsString(Name,'Item#2'));
     ButtonPrev.caption:=GetNlsString(Name,'ButtonPrev');
     ButtonNext.Caption:=GetNlsString(Name,'ButtonNext');
     ButtonCancel.Caption:=GetNlsString(Name,'ButtonCancel');
     FinishCaption:=GetNlsString(Name,'ButtonFinish');
     // Hints :
     IF Application.ProgramIniFile.ReadBool('Program','Hints',FALSE) Then
     Begin
     HintStr:=GetNlsString(Name,'Hint');
     cbRestoreInterface.Hint:=HintStr+' setup.cmd';
     cbRestoreDNS.Hint:=HintStr+' resolv2';
     cbRestoreHostList.Hint:=HintStr+' hosts';
     cbRestoreSocks.Hint:=HintStr+' socks.cfg , socks.env';
     cbRestoreNFS.Hint:=HintStr+' exports';
     cbRestoreUser.Hint:=HintStr+' tcpnbk.lst';
     cbRestoreAutostart.Hint:=HintStr+' tcpstart.cmd';
     cbRestoreInetD.Hint:=HintStr+' tcpstart.cmd';
     cbRestoreConfigSys.Hint:=HintStr+' config.sys';
     End;
End;


Procedure AutoBackup(Param:Byte);
VAR
   BackupIni:TIniFiles;
   TextList:TStringList;

    Procedure WriteBackupInfo;
    Begin

         DateAndTime1.Create;
         BackupIni.Create(BackupFolder+'\BACKUP.INI');
         BackupINi.WriteString('DATETIME','Date',DateAndTime.DateStr);
         BackupINi.WriteString('DATETIME','Time',DateAndTime.TimeStr);
         BackupIni.WriteStrings('INFORMATIOM','Text',TextList);
         BackupINI.WriteStrings('FILELIST','FILE',FileListBackup);
         BackupIni.WriteString('HomeIP','HomeIP',AliasRec.HomeIP);
    End;


Begin
     TextList.Create;
     FileListBackup.Create;

     TextList.Add('Automaticaly generated Backup');

     TextList.Destroy;
     FileListBackup.Destroy;
End;




Initialization
  RegisterClasses ([TBackupRestoreWizard, TNoteBook, TImage, TGroupBox, TLabel, TButton,
    TRadioButton, TEdit, TMemo, TRadioGroup, TCheckBox, TListView]);
End.



{ 23.10.2006 - Backup.Ini wurde bei Alternativen sicherungspaf trotzdem ins Programm Backup Dir geschrieben
  23.10.2005 - NFS Restore Checkbox wurde bei "Alles Wiederherstellen" nicht markiert
  23.10.2006 - TList Error beim Wiederherstellen einer Sicherung.
              Die Fatei "Backup.Ini" wurde in falsches Verzeichniss geschriben.

  24.10.2006 - Auswahl ob �nderungen mit oder ohne neustart �bernommen werden sollen wurde nicht angeziegt wenn die
              checkboxx "Alles Wiederherstellen" ausgew�hlt wurde , da flag "interf" nicht auf TRUE gesetzt wurde.
  24.10.2006 - Information ausgeben wenn CONFIG.SYS wiederherstellung gew�nscht wird, aber versucht wird Radio Button
               "�nderungen ohne Systemstart zu �bernehmen" ausgew�hlt wurde.
               ItemIndex von RadioChanges dann auf 1 stellen (Systemneustart).

  24.10.2006  Ingo's spezieller Wunsch : Dateinamen als Hints bei Wiederherstllung anzeigen.
              Erforder Wert 1 (True) als eintrag unter "Progarm" "Hints" in der Program.ini

  24.10.2006 BallonHint hinzugef�gt.

  24.10.2006 Wiederherstellungs �bersicht zeige auch Dateien anstatt nur Verzeichnisse an.

             �nderung in Procdure "DisplayRestoreOverview" Findfirst suche nur mit attribute fadirectory
             �nderung auf "directory shl 8 or anyfile"

  25.10.2006 �nderungen der Eigenschaft "readonly" bei alternatoven Backup's/ restores von FALSE auf TRUE

  22.11.2006 Sperre des Next Buttons, wenn path aus dem einstellungen nicht vorhanden ist.
  23.11.2006 Seit umstellung des INI Files, wurden keine Dateien aus "PathRec." GESICHERT.


}