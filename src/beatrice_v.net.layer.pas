unit beatrice_v.net.layer;

{$mode Delphi}

interface

uses
    beatrice_v.net.neuron;

type
    { Pointer Definition }
    TNeuronLayerPtr = ^TNeuronLayer;

    { Class Definition }
    TNeuronLayer = class
    private
        { Layer ID }
        cID: Char;

        { I/O Links }
        cILinks: array of Char;
        cOLinks: array of Char;

        { Neuron Matrix Size }
        iNeurons: SmallInt;

        { Output Links Array Length }
        lOutput: SmallInt;

        { Neuron Matrix }
        mNeurons: array of TNeuron;
    public
        { Constructors }
        constructor New;

        procedure AppendNeuron(y: TNeuron); stdcall;
        procedure AppendLayer(y: Char);     stdcall;
        
        { Destructor }
        destructor Destroy; override;
    end;

implementation

constructor TNeuronLayer.New;
begin
    iNeurons := 0;
    lOutput := 0;
    SetLength(mNeurons, 0);  // Initialize as empty array
    SetLength(cILinks, 0);
    SetLength(cOLinks, 0);
end;

procedure TNeuronLayer.AppendLayer(y: Char); stdcall;
begin
    Inc(lOutput);
    SetLength(cOLinks, lOutput);
    cOLinks[lOutput - 1] := y;

    WriteLn('Appending Layer! ', cOLinks[lOutput - 1]);
end;

procedure TNeuronLayer.AppendNeuron(y: TNeuron); stdcall;
begin
    Inc(iNeurons);
    SetLength(mNeurons, iNeurons);
    mNeurons[iNeurons - 1] := y;

    WriteLn('Appending! b', mNeurons[iNeurons - 1].sBias,
            ' w',           mNeurons[iNeurons - 1].sWeight,
            ' i',           mNeurons[iNeurons - 1].sInput,
            ' o',           mNeurons[iNeurons - 1].sOutput);
end;

destructor TNeuronLayer.Destroy;
begin
    Finalize(mNeurons);
    Finalize(cILinks);
    Finalize(cOLinks);
    inherited Destroy;
end;

end.
