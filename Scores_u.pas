unit Scores_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ExtCtrls, StdCtrls, jpeg, clsScores;

type
  TForm7 = class(TForm)
    imgBackground: TImage;
    shpHeader: TShape;
    lblMidstream: TLabel;
    lblCollege: TLabel;
    lblQuizNight: TLabel;
    shpHutton: TShape;
    shpWindsor: TShape;
    shpMaroon: TShape;
    lblHNumber: TLabel;
    lblWNumber: TLabel;
    lblOKNumber: TLabel;
    pnlScore: TPanel;
    shpScore: TShape;
    lblHeader: TLabel;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    lblHutton: TLabel;
    lblWindsor: TLabel;
    lblOldKent: TLabel;
    lblH: TLabel;
    lblW: TLabel;
    lblO: TLabel;
    btn8: TButton;
    btn9: TButton;
    btn10: TButton;
    btn11: TButton;
    btn12: TButton;
    btnT: TButton;
    btnSave: TButton;
    MainMenu1: TMainMenu;
    Home1: TMenuItem;
    Exit1: TMenuItem;
    procedure btn10Click(Sender: TObject);
    procedure btn11Click(Sender: TObject);
    procedure btn12Click(Sender: TObject);
    procedure btn8Click(Sender: TObject);
    procedure btn9Click(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnTClick(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure Home1Click(Sender: TObject);
    procedure lblQuizNightClick(Sender: TObject);
  private
    //helper method
    procedure AddOn(iLeft:integer; sGrade : string);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form7: TForm7;

implementation

uses FrontCover_u;

{$R *.dfm}

//helper method
procedure TForm7.AddOn(iLeft: integer; sGrade: string);
var
  tf : textfile;
  oneLine : string;
  iH, iW, iO : integer;
begin
  //heading
  lblHeader.Left := iLeft;
  lblHeader.Caption := sGrade + ':';
  //read file
  AssignFile(TF, 'C:\Users\Tony\Desktop\YoYo\Billabong\Scores\' +
             sGrade + '.txt');
  Reset(TF);
  readln(TF, oneLine);
  //first line
  case oneLine[1] of
  'H': begin
        lblH.Caption := copy(oneLine, 2, length(oneLine)-1);
        iH := strtoint(lblHNumber.Caption);
        iH := iH+3;
        lblHNumber.Caption := inttostr(iH);
       end;
  'W': begin
        lblW.Caption := copy(oneLine, 2, length(oneLine)-1);
        iW := strtoint(lblWNumber.Caption);
        iW := iW+3;
        lblWNumber.Caption := inttostr(iW);
       end;
  'O': begin
        lblO.Caption := copy(oneLine, 2, length(oneLine)-1);
        iO := strtoint(lblOKNumber.Caption);
        iO := iO+3;
        lblOKNumber.Caption := inttostr(iO);
       end;
  end;

  //second line
  readln(TF, oneLine);
  case oneLine[1] of
  'H': begin
        lblH.Caption := copy(oneLine, 2, length(oneLine)-1);
        iH := strtoint(lblHNumber.Caption);
        iH := iH+2;
        lblHNumber.Caption := inttostr(iH);
       end;
  'W': begin
        lblW.Caption := copy(oneLine, 2, length(oneLine)-1);
        iW := strtoint(lblWNumber.Caption);
        iW := iW+2;
        lblWNumber.Caption := inttostr(iW);
       end;
  'O': begin
        lblO.Caption := copy(oneLine, 2, length(oneLine)-1);
        iO := strtoint(lblOKNumber.Caption);
        iO := iO+2;
        lblOKNumber.Caption := inttostr(iO);
       end;
  end;

  //third line
  readln(TF, oneLine);
  case oneLine[1] of
  'H': begin
        lblH.Caption := copy(oneLine, 2, length(oneLine)-1);
        iH := strtoint(lblHNumber.Caption);
        iH := iH+1;
        lblHNumber.Caption := inttostr(iH);
       end;
  'W': begin
        lblW.Caption := copy(oneLine, 2, length(oneLine)-1);
        iW := strtoint(lblWNumber.Caption);
        iW := iW+1;
        lblWNumber.Caption := inttostr(iW);
       end;
  'O': begin
        lblO.Caption := copy(oneLine, 2, length(oneLine)-1);
        iO := strtoint(lblOKNumber.Caption);
        iO := iO+1;
        lblOKNumber.Caption := inttostr(iO);
       end;
  end;
  CloseFile(TF);

  //Alignment
  if length(lblH.Caption) = 2
    then lblH.Left := 415
    else lblH.Left := 443;

  if length(lblW.Caption) = 2
    then lblW.Left := 415
    else lblW.Left := 443;

  if length(lblO.Caption) = 2
    then lblO.Left := 415
    else lblO.Left := 443;

  if length(lblHNumber.Caption) = 2
    then lblHNumber.Left := 88
    else lblHNumber.Left := 112;

  if length(lblWNumber.Caption) = 2
    then lblWNumber.Left := 248
    else lblWNumber.Left := 272;

  if length(lblOKNumber.Caption) = 2
    then lblOKNumber.Left := 416
    else lblOKNumber.Left := 440;
end;

procedure TForm7.btn10Click(Sender: TObject);
begin
  AddOn(150, 'Grade 10');
end;

procedure TForm7.btn11Click(Sender: TObject);
begin
  AddOn(150, 'Grade 11');
end;

procedure TForm7.btn12Click(Sender: TObject);
begin
  AddOn(150, 'Grade 12');
end;

procedure TForm7.btn8Click(Sender: TObject);
begin
  AddOn(165, 'Grade 8');
end;

procedure TForm7.btn9Click(Sender: TObject);
begin
  AddOn(165, 'Grade 9');
end;

procedure TForm7.btnSaveClick(Sender: TObject);
var
  TheScores : TScores;
  iH, iW, iOK, buttonselected : integer;
begin
  //confirmation
  buttonselected := Messagedlg('Are you sure?', mtConfirmation, [mbOK, mbCancel], 0);
  if buttonselected = mrCancel then Exit; 
  //get scores
  iH := strtoint(lblHNumber.Caption);
  iW := strtoint(lblWNumber.Caption);
  iOK := strtoint(lblOKNumber.Caption);
  //create and save
  TheScores := TScores.Create(iH, iW, iOK);
  TheScores.Save;
end;

procedure TForm7.btnTClick(Sender: TObject);
begin
  AddOn(150, 'Teachers');
end;

procedure TForm7.Exit1Click(Sender: TObject);
begin
  //Exit
  Application.Terminate;
end;

procedure TForm7.Home1Click(Sender: TObject);
begin
  //Home
  Form7.Hide;
  Form1.Show;
end;

procedure TForm7.lblQuizNightClick(Sender: TObject);
begin
  //automation - easier
  btn8.Click;
  btn9.Click;
  btn10.Click;
  btn11.Click;
  btn12.Click;
  btnT.Click;
end;

end.
