program test;

uses
  beatrice_v.robot,
  beatrice_v.net.layer,
  beatrice_v.net.neuron,
  beatrice_v.net.network,
  beatrice_v.front.robot,
  beatrice_v.back.body,
  beatrice_v.math.rand,
  beatrice_v.back.sensor;

var
  robot:  TBeatriceRobot;
  net:    TNeuralNet;
begin
  writeln(Beatrice_Rand(700));
  writeln(Beatrice_Rand(2112));
  writeln(Beatrice_Rand(3004));
  net := TNeuralNet.New();
  robot := TBeatriceRobot.New();
  robot.Destroy();
  net.Destroy();
end.