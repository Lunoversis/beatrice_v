{ +-----------------------------------------------------------------------+}
{ | This is the main unit, made for loading every dynamic module and etc. | }
{ +-----------------------------------------------------------------------+}

unit beatrice_v.main;

{$MACRO ON}
{$IFDEF     FPC}
{$mode Delphi}
{$ENDIF}  { FPC }

interface

uses
{$IFDEF BEATRICE_V_DYNAMIC}
{$ELSE}
  beatrice_v.back.body,
  beatrice_v.back.sensor,
  beatrice_v.front.robot,
  beatrice_v.net.layer,
  beatrice_v.net.neuron,
  beatrice_v.net.network,
{$ENDIF} { BEATRICE_V_DYNAMIC }
  dynlibs,
  sysutils;


{$IFDEF BEATRICE_V_DYNAMIC}
const
  {$IFDEF win32}
    neural_net_mod  = 'beatrice_v.net.lib.dll';
    front_end_mod   = 'beatrice_v.front.lib.dll';
    engine_mod      = 'beatrice_v.engine.lib.dll';
  {$ELSE}
    {$IFDEF darwin}
      neural_net_mod  = 'beatrice_v.net.lib';
      front_end_mod   = 'beatrice_v.front.lib';
      engine_mod      = 'beatrice_v.engine.lib';
      {$linklib gtk-x11-2.0}
    {$ELSE}
      neural_net_mod  = 'beatrice_v.net.lib.so';
      front_end_mod   = 'beatrice_v.front.lib.so';
      engine_mod      = 'beatrice_v.engine.lib.so';
    {$ENDIF} { darwin }
  {$ENDIF} { win32 }
{$ENDIF} { BEATRICE_V_DYNAMIC }

{$IFDEF BEATRICE_V_DYNAMIC}
type
  { @TODO: Add types and function declarations }
{$ENDIF} { BEATRICE_V_DYNAMIC }

implementation

end.