unit beatrice_v.perceptron;
    
interface
    
{$MACRO ON}
{$IFDEF     FPC}
{$mode Delphi}
{$ENDIF}  { FPC }

uses
  beatrice_v.mgmt.fixed,
  Classes,
  SysUtils;

type
  { Our Perceptron Class }
  TPerceptron = class
  private
    fWeight : f32_t;  { Weight for output }
    fBias   : f32_t;  { Bias for perceptron }
    fLRate  : f32_t;  { Learning rate }

    { Prototype Method }
    procedure
    init( iw: f32_t;
          ib: f32_t;
          il: f32_t); stdcall;
  public
    { +--------------+ }
    { | Constructors | }
    { +--------------+ }
    constructor
    New(        iw:   f32_t;
                ib:   f32_t;
                il:   f32_t); overload;
    constructor
    New(        iw:   single;
                ib:   single;
                il:   single); overload;
    
    { +---------+ }
    { | Methods | }
    { +---------+ }
    function 
    Activate(   x:    f32_t):   integer;  stdcall;
    procedure
    Train(      i:    f32_t;
                t:    f32_t);   stdcall;
    function
    Predict(    x:    f32_t):   integer;  stdcall;
  end;
    
implementation

procedure
TPerceptron.init( iw: f32_t;
                  ib: f32_t;
                  il: f32_t); stdcall; 
begin
  fWeight := iw;
  fBias   := ib;
  fLRate  := il;
end;


function
TPerceptron.Predict(x:    f32_t):   integer;  stdcall;
begin
  Result  := Activate(x * fWeight + fBias);
end;

procedure
TPerceptron.Train(  i:    f32_t;
                    t:    f32_t);   stdcall;
var
  output: f32_t;
  error:  integer;
begin
  { Calculate Output }
  output  :=  Activate(i * fWeight + fBias);

  { Calculate Error }
  error   :=  t - output;

  { Update properties}
  fWeight :=  fWeight + fLRate * error * i;
  fBias   :=  fLRate  * error;
end;

function 
TPerceptron.Activate(x: f32_t):  integer; stdcall;
begin
  if(x > 0)then begin
    Result  := 1;
  end else begin
    Result  := 0;
  end;
end;

constructor
TPerceptron.New(iw: single;
                ib: single;
                il: single);  
begin
  init(F_TO_FX(iw), F_TO_FX(ib), F_TO_FX(il));
end;

constructor
TPerceptron.New(iw: f32_t;
                ib: f32_t;
                il: f32_t);  
begin
  init(iw, ib, il);
end;

    
end.