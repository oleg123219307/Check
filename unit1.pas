unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls;

type
  TCheck=record
    super,avialable:boolean;
    Image:Timage;
    color,num,ves,target:integer;
  end;
  Tmas =array[1..8,1..8] of TCheck;
  { TForm1 }

  TForm1 = class(TForm)
    Image1: TImage;
    Image10: TImage;
    Image11: TImage;
    Image12: TImage;
    Image13: TImage;
    Image14: TImage;
    Image15: TImage;
    Image16: TImage;
    Image17: TImage;
    Image18: TImage;
    Image19: TImage;
    Image2: TImage;
    Image20: TImage;
    Image21: TImage;
    Image22: TImage;
    Image23: TImage;
    Image24: TImage;
    Image25: TImage;
    Image26: TImage;
    Image27: TImage;
    Image28: TImage;
    Image29: TImage;
    Image3: TImage;
    Image30: TImage;
    Image31: TImage;
    Image32: TImage;
    Image33: TImage;
    Image34: TImage;
    Image35: TImage;
    Image36: TImage;
    Image37: TImage;
    Image38: TImage;
    Image39: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    Image8: TImage;
    Image9: TImage;
    procedure FormActivate(Sender: TObject);
    procedure Image10Click(Sender: TObject);
    procedure Image11Click(Sender: TObject);
    procedure Image12Click(Sender: TObject);
    procedure Image13Click(Sender: TObject);
    procedure Image14Click(Sender: TObject);
    procedure Image15Click(Sender: TObject);
    procedure Image16Click(Sender: TObject);
    procedure Image17Click(Sender: TObject);
    procedure Image18Click(Sender: TObject);
    procedure Image19Click(Sender: TObject);
    procedure Image20Click(Sender: TObject);
    procedure Image21Click(Sender: TObject);
    procedure Image22Click(Sender: TObject);
    procedure Image23Click(Sender: TObject);
    procedure Image24Click(Sender: TObject);
    procedure Image25Click(Sender: TObject);
    procedure Image26Click(Sender: TObject);
    procedure Image27Click(Sender: TObject);
    procedure Image28Click(Sender: TObject);
    procedure Image29Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure Image30Click(Sender: TObject);
    procedure Image31Click(Sender: TObject);
    procedure Image32Click(Sender: TObject);
    procedure Image33Click(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure Image5Click(Sender: TObject);
    procedure Image6Click(Sender: TObject);
    procedure Image7Click(Sender: TObject);
    procedure Image8Click(Sender: TObject);
    procedure Image9Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;
  AP:Tmas;
  A1,A2:Tcheck;
  Seli,selj,Yu,YY,Oo:integer;
implementation
{$R *.lfm}

{ TForm1 }

Procedure MoveT(var C:Tcheck; var D:TCheck);
Var
Ts1:Tpicture;
Tcol:integer;
begin
  if (D.num<=4) and (C.Color=2) and (not C.super) then begin
  D.Image.Picture:=Form1.Image38.Picture;
  C.Image.Picture:=nil;
  Tcol:=C.color;
  C.color:=D.color;
  D.color:=Tcol;
  D.super:=true;
  end else
  if (D.num>=29) and (C.Color=1) and (not C.super) then begin
  D.Image.Picture:=Form1.Image39.Picture;
  C.Image.Picture:=nil;
  Tcol:=C.color;
  C.color:=D.color;
  D.color:=Tcol;
  D.super:=true;
  end else begin
D.Image.Picture:=C.Image.Picture;
C.Image.Picture:=nil;
D.color:=C.color;
C.color:=0;
  if C.super then D.super:=true;
    C.super:=false;
end;
end;

Procedure MoveV(C,D:TCheck);
begin
C.Image.Top:=D.Image.Top;
C.Image.Left:=D.Image.left;
end;

Function MT(var A:Tmas; var Y:integer; u:integer):boolean;
var b,D:boolean;
i,j,g,ii,jj,gg,kk:integer;
begin
MT:=false;
b:=false;
g:=0;
for i:=1 to 8 do begin
   for j:=1 to 8 do
      if a[i,j].num=u then begin b:=true; break; end;
      if b then break;
   end;

  if (Seli<>0)and(a[i,j].Image.Picture.Graphic<>nil) then begin
      Seli:=0;
      Selj:=0;
      MoveV(A1,A2);
    end;

// Выбор шашки
  if (Seli=0)and(a[i,j].Image.Picture.Graphic<>nil)and(a[i,j].color=Y) then begin
    Seli:=i;
    Selj:=j;
    MoveV(A1,a[seli,selj]);
    exit;
  end;
// Конец
if not a[seli,selj].super then begin
if seli<>0 then
    if (a[i,j].Image.Picture.Graphic = nil) then if (((seli=i+1)and(Y=2))or((seli=i-1)and(Y=1)))and((selj=j+1)or(selj=j-1))
    then begin
      MoveT(a[seli,selj],a[i,j]);
      MoveV(A1,A2);
        MT:=true;
      Seli:=0;
      Selj:=0;
      if Y=2 then Y:=1 else Y:=2;
      end else begin
      //Проверка удара
      if ((seli=i-2)and(selj=j-2)and(a[seli+1,selj+1].color>0)and(a[seli+1,selj+1].color<>a[seli,selj].color)) then g:=1;
      if ((seli=i+2)and(selj=j-2)and(a[seli-1,selj+1].color>0)and(a[seli-1,selj+1].color<>a[seli,selj].color)) then g:=2;
      if ((seli=i-2)and(selj=j+2)and(a[seli+1,selj-1].color>0)and(a[seli+1,selj-1].color<>a[seli,selj].color)) then g:=3;
      if ((seli=i+2)and(selj=j+2)and(a[seli-1,selj-1].color>0)and(a[seli-1,selj-1].color<>a[seli,selj].color)) then g:=4;
      if g>0 then
      begin
      MoveT(a[seli,selj],a[i,j]);
        MT:=true;
      case g of
      1: begin a[seli+1,selj+1].color:=0; a[seli+1,selj+1].Image.Picture:=nil; end;
      2: begin a[seli-1,selj+1].color:=0; a[seli-1,selj+1].Image.Picture:=nil; end;
      3: begin a[seli+1,selj-1].color:=0; a[seli+1,selj-1].Image.Picture:=nil; end;
      4: begin a[seli-1,selj-1].color:=0; a[seli-1,selj-1].Image.Picture:=nil; end;
      end;
      MoveV(A1,A2);
      Seli:=0;
      Selj:=0;
      end; end;
      //Конец
      end else
      begin
      if (a[i,j].Image.Picture.Graphic = nil) then
          begin
          gg:=0;
          if ((i>seli) and (j>selj)) and (abs(seli-i)=abs(selj-j)) then
          begin
          gg:=1;
          kk:=0;
              for ii:=seli+1 to i-1 do begin
              inc(kk);
                  if a[seli+kk,selj+kk].color>0 then begin  gg:=0; break;  end;
              end;
          end;
          if ((i<seli) and (j<selj))and (abs(seli-i)=abs(selj-j)) then
          begin
          gg:=2;
          kk:=0;
              for ii:=seli-1 downto i+1 do begin
              inc(kk);
                  if a[seli-kk,selj-kk].color>0 then begin  gg:=0; break;  end;
              end;
          end;
          if ((i>seli) and (j<selj))and (abs(seli-i)=abs(selj-j)) then
          begin
          gg:=3;
          kk:=0;
              for ii:=seli+1 to i-1 do
                  begin
                  inc(kk);
                  if a[seli+kk,selj-kk].color>0 then begin  gg:=0; break;  end;
                  end;
                end;
          end;
          if ((i<seli) and (j>selj))and (abs(seli-i)=abs(selj-j)) then
          begin
          gg:=4;
          kk:=0;
              for ii:=seli-1 downto i+1 do begin
                   inc(kk);
                  if a[seli-kk,selj+kk].color>0 then begin  gg:=0; break;  end;
              end;
          end;
          if gg>0 then begin
            MT:=true;
      MoveT(a[seli,selj],a[i,j]);
      MoveV(A1,A2);
      Seli:=0;
      Selj:=0;
      if Y=2 then begin Y:=1;
      end else Y:=2;
      end else begin
      //Проверка удара
      if (ii=(i-1))and((selj+kk)=j-1)and(a[i-1,j-1].color<>Y) then g:=1;
      if (ii=(i+1))and((selj-kk)=j+1)and(a[i+1,j+1].color<>Y) then g:=2;
      if (ii=(i-1))and((selj-kk)=j+1)and(a[i-1,j+1].color<>Y) then g:=3;
      if (ii=(i+1))and((selj+kk)=j-1)and(a[i+1,j-1].color<>Y) then g:=4;
      if g>0 then
      begin
      MT:=true;
      MoveT(a[seli,selj],a[i,j]);
      case g of
      1: begin a[i-1,j-1].color:=0; a[i-1,j-1].Image.Picture:=nil; end;
      2: begin a[i+1,j+1].color:=0; a[i+1,j+1].Image.Picture:=nil; end;
      3: begin a[i-1,j+1].color:=0; a[i-1,j+1].Image.Picture:=nil; end;
      4: begin a[i+1,j-1].color:=0; a[i+1,j-1].Image.Picture:=nil; end;
      end;
      MoveV(A1,A2);
      Seli:=0;
      Selj:=0;
      end; end;
      //Конец
      end;
  end;

procedure TForm1.FormActivate(Sender: TObject);
var i,j,k:integer;
s:string;
begin
Yu:=2;
Oo:=1;///////Глубина расчета
AP[1,2].image:=image2;  AP[3,2].image:=image10;  AP[5,2].image:=image18;   AP[7,2].image:=image26;
AP[1,4].image:=image3;  AP[3,4].image:=image11;  AP[5,4].image:=image19;   AP[7,4].image:=image27;
AP[1,6].image:=image4;  AP[3,6].image:=image12;  AP[5,6].image:=image20;   AP[7,6].image:=image28;
AP[1,8].image:=image5;  AP[3,8].image:=image13;  AP[5,8].image:=image21;   AP[7,8].image:=image29;
AP[2,1].image:=image6;  AP[4,1].image:=image14;  AP[6,1].image:=image22;   AP[8,1].image:=image30;
AP[2,3].image:=image7;  AP[4,3].image:=image15;  AP[6,3].image:=image23;   AP[8,3].image:=image31;
AP[2,5].image:=image8;  AP[4,5].image:=image16;  AP[6,5].image:=image24;   AP[8,5].image:=image32;
AP[2,7].image:=image9;  AP[4,7].image:=image17;  AP[6,7].image:=image25;   AP[8,7].image:=image33;
For i:=1 to 8 do
  For j:=1 to 8 do
       AP[i,j].avialable:=not((((i mod 2)=0)and((j mod 2)=0))or(((i mod 2)>0)and((j mod 2)>0)));
       k:=1;
       for i:=1 to 8 do
          for j:=1 to 8 do
             if AP[i,j].avialable then begin
             if i<=3 then begin AP[i,j].color:=1; AP[i,j].image.Picture:=Image37.picture; end;
             if (i>3)and(i<6) then begin AP[i,j].color:=0; AP[i,j].image.Picture:=nil; end;
             if i>=6 then begin AP[i,j].color:=2; AP[i,j].image.Picture:=image36.picture; end;
             AP[i,j].num:=k;
             AP[i,j].target:=0;
             AP[i,j].ves:=0;
             inc(k);
             end;
 A1.Image:=image34;
 A2.Image:=image35;
end;


Procedure AI(Var A:Tmas; B:Tmas);
Function prov(Bb:Tmas; glub,X:integer; var Uu1:integer; var Uu2:integer):integer; forward;


///////

  Procedure MoveTT(var C:Tcheck; var D:TCheck);
  Var
  Tcol:integer;
  begin
    if (D.num<=4) and (C.Color=2) and (not C.super) then begin
    Tcol:=C.color;
    C.color:=D.color;
    D.color:=Tcol;
    D.super:=true;
    end else
    if (D.num>=29) and (C.Color=1) and (not C.super) then begin
    Tcol:=C.color;
    C.color:=D.color;
    D.color:=Tcol;
    D.super:=true;
    end else begin
  D.color:=C.color;
  C.color:=0;
    if C.super then D.super:=true;
      C.super:=false;
  end;
  end;

Function MTI(var A:Tmas;var Y:integer; u:integer):integer;
var b:boolean;
i,j,g,ii,jj,gg,kk:integer;
begin
MTI:=0;
b:=false;
g:=0;
for i:=1 to 8 do begin
   for j:=1 to 8 do
      if a[i,j].num=u then begin b:=true; break; end;
      if b then break;
   end;

  if (Seli<>0)and(a[i,j].color<>0) then begin
      Seli:=0;
      Selj:=0;
      MoveV(A1,A2);
    end;

// Выбор шашки
  if (Seli=0)and(a[i,j].color<>0)and(a[i,j].color=Y) then begin
    Seli:=i;
    Selj:=j;
    MoveV(A1,a[seli,selj]);
      MTI:=0;
    exit;
  end;
// Конец
if not a[seli,selj].super then begin
if seli<>0 then
    if (a[i,j].color = 0) then if (((seli=i+1)and(Y=2))or((seli=i-1)and(Y=1)))and((selj=j+1)or(selj=j-1))
    then begin
      MoveTT(a[seli,selj],a[i,j]);
      MoveV(A1,A2);
        MTI:=1;
      Seli:=0;
      Selj:=0;
      if Y=2 then Y:=1 else Y:=2;
      end else begin
      //Проверка удара
      if ((seli=i-2)and(selj=j-2)and(a[seli+1,selj+1].color>0)and(a[seli+1,selj+1].color<>a[seli,selj].color)) then g:=1;
      if ((seli=i+2)and(selj=j-2)and(a[seli-1,selj+1].color>0)and(a[seli-1,selj+1].color<>a[seli,selj].color)) then g:=2;
      if ((seli=i-2)and(selj=j+2)and(a[seli+1,selj-1].color>0)and(a[seli+1,selj-1].color<>a[seli,selj].color)) then g:=3;
      if ((seli=i+2)and(selj=j+2)and(a[seli-1,selj-1].color>0)and(a[seli-1,selj-1].color<>a[seli,selj].color)) then g:=4;
      if g>0 then
      begin
      MoveTT(a[seli,selj],a[i,j]);
        MTI:=2;
      case g of
      1: begin a[seli+1,selj+1].color:=0; end;
      2: begin a[seli-1,selj+1].color:=0; end;
      3: begin a[seli+1,selj-1].color:=0; end;
      4: begin a[seli-1,selj-1].color:=0; end;
      end;
      MoveV(A1,A2);
      Seli:=0;
      Selj:=0;
      end; end;
      //Конец
      end else
      begin
      if (a[i,j].color = 0) then
          begin
          gg:=0;
          if ((i>seli) and (j>selj)) and (abs(seli-i)=abs(selj-j)) then
          begin
          gg:=1;
          kk:=0;
              for ii:=seli+1 to i-1 do begin
              inc(kk);
                  if a[seli+kk,selj+kk].color>0 then begin  gg:=0; break;  end;
              end;
          end;
          if ((i<seli) and (j<selj))and (abs(seli-i)=abs(selj-j)) then
          begin
          gg:=2;
          kk:=0;
              for ii:=seli-1 downto i+1 do begin
              inc(kk);
                  if a[seli-kk,selj-kk].color>0 then begin  gg:=0; break;  end;
              end;
          end;
          if ((i>seli) and (j<selj))and (abs(seli-i)=abs(selj-j)) then
          begin
          gg:=3;
          kk:=0;
              for ii:=seli+1 to i-1 do
                  begin
                  inc(kk);
                  if a[seli+kk,selj-kk].color>0 then begin  gg:=0; break;  end;
                  end;
                end;
          end;
          if ((i<seli) and (j>selj))and (abs(seli-i)=abs(selj-j)) then
          begin
          gg:=4;
          kk:=0;
              for ii:=seli-1 downto i+1 do begin
                   inc(kk);
                  if a[seli-kk,selj+kk].color>0 then begin  gg:=0; break;  end;
              end;
          end;
          if gg>0 then begin
            MTI:=3;
      MoveTT(a[seli,selj],a[i,j]);
      MoveV(A1,A2);
      Seli:=0;
      Selj:=0;
      if Y=2 then begin Y:=1;
      end else Y:=2;
      end else begin
      //Проверка удара
      if (ii=(i-1))and((selj+kk)=j-1)and(a[i-1,j-1].color<>Y) then g:=1;
      if (ii=(i+1))and((selj-kk)=j+1)and(a[i+1,j+1].color<>Y) then g:=2;
      if (ii=(i-1))and((selj-kk)=j+1)and(a[i-1,j+1].color<>Y) then g:=3;
      if (ii=(i+1))and((selj+kk)=j-1)and(a[i+1,j-1].color<>Y) then g:=4;
      if g>0 then
      begin
        MTI:=4;
      MoveTT(a[seli,selj],a[i,j]);
      case g of
      1: begin a[i-1,j-1].color:=0; end;
      2: begin a[i+1,j+1].color:=0; end;
      3: begin a[i-1,j+1].color:=0; end;
      4: begin a[i+1,j-1].color:=0; end;
      end;
      MoveV(A1,A2);
      Seli:=0;
      Selj:=0;
      end; end;
      //Конец
      end;
  end;
///////


Function Ocenka(Bb:Tmas; ii,jj,kk,mm,glub,Col:integer):integer;
var
i,j,U1,U2,X,Z,kols,kolch,rasst, rasst2:integer;
begin
rasst:=1;
rasst2:=1;
  kols:=0;
  kolch:=0;
  X:=col;
Mti(Bb,X,Bb[ii,jj].num);
Z:=Mti(Bb,X,Bb[kk,mm].num);
if (Z = 1)or(Z = 3) then begin
if glub>0 then begin
ocenka:=Prov(Bb,glub-1,X,U1,U2);
end else begin
for i:=1 to 8 do
for j:=1 to 8 do
if (bb[i,j].avialable)and(bb[i,j].color=1) then
kols:=kols+1;
for i:=1 to 8 do
for j:=1 to 8 do
if (bb[i,j].avialable)and(bb[i,j].color<>1)and(bb[i,j].color<>0) then
kolch:=kolch+1;
for i:=1 to 8 do
for j:=1 to 8 do
if (bb[i,j].avialable)and(bb[i,j].color=1)and(bb[i,j].super) then
rasst:=rasst*10;
for i:=1 to 8 do
for j:=1 to 8 do
if (bb[i,j].avialable)and(bb[i,j].color=1)and(bb[i,j].super) then
rasst2:=rasst2*10;
Ocenka:=round(100*(kols)*(13-kolch)*rasst/rasst2);
end; end else
if ((Z = 2)or(Z = 4))and((Col=1)and(Glub=(Oo*2))) then begin
Ocenka:=10000*(glub+1);
exit;
end else
Ocenka:=0;
end;

Function prov(Bb:Tmas; glub,X:integer; var Uu1:integer; var Uu2:integer):integer;
var
i,j,m,k,max,oc:integer;
begin
max:=0;
oc:=0;
for i:=1 to 8 do
    for j:=1 to 8 do
    if (Bb[i,j].avialable)and(Bb[i,j].color=X) then
       for k:=1 to 8 do
           for m:=1 to 8 do
           if (Bb[k,m].avialable)and(Bb[k,m].color=0) then
               begin
               oc:=Ocenka(Bb,i,j,k,m,glub,X);
               if oc>max then begin
               max:=oc;
               Uu1:=Bb[i,j].num;
               Uu2:=Bb[k,m].num;
               Prov:=max;
               end;
               end;
end;
label 1;
var
U1,U2,U3:integer;
begin
1:
Prov(A,Oo*2,1,U1,U2);
if U1=0 then exit;
MT(A,Yu,U1);
if MT(A,Yu,U2) and (Yu=1) then goto 1;
end;


procedure TForm1.Image10Click(Sender: TObject);
begin
  if MT(AP,Yu,9) then
  AI(AP,AP);
end;

procedure TForm1.Image11Click(Sender: TObject);
begin
  if MT(AP,Yu,10) then
  AI(AP,AP);
end;

procedure TForm1.Image12Click(Sender: TObject);
begin
  if MT(AP,Yu,11) then
  AI(AP,AP);
end;

procedure TForm1.Image13Click(Sender: TObject);
begin
  if MT(AP,Yu,12) then
  AI(AP,AP);
end;

procedure TForm1.Image14Click(Sender: TObject);
begin
  if MT(AP,Yu,13) then
  AI(AP,AP);
end;

procedure TForm1.Image15Click(Sender: TObject);
begin
  if MT(AP,Yu,14) then
  AI(AP,AP);
end;

procedure TForm1.Image16Click(Sender: TObject);
begin
  if MT(AP,Yu,15) then
  AI(AP,AP);
end;

procedure TForm1.Image17Click(Sender: TObject);
begin
  if MT(AP,Yu,16) then
  AI(AP,AP);
end;

procedure TForm1.Image18Click(Sender: TObject);
begin
  if MT(AP,Yu,17) then
  AI(AP,AP);
end;

procedure TForm1.Image19Click(Sender: TObject);
begin
  if MT(AP,Yu,18) then
  AI(AP,AP);
end;

procedure TForm1.Image20Click(Sender: TObject);
begin
  if MT(AP,Yu,19) then
  AI(AP,AP);
end;

procedure TForm1.Image21Click(Sender: TObject);
begin
  if MT(AP,Yu,20) then
  AI(AP,AP);
end;

procedure TForm1.Image22Click(Sender: TObject);
begin
if
MT(AP,Yu,21)
then
AI(AP,AP);
end;

procedure TForm1.Image23Click(Sender: TObject);
begin
  if MT(AP,Yu,22) then
  AI(AP,AP);
end;

procedure TForm1.Image24Click(Sender: TObject);
begin
  if MT(AP,Yu,23) then
  AI(AP,AP);
end;

procedure TForm1.Image25Click(Sender: TObject);
begin
  if MT(AP,Yu,24) then
  AI(AP,AP);
end;

procedure TForm1.Image26Click(Sender: TObject);
begin
  if MT(AP,Yu,25) then
  AI(AP,AP);
end;

procedure TForm1.Image27Click(Sender: TObject);
begin
  if MT(AP,Yu,26) then
  AI(AP,AP);
end;

procedure TForm1.Image28Click(Sender: TObject);
begin
 if MT(AP,Yu,27) then
 AI(AP,AP);
end;

procedure TForm1.Image29Click(Sender: TObject);
begin
  if MT(AP,Yu,28) then
  AI(AP,AP);
end;

procedure TForm1.Image2Click(Sender: TObject);
begin
 if MT(AP,Yu,1) then
 AI(AP,AP);
end;

procedure TForm1.Image30Click(Sender: TObject);
begin
  if MT(AP,Yu,29) then
  AI(AP,AP);
end;

procedure TForm1.Image31Click(Sender: TObject);
begin
  if MT(AP,Yu,30) then
  AI(AP,AP);
end;

procedure TForm1.Image32Click(Sender: TObject);
begin
  if MT(AP,Yu,31) then
  AI(AP,AP);
end;

procedure TForm1.Image33Click(Sender: TObject);
begin
  if MT(AP,Yu,32) then
  AI(AP,AP);
end;

procedure TForm1.Image3Click(Sender: TObject);
begin
 if MT(AP,Yu,2) then
 AI(AP,AP);
end;

procedure TForm1.Image4Click(Sender: TObject);
begin
 if MT(AP,Yu,3) then
 AI(AP,AP);
end;

procedure TForm1.Image5Click(Sender: TObject);
begin
 if MT(AP,Yu,4) then
 AI(AP,AP);
end;

procedure TForm1.Image6Click(Sender: TObject);
begin
  if MT(AP,Yu,5) then
  AI(AP,AP);
end;

procedure TForm1.Image7Click(Sender: TObject);
begin
  if MT(AP,Yu,6) then
  AI(AP,AP);
end;

procedure TForm1.Image8Click(Sender: TObject);
begin
  if MT(AP,Yu,7) then
  AI(AP,AP);
end;

procedure TForm1.Image9Click(Sender: TObject);
begin
  if MT(AP,Yu,8) then
  AI(AP,AP);
end;


end.

