unit beatrice_v.robot;
    
interface

{$IFDEF     FPC}
{$mode Delphi}
{$ENDIF}  { FPC }
uses
  beatrice_v.back.body,
  beatrice_v.back.sensor,
  beatrice_v.front.robot,
  beatrice_v.math.rand,
  beatrice_v.mgmt.fixed,
  beatrice_v.math.vec2f,
  Classes,
  Generics.Collections;

type
  TBeatriceRobot = class(TRobot)
  private
    lPositions:   TList<TVec2f>;
  public
    { Constructor }
    constructor
    New();        overload;

    { Methods }
    procedure
    OnCreate();   override;  stdcall;
    procedure
    OnStep();     override;  stdcall;
    procedure
    OnDestroy();  override;  stdcall;

    { Destructor }
    destructor
    Destroy();    overload;
  end;
    
implementation
    

constructor 
TBeatriceRobot.New();
begin
  inherited New(RobotPrototype( I_TO_FX(21), 
                                I_TO_FX(12),
                                I_TO_FX(314), 
                                TVec2f.New(21, 18)));
  lPositions  :=  TList<TVec2f>.Create;
end;

procedure 
TBeatriceRobot.OnCreate();  stdcall;
begin end;

procedure 
TBeatriceRobot.OnStep();    stdcall;
begin end;

procedure 
TBeatriceRobot.OnDestroy(); stdcall;
begin end;

destructor 
TBeatriceRobot.Destroy();
begin
  inherited;
  lPositions.Destroy;
end;

    
end.