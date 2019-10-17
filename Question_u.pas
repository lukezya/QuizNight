unit Question_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Menus, StdCtrls, ComCtrls, pngimage, jpeg;

type
  TForm4 = class(TForm)
    imgBackground: TImage;
    shpHeader: TShape;
    lblMidstream: TLabel;
    lblCollege: TLabel;
    lblQuizNight: TLabel;
    shpHutton: TShape;
    shpQuestion: TShape;
    shpAnswer: TShape;
    shpWindsor: TShape;
    shpMaroon: TShape;
    lblAnswer: TLabel;
    Label7: TLabel;
    imgFace: TImage;
    imgHGreen: TImage;
    imgHRed: TImage;
    imgWGreen: TImage;
    imgWRed: TImage;
    imgOKGreen: TImage;
    imgOKRed: TImage;
    lblSubject: TLabel;
    lblMovies: TLabel;
    lblSeries: TLabel;
    lblHNumber: TLabel;
    lblWNumber: TLabel;
    lblOKNumber: TLabel;
    imgHSmiley: TImage;
    imgWSmiley: TImage;
    imgOKSmiley: TImage;
    imgHArrow: TImage;
    imgWArrow: TImage;
    imgOKArrow: TImage;
    edtOut: TEdit;
    redOut: TRichEdit;
    pnlTimer: TPanel;
    shpTimer: TShape;
    lblTimer: TLabel;
    redQuestion: TRichEdit;
    btnReset: TButton;
    btnGo: TButton;
    MainMenu1: TMainMenu;
    Question1: TMenuItem;
    Scores1: TMenuItem;
    Timer: TTimer;
    procedure btnGoClick(Sender: TObject);
    procedure btnResetClick(Sender: TObject);
    procedure Question1Click(Sender: TObject);
    procedure imgHGreenClick(Sender: TObject);
    procedure imgHRedClick(Sender: TObject);
    procedure imgOKGreenClick(Sender: TObject);
    procedure imgOKRedClick(Sender: TObject);
    procedure imgWGreenClick(Sender: TObject);
    procedure imgWRedClick(Sender: TObject);
    procedure redOutKeyPress(Sender: TObject; var Key: Char);
    procedure Scores1Click(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    //helper methods
    procedure GreenCorrect(imgHide, imgShow : TImage; pAdd : string);
    procedure RedWrong(imgGreen, imgArr1, imgArr2, imgArrHide : TImage;
                       cap1, cap2, cap3 : TLabel);
    procedure WaitStart(iNo : string; cap : TLabel; imgArrShow : TImage;
                        var Key: Char);
    procedure WaitAfter(iFirst, iSecond, iThird : string; cap1, cap2 : TLabel;
                        var Key: Char);
    { Private declarations }
  public
    Point : string;
    QN : integer;
    TheAnswer : string;
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

uses Number_u, GradeMenu_u, ScoreSheet_u, Teachers_u;

{$R *.dfm}

procedure TForm4.btnGoClick(Sender: TObject);
begin
  //let timer go
  Timer.Enabled := true;;
end;

procedure TForm4.btnResetClick(Sender: TObject);
begin
  //reset timer
  Timer.Enabled := false;
  lblTimer.Font.Color := clBlack;
  lblTimer.Caption := '7.0';
end;

procedure TForm4.Question1Click(Sender: TObject);
begin
  //get everything ready
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
  redQuestion.Clear;
  lblAnswer.Caption := '';
  lblMidstream.Hide;
  lblCollege.Hide;
  lblQuizNight.Hide;
  lblSubject.Show;
  redQuestion.SetFocus;
  //make sure its not Q40 - only 40 questions
  QN := Form5.sedQuestion.Value;
  if QN = 40 then
    begin
      ShowMessage('40 Questions have been asked');
      Exit;
    end;
  inc(QN);
  Form5.sedQuestion.Value := QN;
  //get number_u screen ready
  Form4.Hide;
  Form5.Show;
  Form5.WindowState := wsNormal;
  Form5.WindowState := wsMaximized;  
end;

procedure TForm4.imgHGreenClick(Sender: TObject);
begin
  GreenCorrect(imgHRed, imgHSmiley, 'H');
end;

procedure TForm4.imgHRedClick(Sender: TObject);
begin
  RedWrong(imgHGreen, imgWArrow, imgOKArrow, imgHArrow,
           lblHNumber, lblWNumber, lblOKNumber);
end;

procedure TForm4.imgOKGreenClick(Sender: TObject);
begin
  GreenCorrect(imgOKRed, imgOKSmiley, 'O');
end;

procedure TForm4.imgOKRedClick(Sender: TObject);
begin
  RedWrong(imgOKGreen, imgHArrow, imgWArrow, imgOKArrow,
           lblOKNumber, lblHNumber, lblWNumber);
end;

procedure TForm4.imgWGreenClick(Sender: TObject);
begin
  GreenCorrect(imgWRed, imgWSmiley, 'W');
end;

procedure TForm4.imgWRedClick(Sender: TObject);
begin
  RedWrong(imgWGreen, imgHArrow, imgOKArrow, imgWArrow,
           lblWNumber, lblHNumber, lblOKNumber);
end;

procedure TForm4.redOutKeyPress(Sender: TObject; var Key: Char);
var
  sequence: string;
begin
  sequence := edtOut.Text;
  //start of question - waiting for 1st buzz
  if sequence = '' then
    begin
      WaitStart('1', lblHNumber, imgHArrow, Key);
      WaitStart('2', lblWNumber, imgWArrow, Key);
      WaitStart('3', lblOKNumber, imgOKArrow, Key);
 
      edtOut.Text := Key;
      Timer.Enabled := true;
    end;

  //after first buzz - if its Hutton
  if length(sequence) = 1 then
    begin
      WaitAfter('1', '2', '3', lblWNumber, lblOKNumber, Key);
  //after first buzz - if its Windsor
      WaitAfter('2', '1', '3', lblHNumber, lblOKNumber, Key);
  //after first buzz - if its Old Kent
      WaitAfter('3', '1', '2', lblHNumber, lblWNumber, Key);
      //set timer off
      Timer.Enabled := true;
    end;
  if length(sequence) >= 2
    then Key := #0;  
end;

procedure TForm4.Scores1Click(Sender: TObject);
var
  m, Hu, Wi, Ol : integer;
begin
  //teachers
  if Form6.bTeachers = true then
    begin
      Form4.Hide;
      for m := 1 to length(Point) do
        begin
          if Point[m] = 'W' then
            begin
              Wi := strtoint(Form6.lblWScore.Caption);
              inc(Wi);
              Form6.lblWScore.Caption := inttostr(Wi);
            end;
          if Point[m] = 'H' then
            begin
              Hu := strtoint(Form6.lblHScore.Caption);
              inc(Hu);
              Form6.lblHScore.Caption := inttostr(Hu);
            end;
          if Point[m] = 'O'then
            begin
              Ol := strtoint(Form6.lblOKScore.Caption);
              inc(Ol);
              Form6.lblOKScore.Caption := inttostr(Ol);
            end;
        end;
      Form6.Show;
      Exit;
    end;
  //grade 8-12
  Form4.Hide;
  for m := 1 to length(Point) do
    begin
      if Point[m] = 'W' then
        begin
          Wi := strtoint(Form3.lblWScore.Caption);
          inc(Wi);
          Form3.lblWScore.Caption := inttostr(Wi);
        end;
      if Point[m] = 'H' then
        begin
          Hu := strtoint(Form3.lblHScore.Caption);
          inc(Hu);
          Form3.lblHScore.Caption := inttostr(Hu);
        end;
      if Point[m] = 'O'then
        begin
          Ol := strtoint(Form3.lblOKScore.Caption);
          inc(Ol);
          Form3.lblOKScore.Caption := inttostr(Ol);
        end;
    end;
  Form3.Show;
end;

procedure TForm4.TimerTimer(Sender: TObject);
begin
  //let the time click
  lblTimer.Caption := floattostr(strtofloat(lblTimer.Caption)-0.1);
  if lblTimer.Caption = '0' then
    begin
      Timer.Enabled := false;
      lblTimer.Caption := '0.0';
      lblTimer.Font.Color := clRed;
    end;
end;

procedure TForm4.FormCreate(Sender: TObject);
//colours
const
  clOrangeRed = TColor($0024FF);
  clGold = TColor($327FCD);
//put correct setup
begin
  lblQuizNight.Font.Color := clOrangeRed;
  lblQuizNight.Width := 280;
  shpQuestion.Pen.Color := clOrangeRed;
  shpAnswer.Pen.Color := clOrangeRed;
  lblSubject.Hide;
  lblMovies.Hide;
  lblSeries.Hide;
  Point := '';
  QN := 0;
  TheAnswer := '';
end;

procedure TForm4.FormActivate(Sender: TObject);
//get ready for buzzers
begin
  redQuestion.SetFocus;
end;

//helper methods
procedure TForm4.GreenCorrect(imgHide, imgShow: TImage; pAdd: string);
begin
  Timer.Enabled := false;
  imgHide.Hide;
  imgShow.Show;
  lblTimer.Font.Color := clBlack;
  lblTimer.Caption := '7.0';
  Point := Point + pAdd;  
  lblAnswer.Caption := TheAnswer;
end;

procedure TForm4.RedWrong(imgGreen, imgArr1, imgArr2, imgArrHide: TImage;
  cap1, cap2, cap3: TLabel);
var
  num : integer;
begin
  Timer.Enabled := false;
  imgGreen.Hide;
  //show next arrow
  num := strtoint(cap1.caption);
  inc(num);

  if num = 4 then
    begin
      lblAnswer.Caption := TheAnswer;
      lblTimer.Font.Color := clBlack;
      lblTimer.Caption := '7.0';
	  //make sure its black
      lblTimer.Font.Color := clBlack; 
      Exit;
    end;
  //check which number corresponds
  if strtoint(cap2.Caption) = num then
    begin
      imgArrHide.Hide;
      imgArr1.Show;
    end;

  if strtoint(cap3.Caption) = num then
    begin
      imgArrHide.Hide;
      imgArr2.Show;
    end;

  lblTimer.Caption := '7.0';
  lblTimer.Font.Color := clBlack;
  Timer.Enabled := true;
end;

procedure TForm4.WaitStart(iNo : string; cap: TLabel; imgArrShow: TImage;
  var Key: Char);
begin
  if Key = iNo then
    begin
      cap.Caption := '1';
      imgArrShow.Show;
    end;
end;

procedure TForm4.WaitAfter(iFirst, iSecond, iThird : string;
  cap1, cap2: TLabel; var Key: Char);
var
  sequence: string;
begin
  sequence := edtOut.Text;
  if sequence = iFirst then
    begin
      if Key = iFirst
        then Key := #0;
      if Key = iSecond then
        begin
          cap1.Caption := '2';
          cap2.Caption := '3';
          edtOut.Text := edtOut.Text + Key;
        end;
      if Key = iThird then
        begin
          cap2.Caption := '2';
          cap1.Caption := '3';
          edtOut.Text := edtOut.Text + Key;
        end;
    end;
end;

end.
