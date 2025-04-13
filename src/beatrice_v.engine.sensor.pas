unit beatrice_v.engine.sensor;

interface

{$mode Delphi}

type
  TEngine_Sensor = class
  private
    dwInput:   DWord;
    dwOutput:  DWord;
  public
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
end.