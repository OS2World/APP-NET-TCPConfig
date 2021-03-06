{
浜様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様�
�                                                                           �
� TCP_AutoActivateConfig Version 1                                          �
�                                                                           �
� Erstellt : 01.10.2006 - Letzte �nderung : 14.10.2006                      �
�                                                                           �
� Zum automatischen Aktivieren der Schnittstellen nach einer �nderung       �
�                                                                           �
�                                                                           �
藩様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様�
}



Unit TCP_AutoActivateConfig;

Interface

USES sysUtils, INet, StdCtrls,ExtCtrls ,Buttons,ComCtrls,Classes,Forms,Graphics,StdCtrls,Buttons,Messages,UString;


Type
  TExecuteForm = Class (TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    ListBoxParam: TListBox;
    ListBoxProg: TListBox;
    BitBtn1: TBitBtn;
    TCP1: TTCP;
    GroupBox3: TGroupBox;
    Memo1: TMemo;
    ButtonMultiCOmmand: TButton;
    ButtonSingleCommand: TButton;
    ButtonClearMemo: TButton;
    Label1: TLabel;
    Label2: TLabel;
    ButtonProgressFormTest: TButton;
    Label3: TLabel;
    LabelAliasIP: TLabel;
    Label4: TLabel;
    LabelAmountLoops: TLabel;
    Procedure ButtonProgressFormTestOnClick (Sender: TObject);
    Procedure ButtonMultiCOmmandOnClick (Sender: TObject);
    Procedure ButtonClearMemoOnClick (Sender: TObject);
    Procedure ButtonSingleCommandOnClick (Sender: TObject);
    Procedure ListBoxParamOnItemFocus (Sender: TObject; Index: LongInt);
    Procedure ListBoxProgOnItemFocus (Sender: TObject; Index: LongInt);
    Procedure ExecuteFormOnSetupShow (Sender: TObject);
  Private
    {Private Deklarationen hier einf�gen}
  Procedure ExecuteAllCommands;
  Procedure ExecuteCommand(Index:Longint);
  Public
    {�ffentliche Deklarationen hier einf�gen}
    Procedure Execute;
    Constructor Create; VIRTUAL;
    Destructor Destroy; VIRTUAL;
  End;

VAR
   ExecuteForm:TExecuteForm;

Implementation
USES TCP_Var_Unit,TCP_LanguageUnit,TCP_STDIOError,TCPUtilityUnit,MyMessageBox,TCP_FinalNoteDialog,TCP_IniFiles,DebugUnit;

     Type
         TConfigProgressForm = Class (TForm)
         Title1: TLabel;
         Image1: TImage;
         ProgressBar1: TProgressBar;
         ImageList1: TImageList;
         TCP1: TTCP;
    Procedure ConfigProgressFormOnSetupShow (Sender: TObject);
         Private
         Procedure Execute;
         Public
         Procedure ShowModal; Virtual;
     End;

   {DLL Importe hier einf�gen}
   Imports
   Function DelayExecDll(aString:String;aString2:String):Longint; 'TCPLIB' NAME 'DLLTest';
   Function ExecDLL(aString:String;aString2:String):Longint; 'TCPLIB' NAME 'DLLExecutePrg';
   End;



VAR
   ConfigProgressForm    :      TConfigProgressForm;
   ProgList              :      TStringlist;   // Stringlist wich contains the programs from the setup.cmd file
   ParamList             :      TStringlist;   // Stringlisz wich contains the parameter for the programs in setup.cmd file
   BMPCounter            :      Byte;           // Counts the amount of called BMP's from the immagelist
   LoopIndex             :      Byte;           // Loop Index counter for the  stringlists
   RC                    :      Longint;        // contains the returncode from the exec call in DLL
   LoopCount             :      Byte;

 {
浜様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様�
�                                                                           �
� This Section : Copy Entry Procedure                                       �
�                                                                           �
� This will read and split the entrys from setup.cmd into 2                 �
�                                                                           �
� Stringlists for later executen                                            �
�                                                                           �
� created 15.11.2005 , last changed 01.10.2006                              �
藩様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様�
}
 Procedure CopyEntrys;
 Label Ausgang;

 VAR
    SetupCMDFIle:System.Text;
    SetupTXT:String;
    IOError:Longint;
    ExeStr : String;
    ParamStr:String;

    Function FindInString(StringToSearch:String):Boolean;
    Var Counter:Byte;
        Begin
              Counter:=1;Result:=False;
              Repeat
                   IF copy(SetupTXT,counter,length(StringToSearch))=StringToSearch Then
                   Begin
                        Result:=True;
                        //ExeStr:=ProgramSettings.EditBinText+'\'+Copy( SetupTXT,1,length(StringToSearch) )+'.EXE';
                          ExeStr:=Application.ProgramIniFile.ReadString('Settings','MPTN_BIN_PATH','')+'\'+Copy( SetupTXT,1,length(StringToSearch) )+'.EXE';
                      ParamStr:=Copy( SetupTXT,length(StringToSearch)+2,length(SetupTXT) );
                      Exit;
                   ENd;
                   Inc(Counter);
              Until (Counter=255);
        End;

     Procedure DisplayIOError;
     Begin
         FileOpenError(IOError,'SETUP.CMD');
     End;

     Function OpenFile:Boolean;
     Begin
          {$I-}
          System.Assign(SetupCMDFile,Application.ProgramIniFile.ReadString('Settings','MPTN_BIN_PATH','')+'\SETUP.CMD');
          ReSet(SetupCMDFIle);
          IOERROR:=IOResult;IF IOERROR<>0 Then Begin Result:=FALSE;DisplayIOError;End else Result:=TRUE;

     End;

     Procedure SplitEntrys;
     Begin
          IF Copy(Uppercase(SetupTXT),1,3)='REM' Then exit; // Do not add REM statements to the execute list
          IF FindInString('route') Then Begin ProgList.add(ExeStr);ParamList.add(ParamStr);End;
          IF FindInString('arp') Then Begin   ProgList.add(ExeStr);ParamList.add(ParamStr);End;
          IF FindInString('ifconfig') Then Begin ProgList.add(ExeStr);ParamList.add(ParamStr);End;
          IF FindInString('ipgate') Then Begin   ProgList.add(ExeStr);ParamList.add(ParamStr);End;
          if findinstring('dhcpstrt') Then Begin ProgList.add(ExeStr);ParamList.add(ParamStr);End;
     End;

 Begin
      ProgList.Clear;
      ParamList.Clear;
      IF OpenFile Then
      Begin
           While not eof(SetupCMDFIle) do
           Begin
                Readln(SetupCMDFile,SetupTXT);IOError:=IOResult;IF IOError<>0 Then Begin FileReadError(IOError,'SETUP.CMD');Goto Ausgang;End;
                SplitEntrys;
           End;

       Ausgang:
       System.Close(SetupCMDFile);
      End;


 End;



 {
浜様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様�
�                                                                           �
� This Section :                                                            �
�                                                                           �
� TConfigProgressForm                                                       �
� Displayes animated progress on screen                                     �
藩様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様�
}


Procedure TConfigProgressForm.ConfigProgressFormOnSetupShow (Sender: TObject);
Begin
     Caption:=GetNlsString('FormActivateConfig','Caption');
     Title1.Caption:=GetNlsString('FormActivateConfig','title');
End;

Procedure TConfigProgressForm.Execute;
VAR
   UIni:TOs2UserIniFile;


   Procedure DoExecute(DelayCall:Boolean);
     Begin
          For LoopIndex:=0 to ProgList.count-1 do
          Begin

              Inc(BMPCounter);IF BMPCounter=4 Then BMPCounter:=0; // IF the 4th BMP is arrived, switch back to 0

                Update;                  // Update The Bitmap on screen

                ExecuteForm.Memo1.Lines.add(ProgList[LoopIndex]+' '+ParamList[LoopIndex]);

                IF DelayCall Then RC:=DelayExecDLL(ProgList[LoopIndex],ParamList[LoopIndex])
                             else RC:=ExecDLL(ProgList[LoopIndex],ParamList[LoopIndex]);

                ExecuteForm.Memo1.Lines.Add('Return Code : '+toStr(RC));

               ImageList1.GetBitmap(BMPCounter,Image1.Bitmap);        // Get Bitmap from list

               IF RC<>0 Then
               Begin
                    NLSErrorBox('EXEC_Error'+#13+ProgList[LoopIndex]+#13+SysErrorMessage(RC));Halt;
               End;

               IF DelayCall Then ProgressBar1.Position:=Prozent(LoopIndex,ProgList.count-1);
          End;
     End;

VAR UIniResult:String;
Begin
     LoopCount:=0;
     {
     UIni.Create;
     UIniResult:=UIni.ReadString('TCPConfig','HomeIP','');    // Get HomeIP from UserIni
     IF UIniResult='-1' Then UIniResult:='';                  // Should there be no HOMEIP Setuped or -1 stored , reset the result to empty String - 15.10.2006
     }
     UIniResult:=DebugForm.EditHomeIP.Text;
     IF UIniResult='-1' Then UIniResult:='';

     IF UIniResult<>'' Then
     Begin
          DoExecute(TRUE);
          REPEAT
                DOExecute(FALSE);
                Inc(LoopCount);
          UNTIL  (TCP1.LocalIP=UIniResult) or (LoopCount=20);
          IF LoopCOunt=20 Then ChangeRec.IFAliasError:=True else ChangeRec.IFAliasError:=FALSE;
     End else
     Begin
          DoExecute(TRUE);
     End;

End;

Procedure TConfigProgressForm.ShowModal;
Begin
     BMPCounter:=0;
     ImageList1.GetBitmap(0,Image1.Bitmap);
     Show;
     Execute;
     DisMissDlg(CMOK);
End;

{
浜様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様�
�                                                                           �
� Execute Settings                                                          �
�                                                                           �
� Executes the entrys via DLL Call stored into the DebugExecForm  listbox   �
� (replaces execute setup.cmd call)                                         �
藩様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様�
}

Procedure TExecuteForm.ButtonProgressFormTestOnClick (Sender: TObject);
Begin
     ConfigProgressForm.Create(Self);
     ConfigProgressForm.ShowModal;
     ConfigProgressForm.Destroy;
     LabelAmountLoops.Caption:=ToStr(LoopCount);
     IF ChangeRec.IFAliasError Then MyInfoBox('Alias IP konnte nicht zugewiesen werden');
End;

Procedure TExecuteForm.ButtonMultiCOmmandOnClick (Sender: TObject);
Begin
     ExecuteAllCommands;
End;

Procedure TExecuteForm.ButtonClearMemoOnClick (Sender: TObject);
Begin
  Memo1.Clear;
End;

Procedure TExecuteForm.ExecuteCommand(Index:Longint);
VAR RC:Longint;
Begin
     Memo1.Lines.add('Ausf�hren von Befehl :');
     Memo1.Lines.add(ProgList[Index]+' '+ParamList[Index]);
     RC:=ExecDLL(ProgList[Index],ParamList[Index]);
     Memo1.Lines.add('Return code : '+ToStr(RC));
End;

Procedure TExecuteForm.ExecuteAllCommands;
vAR Loop:Byte;
Begin
   for loop:=0 to proglist.count-1 do
   begin
       ExecuteCommand(Loop);
   end;
   Label2.Caption:=TCP1.LocalIP;
END;

Procedure TExecuteForm.ButtonSingleCommandOnClick (Sender: TObject);
Begin
     ExecuteCommand(ListBoxProg.ItemIndex);
     Label2.Caption:=TCP1.LocalIP;
End;

Procedure TExecuteForm.ListBoxParamOnItemFocus (Sender: TObject;
  Index: LongInt);
Begin
     ListBoxProg.ItemIndex:=Index;
End;

Procedure TExecuteForm.ListBoxProgOnItemFocus (Sender: TObject;
  Index: LongInt);
Begin
     ListBoxParam.ItemIndex:=Index;
End;

Procedure TExecuteForm.ExecuteFormOnSetupShow (Sender: TObject);
Begin
     ListBoxProg.items:=ProgList;
     ListBoxParam.Items:=ParamList;

     IF DebugForm.EditHomeIP.Text<>'' Then LabelAliasIP.Caption:='Ja (IP='+DebugFOrm.EditHomeIP.Text+')'
                                               else LabelAliasIP.Caption:='Nein';
End;



Procedure TExecuteForm.Execute;
Begin
     COnfigProgressForm.Create(Self);
     COnfigProgressFOrm.ShowModal;
     ConfigProgressForm.Destroy;
     {FormFinalNote.Create(Self);
     FormFinalNote.ShowModal;
     FormFinalNote.Destroy;}
End;




 Constructor TExecuteForm.Create;
 Begin
      // Create the Stringlists needed for storing the splitted comands from setup.cmd
      ProgList.Create;
      ParamList.Create;
      CopyEntrys;
      inherited.Create(Nil);
      Label2.Caption:=TCP1.LocalIP;
 End;

Destructor TExecuteForm.Destroy;
Begin
     ProgList.Destroy;
     ParamList.Destroy;
     inherited.Destroy;

End;

Initialization
  RegisterClasses ([TExecuteForm, TGroupBox, TListBox, TBitBtn, TTCP, TMemo,TButton,TConfigProgressForm, TLabel, TImage, TProgressBar, TImageList]);
End.
