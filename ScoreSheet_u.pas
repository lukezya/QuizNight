unit ScoreSheet_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ExtCtrls, StdCtrls, jpeg, clsHouse;

type
  TForm3 = class(TForm)
    shpHutton: TShape;
    imgHutton: TImage;
    shpWindsor: TShape;
    shpOldKent: TShape;
    imgWindsor: TImage;
    imgOldKent: TImage;
    lblHutton: TLabel;
    lblWindsor: TLabel;
    lblOldKent: TLabel;
    pnlHScore: TPanel;
    lblHScore: TLabel;
    pnlWScore: TPanel;
    lblWScore: TLabel;
    pnlOKScore: TPanel;
    lblOKScore: TLabel;
    pnlHTeam: TPanel;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    lblH1: TLabel;
    lblH2: TLabel;
    lblH3: TLabel;
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
    MainMenu1: TMainMenu;
    Home1: TMenuItem;
    Reset1: TMenuItem;
    Finish1: TMenuItem;
    Begin1: TMenuItem;
    Next1: TMenuItem;
    SaveDialog1: TSaveDialog;
    procedure Begin1Click(Sender: TObject);
    procedure Home1Click(Sender: TObject);
    procedure Finish1Click(Sender: TObject);
    procedure Next1Click(Sender: TObject);
    procedure Reset1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure ScoreAlignment(lbl : TLabel);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

uses Question_u, Number_u, FrontCover_u, GradeMenu_u;

{$R *.dfm}

procedure TForm3.Begin1Click(Sender: TObject);
begin
  //begin the quiznight
  Begin1.Enabled := False;
  Next1.Enabled := true;
  Form3.Hide;
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

procedure TForm3.Home1Click(Sender: TObject);
begin
  //clear everything
  Form3.Hide;
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
  Form2.QuizNight.Destroy;
end;

procedure TForm3.Finish1Click(Sender: TObject);
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

procedure TForm3.Next1Click(Sender: TObject);
begin
  //keep on going
  Form3.Hide;
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

procedure TForm3.Reset1Click(Sender: TObject);
var
  H, W, O : string;
  buttonselected, iGrade : integer;
  HHutton, HWindsor, HOK : THouse;
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

  //reset grade and participants
  iGrade := strtoint(InputBox('Midstream College Quiz Night', 'Grade:', ''));
  Form2.QuizNight.setGrade(iGrade);
  //create houses to extract the participants
  HHutton := THouse.Create('Hutton', iGrade);
  HWindsor := THouse.Create('Windsor', iGrade);
  HOK := THouse.Create('Old Kent', iGrade);
  //set scores before creating them
  HHutton.setScore(strtoint(H));
  HWindsor.setScore(strtoint(W));
  HOK.setScore(strtoint(O));
  //create quiznight again with right grade and house participants and scores
  Form2.QuizNight.setHouse(HHutton, HWindsor, HOK);
  //show participants
  lblH1.Caption := HHutton.getParticipant(1);
  lblH2.Caption := HHutton.getParticipant(2);
  lblH3.Caption := HHutton.getParticipant(3);

  lblW1.Caption := HWindsor.getParticipant(1);
  lblW2.Caption := HWindsor.getParticipant(2);
  lblW3.Caption := HWindsor.getParticipant(3);

  lblOK1.Caption := HOK.getParticipant(1);
  lblOK2.Caption := HOK.getParticipant(2);
  lblOK3.Caption := HOK.getParticipant(3);
  //destroy houses to free memory since all in quiznight all ready
  HHutton.Destroy;
  HWindsor.Destroy;
  HOK.Destroy;
  //exception alignment
  if lblOK3.Caption = 'Mandi Janse van Rensburg'
    then lblOK3.Left := 28
    else lblOK3.Left := 56;
end;

procedure TForm3.FormActivate(Sender: TObject);
begin
  //exception alignment
  if lblOK3.Caption = 'Mandi Janse van Rensburg'
    then lblOK3.Left := 28
    else lblOK3.Left := 56;
  //alignment
  ScoreAlignment(lblHScore);
  ScoreAlignment(lblWScore);
  ScoreAlignment(lblOKScore);
end;

//helper method
procedure TForm3.ScoreAlignment(lbl: TLabel);
begin
  if length(lbl.Caption) = 2
    then lbl.Left := 40
    else lbl.Left := 80;
end;

procedure TForm3.FormCreate(Sender: TObject);
//make sure colours are correct
const
  clDarkWood = TColor($425E85);
  clLightWood = TColor($A6C2E9);
  clTurquoise = TColor($EAEAAD);
  clDarkTurquoise = TColor($DB9370);
  clGold = TColor($327FCD);
  clOrangeRed = TColor($0024FF);
begin
  pnlHTeam.Color := clLime;
  pnlWTeam.Color := clBlack;
  pnlOKTeam.Color := clRed;
end;

end.
