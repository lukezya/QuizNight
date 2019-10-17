unit clsQuiz;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, clsHouse;

type
  TQuiz = class
  private
    fArrHouses : array[1..3] of THouse;
    fGrade : integer;
    fArrAnswers : array[1..40] of string;
    fArrQuestions : array[1..40] of string;
  public
    constructor Create(iGrade : integer; HHutton, HWindsor, HOK : THouse);
    destructor Destroy; override;
    procedure setGrade(iGrade : integer);
    procedure setAnswers(iGrade : integer);
    procedure setQuestions(iGrade : integer);
    procedure setHouse(H, W, OK : THouse);
    function getGrade : integer;
    function getAnswer(iNo : integer) : string;
    function getQuestion(iNo : integer) : string;
    function getHouse(iCount : integer) : THouse;
  end;

implementation

{ TQuiz }

constructor TQuiz.Create(iGrade: integer; HHutton, HWindsor, HOK : THouse);
begin
  fGrade := iGrade;
  fArrHouses[1] := HHutton;
  fArrHouses[2] := HWindsor;
  fArrHouses[3] := HOK;

  setQuestions(iGrade);
  setAnswers(iGrade);
end;

destructor TQuiz.Destroy;
begin
  //FreeAndNil(fArrHouses[1]);
  //FreeAndNil(fArrHouses[2]);
  //FreeAndNil(fArrHouses[3]);
  inherited;
end;

function TQuiz.getAnswer(iNo: integer): string;
begin
  result := fArrAnswers[iNo];
end;

function TQuiz.getGrade: integer;
begin
  result := fGrade;
end;

function TQuiz.getHouse(iCount: integer): THouse;
begin
  result := fArrHouses[iCount];
end;

function TQuiz.getQuestion(iNo: integer): string;
begin
  result := fArrQuestions[iNo];
end;

procedure TQuiz.setAnswers(iGrade: integer);
var
  sPath, sAdd : string;
  TFAnswers : textfile;
  iAnswer : integer;
begin
  iAnswer := 0;
  sPath := GetCurrentDir()+'\Answers\';
  sAdd := 'Grade ' + inttostr(iGrade) + '.txt';

  sPath := sPath + sAdd;

  if FileExists(sPath) <> true then
    begin
      ShowMessage('File ' + sPath + ' does not exist!');
      Exit;
    end;

  AssignFile(TFAnswers, sPath);
  Reset(TFAnswers);

  while (not EOF(TFAnswers)) AND (iAnswer <= 40)  do
    begin
      inc(iAnswer);
      readln(TFAnswers, fArrAnswers[iAnswer]);
    end;

  CloseFile(TFAnswers);
end;

procedure TQuiz.setGrade(iGrade: integer);
begin
  fGrade := iGrade;
  setQuestions(iGrade);
  setAnswers(iGrade);
end;

procedure TQuiz.setHouse(H, W, OK: THouse);
begin
  fArrHouses[1] := H;
  fArrHouses[2] := W;
  fArrHouses[3] := OK;
end;

procedure TQuiz.setQuestions(iGrade: integer);
var
  sPath, sAdd : string;
  TFQuestions : textfile;
  iQuestion : integer;
begin
  iQuestion := 0;
  sPath := GetCurrentDir()+'\Questions\';
  sAdd := 'Grade ' + inttostr(iGrade) + '.txt';

  sPath := sPath + sAdd;

  if FileExists(sPath) <> true then
    begin
      ShowMessage('File ' + sPath + ' does not exist!');
      Exit;
    end;

  AssignFile(TFQuestions, sPath);
  Reset(TFQuestions);

  while (not EOF(TFQuestions)) AND (iQuestion <= 40)  do
    begin
      inc(iQuestion);
      readln(TFQuestions, fArrQuestions[iQuestion]);
    end;

  CloseFile(TFQuestions);
end;

end.
