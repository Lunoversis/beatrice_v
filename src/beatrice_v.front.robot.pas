unit beatrice_v.front.robot;

interface

{$mode Delphi}

uses
  classes,
  beatrice_v.back.body,
  Generics.Collections,
  beatrice_v.math.vec2i,
  beatrice_v.back.sensor;

type
  TRobotPrototype = record
    m_sAngle: single;
    m_sPath:  single; { Delta S }
    m_sSpeed: single; { Delta V }
    m_v2Pos:  TVec2i; { Current Position }
  end;

  TRobot = class(TEngine_Body)
  private
    m_lSensor:  TList<TEngine_Sensor>;
    m_pProto:   TRobotPrototype;

    procedure
    Init(proto: TRobotPrototype);

  public
    { Constructor }
    constructor
    New();                    overload;
    constructor
    New(proto: TRobotPrototype);  overload;

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

  { Prototype Generator }
  function
  RobotPrototype( m_sAngle: single;
                  m_sPath:  single;
                  m_sSpeed: single;
                  m_v2Pos:  TVec2i): TRobotPrototype; stdcall;

implementation

procedure
TRobot.Init(proto: TRobotPrototype);
begin
  m_lSensor := TList<TEngine_Sensor>.Create;
  m_pProto  := proto;
  writeln('Created Robot! :: a',  m_pProto.m_sAngle,
          '| p',                  m_pProto.m_sPath,
          '| spd',                m_pProto.m_sSpeed,
          '| pos x',              m_pProto.m_v2Pos.X, 
          '| pos y',              m_pProto.m_v2Pos.Y);
end;

constructor
TRobot.New(proto: TRobotPrototype);
begin
  Init(proto);
end;

constructor 
TRobot.New();
begin
  Init(RobotPrototype(0, 0, 0, TVec2i.New()));
end;

procedure 
TRobot.OnCreate();  stdcall;
begin end;

procedure 
TRobot.OnStep();    stdcall;
begin end;

procedure 
TRobot.OnDestroy(); stdcall;
begin end;

destructor 
TRobot.Destroy();
begin
  m_lSensor.Free();
  writeln('Destroyed Robot!');
end;

function
RobotPrototype( m_sAngle: single;
                m_sPath:  single;
                m_sSpeed: single;
                m_v2Pos:  TVec2i): TRobotPrototype; stdcall;
var
  x: TRobotPrototype;
begin
  x.m_sAngle  := m_sAngle;
  x.m_sPath   := m_sPath;
  x.m_sSpeed  := m_sSpeed;
  x.m_v2Pos   := m_v2Pos;

  Result      := x;
end;

end.