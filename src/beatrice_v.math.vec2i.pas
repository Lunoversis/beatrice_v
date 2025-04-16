unit beatrice_v.math.vec2i;

interface

{$mode Delphi}

type
  TVec2i = class
  private
    iX: integer;
    iY: integer;
  public
    { Constructors }
    constructor
    New();            overload;
    constructor
    New(x:  integer;
        y:  integer); overload;

    { Properties }
    property
    X: integer
      read iX write iX;
    property
    Y: integer
      read iY write iY;    
  end;

implementation

constructor
TVec2i.New();
begin
  iX := 0;
  iY := 0;
end;

constructor
TVec2i.New( x:  integer;
            y:  integer);
begin
  iX := x;
  iY := y;
end;

end.