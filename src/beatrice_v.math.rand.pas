unit beatrice_v.math.rand;

interface

const
  Magical_A: integer = 2112;
  Magical_B: integer = 1911;

function Beatrice_Rand(seed: integer): integer; stdcall; export;

implementation

function Beatrice_Rand(seed: integer): integer; stdcall; export;
begin
  Beatrice_Rand := (((seed  xor Magical_B)  shl 4) or 
                    ((seed  xor Magical_A)));
end;

end.
