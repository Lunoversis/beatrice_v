unit beatrice_v.robot;
    
interface

{$mode Delphi}

uses
  beatrice_v.net.layer,
  beatrice_v.back.body,
  beatrice_v.math.rand,
  beatrice_v.math.vec2i,
  beatrice_v.net.neuron,
  beatrice_v.back.sensor,
  beatrice_v.net.network,
  beatrice_v.front.robot;

type
  TBeatriceRobot = class(TRobot)
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
  inherited New(RobotPrototype(1, 2, 3, TVec2i.New(21, 12)));
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
end;

    
end.