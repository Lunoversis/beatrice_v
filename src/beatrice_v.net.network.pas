unit beatrice_v.net.network;

{$mode Delphi}

interface

uses
  beatrice_v.net.neuron,
  beatrice_v.net.layer;

type
  TNeuralNet = class
  private
    m_iLayers:  integer;      { Layer List Length }
    m_lLayers:  TNeuronLayer; { Layer List }

    procedure
    InitNetwork(inputs:   integer;
                hidden:   integer;
                outputs:  integer);
  public
    constructor
    New(); overload;
  end;

implementation

constructor
TNeuralNet.New();
begin
  m_iLayers := 0;
  m_lLayers := nil;
end;


procedure
TNeuralNet.InitNetwork( inputs:   integer;
                        hidden:   integer;
                        outputs:  integer);
begin
 { @TODO }
end;
end.
