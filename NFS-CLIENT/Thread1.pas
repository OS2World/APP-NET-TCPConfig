Unit Thread1;

Interface

Uses
  Classes,Dialogs,bsedos,stdctrls;

Type
  ExeThread = Class(TThread)
  Private
    {Private Deklarationen hier einf�gen}
  Protected
    Procedure Execute; Override;
  Public
    Constructor Create(aLabel:Tlabel);
    FLabel:TLabel;
  End;

Implementation
IMPORTS
       Function DllExecNFSProg(ExeName:String;Parameter:String;LogFileName:String):Boolean; 'TCPLIB' NAME 'DllExecNFSProg';
End;
{ExeThread}

Procedure ExeThread.Create(aLabel:Tlabel);
Begin
End;

Procedure ExeThread.Execute;
VAR RC:Byte;
Begin
  {Thread Code hier einf�gen}
    FOr RC:=90 Downto 0 do
    Begin
    Beep(100,100);
    DosSleep(1000);
    IF Terminated then exit;
    aLabel.Caption:=ToStr(RC);
    End;
End;

Initialization
End.
