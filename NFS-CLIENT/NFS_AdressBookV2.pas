Unit NFS_AdressBookV2;

Interface

Uses
  Classes, Forms, Graphics, TabCtrls, Buttons, StdCtrls, ExtCtrls,NFS_VAR_Unit,NFS_ToolBox,DOS,Unit2,NFS_LanguageUnit,MyMessageBox,NFS_IniFiles,Color,
  Menus,nfs_hostlist,Messages,NFS_UtiltyUnit;

Type
  TAdressBookV2 = Class (TForm)
    TabbedNotebook1: TTabbedNotebook;
    ButtonPrev: TBitBtn;
    ButtonNext: TBitBtn;
    ButtonCancel: TBitBtn;
    GroupBoxServerType: TGroupBox;
    RadioButtonAuto: TRadioButton;
    ButtonHelp: TBitBtn;
    CheckBox1: TCheckBox;
    Button1: TButton;
    LabelStepLinux: TLabel;
    Image3: TImage;
    Label10: TLabel;
    Image8: TImage;
    Label16: TLabel;
    cbRespectCase: TCheckBox;
    cbCaseSensetiv: TCheckBox;
    cbLowerCase: TCheckBox;
    LabelStepLinux3: TLabel;
    Label15: TLabel;
    Label14: TLabel;
    GroupBox16: TGroupBox;
    GroupBox5: TGroupBox;
    GroupBoxLinux4: TGroupBox;
    RadioButtonManuel: TRadioButton;
    GroupBoxPCNFSD: TGroupBox;
    GroupBox2: TGroupBox;
    Label7666: TLabel;
    EditUsername: TEdit;
    Label888: TLabel;
    EditPassword: TEdit;
    ButtonOK: TBitBtn;
    Label17: TLabel;
    Label18: TLabel;
    Image7: TImage;
    GroupBox11: TGroupBox;
    EditUMask: TEdit;
    cbUserMask: TCheckBox;
    labUMask: TLabel;
    LabelUserMask: TLabel;
    EditDirRule: TEdit;
    Label171: TLabel;
    EditFileRule: TEdit;
    Label6666: TLabel;
    GroupBox4: TGroupBox;
    Image5: TImage;
    GroupBox9: TGroupBox;
    Label0: TLabel;
    Label1: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    GroupBoxDummy2: TGroupBox;
    Image2: TImage;
    Label7: TLabel;
    LabelSTEPPCNFSD: TLabel;
    Label13: TLabel;
    LabelStepLinux2: TLabel;
    Image6: TImage;
    Label12: TLabel;
    Label11: TLabel;
    GroupBox14: TGroupBox;
    GroupBoxLinux2: TGroupBox;
    Label4: TLabel;
    LabelSTEPPCNFSD1: TLabel;
    Image1: TImage;
    Label3: TLabel;
    Label2: TLabel;
    GroupBoxDummy: TGroupBox;
    EditComment: TEdit;
    Label2222: TLabel;
    EditIP: TEdit;
    Label1111: TLabel;
    GroupBox1: TGroupBox;
    GroupBoxDefault: TGroupBox;
    GroupBoxLinux1: TGroupBox;
    GroupBox3: TGroupBox;
    Label333: TLabel;
    EditUID: TEdit;
    Label131: TLabel;
    EditGID: TEdit;
    GroupBoxDummy1: TGroupBox;
    LabelComment1: TLabel;
    LabGID: TLabel;
    LabelGroupID1: TLabel;
    labFileRight: TLabel;
    labDirRight: TLabel;
    LabelFileRule1: TLabel;
    LabelDirRule1: TLabel;
    kabComment: TLabel;
    LabelUserID1: TLabel;
    labUID: TLabel;
    LabelUserName1: TLabel;
    LabUName: TLabel;
    LabelIP1: TLabel;
    LabServIP: TLabel;
    GroupBox6: TGroupBox;
    Procedure Button1OnClick (Sender: TObject);
    Procedure BitBtn2OnClick (Sender: TObject);
    Procedure TabbedNotebook1OnSetupShow (Sender: TObject);
    Procedure TabbedNotebook1OnPageChanged (Sender: TObject);
    Procedure ButtonOKOnClick (Sender: TObject);
    Procedure AdressBookV2OnSetupShow (Sender: TObject);
    Procedure ButtonPrevOnClick (Sender: TObject);
    Procedure ButtonNextOnClick (Sender: TObject);
  Private
    {Private Deklarationen hier einf�gen}
  UIndex:LongWord;
  Mode:Byte;
  Procedure ApplySettings;
  Public
    {�ffentliche Deklarationen hier einf�gen}
  Function ShowModal(EditMode:Byte;UserIndex:Longint):longword; Virtual;
  Procedure EnableGroupBoxPCNFSD;
  Procedure DisableGroupBoxPCNFSD;
  Procedure DisableGroupBoxLinux;
  Procedure EnableGroupBoxLinux;
  Procedure Language;

End;

Const
     ABEditMode_Add=0;
     ABEditMode_Edit=1;
Var
  AdressBookV2: TAdressBookV2;

Implementation
IMPORTS
Function DllExecNFSProg(ExeName:String;Parameter:String;LogFileName:String):Boolean; 'TCPLIB' NAME 'DllExecNFSProg';
Function DLLResultStr:String; 'TCPLIB' NAME 'DllReturnString';
Function GetRpcInfoDLL(Value:byte):Boolean; 'TCPLIB' NAME 'GetRpcInfo';
ENd;


 VAR NFSFIle:DataFile;

Procedure TAdressBookV2.Button1OnClick (Sender: TObject);
VAR S,s2:String;
Begin
     IF HostListForm.ShowModal=CMOK Then
     Begin
          S:=MultiColumStringToString(HostListForm.Hostlist.items[HostListForm.HostList.ItemIndex],0);
          EditIP.Text:=S;
     End;
End;

Procedure TAdressBookV2.Language;
Begin
     Caption:=GetNlsString(Name,'Caption');
     Label0.Caption:=GetNlsString(Name,'Label0');
     Label1.Caption:=GetNlsString(Name,'Label1');
     Label2.Caption:=GetNlsString(Name,'Label2');
     Label3.Caption:=GetNlsString(Name,'Label3');
     Label4.Caption:=GetNlsString(Name,'Label4');
     Label5.Caption:=GetNlsString(Name,'Label5');
     Label6.Caption:=GetNlsString(Name,'Label6');
     Label7.Caption:=GetNlsString(Name,'Label7');
     Label8.Caption:=GetNlsString(Name,'Label8');
     Label9.Caption:=GetNlsString(Name,'Label9');
     Label10.Caption:=GetNlsString(Name,'Label10');
     Label11.Caption:=GetNlsString(Name,'Label11');
     Label12.Caption:=GetNlsString(Name,'Label12');
     Label13.Caption:=GetNlsString(Name,'Label13');
     Label14.Caption:=GetNlsString(Name,'Label14');
     Label15.Caption:=GetNlsString(Name,'Label15');
     Label16.Caption:=GetNlsString(Name,'Label16');
     Label17.Caption:=GetNlsString(Name,'Label17');
     Label18.Caption:=GetNlsString(Name,'Label18');

     LabelSTEPPCNFSD.Caption:=getNlsString(Name,'LabelSTEPPCNFSD');
     LabelSTEPPCNFSD1.Caption:=GetNLSString(Name,'LabelSTEPPCNFSD1');
     LabelStepLinux.Caption:=GetNLSString(Name,'LabelStepLinux');
     LabelStepLinux2.Caption:=GetNLSString(Name,'LabelStepLinux2');
     LabelStepLinux3.Caption:=GetNLSString(Name,'LabelStepLinux3');
     LabServIP.Caption:=GetNLSString(Name,'LabServIP');
     LabUName.Caption:=GetNLSString(Name,'LabUName');
     LabUID.Caption:=GetNLSString(Name,'LabUID');
     LabGID.Caption:=GetNLSString(Name,'LabGID');
     labFileRight.Caption:=GetNLSString(Name,'labFileRight');
     labDirRight.Caption:=GetNLSString(Name,'labDirRight');
     labUMask.Caption:=GetNLSString(Name,'labUMask');
     kabComment.Caption:=GetNLSString(Name,'kabComment');
     ButtonOK.Caption:=GetNLSString(Name,'ButtonOK');
     ButtonNext.Caption:=GetNlsString(Name,'ButtonNext');
     ButtonPrev.Caption:=GetNLSString(Name,'ButtonPrev');
     ButtonCancel.Caption:=GetNLSString(Name,'ButtonCancel');
     ButtonHelp.Caption:=GetNLSString(Name,'ButtonHelp');

     GroupBoxServerType.Caption:=GetNLSString(Name,'GroupBoxServerType');
     RadioButtonAuto.Caption:=GetNLSString(Name,'RadioButtonAuto');
     RadioButtonManuel.Caption:=GetNLSString(Name,'RadioButtonManuel');
     GroupBox1.Caption:=GetNLSString(Name,'GroupBox1');
     GroupBox2.Caption:=GetNLSString(Name,'GroupBox2');
     GroupBox3.Caption:=GetNLSString(Name,'GroupBox3');
     GroupBox4.Caption:=GetNLSString(Name,'GroupBox4');
     GroupBox5.Caption:=GetNLSString(Name,'GroupBox5');
     GroupBox6.Caption:=GetNLSString(Name,'GroupBox6');
End;


Procedure TAdressBookV2.BitBtn2OnClick (Sender: TObject);
Begin
  ViewHelp(HLP_AdressBook+TabbedNotebook1.PageIndex);
End;

Procedure TAdressbookV2.EnableGroupBoxPCNFSD;
Begin
     GroupBoxPCNFSD.Enabled:=TRUE;
     GroupBoxPCNFSD.PenColor:=clWindowText;
     LabelStepPCNFSD.Caption:='Schritt 2 : Angabe von Username sowie Passwort :';
ENd;


Procedure TAdressbookV2.DisableGroupBoxPCNFSD;
Begin
     GroupBoxPCNFSD.Enabled:=FALSE;
     GroupBoxPCNFSD.PenColor:=clGrayText;
     LabelStepPCNFSD.Caption:='DIESE SEITE WURDE GESPERRT, DA KEIN OS/2 MIT PCNFSD AUF DER GEGENSEITE L�UFT';
ENd;


Procedure TAdressBookV2.EnableGroupBoxLinux;
Begin
     GroupBoxLinux1.Enabled:=True;
     GroupBoxLinux2.Enabled:=TRUE;
     GroupBoxLinux1.PenColor:=clWindowText;
     GroupBoxLinux2.PenColor:=clWindowText;
     LabelStepLinux.Caption:='Schritt 2 : Angabe von Benutzer ID und Gruppen ID';
     LabelStepLinux2.Caption:='Schritt 3 : Angabe von Berechtigungsbits sowie Benutzermaske';
End;

Procedure TAdressBookV2.DisableGroupBoxLinux;
Begin
     LabelStepLinux.Caption:='Diese Seite wurde gesperrt, da ein OS/2 PCNFSD Server auf der Gegenseite aktiv ist';
     LabelStepLinux2.Caption:='Diese Seite wurde gesperrt, da ein OS/2 PCNFSD Server auf der Gegenseite aktiv ist';
     GroupBoxLinux2.PenColor:=ClGrayText;
     GroupBoxLinux1.PenColor:=clGrayText;
     GroupBoxLinux1.Enabled:=FALSE;
     GroupBoxLinux2.Enabled:=FALSE;

End;

Function  GetRPC_Info(ServerIP:String):Boolean;
VAR RC:Boolean;Dummy:String;
Begin
     //rc:=DllExecNFSProg('rpcinfo.exe','-p '+ServerIP,'Output.txt');
     Form2.ShowModal(ServerIP);
     Form2.Close;
     case Form2.RPC_Result of
     TRUE:  Begin
                 If GetRpcInfoDLL(Info_error) Then Begin Dummy:=DLLResultStr;MyErrorBox(Dummy);Result:=FALSE;exit;End;
            End;
     FALSE: Begin
                 Dummy:=DllResultStr;NLSErrorBox('RPCInfo_Failed2');
                 AdressBookV2.EnableGroupBoxLinux;
                 AdressBookV2.EnableGroupBoxPCNFSD;
            End;
     End;
     Result:=Form2.RPC_Result;
End;


Procedure TAdressBookV2.TabbedNotebook1OnSetupShow (Sender: TObject);
Begin
     DisableGroupBoxLinux;
     DisableGroupBoxPCNFSD;
     Language;
End;

Procedure TAdressBookV2.TabbedNotebook1OnPageChanged (Sender: TObject);
Begin
    ButtonPrev.Enabled:=True;
    Case TabbedNotebook1.PageIndex of
    0:Begin ButtonPrev.Enabled:=FALSE;ButtonNext.Enabled:=True;End;
    1:Begin ButtonPrev.Enabled:=True;ButtonNext.Enabled:=True;End;
    2:Begin
           ButtonNext.Enabled:=True;
           IF RadioButtonAuto.checked then
           Begin
                IF GetRPC_Info(EditIP.Text) Then
                Begin
                     If GetRpcInfoDLL(Info_pcnfsd) Then Begin EnableGroupBoxPCNFSD;DisableGroupBoxLinux;End;
                End;
           End else EnableGroupBoxPCNFSD;
      End;
    3:Begin
            ButtonNext.Enabled:=True;
            IF RadioButtonAuto.checked then
           Begin
                IF GetRPC_Info(EditIP.Text) Then
                Begin
                     If not GetRpcInfoDLL(Info_pcnfsd) Then Begin DisableGroupBoxPCNFSD;EnableGroupBoxLinux;End;
                End;
           End Else EnableGroupBoxLinux;
      End;
    5:ButtonNext.Enabled:=True;
    6:Begin
            ButtonNext.Enabled:=FALSE;
            LabelIP1.Caption:=EditIP.Text;
            LabelUserName1.Caption:=EditUserName.Text;
            LabelUserID1.Caption:=EditUID.Text;
            LabelGroupID1.Caption:=EditGID.Text;
            labelFileRule1.Caption:=EditFileRule.Text;
            LabelDirRule1.Caption:=EditDirRule.TEXT;
            LabelComment1.Caption:=EditCOmment.TEXT;
            LabelUserMask.Caption:=EditUMask.Text;
      End;
    End;
End;


Procedure TAdressBookV2.ButtonOKOnClick (Sender: TObject);
VAR Index:Longint;
Begin
          AdressBookFileName:='NFSBOOK.DAT';
          OpenFile(NFSFile,AdressBookFilename,Data_Size);
          AdressBookData.IPAdress:=EditIP.Text;
          AdressBookData.UserName:=EditUserName.Text;
          AdressBookData.Password:=EditPassword.Text;
          AdressBookData.UID:=EditUID.Text;
          AdressBookData.GID:=EditGID.TEXT;
          AdressBookData.FileBit:=EditFileRule.Text;
          AdressBookData.DirBit:=EditDirRule.Text;
          AdressBookData.Comment:=EditComment.Text;
          AdressBookData.UMask:=EditUMask.Text;
          AdressBookData.UMaskUse:=cbUserMask.checked;

          AdressBookData.cbRespectCase:=cbRespectCase.checked;
          AdressBookData.cbCaseSensetiv:=cbCaseSensetiv.checked;
          AdressBookData.cblowercase:=cbLowerCase.checked;

     Index:=FileLen(NFSFile);
     IF Mode=ABEditMode_ADD Then AddRec(NFSFile,Index,AdressBookData)
                     else PutRec(NFSFile,UIndex,AdressBookData);
     CLoseFile(NFSFile);
End;

Function TAdressBookV2.ShowModal(EditMode:Byte;UserIndex:Longint):Longword;
Begin
     UIndex:=UserINdex;Mode:=EditMode;
     Case EditMode of
     ABEditMode_Add:
     Begin
          EditIP.Clear;
          EditUserName.Clear;
          EditPassword.Clear;
          EditUMask.Clear;
          IF GetEnv('NFS.PERMISSION.BITS')<>'' Then EditFileRule.Text:=GetEnv('NFS.PERMISSION.BITS') else EditFileRule.Text:='700';
          IF GetEnv('NFS.PERMISSION.DBITS')<>'' Then EditDirRule.Text:=GetEnv('NFS.PERMISSION.DBITS') else EditDirRule.Text:='700';
          IF GetEnv('UNIX.UID')<>'' then EditUID.Text:=GetEnv('UNIX.UID') else EditUID.Clear;
          IF GetEnv('UNIX.GID')<>'' Then EditGID.Text:=GetEnv('UNIX.GID') else EditGID.Clear;
          cbUserMask.checked:=FALSE;
          EditComment.Clear;
          cbRespectCase.checked:=FALSE;
          cbCaseSensetiv.checked:=FALSE;
          cblowerCase.checked:=FALSE;

     End;
     ABEditMode_Edit:
     Begin
          OpenFile(NFSFile,AdressBookFilename,Data_Size);
          GetRec(NFSFile,UserIndex,AdressBookData);
          EditIP.Text:=AdressBookData.IPAdress;
          EditUserName.Text:=AdressBookData.UserName;
          EditPassword.Text:=AdressBookData.Password;
          EditDirRule.Text:=AdressBookData.DirBit;
          EditFileRule.Text:=AdressBookData.FileBit;
          EditGID.Text:=AdressBookData.GID;
          EditUID.Text:=AdressBookData.UID;
          EditComment.Text:=AdressBookData.Comment;
          EditUMask.Text:=AdressBookData.UMask;
          cbUserMask.checked:=AdressBookData.UMaskUse;
          cbCaseSensetiv.checked:=AdressBookData.cbCaseSensetiv;
          cbRespectCase.checked:=AdressBookData.cbRespectCase;
          cblowercase.checked:=AdressBookData.cblowercase;
          CloseFile(NFSFile);
     End;
     End;
     Inherited.showModal;
     Result:=ModalResult;
End;

Procedure TAdressBookV2.ApplySettings;
Begin
     ButtonOKOnCLick(Nil);
End;



Procedure TAdressBookV2.AdressBookV2OnSetupShow (Sender: TObject);
Begin
     TabbedNotebook1.PageIndex:=0;
     //IF Paramstr(1)<>'\ADVANCED' Then TabbedNotebook1.Pages.delete(5);
End;

Procedure TAdressBookV2.ButtonPrevOnClick (Sender: TObject);
Begin
     TabbedNotebook1.PageIndex:=TabbedNotebook1.PageIndex-1;
End;

Procedure TAdressBookV2.ButtonNextOnClick (Sender: TObject);
Begin
  Try
  TabbedNotebook1.PageIndex:=TabbedNotebook1.PageIndex+1;
  Except
        {ApplySettings;
        ButtonNext.ModalResult:=CMOK;}
        TabbedNotebook1.PageIndex:=6;
  End;
End;

Initialization
  RegisterClasses ([TAdressBookV2, TTabbedNotebook, TGroupBox, TLabel, TImage,
    TEdit, TCheckBox, TBitBtn, TRadioButton, TButton]);
End.
