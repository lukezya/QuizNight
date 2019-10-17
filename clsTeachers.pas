unit clsTeachers;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, clsHouse;

type
  TTeachers = class
  private
    fArrAnswers : array[1..40] of string;
    fArrQuestions : array[1..40] of string;
  public
    constructor Create;
    destructor Destroy; override;
    procedure setAnswers;
    procedure setQuestions;
    function getAnswer(iNo : integer) : string;
    function getQuestion(iNo : integer) : string;
  end;

implementation

{ TTeachers }

constructor TTeachers.Create;
begin
  setQuestions;
  setAnswers;
end;

destructor TTeachers.Destroy;
begin

  inherited;
end;

function TTeachers.getAnswer(iNo: integer): string;
begin
  result := fArrAnswers[iNo];
end;

function TTeachers.getQuestion(iNo: integer): string;
begin
  result := fArrQuestions[iNo];
end;

procedure TTeachers.setAnswers;
var
  sPath, sAdd : string;
  TFAnswers : textfile;
  iAnswer : integer;
begin
  iAnswer := 0;
  sPath := GetCurrentDir()+'\Answers\';
  sAdd := 'Teachers' + '.txt';

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

procedure TTeachers.setQuestions;
var
  sPath, sAdd : string;
  TFQuestions : textfile;
  iQuestion : integer;
begin
  iQuestion := 0;
  sPath := GetCurrentDir()+'\Questions\';
  sAdd := 'Teachers' + '.txt';

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
 