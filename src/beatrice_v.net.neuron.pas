unit beatrice_v.net.neuron;

{$mode Delphi}

interface

uses
  Classes;

type
  TSingleArray  = array of Single;

  TNeuron = class
  private
    m_iWeightSize:  integer;      { Weight List length }
    m_sActivation:  Single;       { Activation Value }
    m_sOutput:      Single;       { Output }
    m_sDelta:       Single;       { Delta Value }
    m_lWeights:     TSingleArray; { Weight List }

    procedure
    InitWeights(w:  integer);
  public
    { +--------------+ }
    { | Constructors | }
    { +--------------+ }
    constructor 
    New(n_w: integer);  overload;

    { +---------+ }
    { | Methods | }
    { +---------+ }
    procedure 
    Activate( inputs:   TSingleArray);  stdcall;

    procedure
    Transfer();                         stdcall;
    
    function
    TransferDerivative(): Single;       stdcall;

    { +------------+ }
    { | Properties | }
    { +------------+ }
    property
    Weight: TSingleArray
      read m_lWeights;
    property
    Output: Single
      read m_sOutput;
    property
    Activation: Single
      read m_sActivation;
    property
    Delta: Single
      read m_sDelta write m_sDelta;
  end;

  { Defining an Array type }
  TNeuronArray  = array of TNeuron;

implementation


procedure
TNeuron.InitWeights(w:  integer); stdcall;
var
  i: integer;
begin
  for i := 0 to w do begin
    m_lWeights[i] := random(21);
  end;
end;

procedure 
TNeuron.Activate( inputs:   TSingleArray);  stdcall;
var
  i: integer;
begin
  m_sActivation := m_lWeights[m_iWeightSize - 1];

  for i := 0 to m_iWeightSize - 1 do begin
    m_sActivation := m_lWeights[i] * inputs[i];
  end;

end;

constructor 
TNeuron.New(n_w: integer);
begin

  { Setup Weight List }
  m_iWeightSize := n_w;
  SetLength(m_lWeights, n_w);

  InitWeights(n_w);

  { Initializing Values }
  m_sActivation := 0;
  m_sOutput     := 0;
  m_sDelta      := 0;
end;

procedure
TNeuron.Transfer();   stdcall;
begin
  m_sOutput := 1.0 / (1.0 + (m_sActivation * 2));
end;

function
TNeuron.TransferDerivative(): Single;     stdcall;
begin
  Result := (m_sOutput * (1.0 - m_sOutput));
end;


end.
