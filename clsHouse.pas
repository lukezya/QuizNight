unit clsHouse;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs;

type
  THouse = class
  private
    fArrParticipants : array[1..3] of string;
    fHouse : string;
    fGrade : integer;
    fScore : integer;
  public
    constructor Create(sHouse : string; iGrade : integer);
    destructor Destroy; override; 
    procedure setHouse(sHouse : string);
    procedure setGrade(iGrade : integer);
    procedure setScore(iScore : integer);
    procedure setParticipants(p1, p2, p3 : string);
    function getHouse : string;
    function getGrade : integer;
    function getScore : integer;
    function toString : string;
    function getParticipant(iNo : integer):string;
  end;

implementation

{ THouse }

constructor THouse.Create(sHouse: string; iGrade: integer);
var
  sPath, sAdd, sLine, sP1, sP2, sP3 : string;
  TF: textfile;
begin
  sP1 := '';
  sP2 := '';
  sP3 := '';
  sAdd := '';
  sPath := '';
  fHouse := sHouse;
  fGrade := iGrade;
  case fGrade of
    8: sAdd := 'Grade 8';
    9: sAdd := 'Grade 9';
    10: sAdd := 'Grade 10';
    11: sAdd := 'Grade 11';
    12: sAdd := 'Grade 12';
//    13: sAdd := 'Teachers';
  end;

  sPath := GetCurrentDir()+'\Participants\' + sAdd + '.txt';

  if FileExists(sPath) <> true then
    begin
      ShowMessage('File for ' + sAdd + ' cannot be found!');
      Exit;
    end;

  
  sHouse := sHouse + ':';

  AssignFile(TF, sPath);
  Reset(TF);

  while not EOF(TF) do
    begin
      readln(TF, sLine);
      if sHouse = sLine then
        begin
          readln(TF, sP1);
          readln(TF, sP2);
          readln(TF, sP3);
          break;
        end;
    end;

  fArrParticipants[1] := sP1;
  fArrParticipants[2] := sP2;
  fArrParticipants[3] := sP3;
  fScore := 0;

  CloseFile(TF);  
end;

destructor THouse.Destroy;
begin
  inherited;
end;

function THouse.getGrade: integer;
begin
  result := fGrade;
end;

function THouse.getHouse: string;
begin
  result := fHouse;
end;

function THouse.getParticipant(iNo: integer): string;
begin
  result := fArrParticipants[iNo];
end;

function THouse.getScore: integer;
begin
  result := fScore;
end;

procedure THouse.setGrade(iGrade: integer);
begin
  fGrade := iGrade;
end;

procedure THouse.setHouse(sHouse: string);
begin
  fHouse := sHouse;
end;

procedure THouse.setParticipants(p1, p2, p3: string);
begin
  fArrParticipants[1] := p1;
  fArrParticipants[2] := p2;
  fArrParticipants[3] := p3;
end;

procedure THouse.setScore(iScore: integer);
begin
  fScore := iScore;
end;

function THouse.toString: string;
var
  sParticipants : string;
  iLoop : integer;
begin
  sParticipants := '';
  for iLoop := 1 to 3 do
    begin
      sParticipants := sParticipants + fArrParticipants[iLoop] + #13;
    end;
  result := fHouse + #9 + 'Grade ' + inttostr(fGrade) + #13 +
            sParticipants;
end;

end.
 