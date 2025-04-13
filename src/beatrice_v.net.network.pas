unit beatrice_v.net.network;

{$mode Delphi}

interface

uses
  beatrice_v.net.neuron,
  beatrice_v.net.layer;

type
  TNeuralNet = class
  private
    iLayers: SmallInt;
    mLayer: array of TNeuronLayer;
  public
    constructor New(layers: SmallInt);

    { Personally I hate C++-like Getters/Setters, 
      But we are trying to access an array. 
                                    - Jari         }
    function
    GetLayer(i: integer):   TNeuronLayer;

    destructor Destroy; override;
  end;

implementation

constructor
TNeuralNet.New(layers: SmallInt);
var
  i: Integer;
begin
  iLayers := layers;
  SetLength(mLayer, iLayers);

  for i := 0 to iLayers - 1 do
  begin
    WriteLn('Spawning Layer!');
    mLayer[i] := TNeuronLayer.New;
    mLayer[i].AppendNeuron(Neuron(0, 0, 0))
  end;
end;

function
TNeuralNet.GetLayer(i: integer):   TNeuronLayer;
begin
    Result := mLayer[i];
end;

destructor
TNeuralNet.Destroy;
var
  i: Integer;
begin
  for i := 0 to iLayers - 1 do
  begin
    WriteLn('Disposing Layer #', i);
    mLayer[i].Destroy;
  end;
  inherited Destroy;
end;

end.
