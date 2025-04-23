unit beatrice_v.mgmt.fixed;

interface

uses
  beatrice_v.mgmt.types;

const
  FR_BITS = 16;
  FR_UNIT = 1 shl FR_BITS;

type
  f32_t = i32_t;

{ +-----------------------+ }
{ |       CONVERTERS      | }
{ +-----------------------+ }
function
F_TO_FX(f: single):   f32_t;
function
I_TO_FX(i: integer):  f32_t;
function
FX_TO_F(x: f32_t):    single;
function
FX_TO_I(x: f32_t):    integer;

{ +-----------------------+ }
{ |       OPERATIONS      | }
{ +-----------------------+ }
function
f32_mul( a, b: f32_t): f32_t;
function
f32_div( a, b: f32_t): f32_t;
function
f32_div2(a, b: f32_t): f32_t;

implementation

{ +-----------------------+ }
{ |       CONVERTERS      | }
{ +-----------------------+ }
function
F_TO_FX(f: single): f32_t;
begin
  F_TO_FX := f32_t(f * 65536.0);
end;

function
I_TO_FX(i: integer): f32_t;
begin
  I_TO_FX := f32_t(i shl FR_BITS);
end;

function
FX_TO_F(x: f32_t): single;
begin
  FX_TO_F := single(x) / 65536.0;
end;

function
FX_TO_I(x: f32_t): integer;
begin
  FX_TO_I := x shr FR_BITS;
end;

function
f32_mul(a, b: f32_t): f32_t;
begin
  f32_mul := f32_t(((Int64(a) * Int64(b)) shr FR_BITS));  // Use Int64 to prevent overflow
end;

function
f32_div(a, b: f32_t): f32_t;
begin
  if b = 0 then
  begin
    WriteLn('Error: Division by zero in f32_div');
    halt;
  end;

  if ((Abs(a) >= ($FFFFFFFF shl FR_BITS)) or 
      (Abs(b) >= ($FFFFFFFF shl FR_BITS))) then
  begin
    WriteLn('Error: Fixed-point division overflow/underflow');
    if a < 0 then
      f32_div := -$FFFFFFFF
    else
      f32_div := $FFFFFFFF;
  end;

  f32_div := f32_div2(a, b);
end;

function f32_div2(a, b: f32_t): f32_t;
var
  r: double;
begin
  if b = 0 then
  begin
    WriteLn('Error: Division by zero in f32_div2');
    if a < 0 then
      f32_div2  := -$FFFFFFFF
    else
      f32_div2  := $FFFFFFFF;
    Exit;
  end;

  r := (double(a) * (1 shl FR_BITS)) / double(b);

  if (r >= $FFFFFFFF) or (r < -$FFFFFFFF) then
  begin
    WriteLn('f32_div2: result out of bounds');
    if a < 0 then
      f32_div2  :=  -$FFFFFFFF
    else
      f32_div2  :=   $FFFFFFFF;
  end
  else
  begin
    // Explicitly cast the result to f32_t (i32_t), using truncation to fit into 32-bit range
    f32_div2 := f32_t(Round(r));  // Use Round to ensure proper integer conversion
  end;
end;

end.
