Unit TCP_IniFiles;

   {
  SibylVP2 Project (C) 2001 os2.ru team
  
 This program is free software; you can redistribute it and/or modify it  
 under the terms of the GNU Library General Public License (LGPL) as      
 published by the Free Software Foundation; either version 2 of the       
 License, or (at your option) any later version. This program is          
 distributed in the hope that it will be useful, but WITHOUT ANY          
 WARRANTY; without even the implied warranty of MERCHANTABILITY or        
 FITNESS FOR A PARTICULAR PURPOSE.                                        
 See the GNU Library General Public License for more details. You should  
 have received a copy of the GNU Library General Public License along     
 with this program; if not, write to the Free Software Foundation, Inc.,  
 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.                 
  
  
  $Log: INIFILES.PAS,v $
  Revision 1.1  2002/05/14 11:27:34  ktk
  Modified for TCP Project on 2004/02/06
  Import

  
}

{浜様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様融
 �                                                                          �
 �     Sibyl Portable Component Classes                                     �
 �                                                                          �
 �     Copyright (C) 1995,99 SpeedSoft Germany,   All rights reserved.      �
 �                                                                          �
 藩様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様夕}

{浜様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様融
 �                                                                          �
 � 12.03.2005 neue TASCII Funktion "NEWRead" hinzugef�gt                    �
 � 30.07.2005 2 Neue Typen  "OS2UserIni" und "OS2SysIni"                    �
 � 30.09.2006 neue TIniFile Funktionen "ReadStrings/WriteStrings" eingebaut �
 � 30.09.2006 neue Funktion "containSections" eingebaut                     �
 � Copyright (C) 1995,99 SpeedSoft GbR, Germany                             �
 �                                                                          �
 �                                                                          �
 �                                                                          �
 �                                                                          �
 藩様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様夕}


Interface

{ TIniFiles: Standard (bin�res) OS/2 Inifile
  TAsciiIniFile: Text-Inifile, lesbar, mit Editor zu bearbeiten.

  Beide benutzen exakt das gleiche Interface und sind bis
  auf Die neue Methode 'Erase' kompatibel zu den normalen
  Delphi-IniFiles. }

Uses Classes,SysUtils,ustring;

{$IFDEF OS2}
Uses PMSHL; { OS/2 profile functions }
{$ENDIF}
{$IFDEF Win32}
Uses WinBase;
{$ENDIF}

CONST
     IniFMOpen=100;
     iniFMCreate=110;
     IniFMOpenCreate=120;

Type
  EIniFileError = Class(Exception);

Type
  TIniFiles = Class(TObject)
  Private
    FFileName: PString;         // Physical Name Of File
    {$IFDEF OS2}
    //FHandle: HINI;              // profile Handle
    {$ENDIF}
    Function GetFileName: String;

  Protected
    Procedure Error(Const Msg: String); Virtual;
    EMessage: Boolean;           // Display or display not a errormasse if an .ini file could not be opened

  Public
    Constructor Create(Const FileName: String);Virtual;
    Destructor Destroy; Override;
    Procedure Erase(Const section, Ident: String); Virtual;
    Procedure EraseSection(Const section: String); Virtual;
    Function ReadString(Const section, Ident, Default: String): String; Virtual;
    Function ContainSection(aSection:String):Boolean;
    Procedure ReadStrings(Const section, Ident: String; AStrings : tStrings);
    Procedure ReadPathStrings(Const section, Ident: String; AStrings : tStrings);
    Function ReadInteger(Const section, Ident: String; Default: LongInt): LongInt; Virtual;
    Function ReadBool(Const section, Ident: String; Default: Boolean): Boolean; Virtual;
    Procedure ReadSection(Const section: String; AStrings: TStrings); Virtual;
    Procedure ReadSections(AStrings: TStrings);
    Procedure ReadSectionValues(Const section: String; AStrings: TStrings); Virtual;
    Procedure WriteString(Const section, Ident, Value: String); Virtual;
    Procedure WriteStrings(Const section, Ident: String; AStrings : tStrings);
    Procedure WriteInteger(Const section, Ident: String; Value: LongInt); Virtual;
    Procedure WriteBool(Const section, Ident: String; Value: Boolean); Virtual;

    Property FileName: String
      Read GetFileName;
      FHandle: HINI;              // profile Handle
    Property ErrMessage:Boolean Read EMessage Write EMessage;
  End;

Type
  {$HINTS OFF}
  TAsciiIniFile = Class(TIniFiles)
  Private
    //FFileName: PString;         // Physical Name Of File
    FSections: TStringList;     // List Of Sections And their Names
    FName: PString;             // Name Of Last used section
    FList: TStringList;         // List Of Last used section
    FChanged: Boolean;          // has the Data been changed?
    CustomIni:Text;
    ReadedIniString:String;
    Procedure WriteToSection(Const section: String);
    Function ReadFromSection(Const section: String): Boolean;
    Function OpenCustomIni:Boolean;
    Function FindSection(const section:String):Boolean;
    Function FindIdent(aIdent:String):Boolean;
    //Function GetFileName: String;

  Protected
    TrueString: String[7];
    FalseString: String[7];
    SectionSort: Boolean;
    IdentSort: Boolean;
  Protected
    Procedure IniTIniFiles;Virtual;

  Public
    Constructor Create(Const FileName: String);Virtual;
    Destructor Destroy; Override;
    Procedure Erase(Const section, Ident: String); Override;
    Procedure EraseSection(Const section: String); Override;
    Function NewReadString(Const section, Ident:String; Return:TSTrings):Boolean;
    Function NewReadSection(Const section:String;AString:TStrings):Boolean;
    Function MyReadString(Const section, Ident: String;VAR Return:String): Boolean;
    Function ReadString(Const section, Ident, Default: String): String; Override;
    Function ReadInteger(Const section, Ident: String; Default: LongInt): LongInt; Override;
    Function ReadBool(Const section, Ident: String; Default: Boolean): Boolean; Override;
    Procedure ReadSection(Const section: String; AStrings: TStrings); Override;
    Procedure ReadSections(AStrings: TStrings);
    Procedure ReadSectionValues(Const section: String; AStrings: TStrings); Override;
    Procedure Refresh;
    Procedure WriteString(Const section, Ident, Value: String); Override;
    Procedure WriteInteger(Const section, Ident: String; Value: LongInt); Override;
    Procedure WriteBool(Const section, Ident: String; Value: Boolean); Override;

    Property FileName: String
      Read GetFileName;
    Property changed: Boolean
      Read FChanged Write FChanged;
  End;
  {$HINTS ON}

Function GetDefaultINI: String;
  { Get Name Of INI-File that matches Program Path & Name With
    extension .INI instead Of .EXE }

   TYPE
      TOs2UserIniFile=Class(TIniFiles)
      Constructor Create;VIRTUAL;
      Destructor Destroy;OVERRIDE;
  End;

  Type TOS2SystemIniFIle=Class(TIniFIles)
  Constructor Create; VIRTUAL;
  Destructor  Destroy; OVERRIDE;
  End;

  Type TMyIni=Class(TIniFiles)
  Constructor Create(aFilename:STring;Mode:Byte); Virtual;

  End;
  Procedure DeleteOs2IniKey;
Implementation

Uses
  SysUtils,TCP_VAR_Unit,DOS,MyMessageBox,Dialogs;

Const
  Null = 0;

Type
  {$HINTS OFF}
  TIniSection = Class(TStringList)
    Private
        Function GetValue(Const Name: String): String;
        Procedure SetValue(Const Name, Value: String);
        Function FindValue(Const Name: String; Var Value: String): LongInt;
        Procedure FreeItem(AObject:TObject);Override;
        Property values[Const Name: String]: String Read GetValue Write SetValue;
  End;
  {$HINTS ON}

 

Function FileSplit(S:String;Mode:Byte):String;
var dirstr,namestr,extstr:String;
{
MODE Schalter : 1=Nur Verzeichniss Name wird zur�cggeliefert
                2=Nur Name+Extension des Dateinamens wird zur�ckgelifert (ohne Pfad)
                3=Nur die Extension
                4=Nur den Dateinamen
}

begin
     Fsplit(S,dirstr,namestr,extstr);
     IF length(dirstr)=3 Then DirStr:=DirStr+'\';
     setlength(dirstr,length(dirstr)-1);
     Case mode of
     1:Result:=dirStr;
     2:Result:=NameStr+ExtStr;
     3:Begin Result:=UPperCase(ExtStr);End;
     4:Result:=NameStr;
     End;
End;

Function CutStr(Var S: String; C: Char): String;
Var
  P: Integer;
Begin
  P := Pos(C, S);
  If P = 0 Then
  Begin
    Result := S;
    SetLength(S, 0);
  End
  Else
  Begin
    Result := Copy(S, 1, P - 1);
    Delete(S, 1, P);
  End;
End;

Function TrimStr(Const S: String): String;
Var
  L, R: Integer;
Begin
  R := Length(S);
  While (R > 0) And (S[R] = ' ') Do Dec(R);
  L := 1;
  While (L <= R) And (S[L] = ' ') Do Inc(L);
  Result := Copy(S, L, R - L + 1);
End;

Function GetDefaultINI: String;
Begin
  Result := ExpandFileName(ChangeFileExt(ParamStr(0), '.INI'));
End;

{ TIniSection }

Procedure TIniSection.FreeItem(AObject:TObject);
Var
  P: PString;
Begin
  P := PString(AObject);
  DisposeStr(P);
  Inherited FreeItem(AObject);
End;

{Procedure TIniSection.Put(Index: LongInt; Const S: String);
Var
  Ident, Value: String;
Begin
  Value := S;
  Ident := CutStr(Value, '=');
  SetValue(Ident, Value);
End;}

Function TIniSection.GetValue(Const Name: String): String;
Var
  I: LongInt;
Begin
  If Find(Name, I) Then Result := PString(Objects[I])^
  Else Result := '';
End;

Function TIniSection.FindValue(Const Name: String; Var Value: String): LongInt;
VAR Ret:longint;
Begin
  {If Find(Name, Result) Then Value := PString(Objects[Result])^
  Else
  Begin
    Value := '';
    Result := -1;
  End;}
  Ret:=IndexOF(Name);IF ret<>-1 Then Value := PString(Objects[Ret])^;
  Result:=ret;
End;

Procedure TIniSection.SetValue(Const Name, Value: String);
Var
  I: LongInt;
  P: PString;
  OldSorted: Boolean;
Begin
  If Find(Name, I) Then
  Begin
    P := PString(Objects[I]);
    DisposeStr(P);
    PutObject(I, TObject(NewStr(Value)));
  End
  Else
  Begin
    OldSorted := sorted;
    sorted := False;
    InsertObject(I, Name, TObject(NewStr(Value)));
    sorted := OldSorted;
  End;
End;

{ TIniFiles }


Constructor TIniFiles.Create(Const FileName: String);
Begin
  {$IFDEF OS2}
  FHandle := PrfOpenProfile(AppHandle, FileName);
  {IF EMessage Then
  Begin
       If FHandle = Null Then begin ErrorBox2('Can not open requested INI File : '+#13+Filename+#13+'Please check if this file is present and , not write protected.'+#13+'Program terminated.');Halt;End;
  End;}
  {$ENDIF}
  FFileName := NewStr(FileName);
End;

Destructor TIniFiles.Destroy;
Begin
  {$IFDEF OS2}
  PrfCloseProfile(FHandle);
  {$ENDIF}
  DisposeStr(FFileName);

  Inherited Destroy;
End;

Procedure TIniFiles.Erase(Const section, Ident: String);
VAR RC:Boolean;
Begin
  {$IFDEF OS2}
  rc:=PrfWriteProfileString(FHandle, section, Ident, Nil);
  {$ENDIF}
  {$IFDEF Win32}
  WritePrivateProfileString(section,Ident,Nil,FileName);
  {$ENDIF}
End;

Procedure TIniFiles.EraseSection(Const section: String);
VAR RC:Boolean;
Begin
  {$IFDEF OS2}
  Rc:=PrfWriteProfileString(FHandle, section, Nil, Nil);
  {$ENDIF}
  {$IFDEF Win32}
  WritePrivateProfileString(section,Nil,Nil,FileName);
  {$ENDIF}
End;

Procedure TIniFiles.Error(Const Msg: String);
Begin
  Raise EIniFileError.Create(Msg);
End;

Function TIniFiles.GetFileName: String;
Begin
  TRY
  Result := FFileName^;
  Except Raise Exception.Create('Error on accessing variable FFileName^'+#13+'Error in Unit NW_IniFiles, Function GetFileName');
  End;
End;

Function TIniFiles.ReadString(Const section, Ident, Default: String): String;
Var
  OutBuf: cstring;
Begin
  {$IFDEF OS2}
  Fillchar(OutBuf, 255, 0); {sometimes the #0 character is not copied (cdp.ini)}
  PrfQueryProfileString(FHandle, Section, Ident, Default, OutBuf, 255);
  Result := OutBuf;
  {$ENDIF}
  {$IFDEF Win32}
  SetLength(Result,GetPrivateProfileString(
    Section,Ident,Default,cstring(Result[1]),255,FileName));
  {$ENDIF}
End;

Procedure TIniFiles.ReadStrings(Const section, Ident: String; AStrings : tStrings);

Var Anz  : LongInt;
    Cou  : LongInt;

Begin
  AStrings.Clear;
  Anz:=ReadInteger(section, Ident+'_Anz', AStrings.Count-1);
  //Anz:=ReadInteger(section, Ident+'_Anz', -1);
  if Anz = -1 then Begin Raise Exception.Create('IniFiles : Section or Ident not found in ReadStrings Command !');Halt;End;
  for Cou:=0 to Anz-1 do
    AStrings.Add(ReadString(section, Ident+ '_' + tostr(Cou), ''));
End;

Procedure TIniFiles.ReadPathStrings(Const section, Ident: String; AStrings : tStrings);

Var Anz  : LongInt;
    Cou  : LongInt;
    aString:String;

Begin
  AStrings.Clear;
  Anz:=ReadInteger(section, Ident+'_Anz', AStrings.Count-1);
  //Anz:=ReadInteger(section, Ident+'_Anz', -1);
  if Anz = -1 then Begin Raise Exception.Create('IniFiles : Section or Ident not found in ReadStrings Command !');Halt;End;
  for Cou:=0 to Anz-1 do
  Begin
       aString:=ReadString(section, Ident+ '_' + tostr(Cou), '');
       IF aString='' Then Begin Raise Exception.Create('Unable to find section or ident in ReadPathString');Halt;ENd;
     AStrings.Add(Filesplit(aString,2));
  End;
End;

Function TIniFiles.ReadInteger(Const section, Ident: String; Default: LongInt): LongInt;
Begin
  {$IFDEF OS2}
  Result := PrfQueryProfileInt(FHandle, section, Ident, Default);
  {$ENDIF}
  {$IFDEF Win32}
  Result := GetPrivateProfileInt(section,Ident,Default,FileName);
  {$ENDIF}
End;

Function TIniFiles.ReadBool(Const section, Ident: String; Default: Boolean): Boolean;
Var
  L: LongInt;
Begin
  If Default Then L := 1 Else L := 0;
  {$IFDEF OS2}
  Result := (PrfQueryProfileInt(FHandle, section, Ident, L) <> 0);
  {$ENDIF}
  {$IFDEF Win32}
  Result := (GetPrivateProfileInt(section,Ident,L,FileName) <> 0);
  {$ENDIF}
End;


Procedure TIniFiles.ReadSection(Const section: String; AStrings: TStrings);
Var
  Size, RealSize: LongWord;
  Buffer, Pos: PChar;
  S: String;
Begin
  {$IFDEF OS2}
  If Not PrfQueryProfileSize(FHandle, section, Nil, Size) Then Exit;
  If Size=0 Then exit;
  {$ENDIF}
  {$IFDEF Win32}
  //??????????????????????????????????????????????????????????
  Size:=8192;
  {$ENDIF}
  GetMem(Buffer, Size);
  Try
    {$IFDEF OS2}
    PrfQueryProfileString(FHandle, section, Nil, Nil, Buffer^, Size);
    Buffer[Size - 1] := #0;
    {$ENDIF}
    {$IFDEF Win32}
    Buffer[GetPrivateProfileString(section,Nil,Nil,Buffer^,Size,FileName)-1] := #0;
    {$ENDIF}
    Pos := Buffer;
    While Pos[0] <> #0 Do
    Begin
      S := StrPas(Pos);
      Inc(Pos, Length(S) + 1);
      Dec(RealSize, Length(S) + 1);
      AStrings.Add(S);
    End;
  Finally
    FreeMem(Buffer, Size);
  End;
End;

Function TIniFiles.ContainSection(aSection:String):Boolean;
VAR aSectionList:TStringList;
Begin
     aSectionList:=aSectionList.Create;
     ReadSections(aSectionList);
     IF aSectionList.Indexof(aSection)=-1 Then Result:=FALSE else Result:=True;
     aSectionList.Destroy;
End;

Procedure TIniFiles.ReadSections(AStrings: TStrings);
Var
  Size, RealSize: LongWord;
  Buffer, Pos: PChar;
  S: String;
Begin
  Size:=8192;
  GetMem(Buffer, Size);
  Try
    {$IFDEF OS2}
    PrfQueryProfileString(FHandle, Nil, Nil, Nil, Buffer^, Size);
    Buffer[Size - 1] := #0;
    {$ENDIF}
    Pos := Buffer;
    While Pos[0] <> #0 Do
    Begin
      S := StrPas(Pos);
      Inc(Pos, Length(S) + 1);
      Dec(RealSize, Length(S) + 1);
      AStrings.Add(S);
    End;
  Finally
    FreeMem(Buffer, Size);
  End;
End;

Procedure TIniFiles.ReadSectionValues(Const section: String; AStrings: TStrings);
Var
  Temp: TIniSection;
  I: LongInt;
Begin
  Temp := TIniSection.Create;
  Temp.sorted := True;
  Temp.Duplicates := dupIgnore;
  Try
    ReadSection(section, Temp);
    For I := 0 To Temp.Count - 1 Do
      AStrings.values[Temp.Strings[I]]:=ReadString(section, Temp.Strings[I], '');
  Finally
    Temp.Destroy;
  End;
End;

Procedure TIniFiles.WriteString(Const section, Ident, Value: String);
Var
  CSection, CIdent, CValue: cstring[256];
Begin
  CSection := section;
  CIdent := Ident;
  CValue := Value;
  {$IFDEF OS2}
  If Not PrfWriteProfileString(FHandle, CSection, CIdent, CValue) Then
    Error(LoadNLSStr(SWriteError)+'.');
  {$ENDIF}
  {$IFDEF Win32}
  If Not WritePrivateProfileString(CSection,CIdent,CValue,FileName) Then
    Error(LoadNLSStr(SWriteError)+'.');
  {$ENDIF}
End;


Procedure TIniFiles.WriteStrings(Const section, Ident: String; AStrings : tStrings);

var Cou : LongInt;

Begin
  EraseSection(section);
  WriteInteger(section, Ident+'_Anz', AStrings.Count);
  for cou:=0 to AStrings.Count-1 do
    WriteString(section, Ident+ '_' + tostr(Cou), AStrings.Strings[Cou])
End;

Procedure TIniFiles.WriteInteger(Const section, Ident: String; Value: LongInt);
Begin
  WriteString(section, Ident, IntToStr(Value));
End;

Procedure TIniFiles.WriteBool(Const section, Ident: String; Value: Boolean);
Var
  C: Char;
Begin
  If Value Then C := '1' Else C := '0';
  WriteString(section, Ident, C);
End;

{ TAsciiIniFile }

Constructor TAsciiIniFile.Create(Const FileName: String);
Var
  Source: Text;
  S, T: String;
Begin
  SectionSort := False;
  IdentSort := False;

  IniTIniFiles;

  FSections := TStringList.Create;
  FSections.Duplicates := dupIgnore;
  FSections.sorted := SectionSort;
  TrueString := 'True';
  FalseString := 'False';

  FFileName := NewStr(FileName);
  FName := NullStr;

  If FFileName <> NullStr Then
  Begin
    Assign(Source, FileName);
    {$I-}
    Reset(Source);
    {$I+}
    If IOResult = 0 Then
    Begin
      While Not Eof(Source) Do
      Begin
        ReadLn(Source, S);
        If Length(S) <> 0 Then
        Begin
          If S[1] = '[' Then
          Begin
            { New section }
            Delete(S, 1, 1);
            WriteToSection(CutStr(S, ']'));
          End
          Else
          If Not (S[1] In [';', '#', '%']) Then
          Begin
            { New entry }
            If FList = Nil Then WriteToSection('');
            T := CutStr(S, '=');
            FList.AddObject(TrimStr(T), TObject(NewStr(TrimStr(S))));
          End;
        End;
      End;
      Close(Source);
    End
    Else
    Begin
      {$I-}
      Rewrite(Source);
      {$I+}
      If IOResult = 0 Then
      Begin
        Close(Source);
        {Delete the 0 Byte dummy}
        //Assign(Source, FileName);
        {$I-}
        //System.Erase(Source);
        {$I+}
      End
      Else Begin ErrorBox2('Cannot open requested INI File : '+#13+Filename+#13+'Please check if this file is present and , not write protected.'+#13+'Program terminated.');Halt;End;
    End;
  End;
End;

{To Setup the Sort Value Of section And Ident}
Procedure TAsciiIniFile.IniTIniFiles;
Begin
End;

Destructor TAsciiIniFile.Destroy;
Var
  I: LongInt;
Begin
  Refresh;
  DisposeStr(FName);
  DisposeStr(FFileName);
  For I := 0 To FSections.Count - 1 Do
  Begin
    FList := TIniSection(FSections.Objects[I]);
    FList.Destroy;
  End;
  FSections.Destroy;
End;

Procedure TAsciiIniFile.Erase(Const section, Ident: String);
Var
  I: LongInt;
Begin
  If ReadFromSection(section) Then
  Begin
    If FList.Find(Ident, I) Then
    Begin
      FList.Delete(I);
      FChanged := True;
    End;
  End;
End;

Procedure TAsciiIniFile.EraseSection(Const section: String);
Var
  I: LongInt;
  S: TIniSection;
Begin
  If FSections.Find(section, I) Then
  Begin
    S := TIniSection(FSections.Objects[I]);
    S.Destroy;
    FSections.Delete(I);
    If S = FList Then
    Begin
      AssignStr(FName, '');
      FList := Nil;
    End;
    FChanged := True;
  End;
End;

Procedure TAsciiIniFile.WriteToSection(Const section: String);
Var
  I: LongInt;
Begin
  If CompareText(section, FName^) <> 0 Then
  Begin
    If FSections.Find(section, I) Then
    Begin
      AssignStr(FName, section);
      FList := TIniSection(FSections.Objects[I]);
    End
    Else
    Begin
      FList := TIniSection.Create;
      FList.Duplicates := dupAccept;
      FList.sorted := IdentSort;
      FList.CaseSensitive := True; // changed 2005-20-10 for TCPConfig NLS files
      FSections.AddObject(section, FList);
      AssignStr(FName, section);
    End;
  End;
End;

Function TAsciiIniFile.ReadFromSection(Const section: String): Boolean;
Var
  I: LongInt;
Begin
  Result := True; {!}
  If CompareText(section, FName^) <> 0 Then
  Begin
    If FSections.Find(section, I) Then
    Begin
      AssignStr(FName, section);
      FList := TIniSection(FSections.Objects[I]);
    End
    Else Result := False; {!}
  End;
//  Result := (FList <> Nil);
  {liefert sonst Die Letzte zur�ck, wenn section unbekannt}
End;

{Function TAsciiIniFile.GetFileName: String;
Begin
  Result := FFileName^;
End;}

Function TAsciiIniFile.ReadBool(Const section, Ident: String; Default: Boolean): Boolean;
Var
  S: String;
Begin
  If ReadFromSection(section) Then
  With TIniSection(FList) { As TIniSection} Do
  Begin
    If FindValue(Ident, S) = -1 Then Result := Default
    Else
    Begin
      If CompareText(S, TrueString) = 0 Then Result := True
      Else If CompareText(S, FalseString) = 0 Then Result := False
      Else Result := Default;
    End;
  End
  Else Result := Default;
End;

Function TAsciiIniFile.ReadInteger(Const section, Ident: String; Default: LongInt): LongInt;
Var
  S: String;
Begin
  If ReadFromSection(section) Then
  With TIniSection(FList) { As TIniSection} Do
  Begin
    If FindValue(Ident, S) = -1 Then Result := Default
    Else Result := StrToIntDef(S, Default);
  End
  Else Result := Default;
End;

Function TAsciiIniFile.ReadString(Const section, Ident, Default: String): String;
Begin
  If ReadFromSection(section) Then
  With TIniSection(FList) { As TIniSection} Do
  Begin
    If FindValue(Ident, Result) = -1 Then Result :=Default;
  End
  Else Result := Default;
End;

Function TAsciiIniFile.MyReadString(Const section, Ident: String;VAR Return:String): Boolean;
Begin
  If ReadFromSection(section) Then
  With TIniSection(FList) { As TIniSection} Do
  Begin
    If FindValue(Ident, Return) = -1 Then result:=FALSE else Result:=TRUE;
  End;

End;

Procedure TAsciiIniFile.ReadSection(Const section: String; AStrings: TStrings);
Var
  N: LongInt;
Begin
  If ReadFromSection(section) Then
  Begin
    For N := 0 To FList.Count - 1 Do AStrings.Add(FList.Strings[N]);
  End;
End;

Procedure TAsciiIniFile.ReadSections(AStrings: TStrings);
Var
  N: LongInt;
Begin
  For N := 0 To FSections.Count - 1 Do AStrings.Add(FSections.Strings[N]);
End;

Procedure TAsciiIniFile.ReadSectionValues(Const section: String; AStrings: TStrings);
Var
  N: LongInt;
Begin
  If ReadFromSection(section) Then
  Begin
    For N := 0 To FList.Count - 1 Do
      AStrings.Add(FList.Strings[N] + '=' + PString(FList.Objects[N])^);
  End;
End;

Procedure TAsciiIniFile.Refresh;
Var
  Dest: Text;
  N, I: LongInt;
  L: TIniSection;
  S: String;
Begin
  If FChanged And (FFileName <> NullStr) Then
  Begin
    Assign(Dest, FileName);
    Rewrite(Dest);
    For N := 0 To FSections.Count - 1 Do
    Begin
      S := FSections.Strings[N];
      If Length(S) <> 0 Then
      Begin
        WriteLn(Dest, '[' + S + ']');
        WriteLn(Dest);
      End;
      L := TIniSection(FSections.Objects[N]);
      For I := 0 To L.Count - 1 Do
        WriteLn(Dest, L.Strings[I], '=', PString(L.Objects[I])^);
      If N < FSections.Count Then WriteLn(Dest);
      FChanged := False;
    End;
    Close(Dest);
  End;
End;

Procedure TAsciiIniFile.WriteBool(Const section, Ident: String; Value: Boolean);
Begin
  FChanged := True;
  WriteToSection(section);
  If Value Then TIniSection(FList).values[Ident]:=TrueString
  Else TIniSection(FList).values[Ident]:=FalseString;
End;

Procedure TAsciiIniFile.WriteInteger(Const section, Ident: String; Value: LongInt);
Begin
  FChanged := True;
  WriteToSection(section);
  TIniSection(FList).values[Ident]:=IntToStr(Value);
End;

Procedure TAsciiIniFile.WriteString(Const section, Ident, Value: String);
Begin
  FChanged := True;
  WriteToSection(section);
  TIniSection(FList).values[Ident]:=Value;
End;


CONSTRUCTOR TOs2UserINIFile.Create;
Begin

     Fhandle:=HINI_USERPROFILE;
End;

DESTRUCTOR TOS2UserINIFIle.Destroy;
Begin
End;


CONSTRUCTOR TOS2SystemIniFIle.Create;
Begin
     FHandle:=HINI_SYSTEMPROFILE;
ENd;

DESTRUCTOR TOS2SysTemIniFIle.Destroy;
Begin

End;

Function RemoveSpacesFromString(SpaceStr:String):String;
VAR
   SpaceCounter:Byte;
   CopyStr:String;

Begin
     For SpaceCounter:=1 to length(SpaceStr) do  // Schleife �ber die gesammt String l�nge
     Begin
           {�berpr�fen ob sich Leerzeichen am Anfang eines Strings befginden}
           If SpaceStr[SpaceCounter]<>' ' Then Begin Result:=Copy(SpaceStr,SpaceCounter,length(SpaceStr));exit;End;
     End;

     {Sollten sich keien Leerzeichen im String befinden, den urspr�nglichen wert zur�ckliefern}
     Result:=SpaceStr;
End;


Function RemoveSpace2(RemoveStr:String):String;
VAR
   Loop:Byte;

Begin

     For Loop:=length(RemoveStr) downto 1 do
     Begin
          IF RemoveStr[loop]=' ' Then delete(removeStr,loop,1);
     End;

     Result:=RemoveStr;

End;

Function MakeValueString(Source:String;Param:Byte):String;
VAR
   resultStr:String;
   Posi:Byte;
Begin
     Posi:=Pos('=',Source);
      IF (Posi=0) and (Param<>3) then Begin Result:=Source;Exit;End;
       case Param of
       1:Begin ResultStr:=Copy(Source,Posi+1,length(Source));Result:=RemoveSpacesFromString(ResultStr);End;
       2:Begin ResultStr:=Copy(source,1,Posi-1);Result:=RemoveSpace2(ResultStr);exit;End;
       3:Begin
              Delete(Source,1,1);delete(source,length(source),1);
              Result:=Source;
              exit;
         End;
       End;

End;

Function MakeIdentString(Source:String;Ident:String):String;
{'   EL90XIO2_nif12345=    EL90XIO2.nif' =}
{'EL90XIO2_NIF12345=  ELxxx =}
{'EL90XIO2_NIF12345'}
VAR
   Posi:Byte;
   ResultStr:String;

Begin
      ResultStr:=RemoveSpacesFromString(Source);
      Posi:=Pos('=',ResultStr);
       IF Posi=0 Then Begin Result:=Source;exit;End;
        Source:=Copy(ResultStr,1,posi-1);
      ResultStr:=Copy(source,1,length(IDENT));
      Result:=Uppercase(ResultStr);
End;


Function TAscIIIniFile.OpenCustomIni:Boolean;
VAR
   IOError:Integer;
Begin
     Result:=FALSE;
     Assign(CustomIni,Filename);
     {$I-}
          ReSet(CustomIni);IOError:=IoResult;
     {$I+}
     IF IOError<>0 Then Raise EInOutError.Create('IniFile open failed'+#13+SysErrorMessage(IOError)+#13+Filename)
                   else Result:=TRUE;
End;

Function TAsciiIniFIle.FindSection(const section:String):Boolean;
Begin
     Result:=FALSE;

      IF not OpenCustomIni Then exit;
       While not Eof(CustomIni) do
       Begin
            Readln(CustomINI,ReadedIniString);
            IF Uppercase(ReadedIniString)='['+Uppercase(Section)+']' then Begin Result:=True;exit;End;
       End;
End;

Function TAsciiIniFile.FindIdent(aIdent:String):Boolean;
VAR
   D1:String;
   D2:Byte;
   D3:Byte;
Begin
     Result:=False;
     While not Eof(CusTomIni) do
     Begin
          Readln(CustomIni,ReadedIniString);   {Achtung ! im Ident String k�nnen sich leerzeichen am Anfang befinden !!}
          IF length(ReadedIniString)<>0 Then
          Begin
               IF MakeIdentString(ReadedIniString,aIdent)=Uppercase(aIdent) Then Begin Result:=True;Exit;End;
          End;
     End;
End;


Function TasciiIniFIle.NewReadString(Const section, Ident:String; Return:TSTrings):Boolean;

Label
     FExit;
VAR
   ReturnString:String;
   RC:Byte;
Begin
     Result:=FALSE;Return.Clear;
      If not FindSection(section) Then Begin Return.add('Section not found');CLose(CustomINI);exit;End;
      IF not FindIdent(ident) Then Begin Return.add('Ident not found');Close(CustomIni);exit;End;
       // Sektion und Ident gefunden , nun R�ckgabewert ermitteln;
        ReturnString:=MakeValueString(ReadedIniString,1);

         IF ReturnString[1]<>'"' Then Begin Return.add(ReturnString);Goto FExit;End else
         Begin
              IF ReturnString[length(ReturnString)]='"' Then
              Begin
                   Return.add(ReturnString);goto Fexit;
              End
                 else
               Begin
                     {weitere Daten einlsen bis das ende (markiert durch ein weiteres " Zeichen gefunden wird.}
                     rc:=Return.add(ReturnString);
                     While not eof (CustomIni) do
                     Begin
                          Readln(CustomINI,ReadedIniString);
                          Return.add(ReadedIniString);
                          IF readedIniString[length(readedIniString)]='"' Then goto Fexit;
                     End;
               End;
         End;

     FExit:
     CLose(CustomIni);
     Result:=True;
End;

Function TAsciiIniFile.NewReadSection(Const section:String;AString:TStrings):Boolean;
Label
     Fexit;
VAR
   SectionList:TStringList;
   ReturnStr:String;
   I        :Longint;
   D1:String;
   D2:String;
Begin
     Result:=FALSE;SectionList:=TStringList.Create;
     IF not findSection(Section) Then Begin Close(CustomIni);AString.add('section not found');exit;End;
     ReadSections(SectionList);
     While not eof(CustomIni) do
     Begin
          Readln(CustomIni,ReadedIniString);ReturnStr:=MakeValueSTring(ReadedIniSTring,2);
          IF length(ReadedIniString)<>0 Then
          Begin
              D1:=MakeValueString(ReadedIniString,3);
              IF SectionList.find(MakeValueString(ReadedIniString,3),I) Then goto fExit;
              D2:=SectionList.Strings[1];
              Astring.add(ReturnStr);
              IF readedIniString[Length(readedINIString)]<>'"' Then
              Begin
                   IF MakeValueString(ReadedIniString,1)[1]='"' Then goto Fexit;
              End;
           End;

     End;
Fexit:
CLose(CustomIni);
Result:=True;
End;


Procedure DeleteOs2IniKey;
VAR OS2INI:TOS2UseriNIFile;Loop:Byte;
Begin
     OS2INI.Create;
     FOr Loop:=0 to 7 do OS2INI.Erase('TCPConfig','LAN'+ToStr(Loop));
     OS2Ini.Destroy;
End;


{ �nderungen: 26.11.95  Sections werden sortiert, Eintr�ge aber nicht
              28.11.95  alles wird sortiert, schneller durch Trennung
                        von Ident und Value (TIniSection).
              30.11.95  Fehler In TIniSection korrigiert, ES
                        fehlten Get/Put
              16.12.95  neue Funktion GetDefaultINI()
              16-Aug-97   J�rg: Bugfix for TIniFiles.ReadString.

  To-Do: - Eventuell ReadData / WriteData einbauen
         - Eventuell ReadSectionNames einbauen = ReadSections
         - wenn String -> cstring Fehler In SP/2 behoben,
           Workaround entfernen.
}


Constructor TMyIni.Create(aFilename:String;Mode:Byte);
Begin
    Case Mode of
    IniFMOpen:Begin
                    IF not FileExists(aFilename) Then Begin fhandle:=0;exit;End;
              End;
    IniFMOpenCreate,IniFmCreate:Begin End
    else ShowMessage('Falscher Parameter');
    End;
  inherited.Create(aFileName);
End;

End.