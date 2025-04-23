unit beatrice_v.front.robot;

interface

{$IFDEF     FPC}
{$mode Delphi}
{$ENDIF}  { FPC }

uses
  classes,
  beatrice_v.back.body,
  Generics.Collections,
  beatrice_v.math.vec2f,
  beatrice_v.mgmt.fixed,
  beatrice_v.back.sensor;

type
  TRobotPrototype = record
    m_sAngle: f32_t;
    m_sPath:  f32_t;  { Delta S }
    m_sSpeed: f32_t;  { Delta V }
    m_v2Size: TVec2f; { Current Position }
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
    New();                        overload;
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
  RobotPrototype( m_sAngle: f32_t;
                  m_sPath:  f32_t;
                  m_sSpeed: f32_t;
                  m_v2Size: TVec2f): TRobotPrototype; stdcall;

implementation

procedure
TRobot.Init(proto: TRobotPrototype);
begin
  m_lSensor := TList<TEngine_Sensor>.Create;
  m_pProto  := proto;
  writeln('Created Robot! :: a',  FX_TO_F(m_pProto.m_sAngle),
          '| p',                  FX_TO_F(m_pProto.m_sPath),
          '| spd',                FX_TO_F(m_pProto.m_sSpeed),
          '| sz x',               m_pProto.m_v2Size.X,
          '| sz y',               m_pProto.m_v2Size.Y);
end;

constructor
TRobot.New(proto: TRobotPrototype);
begin
  Init(proto);
end;

constructor 
TRobot.New();
begin
  Init(RobotPrototype(0, 0, 0, TVec2f.New()));
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
RobotPrototype( m_sAngle: f32_t;
                m_sPath:  f32_t;
                m_sSpeed: f32_t;
                m_v2Size: TVec2f): TRobotPrototype; stdcall;
var
  x: TRobotPrototype;
begin
  x.m_sAngle  := m_sAngle;
  x.m_sPath   := m_sPath;
  x.m_sSpeed  := m_sSpeed;
  x.m_v2Size  := m_v2Size;
  Result      := x;
end;

end.