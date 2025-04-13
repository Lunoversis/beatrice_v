unit beatrice_v.net.neuron;

{$mode Delphi}

interface

type
    TNeuronPtr = ^TNeuron;
    TNeuron = record
        sBias:      ShortInt;
        sWeight:    Single;
        sInput:     Single;
        sOutput:    Single;
    end;

    { Neuron Instance Generator }
    function
    Neuron( sBias:      ShortInt; 
            sWeight:    Single;
            sInput:     Single):        TNeuron;

implementation

function
Neuron(sBias: ShortInt; sWeight, sInput: Single): TNeuron;
var
    x: TNeuron;
begin
    x.sBias     := sBias;
    x.sWeight   := sWeight;
    x.sInput    := sInput;

    { Using an simple activation function }
    x.sOutput   := x.sWeight * x.sInput + x.sBias; 
    
    Result      := x;
end;

end.
