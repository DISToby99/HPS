within ;
package FM3217_2022 "Collection of models in FM3217"

  package Tutorial1

    model SimplePendulum "Model of a simple Pendulum"
     import SI = Modelica.SIunits;
     constant SI.Acceleration g = 9.81 "Gravitation constant";
     parameter SI.Length L = 1 "Length of Pendulum";

     //Variables
     SI.Angle Theta( start=2, fixed=true) "Angle of Pendulum";
     SI.AngularVelocity ThetaDot "Derivative";
    equation
      ThetaDot = der(Theta);
      der(ThetaDot) = -g/L*sin(Theta);
      annotation (experiment(StopTime=10));
    end SimplePendulum;
  end Tutorial1;

  package Tutorial2
    model ElectricalMotor
      Modelica.Electrical.Analog.Basic.Resistor Ra
        annotation (Placement(transformation(extent={{-44,44},{-24,64}})));
      Modelica.Electrical.Analog.Basic.Ground ground
        annotation (Placement(transformation(extent={{-56,-64},{-36,-44}})));
      Modelica.Electrical.Analog.Basic.Inductor La
        annotation (Placement(transformation(extent={{4,44},{24,64}})));
      Modelica.Electrical.Analog.Basic.EMF emf
        annotation (Placement(transformation(extent={{22,-10},{42,10}})));
      Modelica.Electrical.Analog.Sources.SignalVoltage signalVoltage
        annotation (Placement(transformation(
            extent={{10,-10},{-10,10}},
            rotation=90,
            origin={-46,0})));
      Modelica.Mechanics.Rotational.Components.Inertia inertia
        annotation (Placement(transformation(extent={{54,-10},{74,10}})));
      Modelica.Blocks.Interfaces.RealInput u
        annotation (Placement(transformation(extent={{-112,-20},{-72,20}})));
      Modelica.Mechanics.Rotational.Interfaces.Flange_b y
        "Flange of right shaft"
        annotation (Placement(transformation(extent={{82,-10},{102,10}})));
    equation
      connect(Ra.p, signalVoltage.p) annotation (Line(points={{-44,54},{-46,54},
              {-46,10}}, color={0,0,255}));
      connect(signalVoltage.n, ground.p)
        annotation (Line(points={{-46,-10},{-46,-44}}, color={0,0,255}));
      connect(emf.n, ground.p) annotation (Line(points={{32,-10},{32,-26},{-46,
              -26},{-46,-44}}, color={0,0,255}));
      connect(La.p, Ra.n)
        annotation (Line(points={{4,54},{-24,54}}, color={0,0,255}));
      connect(La.n, emf.p)
        annotation (Line(points={{24,54},{32,54},{32,10}}, color={0,0,255}));
      connect(emf.flange, inertia.flange_a)
        annotation (Line(points={{42,0},{54,0}}, color={0,0,0}));
      connect(u, signalVoltage.v)
        annotation (Line(points={{-92,0},{-58,0}}, color={0,0,127}));
      connect(inertia.flange_b, y)
        annotation (Line(points={{74,0},{92,0}}, color={0,0,0}));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
            coordinateSystem(preserveAspectRatio=false)));
    end ElectricalMotor;

    model MotorDrive
      ElectricalMotor electricalMotor
        annotation (Placement(transformation(extent={{-20,-12},{34,16}})));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
            coordinateSystem(preserveAspectRatio=false)));
    end MotorDrive;
  end Tutorial2;
  annotation (uses(Modelica(version="3.2.3")));
end FM3217_2022;
