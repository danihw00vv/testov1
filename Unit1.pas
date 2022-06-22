unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, strutils, math;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);
    
  private
    { Private declarations }
    procedure tento2;
    procedure dvato10;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
   chisl, chisl2:Integer; kod:string; kodfin:string;

implementation

{$R *.dfm}

procedure tform1.tento2;
var ost:Integer;
begin
kod:='';
chisl:=StrToInt(Form1.Edit1.text);
ost:=chisl;
 while (ost>=2) do begin
 ost:=chisl div 2; kod:=inttostr(chisl mod 2) + kod;
 chisl:=ost;
 end;
 kod:=inttostr(chisl mod 2)+ kod;

end;

procedure tform1.dvato10;
 var i,j:Integer;
begin
j:=15;
chisl2:=0;

for i:=1 to 16 do begin
  chisl2:=chisl2+ (StrToInt(kodfin[i])*round(power(2,j)));
  j:=j-1;
end;
end;

procedure TForm1.Button1Click(Sender: TObject);
var kod1,kod2:string[8]; i:Integer;
begin
 if ((StrToInt(Edit1.text)>0) and (StrToInt(Edit1.text)<=65535)) then
                                                                     begin
  kod1:=''; kod2:='';  kodfin:='';
  tento2;
  while (length(kod)<16) do kod:='0'+kod;
   for i:=1 to 8 do kod1:=kod1+kod[i];
   for i:=9 to 16 do kod2:=kod2+kod[i];
  kodfin:= kod2+kod1;

dvato10;
Edit2.Text:=IntToStr(chisl2);
                                                                     end
                          else begin ShowMessage('Не двухбайтное положительное');
                               Edit1.Text:=''; end;



end;



end.
