Unit NFS_AdressWizard;

Interface

Uses
  Classes, Forms, Graphics, TabCtrls, StdCtrls, ExtCtrls, Buttons,Dialogs,messages;

Type
  TAdressWizard = Class (TForm)
    NoteBook1: TNoteBook;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    GroupBox9: TGroupBox;
    Label16: TLabel;
    LabelIP: TLabel;
    Label18: TLabel;
    LabelUserName: TLabel;
    Label20: TLabel;
    LabelUserID: TLabel;
    Label22: TLabel;
    LabelComment: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    LabelGroupID: TLabel;
    Label28: TLabel;
    GroupBox8: TGroupBox;
    Image3: TImage;
    Label13: TLabel;
    GroupBox7: TGroupBox;
    Image4: TImage;
    GroupBox3: TGroupBox;
    Label7: TLabel;
    Image2: TImage;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label17: TLabel;
    Label19: TLabel;
    Image5: TImage;
    Label21: TLabel;
    Label23: TLabel;
    GroupBox10: TGroupBox;
    Label12: TLabel;
    GroupBox5: TGroupBox;
    Image1: TImage;
    Label3: TLabel;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    EditIP: TEdit;
    Label5: TLabel;
    EditUsername: TEdit;
    Label6: TLabel;
    EditPassword: TEdit;
    EditGID: TEdit;
    EditComment: TEdit;
    Label27: TLabel;
    EditFileRule: TEdit;
    Label33: TLabel;
    EditDirRule: TEdit;
    Label34: TLabel;
    Label35: TLabel;
    LabelFileRule: TLabel;
    LabelDirRule: TLabel;
    GroupBox11: TGroupBox;
    Label2: TLabel;
    Label32: TLabel;
    Label31: TLabel;
    GroupBox6: TGroupBox;
    Label30: TLabel;
    EditUID: TEdit;
    Label29: TLabel;
    GroupBox4: TGroupBox;
    NextButton: TButton;
    CancelButton: TButton;
    PrevButton: TButton;
    Button1: TButton;
    Procedure CancelButtonOnClick (Sender: TObject);
    Procedure Button1OnClick (Sender: TObject);
    Procedure NoteBook1OnPageChanged (Sender: TObject);
    Procedure AdressWizardOnSetupShow (Sender: TObject);
    Procedure PrevButtonOnClick (Sender: TObject);
    Procedure NextButtonOnClick (Sender: TObject);
    Procedure Label2OnClick (Sender: TObject);
  Private
    {Private Deklarationen hier einf�gen}
  Public
    {�ffentliche Deklarationen hier einf�gen}
    AddMode:Boolean; // TRUE = Hinzuf�gen / FALSE = Edit
    UserIndex:Longint;
    Procedure Apply;
  End;

Var
  AdressWizard: TAdressWizard;
Implementation
USES NFS_VAR_Unit,MyMessageBox,NFS_ToolBox,DOS,NFS_IniFiles;

VAR NFSFile:DataFile;

Procedure TAdressWizard.CancelButtonOnClick (Sender: TObject);
Begin
     DismissDlg(CMCancel);
End;

Procedure TAdressWizard.Button1OnClick (Sender: TObject);
VAR LL:Longint;
Begin
     LL:=Sizeof(NFS_Server_Rec);
     MyInfoBox(ToStr(LL));
End;

Procedure TAdressWizard.Apply;
VAR Index:Longint;
Begin
     OpenFile(NFSFile,AdressBookFilename,Data_Size);
     With AdressBookData do
     begin
          IPAdress:=EditIP.Text;
          UserName:=EditUserName.Text;
          Password:=EditPassword.Text;
          UID:=EditUID.Text;
          GID:=EditGID.TEXT;
          FileBit:=EditFileRule.Text;
          DirBit:=EditDirRule.Text;
          Comment:=EditComment.Text;
     End;
     Index:=FileLen(NFSFile);
     //IF AddMode then ShowMessage('TRUE') else ShowMessage('FALSE'+#13+ToStr(UserIndex));
     IF AddMode Then AddRec(NFSFile,Index,AdressBookData)
                     else PutRec(NFSFile,UserIndex,AdressBookData);
     CLoseFile(NFSFile);
End;

Procedure TAdressWizard.NoteBook1OnPageChanged (Sender: TObject);
Begin
     Case Notebook1.PageIndex of
     0:begin NextButton.Caption:='~Weiter';PrevButton.Enabled:=FALSE;End;
     1:PrevButton.Enabled:=True;
     2:NextButton.Caption:='~Weiter';
     4:Begin
            LabelIP.Caption:=EditIP.Text;
            LabelUserName.Caption:=EditUserName.Text;
            LabelUserID.Caption:=EditUID.Text;
            LabelGroupID.Caption:=EditGID.Text;
            labelFileRule.Caption:=EditFileRule.Text;
            LabelDirRule.Caption:=EditDirRule.TEXT;
            LabelComment.Caption:=EditCOmment.TEXT;
            NextButton.Caption:='~Fertig';
       End;
     5:Begin Apply;DIsmissDlg(CmOK);End;
     End;
End;

Procedure TAdressWizard.AdressWizardOnSetupShow (Sender: TObject);
Begin
     Notebook1.PageIndex:=0;
     IF AddMode Then
     Begin
          EditIP.Clear;
          EditUserName.Clear;
          EditPassword.Clear;
          IF GetEnv('NFS.PERMISSION.BITS')<>'' Then EditFileRule.Text:=GetEnv('NFS.PERMISSION.BITS') else EditFileRule.Text:='700';
          IF GetEnv('NFS.PERMISSION.DBITS')<>'' Then EditDirRule.Text:=GetEnv('NFS.PERMISSION.DBITS') else EditDirRule.Text:='700';
          IF GetEnv('UNIX.UID')<>'' then EditUID.Text:=GetEnv('UNIX.UID') else EditUID.Clear;
          IF GetEnv('UNIX.GID')<>'' Then EditGID.Text:=GetEnv('UNIX.GID') else EditGID.Clear;
          EditComment.Clear;
     End
     else
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
          CloseFile(NFSFile);
     End;
End;

Procedure TAdressWizard.PrevButtonOnClick (Sender: TObject);
Begin
    Notebook1.PageIndex:=Notebook1.PageIndex-1;
End;

Procedure TAdressWizard.NextButtonOnClick (Sender: TObject);
Begin
     Notebook1.PageIndex:=Notebook1.PageIndex+1;
End;

Procedure TAdressWizard.Label2OnClick (Sender: TObject);
Begin

End;

Initialization
  RegisterClasses ([TAdressWizard, TNoteBook, TGroupBox, TLabel, TImage, TEdit, TButton
   ]);
End.
