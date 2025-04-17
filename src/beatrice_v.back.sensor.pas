unit beatrice_v.back.sensor;

interface

{$mode Delphi}

uses
  beatrice_v.back.body;

type
  TEngine_Sensor = class(TEngine_Body)
  private
    dwInput:   DWord;
    dwOutput:  DWord;
  public
    { Standard Methods }
    procedure
    OnCreate();   virtual;  stdcall;
    procedure
    OnStep();     virtual;  stdcall;
    procedure
    OnDestroy();  virtual;  stdcall;

    { Properties }
    property
    Input: DWord
      read  dwInput
      write dwInput;

    property
    Output: DWord
      read  dwOutput 
      write dwOutput;
  end;

implementation

procedure 
TEngine_Sensor.OnCreate();  stdcall;
begin end;

procedure 
TEngine_Sensor.OnStep();    stdcall;
begin end;

procedure 
TEngine_Sensor.OnDestroy(); stdcall;
begin end;

end.