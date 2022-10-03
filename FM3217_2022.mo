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
        annotation (Placement(transformation(extent={{2,18},{56,34}})));
      Modelica.Blocks.Continuous.PID PID(
        k=7.5,
        Ti=25,
        Td=0.01)
        annotation (Placement(transformation(extent={{-32,16},{-12,36}})));
      Modelica.Blocks.Sources.Step step(
        height=3.14,
        offset=1,
        startTime=50)
        annotation (Placement(transformation(extent={{-98,16},{-78,36}})));
      Modelica.Mechanics.Rotational.Components.Gearbox gearbox(ratio=100)
        annotation (Placement(transformation(extent={{-2,-24},{18,-4}})));
      Modelica.Blocks.Math.Feedback feedback
        annotation (Placement(transformation(extent={{-66,16},{-46,36}})));
      Modelica.Mechanics.Rotational.Components.Inertia inertia(J=5)
        annotation (Placement(transformation(extent={{40,-24},{60,-4}})));
      Modelica.Mechanics.Rotational.Sensors.AngleSensor angleSensor annotation (
         Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={74,-46})));
    equation
      connect(step.y, feedback.u1)
        annotation (Line(points={{-77,26},{-64,26}}, color={0,0,127}));
      connect(feedback.y, PID.u)
        annotation (Line(points={{-47,26},{-34,26}}, color={0,0,127}));
      connect(PID.y, electricalMotor.u)
        annotation (Line(points={{-11,26},{4.16,26}}, color={0,0,127}));
      connect(electricalMotor.y, gearbox.flange_a) annotation (Line(points={{
              53.84,26},{62,26},{62,6},{-10,6},{-10,-14},{-2,-14}}, color={0,0,
              0}));
      connect(inertia.flange_a, gearbox.flange_b)
        annotation (Line(points={{40,-14},{18,-14}}, color={0,0,0}));
      connect(angleSensor.flange, inertia.flange_b)
        annotation (Line(points={{74,-36},{74,-14},{60,-14}}, color={0,0,0}));
      connect(angleSensor.phi, feedback.u2) annotation (Line(points={{74,-57},{
              74,-72},{-56,-72},{-56,18}}, color={0,0,127}));
      annotation (
        Icon(coordinateSystem(preserveAspectRatio=false)),
        Diagram(coordinateSystem(preserveAspectRatio=false)),
        experiment(StopTime=100));
    end MotorDrive;
  end Tutorial2;

  package Tuturial3
    package Componentes
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

      model DCMachine

        parameter Modelica.SIunits.Reactance R = 0.5 "Resitance of the armature";
        parameter Modelica.SIunits.Inductance L=0.1 "Inductance of the DC Machine";
        parameter Modelica.SIunits.Inertia J=0.5 "Inertia for DC Machine";

        Modelica.Electrical.Analog.Basic.Resistor Ra(R=R)
          annotation (Placement(transformation(extent={{-44,44},{-24,64}})));
        Modelica.Electrical.Analog.Basic.Ground ground
          annotation (Placement(transformation(extent={{-50,-64},{-30,-44}})));
        Modelica.Electrical.Analog.Basic.Inductor La(L=L)
          annotation (Placement(transformation(extent={{6,44},{26,64}})));
        Modelica.Electrical.Analog.Basic.EMF emf
          annotation (Placement(transformation(extent={{22,-10},{42,10}})));
        Modelica.Mechanics.Rotational.Components.Inertia inertia(J=J)
          annotation (Placement(transformation(extent={{54,-10},{74,10}})));
        Modelica.Mechanics.Rotational.Interfaces.Flange_b y
          "Flange of right shaft"
          annotation (Placement(transformation(extent={{90,-12},{110,8}}),
              iconTransformation(extent={{90,-12},{110,8}})));
        Modelica.Electrical.Analog.Interfaces.PositivePin p "Positive electrical pin"
          annotation (Placement(transformation(extent={{-120,36},{-84,72}}),
              iconTransformation(extent={{-110,12},{-92,30}})));
        Modelica.Electrical.Analog.Interfaces.Pin n annotation (Placement(
              transformation(extent={{-118,-74},{-82,-38}}), iconTransformation(
                extent={{-110,-32},{-92,-14}})));

      equation
        connect(emf.n, ground.p) annotation (Line(points={{32,-10},{32,-26},{-40,-26},
                {-40,-44}},      color={0,0,255}));
        connect(La.p, Ra.n)
          annotation (Line(points={{6,54},{-24,54}}, color={0,0,255}));
        connect(La.n, emf.p)
          annotation (Line(points={{26,54},{32,54},{32,10}}, color={0,0,255}));
        connect(emf.flange, inertia.flange_a)
          annotation (Line(points={{42,0},{54,0}}, color={0,0,0}));
        connect(inertia.flange_b, y)
          annotation (Line(points={{74,0},{88,0},{88,-2},{100,-2}},
                                                   color={0,0,0}));
        connect(ground.p, n) annotation (Line(points={{-40,-44},{-40,-26},{-70,-26},{-70,
                -56},{-100,-56}},
              color={0,0,255}));
        connect(n, n)
          annotation (Line(points={{-100,-56},{-100,-56}}, color={0,0,255}));
        connect(p, Ra.p)
          annotation (Line(points={{-102,54},{-44,54}}, color={0,0,255}));
        connect(p, p)
          annotation (Line(points={{-102,54},{-102,54}}, color={0,0,255}));
        connect(y, y) annotation (Line(points={{100,-2},{100,3},{100,3},{100,-2}},
              color={0,0,0}));
        annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
                Bitmap(extent={{98,-100},{-100,100}}, fileName="modelica://FM3217_2022/electric-motor.jpg")}),
                                                                       Diagram(
              coordinateSystem(preserveAspectRatio=false)),
          Documentation(info="<html>
<p>This is a model of a simple DC motor. It has two inputs (+ and -) and one output</p>
<p><br><img src=\"modelica://FM3217_2022/electric-motor.jpg\"/></p>
</html>"));
      end DCMachine;

      model R_load "Resistor load"
        Modelica.Electrical.Analog.Basic.Resistor resistor(R=Load)
          annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
        Modelica.Electrical.Analog.Interfaces.PositivePin p1
          "Positive electrical pin"
          annotation (Placement(transformation(extent={{-112,-10},{-92,10}})));
        Modelica.Electrical.Analog.Interfaces.NegativePin n1
                      "Negative electrical pin"
          annotation (Placement(transformation(extent={{94,-10},{114,10}})));
        parameter Modelica.SIunits.Reactance Load=20 "Reactance of load";
      equation
        connect(resistor.p, p1)
          annotation (Line(points={{-10,0},{-102,0}}, color={0,0,255}));
        connect(resistor.n, n1)
          annotation (Line(points={{10,0},{104,0}}, color={0,0,255}));
        annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
              coordinateSystem(preserveAspectRatio=false)));
      end R_load;

      model RL_Load
        extends R_load;
        Modelica.Electrical.Analog.Basic.Inductor inductor(L=L)
          annotation (Placement(transformation(extent={{-10,-48},{10,-28}})));
        parameter Modelica.SIunits.Inductance L=0.1 "Inducatnce of Load";
      equation
        connect(inductor.p, p1) annotation (Line(points={{-10,-38},{-26,-38},{
                -26,0},{-102,0}}, color={0,0,255}));
        connect(inductor.n, n1) annotation (Line(points={{10,-38},{26,-38},{26,
                0},{104,0}}, color={0,0,255}));
      end RL_Load;

      model RLC_Load
        extends RL_Load;
        Modelica.Electrical.Analog.Basic.Capacitor capacitor1(C=C)
          annotation (Placement(transformation(extent={{-10,26},{10,46}})));
        parameter Modelica.SIunits.Capacitance C=0.003 "Capacitance of load";
      equation
        connect(resistor.p, p1)
          annotation (Line(points={{-10,0},{-102,0}}, color={0,0,255}));
        connect(capacitor1.p, p1) annotation (Line(points={{-10,36},{-26,36},{
                -26,0},{-102,0}}, color={0,0,255}));
        connect(capacitor1.n, n1) annotation (Line(points={{10,36},{26,36},{26,
                0},{104,0}}, color={0,0,255}));
      end RLC_Load;

      model Turbine
        Modelica.Mechanics.Rotational.Components.Inertia inertia(J=J_t)
                                                                 annotation (
            Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={0,0})));
        Modelica.Mechanics.Rotational.Sources.ConstantTorque constantTorque(
            tau_constant=T_t)
          annotation (Placement(transformation(extent={{-50,-10},{-30,10}})));
        Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_a annotation (
            Placement(transformation(rotation=0, extent={{90,-10},{110,10}})));
        parameter Modelica.SIunits.Inertia J_t=2 "Trubine inertia";
        parameter Modelica.SIunits.AngularMomentum T_t=10 "Trubine troque";
      equation
        connect(constantTorque.flange, inertia.flange_b) annotation (Line(points={{-30,
                0},{-16,0},{-16,6.66134e-16},{-10,6.66134e-16}}, color={0,0,0}));
        connect(flange_a, inertia.flange_a) annotation (Line(points={{100,0},{56,0},{56,
                -1.77636e-15},{10,-1.77636e-15}}, color={0,0,0}));
        annotation (Icon(graphics={Bitmap(extent={{-92,-100},{108,100}}, fileName="modelica://FM3217_2022/trubine.jpg")}));
      end Turbine;
    end Componentes;

    package Tests
      model MotorDrive
        Tutorial2.ElectricalMotor electricalMotor
          annotation (Placement(transformation(extent={{2,18},{56,34}})));
        Modelica.Blocks.Continuous.PID PID(
          k=7.5,
          Ti=25,
          Td=0.01)
          annotation (Placement(transformation(extent={{-32,16},{-12,36}})));
        Modelica.Blocks.Sources.Step step(
          height=3.14,
          offset=1,
          startTime=50)
          annotation (Placement(transformation(extent={{-98,16},{-78,36}})));
        Modelica.Mechanics.Rotational.Components.Gearbox gearbox(ratio=100)
          annotation (Placement(transformation(extent={{-2,-24},{18,-4}})));
        Modelica.Blocks.Math.Feedback feedback
          annotation (Placement(transformation(extent={{-66,16},{-46,36}})));
        Modelica.Mechanics.Rotational.Components.Inertia inertia(J=5)
          annotation (Placement(transformation(extent={{40,-24},{60,-4}})));
        Modelica.Mechanics.Rotational.Sensors.AngleSensor angleSensor annotation (
           Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={74,-46})));
      equation
        connect(step.y, feedback.u1)
          annotation (Line(points={{-77,26},{-64,26}}, color={0,0,127}));
        connect(feedback.y, PID.u)
          annotation (Line(points={{-47,26},{-34,26}}, color={0,0,127}));
        connect(PID.y, electricalMotor.u)
          annotation (Line(points={{-11,26},{4.16,26}}, color={0,0,127}));
        connect(electricalMotor.y, gearbox.flange_a) annotation (Line(points={{
                53.84,26},{62,26},{62,6},{-10,6},{-10,-14},{-2,-14}}, color={0,0,
                0}));
        connect(inertia.flange_a, gearbox.flange_b)
          annotation (Line(points={{40,-14},{18,-14}}, color={0,0,0}));
        connect(angleSensor.flange, inertia.flange_b)
          annotation (Line(points={{74,-36},{74,-14},{60,-14}}, color={0,0,0}));
        connect(angleSensor.phi, feedback.u2) annotation (Line(points={{74,-57},{
                74,-72},{-56,-72},{-56,18}}, color={0,0,127}));
        annotation (
          Icon(coordinateSystem(preserveAspectRatio=false)),
          Diagram(coordinateSystem(preserveAspectRatio=false)),
          experiment(StopTime=100));
      end MotorDrive;

      model DCMachineTest
        Componentes.DCMachine dCMachine
          annotation (Placement(transformation(extent={{-8,18},{12,38}})));
        Modelica.Electrical.Analog.Sources.SignalVoltage signalVoltage
          annotation (Placement(transformation(
              extent={{10,-10},{-10,10}},
              rotation=90,
              origin={-40,30})));
        Modelica.Blocks.Sources.Step step
          annotation (Placement(transformation(extent={{-90,20},{-70,40}})));
        Modelica.Mechanics.Rotational.Components.Inertia inertia
          annotation (Placement(transformation(extent={{16,18},{36,38}})));
      equation
        connect(signalVoltage.p, dCMachine.p) annotation (Line(points={{-40,40},
                {-26,40},{-26,30.1},{-8.1,30.1}}, color={0,0,255}));
        connect(signalVoltage.n, dCMachine.n) annotation (Line(points={{-40,20},
                {-26,20},{-26,25.7},{-8.1,25.7}}, color={0,0,255}));
        connect(step.y, signalVoltage.v)
          annotation (Line(points={{-69,30},{-52,30}}, color={0,0,127}));
        connect(dCMachine.y, inertia.flange_a) annotation (Line(points={{12,
                27.8},{14,27.8},{14,28},{16,28}}, color={0,0,0}));
        annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
              coordinateSystem(preserveAspectRatio=false)));
      end DCMachineTest;

      model DCGenerator
        Componentes.DCMachine dCMachine annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={0,2})));
        Componentes.RLC_Load rLC_Load annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={36,2})));
        Componentes.Turbine turbine annotation (Placement(transformation(
                rotation=0, extent={{-50,-8},{-30,12}})));
      equation
        connect(turbine.flange_a, dCMachine.y) annotation (Line(points={{-30,2},
                {-14,2},{-14,2.2},{-10,2.2}}, color={0,0,0}));
        connect(dCMachine.n, rLC_Load.p1) annotation (Line(points={{10.1,4.3},{
                24.05,4.3},{24.05,12.2},{36,12.2}}, color={0,0,255}));
        connect(dCMachine.p, rLC_Load.n1) annotation (Line(points={{10.1,-0.1},
                {24.05,-0.1},{24.05,-8.4},{36,-8.4}}, color={0,0,255}));
        annotation (
          Icon(coordinateSystem(preserveAspectRatio=false)),
          Diagram(coordinateSystem(preserveAspectRatio=false)),
          experiment(StopTime=10));
      end DCGenerator;
    end Tests;
  end Tuturial3;

  package Tutorial4 "Electric Kettle"
    model EletricKettel
      Modelica.Electrical.Analog.Basic.Resistor resistor(R=230^2/2000,
          useHeatPort=true) annotation (Placement(transformation(
            extent={{-10,10},{10,-10}},
            rotation=270,
            origin={32,0})));
      Modelica.Electrical.Analog.Sources.SineVoltage sineVoltage(V=230*sqrt(2),
          freqHz=50) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={-54,2})));
      Modelica.Electrical.Analog.Basic.Ground ground
        annotation (Placement(transformation(extent={{-10,-60},{10,-40}})));
      Modelica.Electrical.Analog.Sensors.PowerSensor powerSensor annotation (
          Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=0,
            origin={16,40})));
      Modelica.Blocks.Math.Mean mean(f=50) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={0,-2})));
      Modelica.Thermal.HeatTransfer.Components.HeatCapacitor water(C=4.18e3*1.7,
          T(start=283.15, fixed=true))
        annotation (Placement(transformation(extent={{50,12},{70,32}})));
      Modelica.Thermal.HeatTransfer.Celsius.TemperatureSensor temperatureSensor
        annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=0,
            origin={86,0})));
      Modelica.Thermal.HeatTransfer.Components.ThermalConductor KettleWall(G=5)
        annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={60,-38})));
      Modelica.Thermal.HeatTransfer.Sources.FixedTemperature RoomTemperature(T=
            294.15) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=0,
            origin={30,-70})));
      Modelica.Blocks.Logical.OnOffController onOffController(bandwidth=3)
        annotation (Placement(transformation(extent={{32,64},{12,84}})));
      Modelica.Blocks.Sources.Constant const(k=95)
        annotation (Placement(transformation(extent={{86,74},{66,94}})));
      Modelica.Electrical.Analog.Ideal.IdealClosingSwitch switch1
        annotation (Placement(transformation(extent={{-40,30},{-20,50}})));
    equation
      connect(resistor.n, ground.p)
        annotation (Line(points={{32,-10},{32,-40},{0,-40}}, color={0,0,255}));
      connect(sineVoltage.n, ground.p) annotation (Line(points={{-54,-8},{-54,
              -40},{0,-40}}, color={0,0,255}));
      connect(powerSensor.nc, resistor.p)
        annotation (Line(points={{26,40},{32,40},{32,10}}, color={0,0,255}));
      connect(powerSensor.pv, resistor.p)
        annotation (Line(points={{16,50},{32,50},{32,10}}, color={0,0,255}));
      connect(powerSensor.nv, ground.p)
        annotation (Line(points={{16,30},{16,-40},{0,-40}}, color={0,0,255}));
      connect(powerSensor.power, mean.u) annotation (Line(points={{6,29},{
              2.22045e-15,29},{2.22045e-15,10}}, color={0,0,127}));
      connect(water.port, resistor.heatPort) annotation (Line(points={{60,12},{
              60,-1.77636e-15},{42,-1.77636e-15}}, color={191,0,0}));
      connect(temperatureSensor.port, resistor.heatPort) annotation (Line(
            points={{76,0},{76,-1.77636e-15},{42,-1.77636e-15}}, color={191,0,0}));
      connect(KettleWall.port_a, resistor.heatPort) annotation (Line(points={{
              60,-28},{60,-1.77636e-15},{42,-1.77636e-15}}, color={191,0,0}));
      connect(RoomTemperature.port, KettleWall.port_b) annotation (Line(points=
              {{40,-70},{60,-70},{60,-48}}, color={191,0,0}));
      connect(powerSensor.pc, switch1.n)
        annotation (Line(points={{6,40},{-20,40}}, color={0,0,255}));
      connect(switch1.p, sineVoltage.p) annotation (Line(points={{-40,40},{-54,
              40},{-54,12}}, color={0,0,255}));
      connect(onOffController.y, switch1.control) annotation (Line(points={{11,
              74},{-30,74},{-30,52}}, color={255,0,255}));
      connect(onOffController.reference, const.y) annotation (Line(points={{34,
              80},{50,80},{50,84},{65,84}}, color={0,0,127}));
      connect(temperatureSensor.T, onOffController.u) annotation (Line(points={
              {96,0},{110,0},{110,68},{34,68}}, color={0,0,127}));
      annotation (
        Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
                120,100}})),
        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                {120,100}})),
        Documentation(info="<html>
<h4>Electric Kettle</h4>
<ul>
<li>Volume of 1.7l</li>
<li>230V main supply</li>
<li>Power of 2000W</li>
</ul>
<p><br>Quistion: What should the resitance on the heating resistor be?</p>
<p><br>Power = Voltage * Current</p>
<p>Restitnace = Voltage / Current</p>
<p><br>Restitnace = Voltage<sup>2</sup> / Power</p>
<p><br><br><h5>Heat capacity of water</h5></p>
<p>1 calory = heat energy needed to heat up one gram of water by 1 Kelvin</p>
<p>1 calory = 4.18J/(g*k)</p>
</html>"),
        experiment(StopTime=480, __Dymola_NumberOfIntervals=5000));
    end EletricKettel;
  end Tutorial4;
  annotation (uses(Modelica(version="3.2.3")));
end FM3217_2022;
