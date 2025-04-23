unit beatrice_v.net.layer;

{$IFDEF     FPC}
{$mode Delphi}
{$ENDIF}  { FPC }

interface

uses
  beatrice_v.net.neuron;

type
  TNeuronLayer = class
  private
    m_iNeurons: integer;      { Neuron List Length }
    m_lNeurons: TNeuronArray; { Neuron List }

    { Initializing Function }
    procedure
    InitNeurons(neurons:    integer;
                weights:    integer);
  public
    { +-------------+ }
    { | Constructor | }
    { +-------------+ }
    constructor
    New(neurons:  integer;
        weights:  integer); overload;

    { +------------+ }
    { | Properties | }
    { +------------+ }
    property
    Neurons: TNeuronArray
      read m_lNeurons;
  end;

  { Defining an Array type }
  TNeuronLayerArray = array of TNeuronLayer;

implementation

constructor
TNeuronLayer.New( neurons:  integer;
                  weights:  integer);
begin
  InitNeurons(neurons, weights);
end;

procedure
TNeuronLayer.InitNeurons( neurons:  integer;
                          weights:  integer);
var
  i: integer;
begin
  { Define Obj Size as arg }
  m_iNeurons := neurons;

  { Dynamic alloc }
  SetLength(m_lNeurons, m_iNeurons);

  for i := 0 to m_iNeurons do begin
    m_lNeurons[i] := TNeuron.New(weights);
  end;
end;

end.
