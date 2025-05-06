program test;

uses
  beatrice_v.back.body,
  beatrice_v.back.sensor,
  beatrice_v.front.path,
  beatrice_v.front.robot,
  beatrice_v.math.rand,
  beatrice_v.perceptron,
  beatrice_v.robot;

var
  robot:  TBeatriceRobot;
  ai:     TPerceptron;
begin
  ai  :=  TPerceptron.New(0.0, 0.0, 0.1);
  writeln('test');
  writeln(Beatrice_Rand(700));
  writeln(Beatrice_Rand(2112));
  writeln(Beatrice_Rand(3004));
  robot := TBeatriceRobot.New();
  robot.Destroy();
end.