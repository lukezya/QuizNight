unit clsScores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, clsHouse;

type
  TScores = class
  private
    fHScore : integer;
    fWScore : integer;
    fOKScore : integer;
  public
    constructor Create(iH, iW, iOK : integer);
    destructor Destroy; override;
    procedure Save;
    procedure Sort;
  end;

var
  arrScore : array[1..3] of integer;
  arrLines : array[1..3] of string;

implementation

{ TScores }

constructor TScores.Create(iH, iW, iOK: integer);
var
  iLoop : integer;
begin
  fHScore := iH;
  fWScore := iW;
  fOKScore := iOK;

  for iLoop := 1 to 3 do
    begin
      arrScore[iLoop] := 0;
      arrLines[iLoop] := '';
    end;
end;

destructor TScores.Destroy;
begin

  inherited;
end;

procedure TScores.Save;
var
  TF : textfile;
begin
  Sort;
  AssignFile(TF, 'C:\Users\Tony\Desktop\YoYo\Billabong\Final\House.txt');
  Rewrite(TF);

  Writeln(TF, arrLines[1]);
  Writeln(TF, arrLines[2]);
  Writeln(TF, arrLines[3]);

  CloseFile(TF);
end;

procedure TScores.Sort;
var
  iL1, iL2, tempInt : integer;
  tempLine : string;
begin
  //double sort
  arrScore[1] := fHScore;
  arrScore[2] := fWScore;
  arrScore[3] := fOKScore;

  arrLines[1] := 'H' + inttostr(fHScore);
  arrLines[2] := 'W' + inttostr(fWScore);
  arrLines[3] := 'O' + inttostr(fOKScore);
  for iL1 := 1 to 2 do
    for iL2 := iL1+1 to 3 do
      if arrScore[iL1] < arrScore[iL2] then
        begin
          tempInt := arrScore[iL1];
          arrScore[iL1] := arrScore[iL2];
          arrScore[iL2] := tempInt;

          tempLine := arrLines[iL1];
          arrLines[iL1] := arrLines[iL2];
          arrLines[iL2] := tempLine;
        end;
end;

end.
 