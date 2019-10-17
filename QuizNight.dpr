program QuizNight;

uses
  Forms,
  FrontCover_u in 'FrontCover_u.pas' {Form1},
  GradeMenu_u in 'GradeMenu_u.pas' {Form2},
  ScoreSheet_u in 'ScoreSheet_u.pas' {Form3},
  Question_u in 'Question_u.pas' {Form4},
  Number_u in 'Number_u.pas' {Form5},
  Teachers_u in 'Teachers_u.pas' {Form6},
  Scores_u in 'Scores_u.pas' {Form7},
  clsTeachers in 'clsTeachers.pas',
  clsScores in 'clsScores.pas',
  clsHouse in 'clsHouse.pas',
  clsQuiz in 'clsQuiz.pas',
  Help_u in 'Help_u.pas' {Form8};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TForm4, Form4);
  Application.CreateForm(TForm5, Form5);
  Application.CreateForm(TForm6, Form6);
  Application.CreateForm(TForm7, Form7);
  Application.CreateForm(TForm8, Form8);
  Application.Run;
end.
