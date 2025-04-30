unit beatrice_v.front.robot;

interface

{$IFDEF     FPC}
{$mode Delphi}
{$ENDIF}  { FPC }

uses
  beatrice_v.back.body,
  beatrice_v.back.sensor;
  beatrice_v.ctrl.template,
  beatrice_v.math.vec2f,
  beatrice_v.mgmt.fixed,
  classes,
  Generics.Collections,

type
  TRobotPrototype = record
    m_sAngle: f32_t;
    m_sPath:  f32_t;  { Delta S }
    m_sSpeed: f32_t;  { Delta V }
    m_v2Size: TVec2f; { Current Position }
  end;

  TRobot = class(TEngine_Body)
  private
    m_ctrlAPI:  TControlAPI;              { Control API}
    m_lSensor:  TList<TEngine_Sensor>;    { List of Sensors Attached to Robot}
    m_pProto:   TRobotPrototype;          { Prototype - Handles all basic values }

    { Initializing Protocol }
    procedure
    Init( api:    TControlAPI;
          proto:  TRobotPrototype);

  public
    { Constructor }
    constructor
    New();                        overload;
    constructor
    New(api:  TControlAPI);       overload;
    constructor
    New(proto: TRobotPrototype);  overload;
    constructor
    New(api:  TControlAPI;
        proto: TRobotPrototype);  overload;

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
TRobot.Init(api:    TControlAPI;
            proto:  TRobotPrototype);
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
  Init(TControlAPI.New(), proto);
end;


constructor
TRobot.New( api:  TControlAPI;
            proto: TRobotPrototype);
begin
  Init(api, proto);
end;

constructor 
TRobot.New(api:  TControlAPI);
begin
  Init(api, RobotPrototype(0, 0, 0, TVec2f.New()));
end;

constructor 
TRobot.New();
begin
  Init(TControlAPI.New(), RobotPrototype(0, 0, 0, TVec2f.New()));
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