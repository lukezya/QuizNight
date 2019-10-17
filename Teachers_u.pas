unit Teachers_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, ExtCtrls, jpeg;

type
  TForm6 = class(TForm)
    shpHutton: TShape;
    shpWindsor: TShape;
    shpOldKent: TShape;
    lblOldKent: TLabel;
    lblWindsor: TLabel;
    lblHutton: TLabel;
    pnlHTeam: TPanel;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    lblH1: TLabel;
    lblH2: TLabel;
    lblH3: TLabel;
    Shape10: TShape;
    Shape11: TShape;
    Shape12: TShape;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    pnlWTeam: TPanel;
    Shape4: TShape;
    Shape5: TShape;
    Shape6: TShape;
    lblW1: TLabel;
    lblW2: TLabel;
    lblW3: TLabel;
    pnlOKTeam: TPanel;
    Shape7: TShape;
    Shape8: TShape;
    Shape9: TShape;
    lblOK1: TLabel;
    lblOK2: TLabel;
    lblOK3: TLabel;
    pnlHScore: TPanel;
    lblHScore: TLabel;
    pnlWScore: TPanel;
    lblWScore: TLabel;
    pnlOKScore: TPanel;
    lblOKScore: TLabel;
    MainMenu1: TMainMenu;
    Home1: TMenuItem;
    Reset1: TMenuItem;
    Finish1: TMenuItem;
    Begin1: TMenuItem;
    Next1: TMenuItem;
    SaveDialog1: TSaveDialog;
    procedure Begin1Click(Sender: TObject);
    procedure Finish1Click(Sender: TObject);
    procedure Home1Click(Sender: TObject);
    procedure Next1Click(Sender: TObject);
    procedure Reset1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    procedure ScoreAlignment(lbl: TLabel);
    { Private declarations }
  public
    bTeachers : boolean;
    { Public declarations }
  end;

var
  Form6: TForm6;

implementation

uses Question_u, Number_u, FrontCover_u, GradeMenu_u, ScoreSheet_u;

{$R *.dfm}
        
procedure TForm6.Begin1Click(Sender: TObject);
begin
  //Teachers Quiz
  bTeachers := True;
  //begin the quiznight
  Begin1.Enabled := False;
  Next1.Enabled := true;
  Form6.Hide;
  //get next form ready
  with Form4 do
    begin
      QN := 0;
      imgHGreen.Show;
      imgHRed.Show;
      imgWGreen.Show;
      imgWRed.Show;
      imgOKGreen.Show;
      imgOKRed.Show;
      imgHSmiley.Hide;
      imgWSmiley.Hide;
      imgOKSmiley.Hide;
      imgHArrow.Hide;
      imgWArrow.Hide;
      imgOKArrow.Hide;
      lblHNumber.Caption := '0';
      lblWNumber.Caption := '0';
      lblOKNumber.Caption := '0';
      lblTimer.Caption := '7.0';
      lblTimer.Font.Color := clBlack;
      edtOut.Clear;
      redOut.Clear;
      redQuestion.Text := 'YOLO';
      lblAnswer.Caption := 'Sweg';
      Point := '';
      lblSubject.Hide;
      lblMidstream.Show;
      lblCollege.Show;
      lblQuizNight.Show;
      lblMovies.Hide;
      lblSeries.Hide;
      Show;
    end;
  Form5.sedQuestion.Value := 0;
end;

procedure TForm6.Finish1Click(Sender: TObject);
var
  TF : textfile;
  first, second, third : string;
begin
  //saving path
  savedialog1.InitialDir := 'C:\Users\Tony\Desktop\YoYo\Billabong\Scores';
  if savedialog1.Execute then
    begin
      //order from 1st to 3rd
      first := inputbox('First Letter + Points','1st:','');
      second := inputbox('First Letter + Points','2nd:','');
      third := inputbox('First Letter + Points','3rd:','');
      //write to file
      AssignFile(TF, savedialog1.FileName);
      Rewrite(TF);

      Writeln(TF, first);
      Writeln(TF, second);
      Writeln(TF, third);

      CloseFile(TF);
    end;
end;

procedure TForm6.Home1Click(Sender: TObject);
begin
  //clear everything
  Form6.Hide;
  Form1.Show;
  lblH1.Caption := '';
  lblH2.Caption := '';
  lblH3.Caption := '';
  lblW1.Caption := '';
  lblW2.Caption := '';
  lblW3.Caption := '';
  lblOK1.Caption := '';
  lblOK2.Caption := '';
  lblOK3.Caption := '';
  lblHScore.Caption := '0';
  lblWScore.Caption := '0';
  lblOKScore.Caption := '0';
  Next1.Enabled := false;
  Begin1.Enabled := true;
  //free current quiz from memory
  bTeachers := False;
  Form2.TeachersQuiz.Destroy;
end;

procedure TForm6.Next1Click(Sender: TObject);
begin
  //keep on going
  Form6.Hide;
  with Form4 do
    begin
      Point := '';
      imgHGreen.Show;
      imgHRed.Show;
      imgWGreen.Show;
      imgWRed.Show;
      imgOKGreen.Show;
      imgOKRed.Show;
      imgHSmiley.Hide;
      imgWSmiley.Hide;
      imgOKSmiley.Hide;
      imgHArrow.Hide;
      imgWArrow.Hide;
      imgOKArrow.Hide;
      lblHNumber.Caption := '0';
      lblWNumber.Caption := '0';
      lblOKNumber.Caption := '0';
      lblTimer.Caption := '7.0';
      lblTimer.Font.Color := clBlack;
      edtOut.Clear;
      redOut.Clear;
      redQuestion.Text := 'YOLO';
      lblAnswer.Caption := 'Sweg';
      lblSubject.Hide;
      lblMidstream.Show;
      lblCollege.Show;
      lblQuizNight.Show;
      lblMovies.Hide;
      lblSeries.Hide;
      Show;
    end;
end;

procedure TForm6.Reset1Click(Sender: TObject);
var
  H, W, O : string;
  buttonselected: integer;
begin
  //confirmation
  buttonselected := Messagedlg('Are you sure?', mtConfirmation, [mbOK, mbCancel], 0);
  if buttonselected = mrCancel then Exit; 
  H := inputbox('Score','Hutton:','');
  W := inputbox('Score','Windsor:','');
  O := inputbox('Score','Old Kent:','');
  //reset scores
  lblHScore.Caption := H;
  lblWScore.Caption := W;
  lblOKScore.Caption := O;
  //align them
  ScoreAlignment(lblHScore);
  ScoreAlignment(lblWScore);
  ScoreAlignment(lblOKScore);
end;

procedure TForm6.FormCreate(Sender: TObject);
begin
  //correct settings
  bTeachers := false;
  pnlHTeam.Color := clLime;
  pnlWTeam.Color := clBlack;
  pnlOKTeam.Color := clRed;
  Form6.WindowState := wsMaximized;
end;

//helper method
procedure TForm6.ScoreAlignment(lbl: TLabel);
begin
  if length(lbl.Caption) = 2
    then lbl.Left := 40
    else lbl.Left := 80;
end;

procedure TForm6.FormActivate(Sender: TObject);
begin
  //alignment
  ScoreAlignment(lblHScore);
  ScoreAlignment(lblWScore);
  ScoreAlignment(lblOKScore);
end;

end.
