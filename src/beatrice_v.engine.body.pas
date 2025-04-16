unit beatrice_v.engine.body;

interface

{$mode Delphi}

type
  TEngine_Body = class
  private
    bActive: boolean;    
  public
    { Constructor }
    constructor 
    Create();

    { Standard Methods }
    procedure
    OnCreate();   virtual;  stdcall;
    procedure
    OnStep();     virtual;  stdcall;
    procedure
    OnDestroy();  virtual;  stdcall;

    { Is It Active? }
    property
    CurrentState: boolean
      read bActive;

    { Destructor }
    destructor
    Destroy();
  end;


implementation

constructor 
TEngine_Body.Create();
begin end;

procedure 
TEngine_Body.OnCreate();  stdcall;
begin end;

procedure 
TEngine_Body.OnStep();    stdcall;
begin end;

procedure 
TEngine_Body.OnDestroy(); stdcall;
begin end;

destructor 
TEngine_Body.Destroy();
begin end;

end.