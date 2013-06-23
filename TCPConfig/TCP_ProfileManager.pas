{浜様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様融
 �                                                                          �
 �    Profil Manager                                                        �
 �                                                                          �
 �    Version 2 : 16.10.2006                                                �
 �    Letzte �nderung : 16.10.2006                                          �
 藩様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様夕}

Unit TCP_ProfileManager;

Interface

Uses
  Classes, Forms, Graphics, StdCtrls, ExtCtrls, Buttons, TabCtrls, BmpList, Dialogs,TCP_IniFIles,BSEDOS,SysUtils, DOS, ustring,Messages;

Type
    TErrorInfo=Record
    ErrString:String;          // Keeps the errormessage from syserrormessage
    ErrFilename:String;        // Holds the path+filename on wich the error appeart
    End;
Type
  TProfileManager = Class (TForm)
    ButtonNext: TButton;
    ButtonPrev: TButton;
    ButtonCancel: TButton;
    NoteBook1: TNoteBook;
    GroupBox1: TGroupBox;
    Image1: TImage;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    GroupBox3: TGroupBox;
    Label7: TLabel;
    GroupBox4: TGroupBox;
    Label8: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    GroupBox17: TGroupBox;
    Edit3: TEdit;
    GroupBox18: TGroupBox;
    Memo4: TMemo;
    Image4: TImage;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Image5: TImage;
    GroupBox19: TGroupBox;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    LabelSysErrorMessage: TLabel;
    Label42: TLabel;
    GroupBox20: TGroupBox;
    Memo1: TMemo;
    ButtonDeleteProfile: TButton;
    Label43: TLabel;
    LabelErrFilename: TLabel;
    GroupBox16: TGroupBox;
    Label32: TLabel;
    GroupBox14: TGroupBox;
    Label23: TLabel;
    GroupBox10: TGroupBox;
    GroupBox9: TGroupBox;
    Label19: TLabel;
    InfoProfileName: TEdit;
    InfoProfileInformation: TMemo;
    GroupBox8: TGroupBox;
    Label14: TLabel;
    Label15: TLabel;
    GroupBox7: TGroupBox;
    Label16: TLabel;
    MemoProfileInfo1: TMemo;
    GroupBox11: TGroupBox;
    BMPListProfile: TBitmapListBox;
    GroupBox15: TGroupBox;
    BmpListProfile1: TBitmapListBox;
    Image3: TImage;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    GroupBox5: TGroupBox;
    EditProfileName: TEdit;
    Label20: TLabel;
    GroupBox6: TGroupBox;
    Image2: TImage;
    Label9: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    RadioSelection: TRadioGroup;
    Procedure ButtonDeleteProfileOnClick (Sender: TObject);
    Procedure ProfileManagerOnDestroy (Sender: TObject);
    Procedure ProfileManagerOnCreate (Sender: TObject);
    Procedure BMPListProfileOnItemFocus (Sender: TObject; Index: LongInt);
    Procedure MemoProfileInfo1OnChange (Sender: TObject);
    Procedure EditProfileNameOnChange (Sender: TObject);
    Procedure ButtonPrevOnClick (Sender: TObject);
    Procedure ButtonNextOnClick (Sender: TObject);
    Procedure ProfileManagerOnSetupShow (Sender: TObject);
    Procedure NoteBook1OnPageChanged (Sender: TObject);
    Procedure LanguageCaption;
    FInishCaption:String;
    NextCaption:String;
    ProfileIni:TIniFiles;
    ErrorInfo :TErrorInfo;
    Function MakeProfileName:String;
    Procedure ExecuteMakeProfile;
    Procedure WriteProfileIni;
    Function CopyFiles(Source,Destination:CString):Boolean;
    Procedure IncraseProfilCounter;
    Procedure ScanForProfiles(Param:Byte);
    Function GetProfileName(Path:String):String;
    Procedure ActivateProfile(Path:String);
    ProfileDirectoryList:TStringlist; // holds the founded profile Directorys
    UIni:TOS2UserIniFile;
  Private
    {Private Deklarationen hier einf�gen}
  Public
    {�ffentliche Deklarationen hier einf�gen}
  Procedure Execute;
  End;

Var
  ProfileManager: TProfileManager;

IMPLEMENTATION

USES TCP_LanguageUnit,DebugUnit,TCP_VAR_Unit,MyMessageBox,TCPUtilityUnit,TCP_AutoActivateConfig,deltree;

{$R ProfilWizard}

VAR
   BMP_Profile:TBitmap;


Procedure TProfileManager.ButtonDeleteProfileOnClick (Sender: TObject);
Begin
    IF NLSDialog('DLG_DEL_Profile') Then
    Begin
         ShowMessage('L�sche'+#13+Application.ProgramIniFile.ReadString('Settings','PROFILE_PATH','')+'\'+ProfileDirectoryList[BmpListProfile1.ItemIndex]);
         DeltreeProc(Application.ProgramIniFile.ReadString('Settings','PROFILE_PATH','')+'\'+ProfileDirectoryList[BmpListProfile1.ItemIndex]);
    End;
End;

 Procedure TProfileManager.ActivateProfile(Path:String);
 Begin
       IF not FileCopy( Application.ProgramIniFile.ReadString('Settings','PROFILE_PATH','')+'\'+Path+'\SETUP.CMD',Application.ProgramIniFIle.ReadString('Settings','MPTN_BIN_PATH','')+'\SETUP.CMD') Then Notebook1.PageIndex:=14;
       IF not FileCopy( Application.ProgramIniFile.ReadString('Settings','PROFILE_PATH','')+'\'+Path+'\RESOLV2',GetEnv('ETC')+'\RESOLV2') Then Notebook1.PageIndex:=14;

       ProfileIni.Create(Application.ProgramINiFile.ReadString('Settings','PROFILE_PATH','')+'\'+Path+'\PROFILE.INI');

       DebugForm.EditHomeIP.Text:=    ProfileIni.ReadString('HomeIP','HomeIP','');
       DebugForm.EditHomeSubnet.Text:=ProfileIni.ReadString('HomeIP','HomeSubnet','');

       UIni.Create;
       UIni.WriteString('TCPConfig','HomeIP',DebugForm.EditHomeIP.Text);
       UIni.WriteString('TCPConfig','HomeSubnet',DebugForm.EditHomeSubnet.Text);
       UIni.Destroy;

       ExecuteForm.Create;
       IF Paramstr(1)='\DEBUG' Then ExecuteForm.ShowModal;
       ExecuteForm.Execute;
       ExecuteForm.Destroy;


 End;

 Function TProfileManager.GetProfileName(Path:String):String;
 Begin
      ProfileIni.Create(Application.ProgramINIFile.ReadString('Settings','PROFILE_PATH','')+'\'+Path+'\PROFILE.INI');
      Result:=ProfileIni.ReadString('Name','Profilename','-1');
      IF Result='-1' Then Begin ExceptionBox('Konnte "Name" nicht aus Profile.ini ermitteln !');Halt;End;
      ProfileIni.ReadStrings('Info','ProfInfo',Memo1.Lines);
      ProfileIni.Destroy;
 End;


 Procedure TProfileManager.ScanForProfiles(Param:Byte);
 VAR RC:Integer;DirInfo:TSearchRec;
Begin
     BmpListProfile.Clear;
     ProfileDirectoryList.Clear;

     RC:=SysUtils.FindFirst(Application.ProgramINiFIle.ReadString('Settings','PROFILE_PATH','')+'\*.*',Directory shl 8 OR AnyFile,DirInfo);
     While RC=0 do
     Begin
          //DateAndTime1.GetFileDateTime(DirInfo);

          IF (DirInfo.Name<>'.') and (DirInfo.Name<>'..') Then
          Begin
               IF FileExists(Application.ProgramIniFile.ReadString('Settings','PROFILE_PATH','')+'\'+DirInfo.Name+'\PROFILE.INI') Then
               Begin
                    IF Param=0 Then BMPListProfile.AddBitmap(GetProfileName(DirInfo.Name),BMP_Profile);
                    IF Param=1 Then BMPListProfile1.AddBitmap(GetProfileName(DirInfo.Name),BMP_Profile);
                    ProfileDirectoryList.Add(DirInfo.Name);
               End;
          End;
          RC:=SysUtils.FindNext(DirInfo);
     End;
     Sysutils.FindCLose(DIrInfo);
End;

 Procedure TProfileManager.IncraseProfilCounter;
 VAR Temp:Longint;
 Begin
      Temp:=Application.ProgramIniFile.ReadInteger('Settings','PROFILE_COUNTER',-1);
      IF Temp=-1 Then ErrorBox('Warnung ! Konnte "PROFILE_COUNTER" nicht aus Program INI laden !');
      Inc(Temp);
      Application.ProgramIniFile.WriteInteger('Settings','PROFILE_COUNTER',Temp);
{      Inc(ProgramSettings.ProfileCounter);
      SaveProgIniFile;}
 End;

 Function TProfileManager.MakeProfileName:String;
 VAR
    IniPath:String;
    IniCounter:Integer;
 Begin
      IniPath:=Application.ProgramIniFile.ReadString('Settings','PROFILE_PATH','-1');
      IF INiPath='-1' Then Begin ShowMessage('Warnung ! Kein "PROFILE_PATH" in der Programm INI gefunden !');Halt;End;
      {IniPath:=ProgramSettings.ProfilePath;}

      IniCounter:=Application.ProgramIniFile.ReadInteger('Settings','PROFILE_COUNTER',-1);
      IF IniCounter=-1 Then Begin ShowMessage('Warnung ! Kein "Profile_Counter" in der Programm INI gefunden !');Halt;End;

      {IniCounter:=ProgramSettings.ProfileCounter;}
      Result:=IniPath+'\'+'PRF#'+ToStr(IniCounter);
 End;

Function TProfileManager.CopyFiles(Source,Destination:CString):Boolean;
// Result : True if OK / FALSE if error appeart
VAR RC:Longint;
Begin
      Result:=FALSE;
      RC:=DOSCOpy(Source,Destination,DCPY_EXISTING);
      IF RC<>0 Then Begin
                         ErrorInfo.ErrString:=SysErrorMessage(RC);
                         ErrorInfo.ErrFilename:=Source;
                         exit;
                   End;
    Result:=True;
End;

Procedure TProfileManager.WriteProfileIni;
Begin
     ProfileIni.Create(MakeProfileName+'\PROFILE.INI');
     ProfileIni.WriteString('Name','Profilename',EditProfileName.Text);
     ProfileIni.WriteStrings('Info','ProfInfo',MemoProfileInfo1.lines);
     ProfileIni.WriteString('HomeIP','HomeIP',DebugForm.EditHomeIP.Text);
     ProfileIni.WriteString('HomeIP','HomeSubnet',DebugForm.EditHomeSubnet.Text);
     ProfileIni.Destroy;
End;

Procedure TProfileManager.ExecuteMakeProfile;
VAR
   IOError:Longint;
   SPath:String;

Begin
      SPath:=Application.ProgramIniFile.ReadString('Settings','MPTN_BIN_PATH','-1');
      IF SPath='-1' Then Begin ErrorBox('Fehler ! Kann "MPTN_BIN_PATH" nicht aus Programm INI laden ! (Nicht vorhanden !');Halt;End;
      {$I-}
      MKDir(MakeProfileName);IOError:=IOResult;
      Case IOError of
      0,5:Begin
              WriteProfileIni;
              IF not CopyFIles(SPath+'\SETUP.CMD',MakeProfileName+'\SETUP.CMD') Then Begin Notebook1.PageIndex:=15;exit;End;
              IF not CopyFiles(GetEnv('ETC')+'\RESOLV2',MakeProfileName+'\RESOLV2') Then Begin Notebook1.PageIndex:=15;Exit;End;
              IncraseProfilCounter;
          End else
          Begin
               ErrorBox(GetNlsString('ERRORS','ProfDirCreateFailed'+#13+MakeProfileName));
          End;
      End;
End;

{浜様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様融
 �                                                                          �
 �    This Section :                                                        �
 �                                                                          �
 �    Language Caption Settings                                             �
 �                                                                          �
 藩様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様夕}


 Procedure TProfileManager.LanguageCaption;
 Begin
      Caption:=GetNlsString(Name,'Caption');
      FinishCaption:=GetNLSString(Name,'ButtonFinish');
      NextCaption:=GetNlsString(Name,'ButtonNext');

      ButtonCancel.Caption:=GetNlsString(Name,'ButtonCancel');
      ButtonNext  .Caption:=GetNlsString(Name,'ButtonNext');
      ButtonPrev  .Caption:=GetNlsString(Name,'ButtonPrev');

 End;

{浜様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様融
 �                                                                          �
 �    This Section :                                                        �
 �                                                                          �
 �    Form Events "On" Statements                                           �
 �                                                                          �
 藩様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様夕}

Procedure TProfileManager.ProfileManagerOnDestroy (Sender: TObject);
Begin
     BMP_Profile.Destroy;
     ProfileDirectoryList.Destroy;
End;

Procedure TProfileManager.ProfileManagerOnCreate (Sender: TObject);
Begin
     BMP_Profile.Create;
     BMP_Profile.LoadFromResourceName('Prof_BMP');
     ProfileDirectoryList.Create;
End;

Procedure TProfileManager.BMPListProfileOnItemFocus (Sender: TObject;
  Index: LongInt);
Begin
    GetProfileName(ProfileDirectoryList[Index]);
    ButtonNext.Enabled:=True;
End;

Procedure TProfileManager.MemoProfileInfo1OnChange (Sender: TObject);
Begin
     IF Length(MemoProfileInfo1.Lines.Text)>8 Then ButtonNext.Enabled:=TRUE else ButtonNext.Enabled:=FALSE;
End;

Procedure TProfileManager.EditProfileNameOnChange (Sender: TObject);
Begin
     IF Length(EditProfileName.Text)>4 Then ButtonNext.Enabled:=True else ButtonNext.Enabled:=FALSE;
End;


Procedure TProfileManager.ButtonPrevOnClick (Sender: TObject);
Begin
     Notebook1.PageIndex:=Notebook1.PageIndex-1;
End;

Procedure TProfileManager.ButtonNextOnClick (Sender: TObject);
Begin
     Notebook1.PageIndex:=Notebook1.PageIndex+1;
End;

Procedure TProfileManager.ProfileManagerOnSetupShow (Sender: TObject);
Begin
    Notebook1.PageIndex:=0;
    RadioSelection.ItemIndex:=0;
    LanguageCaption;
End;

Procedure TProfileManager.NoteBook1OnPageChanged (Sender: TObject);
Begin
     Case Notebook1.PageIndex of
     0:Begin ButtonPrev.Enabled:=FALSE;ButtonNext.Enabled:=TRUE;ButtonNext.Caption:=NextCaption;ButtonCancel.Enabled:=True;End;
     1:Begin ButtonPrev.Enabled:=TRUE;ButtonNext.Enabled:=True;ButtonCancel.Enabled:=TRUE;End;
     2:Begin
            IF RadioSelection.ItemIndex=1 Then Notebook1.PageIndex:=7;
            IF RadioSelection.ItemIndex=2 Then Notebook1.PageIndex:=10;
            EditProfileName.Focus;EditProfileNameOnChange(Self);
     End;

     3:Begin MemoProfileInfo1.Focus;MemoProfileInfo1.OnChange(Self);End;
     4:Begin
            InfoProfileName.Text:=EditProfileName.Text;
            InfoProfileInformation.Lines.Text:=MemoProfileInfo1.Lines.Text;
            IF Paramstr(1)='\DEBUG' Then
            Begin
                 InfoProfileInformation.lines.add('DEBUG : Profil Pfadname :');
                 InfoProfileInformation.lines.add(MakeProfileName);

            End;
       End;
     5:Begin
            ExecuteMakeProfile;
            ButtonPrev.Enabled:=FALSE;
            ButtonCancel.Enabled:=FALSE;
            ButtonNext.Caption:=FinishCaption;
       End;
     6:Notebook1.PageIndex:=0;
     7:Begin
            Scanforprofiles(0);
            //IF BMPListProfile.items.count>=0 Then BmpListProfile.ItemIndex:=0;
        end;
     8:Begin
            ButtonNext.Caption:=FinishCaption;
            ButtonPrev.Enabled:=FALSE;
            ButtonCancel.Enabled:=FALSE;
            ActivateProfile(ProfileDirectoryList[BmpListProfile.ItemIndex]);
       End;
     9:Begin
            ButtonNext.ModalResult:=CmOk;
            exit;
     End;
     10:ScanForProfiles(1);
     15:Begin
             LabelSysErrorMessage.Caption:=ErrorInfo.ErrString;
             LabelErrFilename.Caption:=ErrorInfo.ErrFilename;
        End;
     End;
End;

Procedure TProfileManager.Execute;
VAR
   LoopCounter:Byte;
   ProfName:String;
Begin
IF ParamStr(2)<>'' Then
    Begin
         ScanForProfiles(0);
         For LoopCounter:=0 to ProfileDirectoryList.count-1 do
         Begin
                Try
                ProfName:=GetProfileName(ProfileDirectoryList[LoopCounter]);
                Except Raise Exception.Create('Exception in TCP_Profil_Manger bei TProfile_Manger.Exeute'+#13+'Zurguff auf "ProfileDirectoryList['+ToStr(LoopCounter)+'] verweigert !');Halt;
                End;

                IF Uppercase(ProfName)=Uppercase(Paramstr(2)) Then
                Begin
                     ActivateProfile(ProfileDirectoryList[LoopCounter]);
                     If Notebook1.PageIndex=14 Then
                     Begin
                          ShowModal;
                     End;
                     Exit;
                End;
         End;
    End;
    MyErrorBox(GetNlsString('ERRORS','ProfileNameNotFound')+#13+Paramstr(2));
End;

Initialization
  RegisterClasses ([TProfileManager, TButton, TNoteBook, TGroupBox, TImage, TLabel
   , TRadioGroup, TEdit, TMemo, TBitmapListBox]);
End.
