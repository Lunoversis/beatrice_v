unit beatrice_v.front.path;
    
interface
 

{$IFDEF     FPC}
{$mode Delphi}
{$ENDIF}  { FPC }

uses
    beatrice_v.mgmt.types,
    beatrice_v.math.vec2f,
    SysUtils, Classes;


type 
    path_t = record
        pos: TVec2f;
        def: u8_t;
    end;
    function path( pos: TVec2f; def: u8_t):path_t;
    

implementation
    function path( pos: TVec2f; def: u8_t):path_t;
    begin
        result.pos := pos;
        result.def := def;
    end;

    
end.