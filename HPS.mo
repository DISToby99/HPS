within ;
package HPS "Items for HPS systems"
  package Tutorial5
    model ConnectingPipes
      HydroPower.HydroSystems.Pipe pipe(
        horizontalIcon=false,
        L=100,
        ZL=90,
        steadyState=true,
        enable_dataVizPort_lower=false)
        annotation (Placement(transformation(extent={{-8,40},{12,60}})));
      inner HydroPower.System_HPL system_HPL(steadyState=true,
          constantTemperature=true)
        annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
      HydroPower.SinksAndSources.Fixed_pT source(paraOption=false, p_const(
            displayUnit="bar"))
        annotation (Placement(transformation(extent={{-48,40},{-28,60}})));
      HydroPower.SinksAndSources.Fixed_pT sink(paraOption=false) annotation (
          Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={40,50})));
    equation
      connect(source.b, pipe.a)
        annotation (Line(points={{-27,50},{-9,50}}, color={0,0,255}));
      connect(sink.b, pipe.b)
        annotation (Line(points={{29,50},{13,50}}, color={0,0,255}));
      annotation (
        Icon(coordinateSystem(preserveAspectRatio=false)),
        Diagram(coordinateSystem(preserveAspectRatio=false)),
        experiment(
          StopTime=600,
          Tolerance=1e-05,
          __Dymola_Algorithm="Radau"));
    end ConnectingPipes;

    model PipeWithValve
      extends ConnectingPipes;
      HydroPower.HydroSystems.PipeValve pipeValve1(
        m_dot_nom=123.5*1000,
        dp_nom=900000,
        ZL=90) annotation (Placement(transformation(extent={{-8,-10},{12,10}})));
      HydroPower.SinksAndSources.Fixed_pT source1(paraOption=false, p_const(
            displayUnit="bar"))
        annotation (Placement(transformation(extent={{-48,-10},{-28,10}})));
      HydroPower.SinksAndSources.Fixed_pT sink1(paraOption=false) annotation (
          Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={40,0})));
      Modelica.Blocks.Sources.Ramp ramp(
        height=0.9,
        duration=100,
        offset=0.1,
        startTime=100)
        annotation (Placement(transformation(extent={{-92,6},{-72,26}})));
    equation
      connect(pipeValve1.b, sink1.b)
        annotation (Line(points={{13,0},{29,0}}, color={0,0,255}));
      connect(pipeValve1.a, source1.b)
        annotation (Line(points={{-9,0},{-27,0}}, color={0,0,255}));
      connect(ramp.y, pipeValve1.ValveCtrl)
        annotation (Line(points={{-71,16},{2,16},{2,11}}, color={0,0,127}));
    end PipeWithValve;

    model SimpleWaterWay
      extends PipeWithValve(ramp(startTime=10));
      HydroPower.SinksAndSources.Fixed_pT source2(paraOption=false, p_const(
            displayUnit="bar"))
        annotation (Placement(transformation(extent={{-98,-52},{-78,-32}})));
      HydroPower.SinksAndSources.Fixed_pT sink2(paraOption=false) annotation (
          Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={88,-42})));
      HydroPower.HydroSystems.Pipe pipe2(
        horizontalIcon=true,
        L(displayUnit="km") = 10000,
        ZL=100,
        ZR=90,
        steadyState=true,
        enable_dataVizPort_lower=false)
        annotation (Placement(transformation(extent={{-58,-52},{-20,-32}})));
      HydroPower.HydroSystems.PipeValve pipeValve2(
        m_dot_nom=110e3,
        dp_nom=900000,
        ZL=90,
        ZR=0) annotation (Placement(transformation(extent={{36,-52},{56,-32}})));
      HydroPower.HydroSystems.HydroComponents.Containers.ClosedVolume
        closedVolume
        annotation (Placement(transformation(extent={{-10,-52},{10,-32}})));
    equation
      connect(ramp.y, pipeValve2.ValveCtrl) annotation (Line(points={{-71,16},{
              -58,16},{-58,-20},{46,-20},{46,-31}}, color={0,0,127}));
      connect(source2.b, pipe2.a)
        annotation (Line(points={{-77,-42},{-59.9,-42}}, color={0,0,255}));
      connect(pipeValve2.b, sink2.b)
        annotation (Line(points={{57,-42},{77,-42}}, color={0,0,255}));
      connect(pipe2.b, closedVolume.a)
        annotation (Line(points={{-18.1,-42},{-10,-42}}, color={0,0,255}));
      connect(pipeValve2.a, closedVolume.b)
        annotation (Line(points={{35,-42},{10,-42}}, color={0,0,255}));
    end SimpleWaterWay;

    model WaterwayWithSurgeShaft
      extends SimpleWaterWay(ramp(
          height=-0.9,
          duration=10,
          offset=1,
          startTime=10));
      HydroPower.HydroSystems.SurgeTank surgeTank3(
        D=100,
        deltZ=15,
        Vol=1000)
        annotation (Placement(transformation(extent={{-10,-86},{10,-66}})));
      HydroPower.SinksAndSources.Fixed_pT source3(paraOption=false, p_const(
            displayUnit="bar"))
        annotation (Placement(transformation(extent={{-100,-86},{-80,-66}})));
      HydroPower.HydroSystems.Pipe pipe3(
        horizontalIcon=true,
        L(displayUnit="km") = 10000,
        ZL=100,
        ZR=90,
        steadyState=true,
        enable_dataVizPort_lower=false)
        annotation (Placement(transformation(extent={{-60,-86},{-22,-66}})));
      HydroPower.SinksAndSources.Fixed_pT sink3(paraOption=false) annotation (
          Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={84,-76})));
      HydroPower.HydroSystems.PipeValve pipeValve3(
        m_dot_nom=110e3,
        dp_nom=900000,
        ZL=90,
        ZR=0) annotation (Placement(transformation(extent={{34,-86},{54,-66}})));
    equation
      connect(source3.b, pipe3.a)
        annotation (Line(points={{-79,-76},{-61.9,-76}}, color={0,0,255}));
      connect(ramp.y, pipeValve3.ValveCtrl) annotation (Line(points={{-71,16},{
              -58,16},{-58,-20},{26,-20},{26,-60},{44,-60},{44,-65}}, color={0,
              0,127}));
      connect(pipeValve3.b, sink3.b)
        annotation (Line(points={{55,-76},{73,-76}}, color={0,0,255}));
      connect(pipeValve3.a, surgeTank3.b)
        annotation (Line(points={{33,-76},{11,-76}}, color={0,0,255}));
      connect(pipe3.b, surgeTank3.a)
        annotation (Line(points={{-20.1,-76},{-11,-76}}, color={0,0,255}));
      annotation (experiment(
          StopTime=600,
          __Dymola_NumberOfIntervals=5000,
          Tolerance=1e-05,
          __Dymola_Algorithm="Radau"));
    end WaterwayWithSurgeShaft;
  end Tutorial5;

  package Tutorial6
    model ReservoirBase
      inner HydroPower.System_HPL system_HPL(steadyState=true,
          constantTemperature=true)
        annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
      HydroPower.HydroSystems.Reservoir headwater
        annotation (Placement(transformation(extent={{-52,46},{-32,66}})));
      HydroPower.HydroSystems.Reservoir tailwater
        annotation (Placement(transformation(extent={{40,40},{60,60}})));
      HydroPower.HydroSystems.Pipe conduit(horizontalIcon=true, L(displayUnit=
              "km") = 1000)
        annotation (Placement(transformation(extent={{-20,40},{0,60}})));
    equation
      connect(headwater.a2_pipe, conduit.a)
        annotation (Line(points={{-31,50},{-21,50}}, color={0,0,255}));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
            coordinateSystem(preserveAspectRatio=false)));
    end ReservoirBase;

    model TwoReservoirs
      extends Modelica.Icons.Example;
      extends ReservoirBase(conduit(ZL=100));
    equation
      connect(conduit.b, tailwater.a1_pipe) annotation (Line(points={{-7,64},{
              26,64},{26,44},{39,44}}, color={0,0,255}));
    end TwoReservoirs;

    model TwoReservoirsWithSource
      extends Modelica.Icons.Example;
      extends ReservoirBase(conduit(ZL=100));
      HydroPower.SinksAndSources.Fixed_HT constantWaterHead(
        paraOption=false,
        H_const=75,
        Hmax=100,
        depth=50)
        annotation (Placement(transformation(extent={{-98,52},{-78,72}})));
      HydroPower.SinksAndSources.Fixed_HT constantTailWater(
        paraOption=false,
        H_const=75,
        Hmax=100,
        depth=50) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={84,56})));
    equation
      connect(constantWaterHead.b, headwater.a1_open)
        annotation (Line(points={{-77,62},{-53,62}}, color={0,0,255}));
      connect(conduit.b, tailwater.a1_pipe) annotation (Line(points={{1,50},{20,
              50},{20,44},{39,44}}, color={0,0,255}));
      connect(tailwater.a2_open, constantTailWater.b)
        annotation (Line(points={{61,56},{73,56}}, color={0,0,255}));
      annotation (experiment(
          StopTime=600,
          __Dymola_NumberOfIntervals=5000,
          Tolerance=1e-05,
          __Dymola_Algorithm="Radau"));
    end TwoReservoirsWithSource;

    model WaterWayWithReservoir
      extends Modelica.Icons.Example;
      inner HydroPower.System_HPL system_HPL(steadyState=true,
          constantTemperature=true)
        annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
      HydroPower.HydroSystems.Reservoir headwater
        annotation (Placement(transformation(extent={{-66,-4},{-46,16}})));
      HydroPower.SinksAndSources.Fixed_HT constantWaterHead(
        paraOption=false,
        H_const=75,
        Hmax=100,
        depth=50)
        annotation (Placement(transformation(extent={{-96,2},{-76,22}})));
      HydroPower.HydroSystems.SurgeTank surgeTank(D=30, deltZ=100)
        annotation (Placement(transformation(extent={{-8,-10},{12,10}})));
      HydroPower.HydroSystems.Pipe conduit(
        horizontalIcon=true,
        L(displayUnit="km") = 10000,
        ZL=100,
        ZR=90,
        steadyState=true,
        enable_dataVizPort_lower=false)
        annotation (Placement(transformation(extent={{-38,-10},{-18,10}})));
      HydroPower.HydroSystems.PipeValve pressureShaft(
        m_dot_nom=110e3,
        dp_nom=900000,
        ZL=90,
        ZR=0) annotation (Placement(transformation(extent={{22,-14},{42,6}})));
      Modelica.Blocks.Sources.Ramp ramp(
        height=1,
        duration=10,
        offset=0,
        startTime=100)
        annotation (Placement(transformation(extent={{-6,22},{14,42}})));
      HydroPower.HydroSystems.Reservoir tailwater
        annotation (Placement(transformation(extent={{50,-20},{70,0}})));
      HydroPower.SinksAndSources.Fixed_HT constantTailWater(
        paraOption=false,
        H_const=75,
        Hmax=100,
        depth=50) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={88,-4})));
    equation
      connect(constantWaterHead.b, headwater.a1_open)
        annotation (Line(points={{-75,12},{-67,12}}, color={0,0,255}));
      connect(headwater.a2_pipe, conduit.a)
        annotation (Line(points={{-45,0},{-39,0}}, color={0,0,255}));
      connect(conduit.b, surgeTank.a)
        annotation (Line(points={{-17,0},{-9,0}}, color={0,0,255}));
      connect(tailwater.a2_open, constantTailWater.b)
        annotation (Line(points={{71,-4},{77,-4}}, color={0,0,255}));
      connect(surgeTank.b, pressureShaft.a) annotation (Line(points={{13,0},{18,
              0},{18,-4},{21,-4}}, color={0,0,255}));
      connect(pressureShaft.b, tailwater.a1_pipe) annotation (Line(points={{43,
              -4},{46,-4},{46,-16},{49,-16}}, color={0,0,255}));
      connect(ramp.y, pressureShaft.ValveCtrl)
        annotation (Line(points={{15,32},{32,32},{32,7}}, color={0,0,127}));
      annotation (
        Icon(coordinateSystem(preserveAspectRatio=false)),
        Diagram(coordinateSystem(preserveAspectRatio=false)),
        experiment(
          StopTime=600,
          __Dymola_NumberOfIntervals=5000,
          Tolerance=1e-05,
          __Dymola_Algorithm="Radau"));
    end WaterWayWithReservoir;

    model WaterWatResClosingValve
      extends WaterWayWithReservoir(ramp(height=-1, offset=1), system_HPL(
            Q_start=37.216));
      annotation (experiment(
          StopTime=600,
          __Dymola_NumberOfIntervals=5000,
          Tolerance=1e-05,
          __Dymola_Algorithm="Radau"));
    end WaterWatResClosingValve;

    model SundsbarmWaterWay "Model of a HPS in Norway"
      extends Modelica.Icons.Example;
      inner HydroPower.System_HPL system_HPL(
        Q_start=37.216,
        steadyState=true,
        constantTemperature=true)
        annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
      HydroPower.HydroSystems.Reservoir headwater(
        Hmax=ones(headwater.n)*(564 + 48 + 5),
        depth=ones(headwater.n)*(48 + 5),
        H_start=ones(headwater.n)*(564 + 48))
        annotation (Placement(transformation(extent={{-94,2},{-74,22}})));
      HydroPower.HydroSystems.SurgeTank surgeTank(
        D=3.6,
        deltZ=150,
        H2L=0.87,
        Vol=100) annotation (Placement(transformation(extent={{-36,-4},{-16,16}})));
      HydroPower.HydroSystems.Pipe conduit(
        endD={5.8,5.8},
        horizontalIcon=true,
        L(displayUnit="m") = 6600,
        ZL=564,
        ZR=541.5,
        steadyState=true,
        enable_dataVizPort_lower=false)
        annotation (Placement(transformation(extent={{-68,-4},{-44,16}})));
      HydroPower.HydroSystems.PipeValve pressureShaft(
        endD={3,3},
        m_dot_nom=24e3,
        dp_nom=4890000,
        L=724,
        ZL=541.5,
        ZR=112.5) annotation (Placement(transformation(extent={{-10,-10},{12,10}})));
      Modelica.Blocks.Sources.Ramp ramp(
        height=-1,
        offset=1,
        duration=10,
        startTime=100)
        annotation (Placement(transformation(extent={{-36,24},{-16,44}})));
      HydroPower.SinksAndSources.Fixed_HT constantTailWater(
        paraOption=false,
        H_const=110 + 5,
        Hmax=110 + 5 + 3,
        depth=5 + 3)
                  annotation (Placement(transformation(
            extent={{10,-10},{-10,10}},
            rotation=180,
            origin={78,18})));
      HydroPower.HydroSystems.Pipe tainRace(
        endD={5.8,5.8},
        horizontalIcon=true,
        L(displayUnit="m") = 600,
        ZL=110.5,
        ZR=110,
        steadyState=true,
        enable_dataVizPort_lower=false)
        annotation (Placement(transformation(extent={{42,-22},{64,-2}})));
      HydroPower.HydroSystems.HydroComponents.Containers.ClosedVolume TrubineHouse(
          D=5.8, L=2)
        annotation (Placement(transformation(extent={{18,-22},{38,-2}})));
      HydroPower.SinksAndSources.Fixed_HT constantWaterHead1(
        paraOption=false,
        H_const=564 + 48,
        Hmax=564 + 48 + 5,
        depth=48 + 5)
                  annotation (Placement(transformation(extent={{-72,30},{-92,50}})));
      HydroPower.HydroSystems.Reservoir headwater1(
        Hmax=ones(headwater.n)*(564 + 48 + 5),
        depth=ones(headwater.n)*(48 + 5),
        H_start=ones(headwater.n)*(564 + 48))     annotation (Placement(transformation(extent={{70,-16},
                {90,4}})));
    equation
      connect(headwater.a2_pipe, conduit.a)
        annotation (Line(points={{-73,6},{-69.2,6}},   color={0,0,255}));
      connect(conduit.b, surgeTank.a)
        annotation (Line(points={{-42.8,6},{-37,6}},   color={0,0,255}));
      connect(surgeTank.b, pressureShaft.a) annotation (Line(points={{-15,6},{-12,
              6},{-12,0},{-11.1,0}},
                                  color={0,0,255}));
      connect(ramp.y, pressureShaft.ValveCtrl)
        annotation (Line(points={{-15,34},{1,34},{1,11}}, color={0,0,127}));
      connect(tainRace.a, TrubineHouse.b)
        annotation (Line(points={{40.9,-12},{38,-12}},
                                                     color={0,0,255}));
      connect(pressureShaft.b, TrubineHouse.a) annotation (Line(points={{13.1,0},
              {16,0},{16,-12},{18,-12}},
                                    color={0,0,255}));
      connect(constantWaterHead1.b, headwater.a1_open) annotation (Line(points={{
              -93,40},{-98,40},{-98,18},{-95,18}}, color={0,0,255}));
      connect(tainRace.b, headwater1.a1_pipe)
        annotation (Line(points={{65.1,-12},{69,-12}}, color={0,0,255}));
      connect(headwater1.a2_open, constantTailWater.b) annotation (Line(points={{
              91,0},{94,0},{94,18},{89,18}}, color={0,0,255}));
      annotation (
        Icon(coordinateSystem(preserveAspectRatio=false)),
        Diagram(coordinateSystem(preserveAspectRatio=false)),
        Documentation(info="<html>
<p>The Hydro power system are as follows:</p>
<p><img src=\"modelica://HPS/Bilder/SundsbarmModel.png\"/></p>
</html>"),
        experiment(
          StopTime=600,
          __Dymola_NumberOfIntervals=5000,
          Tolerance=1e-05,
          __Dymola_Algorithm="Radau"));
    end SundsbarmWaterWay;
  end Tutorial6;

  package Tutorial7
    model PlantConnectAndDisconnectToGrid
      extends HydroPower.Examples.PlantConnectAndDisconnectToGrid;
      annotation (experiment(
          StopTime=600,
          __Dymola_NumberOfIntervals=5000,
          Tolerance=1e-06,
          __Dymola_Algorithm="Radau"));
    end PlantConnectAndDisconnectToGrid;

    model Sundsbam
      "Hydro plant model connecting to grid at t=150s and disconnecting at t=350s"
      extends Modelon.Icons.Experiment;

      HydroPower.MechanicalSystems.BasicTurbine turbine(
        np=12,
        H_nom=480,
        tableOnFile=true,
        LdraftTube=10,
        DavDraftTube=2,
        LscrollCase=5,
        DavScrollCasing=2,
        PUInFlowTables=true,
        QTableName="Qtab",
        Q_nom=24,
        H_start=564 + 48,
        H_start_draftTube=115,
        Ty=0.4,
        yvLim1=[-0.1, 0.1],
        yvLim2=[-0.2, 0.2],
        TurbineDataFile=Modelica.Utilities.Files.loadResource(HydroPower.TABLE_DIR
             + "TurbineDataFile.mat"),
        P_nom=103000000)
                        annotation (Placement(transformation(extent={{-9,-34},{11,
                -14}},
                     rotation=0)));

      HydroPower.ElectricalSystems.PowerGrid powerGrid(
        startTime=1e6,
        unitsJ={122000,5.5e6,8000},
        NoLoadUnits={200,400,1000},
        distNoGen={-2,0,0},
        distTgen={150,1e6,1e6}) annotation (Placement(transformation(extent={{
                -93,69},{-73,89}}, rotation=0)));

      Modelica.Blocks.Sources.Ramp pwr_ref(
        duration=10,
        height=0,
        offset=45e6,
        startTime=1e6) annotation (Placement(transformation(extent={{-41,93},{
                -29,105}},
                      rotation=0)));
      HydroPower.ElectricalSystems.GeneratorAndMCB generator(
        np={12},
        Kdmp={0.05},
        f_start=0,
        J={212500},
        timeMCB_close={150},
        timeMCB_open={200},
        P_nom={103000000})
                          annotation (Placement(transformation(extent={{-63,69},
                {-43,89}},
                       rotation=0)));
      HydroPower.ControllersAndSensors.TurbineGovernorAnalog turbineGovernor(
        ep=1,
        DeadBand=0.001,
        Ki_load=0.1,
        Kd_load=0.1,
        Kd_noLoad=0.1,
        Ki_noLoad=0.025,
        K_noLoad=0.8,
        K_load=0.4,
        tRamp=40,
        P_generator_nom=generator.P_nom[1],
        enableRamp=false) annotation (Placement(transformation(extent={{-28,69},
                {-8,89}}, rotation=0)));
      HydroPower.Visualizers.RealValue turbinePower(precision=2, input_Value=
            turbine.summary.P_turbine*1e-6)
        annotation (Placement(transformation(extent={{64,10},{78,24}})));
      HydroPower.Visualizers.BooleanIndicator MCB(input_Value=turbineGovernor.summary.isMCB)
        annotation (Placement(transformation(extent={{64,73},{77,87}})));
      HydroPower.Visualizers.RealValue gridbalanceNum(precision=2, input_Value=
            generator.summary.P_grid_tot*1e-6)
        annotation (Placement(transformation(extent={{64,38},{78,52}})));
      inner HydroPower.System_HPL system_HPL(
        steadyState=true,
        pipeRoughness=0.1,
        T_start=293,
        constantTemperature=true)
        annotation (Placement(transformation(extent={{-150,100},{-130,120}})));
      HydroPower.Visualizers.RealValue gridbalanceNum1(precision=2, input_Value=
           generator.summary.f[1])
        annotation (Placement(transformation(extent={{64,53},{78,67}})));
      HydroPower.Visualizers.RealValue gridbalanceNum2(precision=2, input_Value=
           generator.summary.P_generator[1]*1e-6)
        annotation (Placement(transformation(extent={{64,25},{78,39}})));
      HydroPower.HydroSystems.Pipe conduit(
        endD={5.8,5.8},
        horizontalIcon=true,
        L(displayUnit="m") = 6600,
        ZL=564,
        ZR=541.5,
        steadyState=true,
        enable_dataVizPort_lower=false)
        annotation (Placement(transformation(extent={{-105,-30},{-81,-10}})));
      HydroPower.HydroSystems.SurgeTank surgeTank(
        D=3.6,
        deltZ=150,
        H2L=0.87,
        Vol=100) annotation (Placement(transformation(extent={{-73,-30},{-53,
                -10}})));
      HydroPower.HydroSystems.Reservoir Resiorvar(
        Hmax=ones(Resiorvar.n)*(564 + 48 + 5),
        depth=ones(Resiorvar.n)*(48 + 5),
        H_start=ones(Resiorvar.n)*(564 + 48),
        steadyState=false)
        annotation (Placement(transformation(extent={{-139,-24},{-119,-4}})));
      HydroPower.SinksAndSources.Fixed_HT constantWaterHead1(
        paraOption=false,
        H_const=564 + 48,
        Hmax=564 + 48 + 5,
        depth=48 + 5)
                  annotation (Placement(transformation(extent={{-119,5},{-139,
                25}})));
      HydroPower.HydroSystems.Pipe conduit1(
        endD={3,3},
        horizontalIcon=false,
        L(displayUnit="m") = 724,
        ZL=541,
        ZR=112.5,
        enable_dataVizPort_lower=false)
        annotation (Placement(transformation(extent={{-45,-30},{-21,-10}})));
      HydroPower.SinksAndSources.Fixed_HT constantTailWater(
        paraOption=false,
        H_const=110 + 5,
        Hmax=110 + 5 + 3,
        depth=5 + 3)
                  annotation (Placement(transformation(
            extent={{10,-10},{-10,10}},
            rotation=180,
            origin={64,-14})));
      HydroPower.HydroSystems.Pipe tainRace(
        endD={5.8,5.8},
        horizontalIcon=true,
        L(displayUnit="m") = 600,
        ZL=110.5,
        ZR=110,
        steadyState=true,
        enable_dataVizPort_lower=false)
        annotation (Placement(transformation(extent={{22,-34},{44,-14}})));
      HydroPower.HydroSystems.Reservoir headwater1(
        Hmax=ones(Resiorvar.n)*(110 + 5 + 3),
        depth=ones(Resiorvar.n)*(5 + 3),
        H_start=ones(Resiorvar.n)*(110 + 5))
        annotation (Placement(transformation(extent={{55,-47},{75,-27}})));
    equation

      connect(powerGrid.f_grid, generator.f_grid) annotation (Line(
          points={{-72,72},{-64,72}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(powerGrid.P_grid_balance, generator.P_grid_balance) annotation (Line(
          points={{-72,86},{-64,86}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(pwr_ref.y, turbineGovernor.P_reference) annotation (Line(
          points={{-28.4,99},{-24,99},{-24,90}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.f_out[1], turbineGovernor.f) annotation (Line(
          points={{-42,72},{-29,72}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.onMCB, powerGrid.MCB) annotation (Line(
          points={{-53,90},{-53,110},{-83,110},{-83,90}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(generator.onMCB[1], turbineGovernor.isMCB) annotation (Line(
          points={{-53,90},{-53,110},{-18,110},{-18,90}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(generator.P_out[1], turbineGovernor.P_generator) annotation (Line(
          points={{-42,86},{-29,86}},
          color={0,0,127},
          smooth=Smooth.None));

      connect(generator.f_out, powerGrid.f) annotation (Line(
          points={{-42,72},{-37,72},{-37,40},{-98,40},{-98,72},{-94,72}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(powerGrid.J_grid, generator.J_grid)
        annotation (Line(points={{-72,79},{-64,79}},          color={0,0,127}));
      connect(turbineGovernor.y, turbine.yGV)
        annotation (Line(points={{-7,79},{7,79},{7,-13}},
                                                        color={0,0,127}));
      connect(generator.f_out[1], turbine.f_generator) annotation (Line(points={{-42,72},
              {-38,72},{-38,49},{-5,49},{-5,-13}},       color={0,0,127}));
      connect(turbine.TurbineData[1], generator.P_turbine[1]) annotation (Line(
            points={{1,-13.6667},{1,59},{-59,59},{-59,68}},              color={0,0,
              127}));
      connect(constantWaterHead1.b, Resiorvar.a1_open) annotation (Line(points=
              {{-140,15},{-146,15},{-146,-8},{-140,-8}}, color={0,0,255}));
      connect(Resiorvar.a2_pipe, conduit.a)
        annotation (Line(points={{-118,-20},{-106.2,-20}}, color={0,0,255}));
      connect(surgeTank.b, conduit1.a)
        annotation (Line(points={{-52,-20},{-46.2,-20}}, color={0,0,255}));
      connect(conduit1.b, turbine.a) annotation (Line(points={{-19.8,-20},{-14,
              -20},{-14,-24},{-10,-24}}, color={0,0,255}));
      connect(tainRace.b,headwater1. a1_pipe)
        annotation (Line(points={{45.1,-24},{50,-24},{50,-43},{54,-43}},
                                                       color={0,0,255}));
      connect(headwater1.a2_open,constantTailWater. b) annotation (Line(points={{76,-31},
              {94,-31},{94,-14},{75,-14}},   color={0,0,255}));
      connect(tainRace.a, turbine.b)
        annotation (Line(points={{20.9,-24},{12,-24}}, color={0,0,255}));
      connect(conduit.b, surgeTank.a)
        annotation (Line(points={{-79.8,-20},{-74,-20}}, color={0,0,255}));
      annotation (
        Diagram(coordinateSystem(
            preserveAspectRatio=false,
            extent={{-150,-100},{100,120}},
            grid={1,1}), graphics={
            Rectangle(
              extent={{50,91},{90,7}},
              lineColor={215,215,215},
              fillColor={215,215,215},
              fillPattern=FillPattern.Solid,
              radius=2),           Text(
              extent={{54,13},{90,9}},
              lineColor={0,0,0},
              lineThickness=0.5,
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="turbine power [MW]"),Text(
              extent={{57,73},{85,65}},
              lineColor={0,0,0},
              lineThickness=0.5,
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="Main Circuit Breaker"),
                                Text(
              extent={{39,41},{103,37}},
              lineColor={0,0,0},
              lineThickness=0.5,
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="grid power balance [MW]"),
                                Text(
              extent={{39,56},{103,52}},
              lineColor={0,0,0},
              lineThickness=0.5,
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="generator frequency [Hz]"),
                                Text(
              extent={{38,27},{102,23}},
              lineColor={0,0,0},
              lineThickness=0.5,
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="generator power [MW]")}),
        experiment(
          StopTime=600,
          __Dymola_NumberOfIntervals=5000,
          Tolerance=1e-06,
          __Dymola_Algorithm="Radau"),
        Documentation(info="<html>
<p>This example illustrates Sundsbam hydro power plant acting under no load and when connected to the power grid. </p>
<p><img src=\"modelica://HPS/Bilder/SundsbarmModel.png\"/></p>
<h4>Model experiment description</h4>
<p>When there is no load present the governor will only have the frequency error as input signal which will have the effect that the frequency of the hydro plant generator is controlled to equal the nominal frequency. This behaviour can be seen during the first 150s of simulation. </p>
<p>When 150s has passed and the frequency of the generator is synchronized to the grid frequency, the MCB is closed, the power reference is set to 45MW and new PID parameters are applied. </p>
<p>At time=350 load rejection takes place and the MCB opens once again. </p>
<h4>Simulation setup</h4>
<p>Simulate for 600s using solver Radau with a tolerance set to 1e-6.</p>
<h4>Output</h4>
<p>The most interesting variables are:</p>
<ul>
<li>generator frequency - generator.summary.f[1]</li>
<li>generated power - generator.summary.P_generator[1]</li>
</ul>
</html>",     revisions="<html>
<hr><p><font color=\"#E72614\"><b>Copyright &copy; 2004-2022, MODELON AB</b></font> <font color=\"#AFAFAF\"><br /><br /> The use of this software component is regulated by the licensing conditions for Modelon Libraries. <br /> This copyright notice must, unaltered, accompany all components that are derived from, copied from, <br /> or by other means have their origin from any Modelon Library. </font></p>
</html>"),
        Icon(coordinateSystem(
            preserveAspectRatio=false,
            extent={{-150,-100},{100,120}},
            grid={1,1})),
        __Dymola_experimentSetupOutput);
    end Sundsbam;
  end Tutorial7;
  annotation (uses(HydroPower(version="2.15"), Modelica(version="4.0.0"),
      Modelon(version="4.1")));
end HPS;
