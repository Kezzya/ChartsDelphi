unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TeEngine, Series, StdCtrls, ExtCtrls, TeeProcs, Chart, Math;

type
  TForm1 = class(TForm)
    cht1: TChart;
    btn1: TButton;
    pntsrsSeries1: TPointSeries;
    cht2: TChart;
    pntsrsSeries2: TPointSeries;
    edt1: TEdit;
    Label1: TLabel;
    cht3: TChart;
    pntsrsSeries3: TPointSeries;
    btn2: TButton;
    edt2: TEdit;
    lbla: TLabel;
    cht4: TChart;
    pntsrsSeries4: TPointSeries;
    btn3: TButton;
    edt3: TEdit;
    lbl1: TLabel;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  k, x, y: Double;
  phi, rho, a: Double;
  b, t: Double;

implementation

{$R *.dfm}
{Первый график - гипербола}
procedure TForm1.btn1Click(Sender: TObject);
begin

  cht1.Series[0].Clear();
  cht2.Series[0].Clear();
  x:= 0.01;
  if (x <> 0.01) then x:=StrToFloat(edt1.Text);
  k:=1;
  while x<2 do begin
    y := k/x;
    cht1.Series[0].AddXY(x, y);
    cht2.Series[0].AddXY(-x, -y);
    x:= x+0.01;
  end;
  cht1.SaveToBitmapFile('1.bmp');
  cht2.SaveToBitmapFile('2.bmp');
end;
 {Второй график}
procedure TForm1.btn2Click(Sender: TObject);
begin
  cht3.Series[0].Clear();
  phi := 0;
  a:=1;
  if (a = 1) then a:=StrToFloat(edt2.Text);

  while phi < 50 do begin
    rho := (3*a*sin(phi)*cos(phi))/ (Power(sin(phi), 3) + Power(cos(phi), 3));
    x := rho*cos(phi);
    y := rho*sin(phi);
    cht3.Series[0].AddXY(x, y);
    phi := phi + 1;

  end;
  cht3.SaveToBitmapFile('3.bmp')
end;

procedure TForm1.btn3Click(Sender: TObject);
begin
  cht4.Series[0].Clear();
  t := 0;
  if (t = 0) then t:=StrToFloat(edt3.Text);
  a := 5;
  b := 3;
  while t<20 do begin
    x:=(a+b)*sin(t)-b*sin(((a/b)+1)*t);
    y:=(a+b)*cos(t)-b*cos(((a/b)+1)*t);
    cht4.Series[0].AddXY(x, y);
    t:= t + 0.001;
  end;
  cht4.SaveToBitmapFile('4.bmp');
end;

end.
