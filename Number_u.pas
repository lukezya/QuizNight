unit Number_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ColorButton, Spin, ExtCtrls, jpeg;

type
  TForm5 = class(TForm)
    imgBackground: TImage;
    shpHeader: TShape;
    lblMidstream: TLabel;
    lblCollege: TLabel;
    lblQuizNight: TLabel;
    pnlQuestion: TPanel;
    lblQuestion: TLabel;
    sedQuestion: TSpinEdit;
    btnGO: TColorButton;
    procedure btnGOClick(Sender: TObject);
    procedure sedQuestionKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
  private
    //helper method
    procedure Heading(iPos : integer; sSubject : string);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

uses ScoreSheet_u, GradeMenu_u, Question_u, Teachers_u;

{$R *.dfm}

procedure TForm5.btnGOClick(Sender: TObject);
var
  sQuestion, sAnswer : string;
  iNo : integer;
begin
  //get question number
  iNo := sedQuestion.Value;
  //change heading
  case iNo of
    1..5: Heading(192, 'Sport');
    6..10: Heading(88, 'Geography');
    11..15: Heading(168, 'Science');
    16..20: Heading(112, 'Literature');
    21..25: Heading(200, 'Music');
    26..30: with Form4 do
            begin
              lblSubject.Hide;
              lblMovies.Show;
              lblSeries.Show;
            end;
    31..35: Heading(88, 'Technology');
    36..40: Heading(160, 'History');
  end;
 //teachers
  if Form6.bTeachers = true then
    begin
      Form5.Hide;
      sQuestion := Form2.TeachersQuiz.getQuestion(iNo);
      sAnswer := Form2.TeachersQuiz.getAnswer(iNo);

      with Form4 do
        begin
          Show;
          redQuestion.Text := sQuestion;
          TheAnswer := sAnswer;
          redOut.SetFocus;
        end;
      Exit;
    end;
  //grade 8-12
  Form5.Hide;

  //get question and answer
  sQuestion := Form2.QuizNight.getQuestion(iNo);
  sAnswer := Form2.QuizNight.getAnswer(iNo);
  //getting ready for buzzers
  with Form4 do
    begin
      Show;
      redQuestion.Text := sQuestion;
      TheAnswer := sAnswer;
      redOut.SetFocus;
    end;
end;

procedure TForm5.sedQuestionKeyPress(Sender: TObject; var Key: Char);
begin
  //countermeasure for stupid slamming on buzzers
  Key := #0;
end;

procedure TForm5.FormActivate(Sender: TObject);
//colours
const
  clOrangeRed = TColor($0024FF);
//correct setup
begin
  lblQuizNight.Font.Color := clOrangeRed;
  lblQuestion.Font.Color := clOrangeRed;
  lblQuizNight.Width := 280;
end;

//helper method
procedure TForm5.Heading(iPos: integer; sSubject: string);
begin
  with Form4 do
    begin
      lblSubject.Show;
      lblMovies.Hide;
      lblSeries.Hide;
      lblSubject.Left := iPos;
      lblSubject.Caption := sSubject;
    end;
end;

end.
