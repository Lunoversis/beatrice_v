{ +-----------------------------------------------------------------------+}
{ | This is the main unit, made for loading every dynamic module and etc. | }
{ +-----------------------------------------------------------------------+}

unit beatrice_v.main;

{$MACRO ON}

interface

uses
{$ifdef BEATRICE_V_DYNAMIC}
  dynlibs,
{$else}
  beatrice_v.net.layer,
  beatrice_v.net.neuron,
  beatrice_v.net.network,
  beatrice_v.front.robot,
  beatrice_v.back.body,
  beatrice_v.back.sensor,
{$endif} { BEATRICE_V_DYNAMIC }
  sysutils;


{$ifdef BEATRICE_V_DYNAMIC}
const
  {$ifdef win32}
    neural_net_mod  = 'beatrice_v.net.lib.dll';
    front_end_mod   = 'beatrice_v.front.lib.dll';
    engine_mod      = 'beatrice_v.engine.lib.dll';
  {$else}
    {$ifdef darwin}
      neural_net_mod  = 'beatrice_v.net.lib';
      front_end_mod   = 'beatrice_v.front.lib';
      engine_mod      = 'beatrice_v.engine.lib';
      {$linklib gtk-x11-2.0}
    {$else}
      neural_net_mod  = 'beatrice_v.net.lib.so';
      front_end_mod   = 'beatrice_v.front.lib.so';
      engine_mod      = 'beatrice_v.engine.lib.so';
    {$endif} { darwin }
  {$endif} { win32 }
{$endif} { BEATRICE_V_DYNAMIC }

{$ifdef BEATRICE_V_DYNAMIC}
type
  { @TODO: Add types and function declarations }
{$endif} { BEATRICE_V_DYNAMIC }

implementation

end.