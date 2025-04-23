unit beatrice_v.math.vec2f;

interface

{$IFDEF     FPC}
{$mode Delphi}
{$ENDIF}  { FPC }

uses
  beatrice_v.mgmt.fixed;

type
  TVec2f = class
  public
    { Variables }
    X: f32_t;
    Y: f32_t; 

    { Constructors }
    constructor
    New();            overload;
    constructor
    New(ix:  f32_t;
        iy:  f32_t); overload;

  end;

implementation

constructor
TVec2f.New();
begin
  X := 0;
  Y := 0;
end;

constructor
TVec2f.New( ix:  f32_t;
            iy:  f32_t);
begin
  X := ix;
  Y := iy;
end;

end.