program beatrice_v;

uses
  beatrice_v.net.network,
  beatrice_v.robot;

var
  robot: TRobot;
  net:    TNeuralNet;
begin
  writeln('Ola mundo');
  net := TNeuralNet.New(3);
  robot := TRobot.New();
  robot.Destroy();
  net.Destroy();
end.