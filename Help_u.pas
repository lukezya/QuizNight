unit Help_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, jpeg, ComCtrls;

type
  TForm8 = class(TForm)
    imgBackground: TImage;
    shpHeader: TShape;
    lblMidstream: TLabel;
    BitBtn1: TBitBtn;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    redScore: TRichEdit;
    redMenu: TRichEdit;
    redFront: TRichEdit;
    TabSheet4: TTabSheet;
    redQuestion: TRichEdit;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form8: TForm8;

implementation

{$R *.dfm}

procedure TForm8.FormCreate(Sender: TObject);
begin
  pagecontrol1.TabIndex := 0;
end;

end.
