unit beatrice_v.ctrl.template;
    
interface

{$MACRO     ON}
{$IFDEF     FPC}
{$mode      Delphi}
{$ENDIF}  { FPC }

uses
    Classes,
    SysUtils;

type
    TControlAPI_Metadata  = record
        sAPI_name:      String;     { Name of the API }
        sAPI_version:   String;     { API Version }
        sAPI_author:    String;     { Author(s) }
        sAPI_target:    String;     { Target Platform (arduino, ev3dev) }
        sAPI_license:   String;     { License }
    end;

    TControlAPI = class
    private
        meta:   TControlAPI_Metadata;
    public
        { +--------------+ }
        { | Constructors | }
        { +--------------+ }
        constructor
        New();                          overload;
        constructor
        New(m:  TControlAPI_Metadata);  overload;

        { +---------+ }
        { | Methods | }
        { +---------+ }
        procedure
        IgniteMotor();  overload;   stdcall;
        procedure
        BrakeMotor();   overload;   stdcall;

        { +------------+ }
        { | Properties | }
        { +------------+ }
        property
        Metadata:   TControlAPI_Metadata
            read meta;
    end;

    { Control API Metadata Generator }
    function
    ControlAPI_Metadata(sAPI_name:      String;
                        sAPI_version:   String;
                        sAPI_author:    String;
                        sAPI_target:    String;
                        sAPI_license:   String):  TControlAPI_Metadata;
    
implementation

function
ControlAPI_Metadata(sAPI_name:      String;
                    sAPI_version:   String;
                    sAPI_author:    String;
                    sAPI_target:    String;
                    sAPI_license:   String):  TControlAPI_Metadata;
begin
    Result.sAPI_name    :=  sAPI_name;
    Result.sAPI_version :=  sAPI_version;
    Result.sAPI_author  :=  sAPI_author;
    Result.sAPI_target  :=  sAPI_target;
    Result.sAPI_license :=  sAPI_license;
end;

constructor
TControlAPI.New();
begin end;  

constructor
TControlAPI.New(m:  TControlAPI_Metadata);
begin
    meta  := m;
end;

procedure
TControlAPI.IgniteMotor();
begin end;

procedure
TControlAPI.BrakeMotor();
begin end;
    
end.