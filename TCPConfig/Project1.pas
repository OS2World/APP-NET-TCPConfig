Program Project1;

Uses
  Forms, Graphics, Unit1, DEBUGUnit, TCP_ProfileManager, TCP_NewIPWizard, TCP_SettingsNotebook,
TCP_SpecialSettingsNotebook, TCP_AutoActivateConfig, FileDialog, TCP_SOCKSWizard, TCP_ExceptionUnit,
TCP_HostlistWizard, TCP_DirChangeDialog, TCP_ServerServiceWizard, TCP_DNSWizard, TCP_NFSWizard, TCP_FinalNoteDialog, TCP_UserWizard,
TCP_BackupRestoreWizard, TCP_RoutingWizard;

{$r Project1.scu}

Begin
  Application.Create;
  Application.CreateForm (TForm1, Form1);
  Application.Run;
  Application.Destroy;
End.
