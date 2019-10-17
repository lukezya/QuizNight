unit FrontCover_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ColorButton, ExtCtrls, jpeg;

type
  TForm1 = class(TForm)
    imgBackground: TImage;
    shpHeader: TShape;
    lblMidstream: TLabel;
    lblQuizNight: TLabel;
    lblCollege: TLabel;
    pnlMenu: TPanel;
    shpMenu: TShape;
    btnStart: TColorButton;
    btnScores: TColorButton;
    btnExit: TColorButton;
    btnHelp: TColorButton;
    procedure btnExitClick(Sender: TObject);
    procedure btnStartClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnScoresClick(Sender: TObject);
    procedure btnHelpClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses GradeMenu_u, Scores_u, Help_u;

{$R *.dfm}

procedure TForm1.btnExitClick(Sender: TObject);
begin
  //Exit
  Application.Terminate;
end;

procedure TForm1.btnStartClick(Sender: TObject);
begin
  //Start
  Form1.Hide;
  Form2.Show;
end;

procedure TForm1.FormCreate(Sender: TObject);
//get correct colours
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
  //correct setup
  lblQuizNight.Font.Color := clOrangeRed;
  lblQuizNight.Width := 280;
  btnExit.HoverColor := clMandarianOrange;
  btnScores.HoverColor := clMandarianOrange;
  btnStart.HoverColor := clMandarianOrange;
  btnHelp.HoverColor := clMandarianOrange;
end;

procedure TForm1.btnScoresClick(Sender: TObject);
begin
  //Scores
  Form1.Hide;
  Form7.Show;
end;

procedure TForm1.btnHelpClick(Sender: TObject);
begin
  Form8.show;
end;

end.
