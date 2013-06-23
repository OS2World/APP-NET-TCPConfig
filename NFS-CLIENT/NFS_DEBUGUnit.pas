Unit NFS_DEBUGUnit;

Interface

Uses
  Classes, Forms, Graphics, TabCtrls, StdCtrls, Buttons,NFS_IniFiles,MyMessageBox;

Type
  TDebugForm = Class (TForm)
    TabbedNotebook1: TTabbedNotebook;
    Memo1: TMemo;
    Button1: TButton;
    Procedure Button1OnClick (Sender: TObject);
  Private
    {Private Deklarationen hier einf�gen}
  Public
    {�ffentliche Deklarationen hier einf�gen}
  End;

Var
  DebugForm: TDebugForm;

Implementation



USES NFS_VAR_Unit,Dialogs;


Procedure TDebugForm.Button1OnClick (Sender: TObject);
Begin
     DeleteOs2IniKey;
     MyInfoBox('Alle Eintr�ge in OS2USER.INI wurden gel�scht ! Programm neu starten !');
     Halt;
End;

Initialization
  RegisterClasses ([TDebugForm, TTabbedNotebook, TMemo
   , TButton]);
End.
