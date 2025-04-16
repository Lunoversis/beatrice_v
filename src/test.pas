program test;

uses
  beatrice_v.net.layer,
  beatrice_v.net.neuron,
  beatrice_v.net.network,
  beatrice_v.front.robot,
  beatrice_v.engine.body,
  beatrice_v.engine.sensor;

var
  robot:  TRobot;
  net:    TNeuralNet;
begin
  writeln('Ola mundo');
  net := TNeuralNet.New(3);
  robot := TRobot.New();
  robot.Destroy();
  net.Destroy();
end.