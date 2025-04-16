unit beatrice_v.front.robot;

interface

{$mode Delphi}

uses
  classes,
  Generics.Collections,
  beatrice_v.math.vec2,
  beatrice_v.engine.sensor,
  beatrice_v.engine.body;

type
  TRobotPrototype = record
    sAngle:     single;
    s_dPath:    single; { Delta S }
    s_dSpeed:   single; { Delta V }
    vPos:       TVec2i;
  end;

  TRobot = class(TEngine_Body)
  private
    sList:  TList<TEngine_Sensor>;
    Proto:  TRobotPrototype;
  public
    { Constructor }
    constructor
    New();        overload;

    { Methods }
    procedure
    OnCreate();   override;
    procedure
    OnStep();     override;
    procedure
    OnDestroy();  override;

    { Destructor }
    destructor
    Destroy();    overload;
  end;

  { Prototype Generator }
  function
  RobotPrototype( sAngle:     single;
                  s_dPath:    single;
                  s_dSpeed:   single;
                  vPos:       TVec2i): TRobotPrototype;

implementation

constructor 
TRobot.New();
begin
  sList := TList<TEngine_Sensor>.Create;
  Proto := RobotPrototype(0, 0, 0, TVec2i.New());
  writeln('Created Robot!');
end;

procedure 
TRobot.OnCreate();
begin end;

procedure 
TRobot.OnStep();
begin end;

procedure 
TRobot.OnDestroy();
begin end;

destructor 
TRobot.Destroy();
begin
  writeln('Destroyed Robot!');
end;

function
RobotPrototype( sAngle:     single;
                s_dPath:    single;
                s_dSpeed:   single;
                vPos:       TVec2i): TRobotPrototype;
var
  x: TRobotPrototype;
begin
  x.sAngle      := sAngle;
  x.s_dPath     := s_dPath;
  x.s_dSpeed    := s_dPath;
  x.vPos        := vPos;
  Result        := x;
end;

end.