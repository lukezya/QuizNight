unit GradeMenu_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ColorButton, ExtCtrls, clsHouse, clsQuiz, clsTeachers;

type
  TForm2 = class(TForm)
    pnlMenu: TPanel;
    btnGr8: TColorButton;
    btnGr9: TColorButton;
    btnGr10: TColorButton;
    btnGr11: TColorButton;
    btnGr12: TColorButton;
    btnTeachers: TColorButton;
    procedure btnGr8Click(Sender: TObject);
    procedure btnGr9Click(Sender: TObject);
    procedure btnGr10Click(Sender: TObject);
    procedure btnGr11Click(Sender: TObject);
    procedure btnGr12Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnTeachersClick(Sender: TObject);
  private
    //helper method
    procedure GoNext(iGrade : integer);
    { Private declarations }
  public
    QuizNight : TQuiz;
    TeachersQuiz : TTeachers;
    { Public declarations }
  end;

var
  Form2: TForm2;
  gGrade : integer;

implementation

uses ScoreSheet_u, Teachers_u;

{$R *.dfm}

procedure TForm2.btnGr8Click(Sender: TObject);
begin
  GoNext(8);
end;

procedure TForm2.btnGr9Click(Sender: TObject);
begin
  GoNext(9);
end;

procedure TForm2.btnGr10Click(Sender: TObject);
begin
  GoNext(10);
end;

procedure TForm2.btnGr11Click(Sender: TObject);
begin
  GoNext(11);
end;

procedure TForm2.btnGr12Click(Sender: TObject);
begin
  GoNext(12);
end;

procedure TForm2.FormCreate(Sender: TObject);
const
  clOrangeRed = TColor($0024FF);
  clGold = TColor($327FCD);
  clBrightGold = TColor($19D9D9);
  clSummerSky = TColor($DEB038);
  clMandarianOrange = TColor($3378E4);
  clFirebrick = TColor($23238E);
  clIndianRed = TColor($2F2F4E);
  clMediumVioletRed = TColor($9370DB);
begin
  //initialize
  gGrade := 0;
  //correct setup
  btnGr8.HoverColor := clMandarianOrange;
  btnGr9.HoverColor := clMandarianOrange;
  btnGr10.HoverColor := clMandarianOrange;
  btnGr11.HoverColor := clMandarianOrange;
  btnGr12.HoverColor := clMandarianOrange;
  btnTeachers.HoverColor := clMandarianOrange;
end;

//helper method
procedure TForm2.GoNext(iGrade: integer);
var
  HHutton, HWindsor, HOK : THouse;
begin
  //Grade
  gGrade := iGrade;
  //Hutton, Windsor, Old Kent - create houses
  HHutton := THouse.Create('Hutton', iGrade);
  HWindsor := THouse.Create('Windsor', iGrade);
  HOK := THouse.Create('Old Kent', iGrade);
  //Show participants of each house
  with Form3 do
    begin
      lblH1.Caption := HHutton.getParticipant(1);
      lblH2.Caption := HHutton.getParticipant(2);
      lblH3.Caption := HHutton.getParticipant(3);

      lblW1.Caption := HWindsor.getParticipant(1);
      lblW2.Caption := HWindsor.getParticipant(2);
      lblW3.Caption := HWindsor.getParticipant(3);

      lblOK1.Caption := HOK.getParticipant(1);
      lblOK2.Caption := HOK.getParticipant(2);
      lblOK3.Caption := HOK.getParticipant(3);
    end;
  //Create Quiz
  QuizNight := TQuiz.Create(iGrade, HHutton, HWindsor, HOK);
  //Lets go
  Form2.Hide;
  Form3.Show;
  //got everything, can free houses in memory
  HHutton.Destroy;
  HWindsor.Destroy;
  HOK.Destroy;
end;

procedure TForm2.btnTeachersClick(Sender: TObject);
begin
  TeachersQuiz := TTeachers.Create;
  Form2.Hide;
  Form6.Show;
  Form6.bTeachers := true;
end;

end.
