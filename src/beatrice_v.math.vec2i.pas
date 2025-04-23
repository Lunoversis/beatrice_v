unit beatrice_v.math.vec2i;

interface

{$IFDEF     FPC}
{$mode Delphi}
{$ENDIF}  { FPC }

type
  TVec2i = class
  public
    { Variables }
    X: integer;
    Y: integer; 

    { Constructors }
    constructor
    New();            overload;
    constructor
    New(ix:  integer;
        iy:  integer); overload;

  end;

implementation

constructor
TVec2i.New();
begin
  X := 0;
  Y := 0;
end;

constructor
TVec2i.New( ix:  integer;
            iy:  integer);
begin
  X := ix;
  Y := iy;
end;

end.