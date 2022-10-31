within ;
package FM3217_Assignment2022 "Assignment for 2022 course"
  extends Modelica.Icons.Package;
  model TaskDescription "Description of the assignment"
    extends Modelica.Icons.Information;
    annotation(preferredView="info", Documentation(info="<html>
<h4>FM3217 - Object-oriented Modelling of Hydro Power Systems</h4>
<h5>Modelling Assignment</h5>
<h4>Deadline:</h4>
<p>Sunday, 27<sup>th</sup> November 2022 at 23:55 hours</p>
<h4>Where:</h4>
<p>Via GitHub</p>
<h4>How:</h4>
<p>You should add/integrate your solution into this library and save it as <b>one</b> 
  simple Modelica <code>*.mo</code> file. It can be accompanied by image files that 
  are linked from the info layer. Your work should finally be delivered by committing 
  <b>and pushing</b> your changes back to the fork you got the files from. 
  <i>Please do not include any temporary simulation files created by Dymola.
  Doing so will result in point reduction.</i>
</p>
<h4>Result:</h4>
<p>Counts 30&percnt; of the end result and will be published by the end of 9<sup>th</sup> of December 2022</p>
<h4>Task:</h4>
<p>During the tutorial every participant should have learned how to built simple models 
  using components from the <a href=\"modelica://Modelica\">Modelica Standard Library</a> 
  and/or the <a href=\"modelica://HydroPower\">HydroPower Library</a>.</p>
<p>In order to demonstrate your knowledge please fulfill the following tasks:</p>
<ol type=\"A\">
  <li><h5>Parametrisation error</h5>
    <p>The package <a href=\"modelica://FM3217_Assignment2022.AssignmentModels\">AssignmentModels</a> 
      contains an individual model for each student (<code>Model_&LT;YourStudentID&GT;</code>). 
      They all contain at <b>least</b> one parametrisation error which can prevent a successful 
      simulation or simply generates unrealistic results.</p>
    <ol>
      <li>Create a new model which <b>extends</b> from your personalised model(look for your Student ID) 
        and place it under <a href=\"modelica://FM3217_Assignment2022.YourFixedModel\">YourFixedModel</a></li>
      <li>Find the parametrisation error(s), fix <b>and document</b> them in the 
        &QUOT;info&QUOT; layer of your newly created model.</li>
      <li>Simulate the model for 500 seconds with the correct solver and create an image of the plot of &QUOT;<code>penstock.symmary.Q_out</code>&QUOT;
        and add that image to the info layer of that same model (<em>e.g.,</em> adding the stored 
        image file via toolbar of the editor or using the code snippet 
        <code>&LT;img src=&QUOT;modelica://FM3217_Assignment2022/Resources/Images/ImageFile.png&QUOT;&GT;</code>
        in your documentation source.)</li>
    </ol>
  </li>
  <li><h5>Power balance</h5>
    <p>Now that we have a working production model you will find that the electrical power grid 
        is not in balance. This means that the frequency starts to deviate considerable from 50Hz 
        once the generator is connected at <code>T=150 sec</code>.</p>
    <ol>
      <li>Determine the amount of unbalance in the system (either by checking the parameters 
        or by checking the simulation results of the power balance) and set the power reference 
        &QUOT;<code>pwr_ref</code>&QUOT; of the turbine governor to the correct value.</li>
      <li>Again document what you have done in the &QUOT;info&QUOT; layer and include a plot 
        of the turbine power &QUOT;<code>turbine.summary.P_turbine</code>&QUOT; and the total 
        grid power &QUOT;<code>generator.summary.P_grid_tot</code>&QUOT;</li>
    </ol>
  </li>
  <li><h5>Your library</h5>
    <p>The last tasks is about the general modelling in Modelica.</p>
    <ol>
      <li>To demonstrate your ability you should create a sub-library under
        <a href=\"modelica://FM3217_Assignment2022.YourSubLibrary\">YourSubLibrary</a>
      <li>Document the sub-library (at least) in the top-level package</li>
      <li>Include at least one base component</li>
      <li>Extend the functionality of the base component by:
        <ul>
          <li>duplication</li>
          <li>inheritance</li>
        </ul>
      </li>
      <li>Create an example package with at least one example for each extension method 
        (<em>i.e.,</em> duplication, inheritance)</li>
      <li>Document the differences, benefits and drawbacks of the two methods in the info
        layer of the library package.</li>
      <li>The library should have a useful structure</li>
    </ol>
    <p>Example:<br>
      Below is a rough sketch of an example you could use as a guide line.
      Only your version should be placed under 
      <a href=\"modelica://FM3217_Assignment2022.YourSubLibrary\">YourSubLibrary</a>.
    </p>
    <p><img src=\"modelica://FM3217_Assignment2022/Resources/Images/ControllerLib.png\"/></p>
    <p><b>Your work does <i>not</i> have to be in the same way. I&apos;m more than happy 
      if you can surprise me with an even better feature rich set up/structure.</b></p>
  </li>
</ol>
</html>"));
  end TaskDescription;

  package AssignmentModels "This package contains the different variants of assigment models."
    model Model_104111
      extends Modelica.Icons.ReleaseNotes;

      HydroPower.HydroSystems.Pipe conduit(
        horizontalIcon=true,
        L=6600,
        endD={5.8,5.8},
        showDataInIcon=false,
        ZL=564,
        endL={0,0},
        n=4,
        ZR=541.5) annotation (Placement(transformation(extent={{-66,-28},{-46,-8}})));
      HydroPower.HydroSystems.Pipe penstock(
        endD={3,3},
        L=724,
        showDataInIcon=false,
        ZL=541.5,
        ZR=112.5,
        endL={0,0})
        annotation (Placement(transformation(extent={{-16,-40},{4,-20}})));
      HydroPower.HydroSystems.SurgeTank surgeTank(
        D=3.6,
        H2L=0.87,
        Vol=100,
        showDataInIcon=false,
        deltZ=40) annotation (Placement(transformation(extent={{-40,-28},{-20,-8}})));
      HydroPower.SinksAndSources.Fixed_HT inTH(
        depth=60,
        paraOption=false,
        H_const=48 + 564,
        Hmax=564 + 60)
        annotation (Placement(transformation(extent={{-74,2},{-90,18}})));
      HydroPower.HydroSystems.Reservoir reservoir(
        Hmax=564 + 60,
        depth=ones(reservoir.n)*60,
        H_start=48 + 564,
        MidWidth=200,
        SideWidth=100,
        L=100,
        depthIntake={0,0},
        Krough=100,
        pWb=1,
        k=2,
        steadyState=false)
        annotation (Placement(transformation(extent={{-94,-22},{-74,-2}})));
      HydroPower.SinksAndSources.Fixed_HT outTH(
        paraOption=false,
        H_const=115,
        Hmax=130,
        depth=20)
        annotation (Placement(transformation(extent={{72,-52},{90,-68}})));
      HydroPower.HydroSystems.Reservoir river(
        H_start=115,
        MidWidth=200,
        SideWidth=100,
        L=100,
        depthIntake={0,0},
        pWb=1,
        k=2,
        Hmax=130,
        depth=ones(river.n)*20)
               annotation (Placement(transformation(extent={{70,-40},{90,-20}})));
      HydroPower.HydroSystems.Pipe downstream(
        horizontalIcon=true,
        endD={5.8,5.8},
        L=724,
        showDataInIcon=false,
        endL={0,0},
        n=4,
        ZL=215,
        ZR=541.5)
                annotation (Placement(transformation(extent={{40,-46},{60,-26}})));
      HydroPower.ElectricalSystems.PowerGrid
                                  powerGrid(
        distTgen={150,1e6,1e6},
        loadDiv={0.5,0.25,0.25},
        loadT={0.5,1,2},
        NoLoadUnits={2000,4000,10000},
        distTload={1e6,1e6,1e6},
        distNoLoad={0,0,0},
        prodDiv={0.45,0.45,0.1},
        prodT={120,15,5},
        ep={0.5,0.08,0.04},
        unitsJ={122000,5.5e6,8000},
        NoGenUnits={90,100,500},
        distNoGen={-15,0,0})    annotation (Placement(transformation(extent={{-20,20},{0,40}},
                          rotation=0)));
      Modelica.Blocks.Sources.Ramp pwr_ref(
        duration=10,
        height=0,
        startTime=1e6,
        offset=40e6)   annotation (Placement(transformation(extent={{20,60},{40,80}},
                      rotation=0)));
      HydroPower.ElectricalSystems.GeneratorAndMCB generator(
        np={12},
        timeMCB_close=ones(generator.n)*150,
        timeMCB_open=ones(generator.n)*250,
        f_start=0,
        J={212500},
        P_nom={103000000})
                      annotation (Placement(transformation(extent={{20,20},{40,40}},
                       rotation=0)));
      HydroPower.ControllersAndSensors.TurbineGovernorAnalog
                                                  turbineGovernor(
        ep=1,
        tRamp=40,
        P_generator_nom=generator.P_nom[1],
        enableRamp=false,
        Kd_noLoad=0.05,
        Kd_load=0.5,
        K_noLoad=0.2,
        K_load=0.4,
        Ki_load=0.1,
        Ki_noLoad=0.025)
                    annotation (Placement(transformation(extent={{50,20},{70,40}},
              rotation=0)));
      HydroPower.MechanicalSystems.BasicTurbine turbine(
        H_nom=460,
        LdraftTube=2.9,
        DavDraftTube=3,
        LscrollCase=15.7,
        DavScrollCasing=1.5,
        np=12,
        tableOnFile=true,
        PUInFlowTables=true,
        QTableName="Qtab",
        T_start(displayUnit="degC"),
        yvLim1=[-0.4,0.05],
        yvLim2=[-0.4,0.05],
        Q_nom=24.3,
        H_start=564 + 48,
        H_start_draftTube=115,
        effMech=1,
        TurbDmp0=0.01,
        TurbineDataFile=Modelica.Utilities.Files.loadResource(HydroPower.TABLE_DIR
             + "TurbineDataFile.mat"),
        P_nom=103000000)
        annotation (Placement(transformation(extent={{12,-40},{32,-20}})));
      inner HydroPower.System_HPL system_HPL(                  constantTemperature=true,
          steadyState=true)
        annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
    equation
      connect(reservoir.a2_pipe, conduit.a) annotation (Line(
          points={{-73,-18},{-67,-18}},
          color={0,0,255},
          smooth=Smooth.None));

      connect(powerGrid.f_grid,generator. f_grid)         annotation (Line(
          points={{1,23},{19,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(powerGrid.J_grid,generator. J_grid)         annotation (Line(
          points={{1,30},{19,30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(powerGrid.P_grid_balance,generator. P_grid_balance)
        annotation (Line(
          points={{1,37},{19,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(pwr_ref.y,turbineGovernor. P_reference) annotation (Line(
          points={{41,70},{54,70},{54,41}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.f_out[1],turbineGovernor. f) annotation (Line(
          points={{41,23},{49,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.onMCB,powerGrid. MCB) annotation (Line(
          points={{30,41},{30,48},{-10,48},{-10,41}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(generator.onMCB[1],turbineGovernor. isMCB) annotation (Line(
          points={{30,41},{30,48},{60,48},{60,41}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(generator.P_out[1],turbineGovernor. P_generator) annotation (Line(
          points={{41,37},{49,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.f_out,powerGrid. f) annotation (Line(
          points={{41,23},{46,23},{46,10},{-36,10},{-36,23},{-21,23}},
          color={0,0,127},
          smooth=Smooth.None));

      connect(turbine.b, downstream.a) annotation (Line(
          points={{33,-30},{36,-30},{36,-36},{39,-36}},
          color={0,0,255},
          smooth=Smooth.None));

      connect(turbine.TurbineData[1], generator.P_turbine[1]) annotation (Line(
          points={{22,-19.6667},{22,-19.6667},{22,19},{24,19}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(turbine.f_generator, generator.f_out[1]) annotation (Line(
          points={{16,-19},{16,10},{46,10},{46,23},{41,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(turbine.yGV, turbineGovernor.y) annotation (Line(
          points={{28,-19},{28,0},{80,0},{80,30},{71,30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(inTH.b, reservoir.a1_open) annotation (Line(points={{-90.8,10},{-98,10},{-98,-6},{-95,-6}},
                                                color={0,0,255}));
      connect(downstream.b, river.a1_pipe) annotation (Line(points={{61,-36},{61,-36},{69,-36}},
                                   color={0,0,255}));
      connect(river.a2_open, outTH.b) annotation (Line(points={{91,-24},{95.5,-24},{95.5,-60},{90.9,-60}},
                                  color={0,0,255}));
      connect(turbine.a, penstock.b) annotation (Line(points={{11,-30},{5,-30}}, color={0,0,255}));
      connect(penstock.a, surgeTank.b) annotation (Line(points={{-17,-30},{-18,-30},{-18,-18},{-19,-18}}, color={0,0,255}));
      connect(conduit.b, surgeTank.a) annotation (Line(points={{-45,-18},{-41,-18}}, color={0,0,255}));
    end Model_104111;
    extends Modelica.Icons.VariantsPackage;
    model Model_145445
      extends Modelica.Icons.ReleaseNotes;

      HydroPower.HydroSystems.Pipe conduit(
        horizontalIcon=true,
        L=6600,
        endD={5.8,5.8},
        showDataInIcon=false,
        ZL=564,
        endL={0,0},
        n=4,
        ZR=541.5) annotation (Placement(transformation(extent={{-66,-28},{-46,-8}})));
      HydroPower.HydroSystems.Pipe penstock(
        endD={3,3},
        L=724,
        showDataInIcon=false,
        ZL=541.5,
        ZR=112.5,
        endL={0,0})
        annotation (Placement(transformation(extent={{-16,-40},{4,-20}})));
      HydroPower.HydroSystems.SurgeTank surgeTank(
        D=3.6,
        H2L=0.87,
        Vol=100,
        showDataInIcon=false,
        deltZ=40) annotation (Placement(transformation(extent={{-40,-28},{-20,-8}})));
      HydroPower.SinksAndSources.Fixed_HT inTH(
        depth=60,
        paraOption=false,
        H_const=48 + 564,
        Hmax=564 + 60)
        annotation (Placement(transformation(extent={{-74,2},{-90,18}})));
      HydroPower.HydroSystems.Reservoir reservoir(
        Hmax=564 + 60,
        depth=ones(reservoir.n)*60,
        H_start=48 + 564,
        MidWidth=200,
        SideWidth=100,
        L=100,
        depthIntake={0,0},
        Krough=100,
        pWb=1,
        k=2,
        steadyState=false)
        annotation (Placement(transformation(extent={{-94,-22},{-74,-2}})));
      HydroPower.SinksAndSources.Fixed_HT outTH(
        paraOption=false,
        H_const=115,
        Hmax=130,
        depth=20)
        annotation (Placement(transformation(extent={{72,-52},{90,-68}})));
      HydroPower.HydroSystems.Reservoir river(
        H_start=115,
        MidWidth=200,
        SideWidth=100,
        L=100,
        depthIntake={0,0},
        pWb=1,
        k=2,
        Hmax=130,
        depth=ones(river.n)*20)
               annotation (Placement(transformation(extent={{70,-40},{90,-20}})));
      HydroPower.HydroSystems.Pipe downstream(
        horizontalIcon=true,
        endD={5.8,5.8},
        L=724,
        ZL=110.5,
        showDataInIcon=false,
        endL={0,0},
        n=4,
        ZR=215) annotation (Placement(transformation(extent={{40,-46},{60,-26}})));
      HydroPower.ElectricalSystems.PowerGrid
                                  powerGrid(
        distTgen={150,1e6,1e6},
        loadDiv={0.5,0.25,0.25},
        loadT={0.5,1,2},
        NoLoadUnits={2000,4000,10000},
        distTload={1e6,1e6,1e6},
        distNoLoad={0,0,0},
        prodDiv={0.45,0.45,0.1},
        prodT={120,15,5},
        ep={0.5,0.08,0.04},
        unitsJ={122000,5.5e6,8000},
        NoGenUnits={90,100,500},
        distNoGen={-5,0,0})     annotation (Placement(transformation(extent={{-20,20},{0,40}},
                          rotation=0)));
      Modelica.Blocks.Sources.Ramp pwr_ref(
        duration=10,
        height=0,
        startTime=1e6,
        offset=70e6)   annotation (Placement(transformation(extent={{20,60},{40,80}},
                      rotation=0)));
      HydroPower.ElectricalSystems.GeneratorAndMCB generator(
        np={12},
        timeMCB_close=ones(generator.n)*150,
        timeMCB_open=ones(generator.n)*250,
        f_start=0,
        J={212500},
        P_nom={103000000})
                      annotation (Placement(transformation(extent={{20,20},{40,40}},
                       rotation=0)));
      HydroPower.ControllersAndSensors.TurbineGovernorAnalog
                                                  turbineGovernor(
        ep=1,
        tRamp=40,
        P_generator_nom=generator.P_nom[1],
        enableRamp=false,
        Kd_noLoad=0.05,
        Kd_load=0.5,
        K_noLoad=0.2,
        K_load=0.4,
        Ki_load=0.1,
        Ki_noLoad=0.025)
                    annotation (Placement(transformation(extent={{50,20},{70,40}},
              rotation=0)));
      HydroPower.MechanicalSystems.BasicTurbine turbine(
        H_nom=460,
        LdraftTube=2.9,
        DavDraftTube=3,
        LscrollCase=15.7,
        DavScrollCasing=1.5,
        np=12,
        tableOnFile=true,
        PUInFlowTables=true,
        QTableName="Qtab",
        T_start(displayUnit="degC"),
        yvLim1=[-0.4,0.05],
        yvLim2=[-0.4,0.05],
        Q_nom=24.3,
        H_start=564 + 48,
        H_start_draftTube=115,
        effMech=1,
        TurbDmp0=0.01,
        TurbineDataFile=Modelica.Utilities.Files.loadResource(HydroPower.TABLE_DIR
             + "TurbineDataFile.mat"),
        P_nom=103000000)
        annotation (Placement(transformation(extent={{12,-40},{32,-20}})));
      inner HydroPower.System_HPL system_HPL(                  constantTemperature=true,
          steadyState=true)
        annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
    equation
      connect(reservoir.a2_pipe, conduit.a) annotation (Line(
          points={{-73,-18},{-67,-18}},
          color={0,0,255},
          smooth=Smooth.None));

      connect(powerGrid.f_grid,generator. f_grid)         annotation (Line(
          points={{1,23},{19,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(powerGrid.J_grid,generator. J_grid)         annotation (Line(
          points={{1,30},{19,30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(powerGrid.P_grid_balance,generator. P_grid_balance)
        annotation (Line(
          points={{1,37},{19,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(pwr_ref.y,turbineGovernor. P_reference) annotation (Line(
          points={{41,70},{54,70},{54,41}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.f_out[1],turbineGovernor. f) annotation (Line(
          points={{41,23},{49,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.onMCB,powerGrid. MCB) annotation (Line(
          points={{30,41},{30,48},{-10,48},{-10,41}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(generator.onMCB[1],turbineGovernor. isMCB) annotation (Line(
          points={{30,41},{30,48},{60,48},{60,41}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(generator.P_out[1],turbineGovernor. P_generator) annotation (Line(
          points={{41,37},{49,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.f_out,powerGrid. f) annotation (Line(
          points={{41,23},{46,23},{46,10},{-36,10},{-36,23},{-21,23}},
          color={0,0,127},
          smooth=Smooth.None));

      connect(turbine.b, downstream.a) annotation (Line(
          points={{33,-30},{36,-30},{36,-36},{39,-36}},
          color={0,0,255},
          smooth=Smooth.None));

      connect(turbine.TurbineData[1], generator.P_turbine[1]) annotation (Line(
          points={{22,-19.6667},{22,-19.6667},{22,19},{24,19}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(turbine.f_generator, generator.f_out[1]) annotation (Line(
          points={{16,-19},{16,10},{46,10},{46,23},{41,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(turbine.yGV, turbineGovernor.y) annotation (Line(
          points={{28,-19},{28,0},{80,0},{80,30},{71,30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(inTH.b, reservoir.a1_open) annotation (Line(points={{-90.8,10},{-98,10},{-98,-6},{-95,-6}},
                                                color={0,0,255}));
      connect(downstream.b, river.a1_pipe) annotation (Line(points={{61,-36},{61,-36},{69,-36}},
                                   color={0,0,255}));
      connect(river.a2_open, outTH.b) annotation (Line(points={{91,-24},{95.5,-24},{95.5,-60},{90.9,-60}},
                                  color={0,0,255}));
      connect(turbine.a, penstock.b) annotation (Line(points={{11,-30},{5,-30}}, color={0,0,255}));
      connect(penstock.a, surgeTank.b) annotation (Line(points={{-17,-30},{-18,-30},{-18,-18},{-19,-18}}, color={0,0,255}));
      connect(conduit.b, surgeTank.a) annotation (Line(points={{-45,-18},{-41,-18}}, color={0,0,255}));
    end Model_145445;

    model Model_201198
      extends Modelica.Icons.ReleaseNotes;

      HydroPower.HydroSystems.Pipe conduit(
        horizontalIcon=true,
        L=6600,
        endD={5.8,5.8},
        showDataInIcon=false,
        ZL=564,
        endL={0,0},
        n=4,
        ZR=451.5) annotation (Placement(transformation(extent={{-66,-28},{-46,-8}})));
      HydroPower.HydroSystems.Pipe penstock(
        endD={3,3},
        L=724,
        showDataInIcon=false,
        ZL=541.5,
        ZR=112.5,
        endL={0,0})
        annotation (Placement(transformation(extent={{-16,-40},{4,-20}})));
      HydroPower.HydroSystems.SurgeTank surgeTank(
        D=3.6,
        H2L=0.87,
        Vol=100,
        showDataInIcon=false,
        deltZ=40) annotation (Placement(transformation(extent={{-40,-28},{-20,-8}})));
      HydroPower.SinksAndSources.Fixed_HT inTH(
        depth=60,
        paraOption=false,
        H_const=48 + 564,
        Hmax=564 + 60)
        annotation (Placement(transformation(extent={{-74,2},{-90,18}})));
      HydroPower.HydroSystems.Reservoir reservoir(
        Hmax=564 + 60,
        depth=ones(reservoir.n)*60,
        H_start=48 + 564,
        MidWidth=200,
        SideWidth=100,
        L=100,
        depthIntake={0,0},
        Krough=100,
        pWb=1,
        k=2,
        steadyState=false)
        annotation (Placement(transformation(extent={{-94,-22},{-74,-2}})));
      HydroPower.SinksAndSources.Fixed_HT outTH(
        paraOption=false,
        H_const=115,
        Hmax=130,
        depth=20)
        annotation (Placement(transformation(extent={{72,-52},{90,-68}})));
      HydroPower.HydroSystems.Reservoir river(
        H_start=115,
        MidWidth=200,
        SideWidth=100,
        L=100,
        depthIntake={0,0},
        pWb=1,
        k=2,
        Hmax=130,
        depth=ones(river.n)*20)
               annotation (Placement(transformation(extent={{70,-40},{90,-20}})));
      HydroPower.HydroSystems.Pipe downstream(
        horizontalIcon=true,
        endD={5.8,5.8},
        L=724,
        ZL=110.5,
        showDataInIcon=false,
        ZR=110,
        endL={0,0},
        n=4)    annotation (Placement(transformation(extent={{40,-46},{60,-26}})));
      HydroPower.ElectricalSystems.PowerGrid
                                  powerGrid(
        distTgen={150,1e6,1e6},
        loadDiv={0.5,0.25,0.25},
        loadT={0.5,1,2},
        NoLoadUnits={2000,4000,10000},
        distTload={1e6,1e6,1e6},
        distNoLoad={0,0,0},
        prodDiv={0.45,0.45,0.1},
        prodT={120,15,5},
        ep={0.5,0.08,0.04},
        unitsJ={122000,5.5e6,8000},
        NoGenUnits={90,100,500},
        distNoGen={-17,0,0})    annotation (Placement(transformation(extent={{-20,20},{0,40}},
                          rotation=0)));
      Modelica.Blocks.Sources.Ramp pwr_ref(
        duration=10,
        height=0,
        startTime=1e6,
        offset=10e6)   annotation (Placement(transformation(extent={{20,60},{40,80}},
                      rotation=0)));
      HydroPower.ElectricalSystems.GeneratorAndMCB generator(
        np={12},
        timeMCB_close=ones(generator.n)*150,
        timeMCB_open=ones(generator.n)*250,
        f_start=0,
        J={212500},
        P_nom={103000000})
                      annotation (Placement(transformation(extent={{20,20},{40,40}},
                       rotation=0)));
      HydroPower.ControllersAndSensors.TurbineGovernorAnalog
                                                  turbineGovernor(
        ep=1,
        tRamp=40,
        P_generator_nom=generator.P_nom[1],
        enableRamp=false,
        Kd_noLoad=0.05,
        Kd_load=0.5,
        K_noLoad=0.2,
        K_load=0.4,
        Ki_load=0.1,
        Ki_noLoad=0.025)
                    annotation (Placement(transformation(extent={{50,20},{70,40}},
              rotation=0)));
      HydroPower.MechanicalSystems.BasicTurbine turbine(
        H_nom=460,
        LdraftTube=2.9,
        DavDraftTube=3,
        LscrollCase=15.7,
        DavScrollCasing=1.5,
        np=12,
        tableOnFile=true,
        PUInFlowTables=true,
        QTableName="Qtab",
        T_start(displayUnit="degC"),
        yvLim1=[-0.4,0.05],
        yvLim2=[-0.4,0.05],
        Q_nom=24.3,
        H_start=564 + 48,
        H_start_draftTube=115,
        effMech=1,
        TurbDmp0=0.01,
        TurbineDataFile=Modelica.Utilities.Files.loadResource(HydroPower.TABLE_DIR
             + "TurbineDataFile.mat"),
        P_nom=103000000)
        annotation (Placement(transformation(extent={{12,-40},{32,-20}})));
      inner HydroPower.System_HPL system_HPL(                  constantTemperature=true,
          steadyState=true)
        annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
    equation
      connect(reservoir.a2_pipe, conduit.a) annotation (Line(
          points={{-73,-18},{-67,-18}},
          color={0,0,255},
          smooth=Smooth.None));

      connect(powerGrid.f_grid,generator. f_grid)         annotation (Line(
          points={{1,23},{19,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(powerGrid.J_grid,generator. J_grid)         annotation (Line(
          points={{1,30},{19,30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(powerGrid.P_grid_balance,generator. P_grid_balance)
        annotation (Line(
          points={{1,37},{19,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(pwr_ref.y,turbineGovernor. P_reference) annotation (Line(
          points={{41,70},{54,70},{54,41}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.f_out[1],turbineGovernor. f) annotation (Line(
          points={{41,23},{49,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.onMCB,powerGrid. MCB) annotation (Line(
          points={{30,41},{30,48},{-10,48},{-10,41}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(generator.onMCB[1],turbineGovernor. isMCB) annotation (Line(
          points={{30,41},{30,48},{60,48},{60,41}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(generator.P_out[1],turbineGovernor. P_generator) annotation (Line(
          points={{41,37},{49,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.f_out,powerGrid. f) annotation (Line(
          points={{41,23},{46,23},{46,10},{-36,10},{-36,23},{-21,23}},
          color={0,0,127},
          smooth=Smooth.None));

      connect(turbine.b, downstream.a) annotation (Line(
          points={{33,-30},{36,-30},{36,-36},{39,-36}},
          color={0,0,255},
          smooth=Smooth.None));

      connect(turbine.TurbineData[1], generator.P_turbine[1]) annotation (Line(
          points={{22,-19.6667},{22,-19.6667},{22,19},{24,19}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(turbine.f_generator, generator.f_out[1]) annotation (Line(
          points={{16,-19},{16,10},{46,10},{46,23},{41,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(turbine.yGV, turbineGovernor.y) annotation (Line(
          points={{28,-19},{28,0},{80,0},{80,30},{71,30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(inTH.b, reservoir.a1_open) annotation (Line(points={{-90.8,10},{-98,10},{-98,-6},{-95,-6}},
                                                color={0,0,255}));
      connect(downstream.b, river.a1_pipe) annotation (Line(points={{61,-36},{61,-36},{69,-36}},
                                   color={0,0,255}));
      connect(river.a2_open, outTH.b) annotation (Line(points={{91,-24},{95.5,-24},{95.5,-60},{90.9,-60}},
                                  color={0,0,255}));
      connect(turbine.a, penstock.b) annotation (Line(points={{11,-30},{5,-30}}, color={0,0,255}));
      connect(penstock.a, surgeTank.b) annotation (Line(points={{-17,-30},{-18,-30},{-18,-18},{-19,-18}}, color={0,0,255}));
      connect(conduit.b, surgeTank.a) annotation (Line(points={{-45,-18},{-41,-18}}, color={0,0,255}));
    end Model_201198;

    model Model_214913
      extends Modelica.Icons.ReleaseNotes;

      HydroPower.HydroSystems.Pipe conduit(
        horizontalIcon=true,
        L=6600,
        endD={5.8,5.8},
        showDataInIcon=false,
        endL={0,0},
        n=4,
        ZL=564,
        ZR=541.5) annotation (Placement(transformation(extent={{-66,-28},{-46,-8}})));
      HydroPower.HydroSystems.Pipe penstock(
        endD={3,3},
        L=724,
        showDataInIcon=false,
        ZL=541.5,
        ZR=112.5,
        endL={0,0})
        annotation (Placement(transformation(extent={{-16,-40},{4,-20}})));
      HydroPower.HydroSystems.SurgeTank surgeTank(
        D=3.6,
        H2L=0.87,
        Vol=100,
        showDataInIcon=false,
        deltZ=40) annotation (Placement(transformation(extent={{-40,-28},{-20,-8}})));
      HydroPower.SinksAndSources.Fixed_HT inTH(
        depth=60,
        paraOption=false,
        H_const=48 + 564,
        Hmax=564 + 60)
        annotation (Placement(transformation(extent={{-74,2},{-90,18}})));
      HydroPower.HydroSystems.Reservoir reservoir(
        Hmax=564 + 60,
        depth=ones(reservoir.n)*60,
        H_start=48 + 564,
        MidWidth=200,
        SideWidth=100,
        L=100,
        depthIntake={0,0},
        Krough=100,
        pWb=1,
        k=2,
        steadyState=false)
        annotation (Placement(transformation(extent={{-94,-22},{-74,-2}})));
      HydroPower.SinksAndSources.Fixed_HT outTH(
        paraOption=false,
        H_const=115,
        Hmax=130,
        depth=20)
        annotation (Placement(transformation(extent={{72,-52},{90,-68}})));
      HydroPower.HydroSystems.Reservoir river(
        H_start=115,
        MidWidth=200,
        SideWidth=100,
        L=100,
        depthIntake={0,0},
        pWb=1,
        k=2,
        Hmax=130,
        depth=ones(river.n)*20)
               annotation (Placement(transformation(extent={{70,-40},{90,-20}})));
      HydroPower.HydroSystems.Pipe downstream(
        horizontalIcon=true,
        endD={5.8,5.8},
        L=724,
        ZL=110.5,
        showDataInIcon=false,
        endL={0,0},
        n=4,
        ZR=415) annotation (Placement(transformation(extent={{40,-46},{60,-26}})));
      HydroPower.ElectricalSystems.PowerGrid
                                  powerGrid(
        distTgen={150,1e6,1e6},
        loadDiv={0.5,0.25,0.25},
        loadT={0.5,1,2},
        NoLoadUnits={2000,4000,10000},
        distTload={1e6,1e6,1e6},
        distNoLoad={0,0,0},
        prodDiv={0.45,0.45,0.1},
        prodT={120,15,5},
        ep={0.5,0.08,0.04},
        unitsJ={122000,5.5e6,8000},
        NoGenUnits={90,100,500},
        distNoGen={-7,0,0})     annotation (Placement(transformation(extent={{-20,20},{0,40}},
                          rotation=0)));
      Modelica.Blocks.Sources.Ramp pwr_ref(
        duration=10,
        height=0,
        startTime=1e6,
        offset=60e6)   annotation (Placement(transformation(extent={{20,60},{40,80}},
                      rotation=0)));
      HydroPower.ElectricalSystems.GeneratorAndMCB generator(
        np={12},
        timeMCB_close=ones(generator.n)*150,
        timeMCB_open=ones(generator.n)*250,
        f_start=0,
        J={212500},
        P_nom={103000000})
                      annotation (Placement(transformation(extent={{20,20},{40,40}},
                       rotation=0)));
      HydroPower.ControllersAndSensors.TurbineGovernorAnalog
                                                  turbineGovernor(
        ep=1,
        tRamp=40,
        P_generator_nom=generator.P_nom[1],
        enableRamp=false,
        Kd_noLoad=0.05,
        Kd_load=0.5,
        K_noLoad=0.2,
        K_load=0.4,
        Ki_load=0.1,
        Ki_noLoad=0.025)
                    annotation (Placement(transformation(extent={{50,20},{70,40}},
              rotation=0)));
      HydroPower.MechanicalSystems.BasicTurbine turbine(
        H_nom=460,
        LdraftTube=2.9,
        DavDraftTube=3,
        LscrollCase=15.7,
        DavScrollCasing=1.5,
        np=12,
        tableOnFile=true,
        PUInFlowTables=true,
        QTableName="Qtab",
        T_start(displayUnit="degC"),
        yvLim1=[-0.4,0.05],
        yvLim2=[-0.4,0.05],
        Q_nom=24.3,
        H_start=564 + 48,
        H_start_draftTube=115,
        effMech=1,
        TurbDmp0=0.01,
        TurbineDataFile=Modelica.Utilities.Files.loadResource(HydroPower.TABLE_DIR
             + "TurbineDataFile.mat"),
        P_nom=103000000)
        annotation (Placement(transformation(extent={{12,-40},{32,-20}})));
      inner HydroPower.System_HPL system_HPL(                  constantTemperature=true,
          steadyState=true)
        annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
    equation
      connect(reservoir.a2_pipe, conduit.a) annotation (Line(
          points={{-73,-18},{-67,-18}},
          color={0,0,255},
          smooth=Smooth.None));

      connect(powerGrid.f_grid,generator. f_grid)         annotation (Line(
          points={{1,23},{19,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(powerGrid.J_grid,generator. J_grid)         annotation (Line(
          points={{1,30},{19,30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(powerGrid.P_grid_balance,generator. P_grid_balance)
        annotation (Line(
          points={{1,37},{19,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(pwr_ref.y,turbineGovernor. P_reference) annotation (Line(
          points={{41,70},{54,70},{54,41}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.f_out[1],turbineGovernor. f) annotation (Line(
          points={{41,23},{49,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.onMCB,powerGrid. MCB) annotation (Line(
          points={{30,41},{30,48},{-10,48},{-10,41}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(generator.onMCB[1],turbineGovernor. isMCB) annotation (Line(
          points={{30,41},{30,48},{60,48},{60,41}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(generator.P_out[1],turbineGovernor. P_generator) annotation (Line(
          points={{41,37},{49,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.f_out,powerGrid. f) annotation (Line(
          points={{41,23},{46,23},{46,10},{-36,10},{-36,23},{-21,23}},
          color={0,0,127},
          smooth=Smooth.None));

      connect(turbine.b, downstream.a) annotation (Line(
          points={{33,-30},{36,-30},{36,-36},{39,-36}},
          color={0,0,255},
          smooth=Smooth.None));

      connect(turbine.TurbineData[1], generator.P_turbine[1]) annotation (Line(
          points={{22,-19.6667},{22,-19.6667},{22,19},{24,19}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(turbine.f_generator, generator.f_out[1]) annotation (Line(
          points={{16,-19},{16,10},{46,10},{46,23},{41,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(turbine.yGV, turbineGovernor.y) annotation (Line(
          points={{28,-19},{28,0},{80,0},{80,30},{71,30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(inTH.b, reservoir.a1_open) annotation (Line(points={{-90.8,10},{-98,10},{-98,-6},{-95,-6}},
                                                color={0,0,255}));
      connect(downstream.b, river.a1_pipe) annotation (Line(points={{61,-36},{61,-36},{69,-36}},
                                   color={0,0,255}));
      connect(river.a2_open, outTH.b) annotation (Line(points={{91,-24},{95.5,-24},{95.5,-60},{90.9,-60}},
                                  color={0,0,255}));
      connect(turbine.a, penstock.b) annotation (Line(points={{11,-30},{5,-30}}, color={0,0,255}));
      connect(penstock.a, surgeTank.b) annotation (Line(points={{-17,-30},{-18,-30},{-18,-18},{-19,-18}}, color={0,0,255}));
      connect(conduit.b, surgeTank.a) annotation (Line(points={{-45,-18},{-41,-18}}, color={0,0,255}));
    end Model_214913;

    model Model_221879
      extends Modelica.Icons.ReleaseNotes;

      HydroPower.HydroSystems.Pipe conduit(
        horizontalIcon=true,
        L=6600,
        endD={5.8,5.8},
        showDataInIcon=false,
        endL={0,0},
        n=4,
        ZL=564,
        ZR=541.5) annotation (Placement(transformation(extent={{-66,-28},{-46,-8}})));
      HydroPower.HydroSystems.Pipe penstock(
        endD={3,3},
        L=724,
        showDataInIcon=false,
        ZL=541.5,
        ZR=112.5,
        endL={0,0})
        annotation (Placement(transformation(extent={{-16,-40},{4,-20}})));
      HydroPower.HydroSystems.SurgeTank surgeTank(
        D=3.6,
        H2L=0.87,
        Vol=100,
        showDataInIcon=false,
        deltZ=40) annotation (Placement(transformation(extent={{-40,-28},{-20,-8}})));
      HydroPower.SinksAndSources.Fixed_HT inTH(
        depth=60,
        paraOption=false,
        H_const=48 + 564,
        Hmax=564 + 60)
        annotation (Placement(transformation(extent={{-74,2},{-90,18}})));
      HydroPower.HydroSystems.Reservoir reservoir(
        Hmax=564 + 60,
        depth=ones(reservoir.n)*60,
        H_start=48 + 564,
        MidWidth=200,
        SideWidth=100,
        L=100,
        depthIntake={0,0},
        Krough=100,
        pWb=1,
        k=2,
        steadyState=false)
        annotation (Placement(transformation(extent={{-94,-22},{-74,-2}})));
      HydroPower.SinksAndSources.Fixed_HT outTH(
        paraOption=false,
        H_const=115,
        Hmax=130,
        depth=20)
        annotation (Placement(transformation(extent={{72,-52},{90,-68}})));
      HydroPower.HydroSystems.Reservoir river(
        H_start=115,
        MidWidth=200,
        SideWidth=100,
        L=100,
        depthIntake={0,0},
        pWb=1,
        k=2,
        Hmax=130,
        depth=ones(river.n)*20)
               annotation (Placement(transformation(extent={{70,-40},{90,-20}})));
      HydroPower.HydroSystems.Pipe downstream(
        horizontalIcon=true,
        endD={5.8,5.8},
        L=724,
        ZL=110.5,
        showDataInIcon=false,
        endL={0,0},
        n=4,
        ZR=415) annotation (Placement(transformation(extent={{40,-46},{60,-26}})));
      HydroPower.ElectricalSystems.PowerGrid
                                  powerGrid(
        distTgen={150,1e6,1e6},
        loadDiv={0.5,0.25,0.25},
        loadT={0.5,1,2},
        NoLoadUnits={2000,4000,10000},
        distTload={1e6,1e6,1e6},
        distNoLoad={0,0,0},
        prodDiv={0.45,0.45,0.1},
        prodT={120,15,5},
        ep={0.5,0.08,0.04},
        unitsJ={122000,5.5e6,8000},
        NoGenUnits={90,100,500},
        distNoGen={-7,0,0})     annotation (Placement(transformation(extent={{-20,20},{0,40}},
                          rotation=0)));
      Modelica.Blocks.Sources.Ramp pwr_ref(
        duration=10,
        height=0,
        startTime=1e6,
        offset=60e6)   annotation (Placement(transformation(extent={{20,60},{40,80}},
                      rotation=0)));
      HydroPower.ElectricalSystems.GeneratorAndMCB generator(
        np={12},
        timeMCB_close=ones(generator.n)*150,
        timeMCB_open=ones(generator.n)*250,
        f_start=0,
        J={212500},
        P_nom={103000000})
                      annotation (Placement(transformation(extent={{20,20},{40,40}},
                       rotation=0)));
      HydroPower.ControllersAndSensors.TurbineGovernorAnalog
                                                  turbineGovernor(
        ep=1,
        tRamp=40,
        P_generator_nom=generator.P_nom[1],
        enableRamp=false,
        Kd_noLoad=0.05,
        Kd_load=0.5,
        K_noLoad=0.2,
        K_load=0.4,
        Ki_load=0.1,
        Ki_noLoad=0.025)
                    annotation (Placement(transformation(extent={{50,20},{70,40}},
              rotation=0)));
      HydroPower.MechanicalSystems.BasicTurbine turbine(
        H_nom=460,
        LdraftTube=2.9,
        DavDraftTube=3,
        LscrollCase=15.7,
        DavScrollCasing=1.5,
        np=12,
        tableOnFile=true,
        PUInFlowTables=true,
        QTableName="Qtab",
        T_start(displayUnit="degC"),
        yvLim1=[-0.4,0.05],
        yvLim2=[-0.4,0.05],
        Q_nom=24.3,
        H_start=564 + 48,
        H_start_draftTube=115,
        effMech=1,
        TurbDmp0=0.01,
        TurbineDataFile=Modelica.Utilities.Files.loadResource(HydroPower.TABLE_DIR
             + "TurbineDataFile.mat"),
        P_nom=103000000)
        annotation (Placement(transformation(extent={{12,-40},{32,-20}})));
      inner HydroPower.System_HPL system_HPL(                  constantTemperature=true,
          steadyState=true)
        annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
    equation
      connect(reservoir.a2_pipe, conduit.a) annotation (Line(
          points={{-73,-18},{-67,-18}},
          color={0,0,255},
          smooth=Smooth.None));

      connect(powerGrid.f_grid,generator. f_grid)         annotation (Line(
          points={{1,23},{19,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(powerGrid.J_grid,generator. J_grid)         annotation (Line(
          points={{1,30},{19,30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(powerGrid.P_grid_balance,generator. P_grid_balance)
        annotation (Line(
          points={{1,37},{19,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(pwr_ref.y,turbineGovernor. P_reference) annotation (Line(
          points={{41,70},{54,70},{54,41}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.f_out[1],turbineGovernor. f) annotation (Line(
          points={{41,23},{49,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.onMCB,powerGrid. MCB) annotation (Line(
          points={{30,41},{30,48},{-10,48},{-10,41}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(generator.onMCB[1],turbineGovernor. isMCB) annotation (Line(
          points={{30,41},{30,48},{60,48},{60,41}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(generator.P_out[1],turbineGovernor. P_generator) annotation (Line(
          points={{41,37},{49,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.f_out,powerGrid. f) annotation (Line(
          points={{41,23},{46,23},{46,10},{-36,10},{-36,23},{-21,23}},
          color={0,0,127},
          smooth=Smooth.None));

      connect(turbine.b, downstream.a) annotation (Line(
          points={{33,-30},{36,-30},{36,-36},{39,-36}},
          color={0,0,255},
          smooth=Smooth.None));

      connect(turbine.TurbineData[1], generator.P_turbine[1]) annotation (Line(
          points={{22,-19.6667},{22,19}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(turbine.f_generator, generator.f_out[1]) annotation (Line(
          points={{16,-19},{16,10},{46,10},{46,23},{41,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(turbine.yGV, turbineGovernor.y) annotation (Line(
          points={{28,-19},{28,0},{80,0},{80,30},{71,30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(inTH.b, reservoir.a1_open) annotation (Line(points={{-90.8,10},{-98,10},{-98,-6},{-95,-6}},
                                                color={0,0,255}));
      connect(downstream.b, river.a1_pipe) annotation (Line(points={{61,-36},{61,-36},{69,-36}},
                                   color={0,0,255}));
      connect(river.a2_open, outTH.b) annotation (Line(points={{91,-24},{95.5,-24},{95.5,-60},{90.9,-60}},
                                  color={0,0,255}));
      connect(turbine.a, penstock.b) annotation (Line(points={{11,-30},{5,-30}}, color={0,0,255}));
      connect(penstock.a, surgeTank.b) annotation (Line(points={{-17,-30},{-18,-30},{-18,-18},{-19,-18}}, color={0,0,255}));
      connect(conduit.b, surgeTank.a) annotation (Line(points={{-45,-18},{-41,-18}}, color={0,0,255}));
    end Model_221879;

    model Model_223024
      extends Modelica.Icons.ReleaseNotes;

      HydroPower.HydroSystems.Pipe conduit(
        horizontalIcon=true,
        L=6600,
        endD={5.8,5.8},
        showDataInIcon=false,
        ZL=564,
        endL={0,0},
        n=4,
        ZR=154.5) annotation (Placement(transformation(extent={{-66,-28},{-46,-8}})));
      HydroPower.HydroSystems.Pipe penstock(
        endD={3,3},
        L=724,
        showDataInIcon=false,
        ZL=541.5,
        ZR=112.5,
        endL={0,0})
        annotation (Placement(transformation(extent={{-16,-40},{4,-20}})));
      HydroPower.HydroSystems.SurgeTank surgeTank(
        D=3.6,
        H2L=0.87,
        Vol=100,
        showDataInIcon=false,
        deltZ=40) annotation (Placement(transformation(extent={{-40,-28},{-20,-8}})));
      HydroPower.SinksAndSources.Fixed_HT inTH(
        depth=60,
        paraOption=false,
        H_const=48 + 564,
        Hmax=564 + 60)
        annotation (Placement(transformation(extent={{-74,2},{-90,18}})));
      HydroPower.HydroSystems.Reservoir reservoir(
        Hmax=564 + 60,
        depth=ones(reservoir.n)*60,
        H_start=48 + 564,
        MidWidth=200,
        SideWidth=100,
        L=100,
        depthIntake={0,0},
        Krough=100,
        pWb=1,
        k=2,
        steadyState=false)
        annotation (Placement(transformation(extent={{-94,-22},{-74,-2}})));
      HydroPower.SinksAndSources.Fixed_HT outTH(
        paraOption=false,
        H_const=115,
        Hmax=130,
        depth=20)
        annotation (Placement(transformation(extent={{72,-52},{90,-68}})));
      HydroPower.HydroSystems.Reservoir river(
        H_start=115,
        MidWidth=200,
        SideWidth=100,
        L=100,
        depthIntake={0,0},
        pWb=1,
        k=2,
        Hmax=130,
        depth=ones(river.n)*20)
               annotation (Placement(transformation(extent={{70,-40},{90,-20}})));
      HydroPower.HydroSystems.Pipe downstream(
        horizontalIcon=true,
        endD={5.8,5.8},
        L=724,
        ZL=110.5,
        showDataInIcon=false,
        ZR=110,
        endL={0,0},
        n=4)    annotation (Placement(transformation(extent={{40,-46},{60,-26}})));
      HydroPower.ElectricalSystems.PowerGrid
                                  powerGrid(
        distTgen={150,1e6,1e6},
        loadDiv={0.5,0.25,0.25},
        loadT={0.5,1,2},
        NoLoadUnits={2000,4000,10000},
        distTload={1e6,1e6,1e6},
        distNoLoad={0,0,0},
        prodDiv={0.45,0.45,0.1},
        prodT={120,15,5},
        ep={0.5,0.08,0.04},
        unitsJ={122000,5.5e6,8000},
        NoGenUnits={90,100,500},
        distNoGen={-16,0,0})    annotation (Placement(transformation(extent={{-20,20},{0,40}},
                          rotation=0)));
      Modelica.Blocks.Sources.Ramp pwr_ref(
        duration=10,
        height=0,
        startTime=1e6,
        offset=15e6)   annotation (Placement(transformation(extent={{20,60},{40,80}},
                      rotation=0)));
      HydroPower.ElectricalSystems.GeneratorAndMCB generator(
        np={12},
        timeMCB_close=ones(generator.n)*150,
        timeMCB_open=ones(generator.n)*250,
        f_start=0,
        J={212500},
        P_nom={103000000})
                      annotation (Placement(transformation(extent={{20,20},{40,40}},
                       rotation=0)));
      HydroPower.ControllersAndSensors.TurbineGovernorAnalog
                                                  turbineGovernor(
        ep=1,
        tRamp=40,
        P_generator_nom=generator.P_nom[1],
        enableRamp=false,
        Kd_noLoad=0.05,
        Kd_load=0.5,
        K_noLoad=0.2,
        K_load=0.4,
        Ki_load=0.1,
        Ki_noLoad=0.025)
                    annotation (Placement(transformation(extent={{50,20},{70,40}},
              rotation=0)));
      HydroPower.MechanicalSystems.BasicTurbine turbine(
        H_nom=460,
        LdraftTube=2.9,
        DavDraftTube=3,
        LscrollCase=15.7,
        DavScrollCasing=1.5,
        np=12,
        tableOnFile=true,
        PUInFlowTables=true,
        QTableName="Qtab",
        T_start(displayUnit="degC"),
        yvLim1=[-0.4,0.05],
        yvLim2=[-0.4,0.05],
        Q_nom=24.3,
        H_start=564 + 48,
        H_start_draftTube=115,
        effMech=1,
        TurbDmp0=0.01,
        TurbineDataFile=Modelica.Utilities.Files.loadResource(HydroPower.TABLE_DIR
             + "TurbineDataFile.mat"),
        P_nom=103000000)
        annotation (Placement(transformation(extent={{12,-40},{32,-20}})));
      inner HydroPower.System_HPL system_HPL(                  constantTemperature=true,
          steadyState=true)
        annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
    equation
      connect(reservoir.a2_pipe, conduit.a) annotation (Line(
          points={{-73,-18},{-67,-18}},
          color={0,0,255},
          smooth=Smooth.None));

      connect(powerGrid.f_grid,generator. f_grid)         annotation (Line(
          points={{1,23},{19,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(powerGrid.J_grid,generator. J_grid)         annotation (Line(
          points={{1,30},{19,30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(powerGrid.P_grid_balance,generator. P_grid_balance)
        annotation (Line(
          points={{1,37},{19,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(pwr_ref.y,turbineGovernor. P_reference) annotation (Line(
          points={{41,70},{54,70},{54,41}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.f_out[1],turbineGovernor. f) annotation (Line(
          points={{41,23},{49,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.onMCB,powerGrid. MCB) annotation (Line(
          points={{30,41},{30,48},{-10,48},{-10,41}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(generator.onMCB[1],turbineGovernor. isMCB) annotation (Line(
          points={{30,41},{30,48},{60,48},{60,41}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(generator.P_out[1],turbineGovernor. P_generator) annotation (Line(
          points={{41,37},{49,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.f_out,powerGrid. f) annotation (Line(
          points={{41,23},{46,23},{46,10},{-36,10},{-36,23},{-21,23}},
          color={0,0,127},
          smooth=Smooth.None));

      connect(turbine.b, downstream.a) annotation (Line(
          points={{33,-30},{36,-30},{36,-36},{39,-36}},
          color={0,0,255},
          smooth=Smooth.None));

      connect(turbine.TurbineData[1], generator.P_turbine[1]) annotation (Line(
          points={{22,-19.6667},{22,-19.6667},{22,19},{24,19}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(turbine.f_generator, generator.f_out[1]) annotation (Line(
          points={{16,-19},{16,10},{46,10},{46,23},{41,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(turbine.yGV, turbineGovernor.y) annotation (Line(
          points={{28,-19},{28,0},{80,0},{80,30},{71,30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(inTH.b, reservoir.a1_open) annotation (Line(points={{-90.8,10},{-98,10},{-98,-6},{-95,-6}},
                                                color={0,0,255}));
      connect(downstream.b, river.a1_pipe) annotation (Line(points={{61,-36},{61,-36},{69,-36}},
                                   color={0,0,255}));
      connect(river.a2_open, outTH.b) annotation (Line(points={{91,-24},{95.5,-24},{95.5,-60},{90.9,-60}},
                                  color={0,0,255}));
      connect(turbine.a, penstock.b) annotation (Line(points={{11,-30},{5,-30}}, color={0,0,255}));
      connect(penstock.a, surgeTank.b) annotation (Line(points={{-17,-30},{-18,-30},{-18,-18},{-19,-18}}, color={0,0,255}));
      connect(conduit.b, surgeTank.a) annotation (Line(points={{-45,-18},{-41,-18}}, color={0,0,255}));
    end Model_223024;

    model Model_228755
      extends Modelica.Icons.ReleaseNotes;

      HydroPower.HydroSystems.Pipe conduit(
        horizontalIcon=true,
        L=6600,
        endD={5.8,5.8},
        showDataInIcon=false,
        ZL=564,
        endL={0,0},
        n=4,
        ZR=541.5) annotation (Placement(transformation(extent={{-66,-28},{-46,-8}})));
      HydroPower.HydroSystems.Pipe penstock(
        endD={3,3},
        L=724,
        showDataInIcon=false,
        ZL=541.5,
        ZR=112.5,
        endL={0,0})
        annotation (Placement(transformation(extent={{-16,-40},{4,-20}})));
      HydroPower.HydroSystems.SurgeTank surgeTank(
        D=3.6,
        H2L=0.87,
        Vol=100,
        showDataInIcon=false,
        deltZ=40) annotation (Placement(transformation(extent={{-40,-28},{-20,-8}})));
      HydroPower.SinksAndSources.Fixed_HT inTH(
        depth=60,
        paraOption=false,
        H_const=48 + 564,
        Hmax=564 + 60)
        annotation (Placement(transformation(extent={{-74,2},{-90,18}})));
      HydroPower.HydroSystems.Reservoir reservoir(
        Hmax=564 + 60,
        depth=ones(reservoir.n)*60,
        H_start=48 + 564,
        MidWidth=200,
        SideWidth=100,
        L=100,
        depthIntake={0,0},
        Krough=100,
        pWb=1,
        k=2,
        steadyState=false)
        annotation (Placement(transformation(extent={{-94,-22},{-74,-2}})));
      HydroPower.SinksAndSources.Fixed_HT outTH(
        paraOption=false,
        H_const=115,
        Hmax=130,
        depth=20)
        annotation (Placement(transformation(extent={{72,-52},{90,-68}})));
      HydroPower.HydroSystems.Reservoir river(
        H_start=115,
        MidWidth=200,
        SideWidth=100,
        L=100,
        depthIntake={0,0},
        pWb=1,
        k=2,
        Hmax=130,
        depth=ones(river.n)*20)
               annotation (Placement(transformation(extent={{70,-40},{90,-20}})));
      HydroPower.HydroSystems.Pipe downstream(
        horizontalIcon=true,
        endD={5.8,5.8},
        L=724,
        showDataInIcon=false,
        endL={0,0},
        n=4,
        ZL=15,
        ZR=241.5)
                annotation (Placement(transformation(extent={{40,-46},{60,-26}})));
      HydroPower.ElectricalSystems.PowerGrid
                                  powerGrid(
        distTgen={150,1e6,1e6},
        loadDiv={0.5,0.25,0.25},
        loadT={0.5,1,2},
        NoLoadUnits={2000,4000,10000},
        distTload={1e6,1e6,1e6},
        distNoLoad={0,0,0},
        prodDiv={0.45,0.45,0.1},
        prodT={120,15,5},
        ep={0.5,0.08,0.04},
        unitsJ={122000,5.5e6,8000},
        NoGenUnits={180,100,500},
        distNoGen={-27,0,0})    annotation (Placement(transformation(extent={{-20,20},{0,40}},
                          rotation=0)));
      Modelica.Blocks.Sources.Ramp pwr_ref(
        duration=10,
        height=0,
        startTime=1e6,
        offset=22.5e6) annotation (Placement(transformation(extent={{20,60},{40,80}},
                      rotation=0)));
      HydroPower.ElectricalSystems.GeneratorAndMCB generator(
        np={12},
        timeMCB_close=ones(generator.n)*150,
        timeMCB_open=ones(generator.n)*250,
        f_start=0,
        J={212500},
        P_nom={103000000})
                      annotation (Placement(transformation(extent={{20,20},{40,40}},
                       rotation=0)));
      HydroPower.ControllersAndSensors.TurbineGovernorAnalog
                                                  turbineGovernor(
        ep=1,
        tRamp=40,
        P_generator_nom=generator.P_nom[1],
        enableRamp=false,
        Kd_noLoad=0.05,
        Kd_load=0.5,
        K_noLoad=0.2,
        K_load=0.4,
        Ki_load=0.1,
        Ki_noLoad=0.025)
                    annotation (Placement(transformation(extent={{50,20},{70,40}},
              rotation=0)));
      HydroPower.MechanicalSystems.BasicTurbine turbine(
        H_nom=460,
        LdraftTube=2.9,
        DavDraftTube=3,
        LscrollCase=15.7,
        DavScrollCasing=1.5,
        np=12,
        tableOnFile=true,
        PUInFlowTables=true,
        QTableName="Qtab",
        T_start(displayUnit="degC"),
        yvLim1=[-0.4,0.05],
        yvLim2=[-0.4,0.05],
        Q_nom=24.3,
        H_start=564 + 48,
        H_start_draftTube=115,
        effMech=1,
        TurbDmp0=0.01,
        TurbineDataFile=Modelica.Utilities.Files.loadResource(HydroPower.TABLE_DIR
             + "TurbineDataFile.mat"),
        P_nom=103000000)
        annotation (Placement(transformation(extent={{12,-40},{32,-20}})));
      inner HydroPower.System_HPL system_HPL(                  constantTemperature=true,
          steadyState=true)
        annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
    equation
      connect(reservoir.a2_pipe, conduit.a) annotation (Line(
          points={{-73,-18},{-67,-18}},
          color={0,0,255},
          smooth=Smooth.None));

      connect(powerGrid.f_grid,generator. f_grid)         annotation (Line(
          points={{1,23},{19,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(powerGrid.J_grid,generator. J_grid)         annotation (Line(
          points={{1,30},{19,30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(powerGrid.P_grid_balance,generator. P_grid_balance)
        annotation (Line(
          points={{1,37},{19,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(pwr_ref.y,turbineGovernor. P_reference) annotation (Line(
          points={{41,70},{54,70},{54,41}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.f_out[1],turbineGovernor. f) annotation (Line(
          points={{41,23},{49,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.onMCB,powerGrid. MCB) annotation (Line(
          points={{30,41},{30,48},{-10,48},{-10,41}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(generator.onMCB[1],turbineGovernor. isMCB) annotation (Line(
          points={{30,41},{30,48},{60,48},{60,41}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(generator.P_out[1],turbineGovernor. P_generator) annotation (Line(
          points={{41,37},{49,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.f_out,powerGrid. f) annotation (Line(
          points={{41,23},{46,23},{46,10},{-36,10},{-36,23},{-21,23}},
          color={0,0,127},
          smooth=Smooth.None));

      connect(turbine.b, downstream.a) annotation (Line(
          points={{33,-30},{36,-30},{36,-36},{39,-36}},
          color={0,0,255},
          smooth=Smooth.None));

      connect(turbine.TurbineData[1], generator.P_turbine[1]) annotation (Line(
          points={{22,-19.6667},{22,-19.6667},{22,19},{24,19}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(turbine.f_generator, generator.f_out[1]) annotation (Line(
          points={{16,-19},{16,10},{46,10},{46,23},{41,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(turbine.yGV, turbineGovernor.y) annotation (Line(
          points={{28,-19},{28,0},{80,0},{80,30},{71,30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(inTH.b, reservoir.a1_open) annotation (Line(points={{-90.8,10},{-98,10},{-98,-6},{-95,-6}},
                                                color={0,0,255}));
      connect(downstream.b, river.a1_pipe) annotation (Line(points={{61,-36},{61,-36},{69,-36}},
                                   color={0,0,255}));
      connect(river.a2_open, outTH.b) annotation (Line(points={{91,-24},{95.5,-24},{95.5,-60},{90.9,-60}},
                                  color={0,0,255}));
      connect(turbine.a, penstock.b) annotation (Line(points={{11,-30},{5,-30}}, color={0,0,255}));
      connect(penstock.a, surgeTank.b) annotation (Line(points={{-17,-30},{-18,-30},{-18,-18},{-19,-18}}, color={0,0,255}));
      connect(conduit.b, surgeTank.a) annotation (Line(points={{-45,-18},{-41,-18}}, color={0,0,255}));
    end Model_228755;

    model Model_229001
      extends Modelica.Icons.ReleaseNotes;

      HydroPower.HydroSystems.Pipe conduit(
        horizontalIcon=true,
        L=6600,
        endD={5.8,5.8},
        showDataInIcon=false,
        ZL=564,
        endL={0,0},
        n=4,
        ZR=541.5) annotation (Placement(transformation(extent={{-66,-28},{-46,-8}})));
      HydroPower.HydroSystems.Pipe penstock(
        endD={3,3},
        L=724,
        showDataInIcon=false,
        ZL=541.5,
        ZR=112.5,
        endL={0,0})
        annotation (Placement(transformation(extent={{-16,-40},{4,-20}})));
      HydroPower.HydroSystems.SurgeTank surgeTank(
        D=3.6,
        H2L=0.87,
        Vol=100,
        showDataInIcon=false,
        deltZ=40) annotation (Placement(transformation(extent={{-40,-28},{-20,-8}})));
      HydroPower.SinksAndSources.Fixed_HT inTH(
        depth=60,
        paraOption=false,
        H_const=48 + 564,
        Hmax=564 + 60)
        annotation (Placement(transformation(extent={{-74,2},{-90,18}})));
      HydroPower.HydroSystems.Reservoir reservoir(
        Hmax=564 + 60,
        depth=ones(reservoir.n)*60,
        H_start=48 + 564,
        MidWidth=200,
        SideWidth=100,
        L=100,
        depthIntake={0,0},
        Krough=100,
        pWb=1,
        k=2,
        steadyState=false)
        annotation (Placement(transformation(extent={{-94,-22},{-74,-2}})));
      HydroPower.SinksAndSources.Fixed_HT outTH(
        paraOption=false,
        H_const=115,
        Hmax=130,
        depth=20)
        annotation (Placement(transformation(extent={{72,-52},{90,-68}})));
      HydroPower.HydroSystems.Reservoir river(
        H_start=115,
        MidWidth=200,
        SideWidth=100,
        L=100,
        depthIntake={0,0},
        pWb=1,
        k=2,
        Hmax=130,
        depth=ones(river.n)*20)
               annotation (Placement(transformation(extent={{70,-40},{90,-20}})));
      HydroPower.HydroSystems.Pipe downstream(
        horizontalIcon=true,
        endD={5.8,5.8},
        L=724,
        showDataInIcon=false,
        endL={0,0},
        n=4,
        ZL=315,
        ZR=541.5)
                annotation (Placement(transformation(extent={{40,-46},{60,-26}})));
      HydroPower.ElectricalSystems.PowerGrid
                                  powerGrid(
        distTgen={150,1e6,1e6},
        loadDiv={0.5,0.25,0.25},
        loadT={0.5,1,2},
        NoLoadUnits={2000,4000,10000},
        distTload={1e6,1e6,1e6},
        distNoLoad={0,0,0},
        prodDiv={0.45,0.45,0.1},
        prodT={120,15,5},
        ep={0.5,0.08,0.04},
        unitsJ={122000,5.5e6,8000},
        NoGenUnits={90,100,500},
        distNoGen={-3,0,0})     annotation (Placement(transformation(extent={{-20,20},{0,40}},
                          rotation=0)));
      Modelica.Blocks.Sources.Ramp pwr_ref(
        duration=10,
        height=0,
        startTime=1e6,
        offset=80e6)   annotation (Placement(transformation(extent={{20,60},{40,80}},
                      rotation=0)));
      HydroPower.ElectricalSystems.GeneratorAndMCB generator(
        np={12},
        timeMCB_close=ones(generator.n)*150,
        timeMCB_open=ones(generator.n)*250,
        f_start=0,
        J={212500},
        P_nom={103000000})
                      annotation (Placement(transformation(extent={{20,20},{40,40}},
                       rotation=0)));
      HydroPower.ControllersAndSensors.TurbineGovernorAnalog
                                                  turbineGovernor(
        ep=1,
        tRamp=40,
        P_generator_nom=generator.P_nom[1],
        enableRamp=false,
        Kd_noLoad=0.05,
        Kd_load=0.5,
        K_noLoad=0.2,
        K_load=0.4,
        Ki_load=0.1,
        Ki_noLoad=0.025)
                    annotation (Placement(transformation(extent={{50,20},{70,40}},
              rotation=0)));
      HydroPower.MechanicalSystems.BasicTurbine turbine(
        H_nom=460,
        LdraftTube=2.9,
        DavDraftTube=3,
        LscrollCase=15.7,
        DavScrollCasing=1.5,
        np=12,
        tableOnFile=true,
        PUInFlowTables=true,
        QTableName="Qtab",
        T_start(displayUnit="degC"),
        yvLim1=[-0.4,0.05],
        yvLim2=[-0.4,0.05],
        Q_nom=24.3,
        H_start=564 + 48,
        H_start_draftTube=115,
        effMech=1,
        TurbDmp0=0.01,
        TurbineDataFile=Modelica.Utilities.Files.loadResource(HydroPower.TABLE_DIR
             + "TurbineDataFile.mat"),
        P_nom=103000000)
        annotation (Placement(transformation(extent={{12,-40},{32,-20}})));
      inner HydroPower.System_HPL system_HPL(                  constantTemperature=true,
          steadyState=true)
        annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
    equation
      connect(reservoir.a2_pipe, conduit.a) annotation (Line(
          points={{-73,-18},{-67,-18}},
          color={0,0,255},
          smooth=Smooth.None));

      connect(powerGrid.f_grid,generator. f_grid)         annotation (Line(
          points={{1,23},{19,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(powerGrid.J_grid,generator. J_grid)         annotation (Line(
          points={{1,30},{19,30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(powerGrid.P_grid_balance,generator. P_grid_balance)
        annotation (Line(
          points={{1,37},{19,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(pwr_ref.y,turbineGovernor. P_reference) annotation (Line(
          points={{41,70},{54,70},{54,41}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.f_out[1],turbineGovernor. f) annotation (Line(
          points={{41,23},{49,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.onMCB,powerGrid. MCB) annotation (Line(
          points={{30,41},{30,48},{-10,48},{-10,41}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(generator.onMCB[1],turbineGovernor. isMCB) annotation (Line(
          points={{30,41},{30,48},{60,48},{60,41}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(generator.P_out[1],turbineGovernor. P_generator) annotation (Line(
          points={{41,37},{49,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.f_out,powerGrid. f) annotation (Line(
          points={{41,23},{46,23},{46,10},{-36,10},{-36,23},{-21,23}},
          color={0,0,127},
          smooth=Smooth.None));

      connect(turbine.b, downstream.a) annotation (Line(
          points={{33,-30},{36,-30},{36,-36},{39,-36}},
          color={0,0,255},
          smooth=Smooth.None));

      connect(turbine.TurbineData[1], generator.P_turbine[1]) annotation (Line(
          points={{22,-19.6667},{22,-19.6667},{22,19},{24,19}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(turbine.f_generator, generator.f_out[1]) annotation (Line(
          points={{16,-19},{16,10},{46,10},{46,23},{41,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(turbine.yGV, turbineGovernor.y) annotation (Line(
          points={{28,-19},{28,0},{80,0},{80,30},{71,30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(inTH.b, reservoir.a1_open) annotation (Line(points={{-90.8,10},{-98,10},{-98,-6},{-95,-6}},
                                                color={0,0,255}));
      connect(downstream.b, river.a1_pipe) annotation (Line(points={{61,-36},{61,-36},{69,-36}},
                                   color={0,0,255}));
      connect(river.a2_open, outTH.b) annotation (Line(points={{91,-24},{95.5,-24},{95.5,-60},{90.9,-60}},
                                  color={0,0,255}));
      connect(turbine.a, penstock.b) annotation (Line(points={{11,-30},{5,-30}}, color={0,0,255}));
      connect(penstock.a, surgeTank.b) annotation (Line(points={{-17,-30},{-18,-30},{-18,-18},{-19,-18}}, color={0,0,255}));
      connect(conduit.b, surgeTank.a) annotation (Line(points={{-45,-18},{-41,-18}}, color={0,0,255}));
    end Model_229001;

    model Model_229040
      extends Modelica.Icons.ReleaseNotes;

      HydroPower.HydroSystems.Pipe conduit(
        horizontalIcon=true,
        L=6600,
        endD={5.8,5.8},
        showDataInIcon=false,
        ZL=564,
        endL={0,0},
        n=4,
        ZR=541.5) annotation (Placement(transformation(extent={{-66,-28},{-46,-8}})));
      HydroPower.HydroSystems.Pipe penstock(
        endD={3,3},
        L=724,
        showDataInIcon=false,
        ZL=541.5,
        ZR=112.5,
        endL={0,0})
        annotation (Placement(transformation(extent={{-16,-40},{4,-20}})));
      HydroPower.HydroSystems.SurgeTank surgeTank(
        D=3.6,
        H2L=0.87,
        Vol=100,
        showDataInIcon=false,
        deltZ=40) annotation (Placement(transformation(extent={{-40,-28},{-20,-8}})));
      HydroPower.SinksAndSources.Fixed_HT inTH(
        depth=60,
        paraOption=false,
        H_const=48 + 564,
        Hmax=564 + 60)
        annotation (Placement(transformation(extent={{-74,2},{-90,18}})));
      HydroPower.HydroSystems.Reservoir reservoir(
        Hmax=564 + 60,
        depth=ones(reservoir.n)*60,
        H_start=48 + 564,
        MidWidth=200,
        SideWidth=100,
        L=100,
        depthIntake={0,0},
        Krough=100,
        pWb=1,
        k=2,
        steadyState=false)
        annotation (Placement(transformation(extent={{-94,-22},{-74,-2}})));
      HydroPower.SinksAndSources.Fixed_HT outTH(
        paraOption=false,
        H_const=115,
        Hmax=130,
        depth=20)
        annotation (Placement(transformation(extent={{72,-52},{90,-68}})));
      HydroPower.HydroSystems.Reservoir river(
        H_start=115,
        MidWidth=200,
        SideWidth=100,
        L=100,
        depthIntake={0,0},
        pWb=1,
        k=2,
        Hmax=130,
        depth=ones(river.n)*20)
               annotation (Placement(transformation(extent={{70,-40},{90,-20}})));
      HydroPower.HydroSystems.Pipe downstream(
        horizontalIcon=true,
        endD={5.8,5.8},
        L=724,
        showDataInIcon=false,
        endL={0,0},
        n=4,
        ZL=115,
        ZR=641.5)
                annotation (Placement(transformation(extent={{40,-46},{60,-26}})));
      HydroPower.ElectricalSystems.PowerGrid
                                  powerGrid(
        distTgen={150,1e6,1e6},
        loadDiv={0.5,0.25,0.25},
        loadT={0.5,1,2},
        NoLoadUnits={2000,4000,10000},
        distTload={1e6,1e6,1e6},
        distNoLoad={0,0,0},
        prodDiv={0.45,0.45,0.1},
        prodT={120,15,5},
        ep={0.5,0.08,0.04},
        unitsJ={122000,5.5e6,8000},
        NoGenUnits={90,100,500},
        distNoGen={-1,0,0})     annotation (Placement(transformation(extent={{-20,20},{0,40}},
                          rotation=0)));
      Modelica.Blocks.Sources.Ramp pwr_ref(
        duration=10,
        height=0,
        startTime=1e6,
        offset=90e6)   annotation (Placement(transformation(extent={{20,60},{40,80}},
                      rotation=0)));
      HydroPower.ElectricalSystems.GeneratorAndMCB generator(
        np={12},
        timeMCB_close=ones(generator.n)*150,
        timeMCB_open=ones(generator.n)*250,
        f_start=0,
        J={212500},
        P_nom={103000000})
                      annotation (Placement(transformation(extent={{20,20},{40,40}},
                       rotation=0)));
      HydroPower.ControllersAndSensors.TurbineGovernorAnalog
                                                  turbineGovernor(
        ep=1,
        tRamp=40,
        P_generator_nom=generator.P_nom[1],
        enableRamp=false,
        Kd_noLoad=0.05,
        Kd_load=0.5,
        K_noLoad=0.2,
        K_load=0.4,
        Ki_load=0.1,
        Ki_noLoad=0.025)
                    annotation (Placement(transformation(extent={{50,20},{70,40}},
              rotation=0)));
      HydroPower.MechanicalSystems.BasicTurbine turbine(
        H_nom=460,
        LdraftTube=2.9,
        DavDraftTube=3,
        LscrollCase=15.7,
        DavScrollCasing=1.5,
        np=12,
        tableOnFile=true,
        PUInFlowTables=true,
        QTableName="Qtab",
        T_start(displayUnit="degC"),
        yvLim1=[-0.4,0.05],
        yvLim2=[-0.4,0.05],
        Q_nom=24.3,
        H_start=564 + 48,
        H_start_draftTube=115,
        effMech=1,
        TurbDmp0=0.01,
        TurbineDataFile=Modelica.Utilities.Files.loadResource(HydroPower.TABLE_DIR
             + "TurbineDataFile.mat"),
        P_nom=103000000)
        annotation (Placement(transformation(extent={{12,-40},{32,-20}})));
      inner HydroPower.System_HPL system_HPL(                  constantTemperature=true,
          steadyState=true)
        annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
    equation
      connect(reservoir.a2_pipe, conduit.a) annotation (Line(
          points={{-73,-18},{-67,-18}},
          color={0,0,255},
          smooth=Smooth.None));

      connect(powerGrid.f_grid,generator. f_grid)         annotation (Line(
          points={{1,23},{19,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(powerGrid.J_grid,generator. J_grid)         annotation (Line(
          points={{1,30},{19,30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(powerGrid.P_grid_balance,generator. P_grid_balance)
        annotation (Line(
          points={{1,37},{19,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(pwr_ref.y,turbineGovernor. P_reference) annotation (Line(
          points={{41,70},{54,70},{54,41}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.f_out[1],turbineGovernor. f) annotation (Line(
          points={{41,23},{49,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.onMCB,powerGrid. MCB) annotation (Line(
          points={{30,41},{30,48},{-10,48},{-10,41}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(generator.onMCB[1],turbineGovernor. isMCB) annotation (Line(
          points={{30,41},{30,48},{60,48},{60,41}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(generator.P_out[1],turbineGovernor. P_generator) annotation (Line(
          points={{41,37},{49,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.f_out,powerGrid. f) annotation (Line(
          points={{41,23},{46,23},{46,10},{-36,10},{-36,23},{-21,23}},
          color={0,0,127},
          smooth=Smooth.None));

      connect(turbine.b, downstream.a) annotation (Line(
          points={{33,-30},{36,-30},{36,-36},{39,-36}},
          color={0,0,255},
          smooth=Smooth.None));

      connect(turbine.TurbineData[1], generator.P_turbine[1]) annotation (Line(
          points={{22,-19.6667},{22,19}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(turbine.f_generator, generator.f_out[1]) annotation (Line(
          points={{16,-19},{16,10},{46,10},{46,23},{41,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(turbine.yGV, turbineGovernor.y) annotation (Line(
          points={{28,-19},{28,0},{80,0},{80,30},{71,30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(inTH.b, reservoir.a1_open) annotation (Line(points={{-90.8,10},{-98,10},{-98,-6},{-95,-6}},
                                                color={0,0,255}));
      connect(downstream.b, river.a1_pipe) annotation (Line(points={{61,-36},{61,-36},{69,-36}},
                                   color={0,0,255}));
      connect(river.a2_open, outTH.b) annotation (Line(points={{91,-24},{95.5,-24},{95.5,-60},{90.9,-60}},
                                  color={0,0,255}));
      connect(turbine.a, penstock.b) annotation (Line(points={{11,-30},{5,-30}}, color={0,0,255}));
      connect(penstock.a, surgeTank.b) annotation (Line(points={{-17,-30},{-18,-30},{-18,-18},{-19,-18}}, color={0,0,255}));
      connect(conduit.b, surgeTank.a) annotation (Line(points={{-45,-18},{-41,-18}}, color={0,0,255}));
    end Model_229040;

    model Model_229704
      extends Modelica.Icons.ReleaseNotes;

      HydroPower.HydroSystems.Pipe conduit(
        horizontalIcon=true,
        L=6600,
        endD={5.8,5.8},
        showDataInIcon=false,
        ZL=564,
        endL={0,0},
        n=4,
        ZR=641.5) annotation (Placement(transformation(extent={{-66,-28},{-46,-8}})));
      HydroPower.HydroSystems.Pipe penstock(
        endD={3,3},
        L=724,
        showDataInIcon=false,
        ZL=541.5,
        ZR=112.5,
        endL={0,0})
        annotation (Placement(transformation(extent={{-16,-40},{4,-20}})));
      HydroPower.HydroSystems.SurgeTank surgeTank(
        D=3.6,
        H2L=0.87,
        Vol=100,
        showDataInIcon=false,
        deltZ=40) annotation (Placement(transformation(extent={{-40,-28},{-20,-8}})));
      HydroPower.SinksAndSources.Fixed_HT inTH(
        depth=60,
        paraOption=false,
        H_const=48 + 564,
        Hmax=564 + 60)
        annotation (Placement(transformation(extent={{-74,2},{-90,18}})));
      HydroPower.HydroSystems.Reservoir reservoir(
        Hmax=564 + 60,
        depth=ones(reservoir.n)*60,
        H_start=48 + 564,
        MidWidth=200,
        SideWidth=100,
        L=100,
        depthIntake={0,0},
        Krough=100,
        pWb=1,
        k=2,
        steadyState=false)
        annotation (Placement(transformation(extent={{-94,-22},{-74,-2}})));
      HydroPower.SinksAndSources.Fixed_HT outTH(
        paraOption=false,
        H_const=115,
        Hmax=130,
        depth=20)
        annotation (Placement(transformation(extent={{72,-52},{90,-68}})));
      HydroPower.HydroSystems.Reservoir river(
        H_start=115,
        MidWidth=200,
        SideWidth=100,
        L=100,
        depthIntake={0,0},
        pWb=1,
        k=2,
        Hmax=130,
        depth=ones(river.n)*20)
               annotation (Placement(transformation(extent={{70,-40},{90,-20}})));
      HydroPower.HydroSystems.Pipe downstream(
        horizontalIcon=true,
        endD={5.8,5.8},
        L=724,
        ZL=110.5,
        showDataInIcon=false,
        ZR=110,
        endL={0,0},
        n=4)    annotation (Placement(transformation(extent={{40,-46},{60,-26}})));
      HydroPower.ElectricalSystems.PowerGrid
                                  powerGrid(
        distTgen={150,1e6,1e6},
        loadDiv={0.5,0.25,0.25},
        loadT={0.5,1,2},
        NoLoadUnits={2000,4000,10000},
        distTload={1e6,1e6,1e6},
        distNoLoad={0,0,0},
        prodDiv={0.45,0.45,0.1},
        prodT={120,15,5},
        ep={0.5,0.08,0.04},
        unitsJ={122000,5.5e6,8000},
        NoGenUnits={90,100,500},
        distNoGen={-18,0,0})    annotation (Placement(transformation(extent={{-20,20},{0,40}},
                          rotation=0)));
      Modelica.Blocks.Sources.Ramp pwr_ref(
        duration=10,
        height=0,
        startTime=1e6,
        offset=5e6)    annotation (Placement(transformation(extent={{20,60},{40,80}},
                      rotation=0)));
      HydroPower.ElectricalSystems.GeneratorAndMCB generator(
        np={12},
        timeMCB_close=ones(generator.n)*150,
        timeMCB_open=ones(generator.n)*250,
        f_start=0,
        J={212500},
        P_nom={103000000})
                      annotation (Placement(transformation(extent={{20,20},{40,40}},
                       rotation=0)));
      HydroPower.ControllersAndSensors.TurbineGovernorAnalog
                                                  turbineGovernor(
        ep=1,
        tRamp=40,
        P_generator_nom=generator.P_nom[1],
        enableRamp=false,
        Kd_noLoad=0.05,
        Kd_load=0.5,
        K_noLoad=0.2,
        K_load=0.4,
        Ki_load=0.1,
        Ki_noLoad=0.025)
                    annotation (Placement(transformation(extent={{50,20},{70,40}},
              rotation=0)));
      HydroPower.MechanicalSystems.BasicTurbine turbine(
        H_nom=460,
        LdraftTube=2.9,
        DavDraftTube=3,
        LscrollCase=15.7,
        DavScrollCasing=1.5,
        np=12,
        tableOnFile=true,
        PUInFlowTables=true,
        QTableName="Qtab",
        T_start(displayUnit="degC"),
        yvLim1=[-0.4,0.05],
        yvLim2=[-0.4,0.05],
        Q_nom=24.3,
        H_start=564 + 48,
        H_start_draftTube=115,
        effMech=1,
        TurbDmp0=0.01,
        TurbineDataFile=Modelica.Utilities.Files.loadResource(HydroPower.TABLE_DIR
             + "TurbineDataFile.mat"),
        P_nom=103000000)
        annotation (Placement(transformation(extent={{12,-40},{32,-20}})));
      inner HydroPower.System_HPL system_HPL(                  constantTemperature=true,
          steadyState=true)
        annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
    equation
      connect(reservoir.a2_pipe, conduit.a) annotation (Line(
          points={{-73,-18},{-67,-18}},
          color={0,0,255},
          smooth=Smooth.None));

      connect(powerGrid.f_grid,generator. f_grid)         annotation (Line(
          points={{1,23},{19,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(powerGrid.J_grid,generator. J_grid)         annotation (Line(
          points={{1,30},{19,30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(powerGrid.P_grid_balance,generator. P_grid_balance)
        annotation (Line(
          points={{1,37},{19,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(pwr_ref.y,turbineGovernor. P_reference) annotation (Line(
          points={{41,70},{54,70},{54,41}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.f_out[1],turbineGovernor. f) annotation (Line(
          points={{41,23},{49,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.onMCB,powerGrid. MCB) annotation (Line(
          points={{30,41},{30,48},{-10,48},{-10,41}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(generator.onMCB[1],turbineGovernor. isMCB) annotation (Line(
          points={{30,41},{30,48},{60,48},{60,41}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(generator.P_out[1],turbineGovernor. P_generator) annotation (Line(
          points={{41,37},{49,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.f_out,powerGrid. f) annotation (Line(
          points={{41,23},{46,23},{46,10},{-36,10},{-36,23},{-21,23}},
          color={0,0,127},
          smooth=Smooth.None));

      connect(turbine.b, downstream.a) annotation (Line(
          points={{33,-30},{36,-30},{36,-36},{39,-36}},
          color={0,0,255},
          smooth=Smooth.None));

      connect(turbine.TurbineData[1], generator.P_turbine[1]) annotation (Line(
          points={{22,-19.6667},{22,19}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(turbine.f_generator, generator.f_out[1]) annotation (Line(
          points={{16,-19},{16,10},{46,10},{46,23},{41,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(turbine.yGV, turbineGovernor.y) annotation (Line(
          points={{28,-19},{28,0},{80,0},{80,30},{71,30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(inTH.b, reservoir.a1_open) annotation (Line(points={{-90.8,10},{-98,10},{-98,-6},{-95,-6}},
                                                color={0,0,255}));
      connect(downstream.b, river.a1_pipe) annotation (Line(points={{61,-36},{61,-36},{69,-36}},
                                   color={0,0,255}));
      connect(river.a2_open, outTH.b) annotation (Line(points={{91,-24},{95.5,-24},{95.5,-60},{90.9,-60}},
                                  color={0,0,255}));
      connect(turbine.a, penstock.b) annotation (Line(points={{11,-30},{5,-30}}, color={0,0,255}));
      connect(penstock.a, surgeTank.b) annotation (Line(points={{-17,-30},{-18,-30},{-18,-18},{-19,-18}}, color={0,0,255}));
      connect(conduit.b, surgeTank.a) annotation (Line(points={{-45,-18},{-41,-18}}, color={0,0,255}));
    end Model_229704;

    model Model_230312
      extends Modelica.Icons.ReleaseNotes;

      HydroPower.HydroSystems.Pipe conduit(
        horizontalIcon=true,
        L=6600,
        endD={5.8,5.8},
        showDataInIcon=false,
        ZL=564,
        endL={0,0},
        n=4,
        ZR=541.5) annotation (Placement(transformation(extent={{-66,-28},{-46,-8}})));
      HydroPower.HydroSystems.Pipe penstock(
        endD={3,3},
        L=724,
        showDataInIcon=false,
        ZL=541.5,
        ZR=112.5,
        endL={0,0})
        annotation (Placement(transformation(extent={{-16,-40},{4,-20}})));
      HydroPower.HydroSystems.SurgeTank surgeTank(
        D=3.6,
        H2L=0.87,
        Vol=100,
        showDataInIcon=false,
        deltZ=40) annotation (Placement(transformation(extent={{-40,-28},{-20,-8}})));
      HydroPower.SinksAndSources.Fixed_HT inTH(
        depth=60,
        paraOption=false,
        H_const=48 + 564,
        Hmax=564 + 60)
        annotation (Placement(transformation(extent={{-74,2},{-90,18}})));
      HydroPower.HydroSystems.Reservoir reservoir(
        Hmax=564 + 60,
        depth=ones(reservoir.n)*60,
        H_start=48 + 564,
        MidWidth=200,
        SideWidth=100,
        L=100,
        depthIntake={0,0},
        Krough=100,
        pWb=1,
        k=2,
        steadyState=false)
        annotation (Placement(transformation(extent={{-94,-22},{-74,-2}})));
      HydroPower.SinksAndSources.Fixed_HT outTH(
        paraOption=false,
        H_const=115,
        Hmax=130,
        depth=20)
        annotation (Placement(transformation(extent={{72,-52},{90,-68}})));
      HydroPower.HydroSystems.Reservoir river(
        H_start=115,
        MidWidth=200,
        SideWidth=100,
        L=100,
        depthIntake={0,0},
        pWb=1,
        k=2,
        Hmax=130,
        depth=ones(river.n)*20)
               annotation (Placement(transformation(extent={{70,-40},{90,-20}})));
      HydroPower.HydroSystems.Pipe downstream(
        horizontalIcon=true,
        endD={5.8,5.8},
        L=724,
        showDataInIcon=false,
        endL={0,0},
        n=4,
        ZL=215,
        ZR=541.5)
                annotation (Placement(transformation(extent={{40,-46},{60,-26}})));
      HydroPower.ElectricalSystems.PowerGrid
                                  powerGrid(
        distTgen={150,1e6,1e6},
        loadDiv={0.5,0.25,0.25},
        loadT={0.5,1,2},
        NoLoadUnits={2000,4000,10000},
        distTload={1e6,1e6,1e6},
        distNoLoad={0,0,0},
        prodDiv={0.45,0.45,0.1},
        prodT={120,15,5},
        ep={0.5,0.08,0.04},
        unitsJ={122000,5.5e6,8000},
        NoGenUnits={90,100,500},
        distNoGen={-4,0,0})     annotation (Placement(transformation(extent={{-20,20},{0,40}},
                          rotation=0)));
      Modelica.Blocks.Sources.Ramp pwr_ref(
        duration=10,
        height=0,
        startTime=1e6,
        offset=70e6)   annotation (Placement(transformation(extent={{20,60},{40,80}},
                      rotation=0)));
      HydroPower.ElectricalSystems.GeneratorAndMCB generator(
        np={12},
        timeMCB_close=ones(generator.n)*150,
        timeMCB_open=ones(generator.n)*250,
        f_start=0,
        J={212500},
        P_nom={103000000})
                      annotation (Placement(transformation(extent={{20,20},{40,40}},
                       rotation=0)));
      HydroPower.ControllersAndSensors.TurbineGovernorAnalog
                                                  turbineGovernor(
        ep=1,
        tRamp=40,
        P_generator_nom=generator.P_nom[1],
        enableRamp=false,
        Kd_noLoad=0.05,
        Kd_load=0.5,
        K_noLoad=0.2,
        K_load=0.4,
        Ki_load=0.1,
        Ki_noLoad=0.025)
                    annotation (Placement(transformation(extent={{50,20},{70,40}},
              rotation=0)));
      HydroPower.MechanicalSystems.BasicTurbine turbine(
        H_nom=460,
        LdraftTube=2.9,
        DavDraftTube=3,
        LscrollCase=15.7,
        DavScrollCasing=1.5,
        np=12,
        tableOnFile=true,
        PUInFlowTables=true,
        QTableName="Qtab",
        T_start(displayUnit="degC"),
        yvLim1=[-0.4,0.05],
        yvLim2=[-0.4,0.05],
        Q_nom=24.3,
        H_start=564 + 48,
        H_start_draftTube=115,
        effMech=1,
        TurbDmp0=0.01,
        TurbineDataFile=Modelica.Utilities.Files.loadResource(HydroPower.TABLE_DIR
             + "TurbineDataFile.mat"),
        P_nom=103000000)
        annotation (Placement(transformation(extent={{12,-40},{32,-20}})));
      inner HydroPower.System_HPL system_HPL(                  constantTemperature=true,
          steadyState=true)
        annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
    equation
      connect(reservoir.a2_pipe, conduit.a) annotation (Line(
          points={{-73,-18},{-67,-18}},
          color={0,0,255},
          smooth=Smooth.None));

      connect(powerGrid.f_grid,generator. f_grid)         annotation (Line(
          points={{1,23},{19,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(powerGrid.J_grid,generator. J_grid)         annotation (Line(
          points={{1,30},{19,30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(powerGrid.P_grid_balance,generator. P_grid_balance)
        annotation (Line(
          points={{1,37},{19,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(pwr_ref.y,turbineGovernor. P_reference) annotation (Line(
          points={{41,70},{54,70},{54,41}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.f_out[1],turbineGovernor. f) annotation (Line(
          points={{41,23},{49,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.onMCB,powerGrid. MCB) annotation (Line(
          points={{30,41},{30,48},{-10,48},{-10,41}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(generator.onMCB[1],turbineGovernor. isMCB) annotation (Line(
          points={{30,41},{30,48},{60,48},{60,41}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(generator.P_out[1],turbineGovernor. P_generator) annotation (Line(
          points={{41,37},{49,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.f_out,powerGrid. f) annotation (Line(
          points={{41,23},{46,23},{46,10},{-36,10},{-36,23},{-21,23}},
          color={0,0,127},
          smooth=Smooth.None));

      connect(turbine.b, downstream.a) annotation (Line(
          points={{33,-30},{36,-30},{36,-36},{39,-36}},
          color={0,0,255},
          smooth=Smooth.None));

      connect(turbine.TurbineData[1], generator.P_turbine[1]) annotation (Line(
          points={{22,-19.6667},{22,-19.6667},{22,19},{24,19}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(turbine.f_generator, generator.f_out[1]) annotation (Line(
          points={{16,-19},{16,10},{46,10},{46,23},{41,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(turbine.yGV, turbineGovernor.y) annotation (Line(
          points={{28,-19},{28,0},{80,0},{80,30},{71,30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(inTH.b, reservoir.a1_open) annotation (Line(points={{-90.8,10},{-98,10},{-98,-6},{-95,-6}},
                                                color={0,0,255}));
      connect(downstream.b, river.a1_pipe) annotation (Line(points={{61,-36},{61,-36},{69,-36}},
                                   color={0,0,255}));
      connect(river.a2_open, outTH.b) annotation (Line(points={{91,-24},{95.5,-24},{95.5,-60},{90.9,-60}},
                                  color={0,0,255}));
      connect(turbine.a, penstock.b) annotation (Line(points={{11,-30},{5,-30}}, color={0,0,255}));
      connect(penstock.a, surgeTank.b) annotation (Line(points={{-17,-30},{-18,-30},{-18,-18},{-19,-18}}, color={0,0,255}));
      connect(conduit.b, surgeTank.a) annotation (Line(points={{-45,-18},{-41,-18}}, color={0,0,255}));
    end Model_230312;

    model Model_230745
      extends Modelica.Icons.ReleaseNotes;

      HydroPower.HydroSystems.Pipe conduit(
        horizontalIcon=true,
        L=6600,
        endD={5.8,5.8},
        showDataInIcon=false,
        ZL=564,
        endL={0,0},
        n=4,
        ZR=641.5) annotation (Placement(transformation(extent={{-66,-28},{-46,-8}})));
      HydroPower.HydroSystems.Pipe penstock(
        endD={3,3},
        L=724,
        showDataInIcon=false,
        ZL=541.5,
        ZR=112.5,
        endL={0,0})
        annotation (Placement(transformation(extent={{-16,-40},{4,-20}})));
      HydroPower.HydroSystems.SurgeTank surgeTank(
        D=3.6,
        H2L=0.87,
        Vol=100,
        showDataInIcon=false,
        deltZ=40) annotation (Placement(transformation(extent={{-40,-28},{-20,-8}})));
      HydroPower.SinksAndSources.Fixed_HT inTH(
        depth=60,
        paraOption=false,
        H_const=48 + 564,
        Hmax=564 + 60)
        annotation (Placement(transformation(extent={{-74,2},{-90,18}})));
      HydroPower.HydroSystems.Reservoir reservoir(
        Hmax=564 + 60,
        depth=ones(reservoir.n)*60,
        H_start=48 + 564,
        MidWidth=200,
        SideWidth=100,
        L=100,
        depthIntake={0,0},
        Krough=100,
        pWb=1,
        k=2,
        steadyState=false)
        annotation (Placement(transformation(extent={{-94,-22},{-74,-2}})));
      HydroPower.SinksAndSources.Fixed_HT outTH(
        paraOption=false,
        H_const=115,
        Hmax=130,
        depth=20)
        annotation (Placement(transformation(extent={{72,-52},{90,-68}})));
      HydroPower.HydroSystems.Reservoir river(
        H_start=115,
        MidWidth=200,
        SideWidth=100,
        L=100,
        depthIntake={0,0},
        pWb=1,
        k=2,
        Hmax=130,
        depth=ones(river.n)*20)
               annotation (Placement(transformation(extent={{70,-40},{90,-20}})));
      HydroPower.HydroSystems.Pipe downstream(
        horizontalIcon=true,
        endD={5.8,5.8},
        L=724,
        ZL=110.5,
        showDataInIcon=false,
        ZR=110,
        endL={0,0},
        n=4)    annotation (Placement(transformation(extent={{40,-46},{60,-26}})));
      HydroPower.ElectricalSystems.PowerGrid
                                  powerGrid(
        distTgen={150,1e6,1e6},
        loadDiv={0.5,0.25,0.25},
        loadT={0.5,1,2},
        NoLoadUnits={2000,4000,10000},
        distTload={1e6,1e6,1e6},
        distNoLoad={0,0,0},
        prodDiv={0.45,0.45,0.1},
        prodT={120,15,5},
        ep={0.5,0.08,0.04},
        unitsJ={122000,5.5e6,8000},
        NoGenUnits={90,100,500},
        distNoGen={-18,0,0})    annotation (Placement(transformation(extent={{-20,20},{0,40}},
                          rotation=0)));
      Modelica.Blocks.Sources.Ramp pwr_ref(
        duration=10,
        height=0,
        startTime=1e6,
        offset=5e6)    annotation (Placement(transformation(extent={{20,60},{40,80}},
                      rotation=0)));
      HydroPower.ElectricalSystems.GeneratorAndMCB generator(
        np={12},
        timeMCB_close=ones(generator.n)*150,
        timeMCB_open=ones(generator.n)*250,
        f_start=0,
        J={212500},
        P_nom={103000000})
                      annotation (Placement(transformation(extent={{20,20},{40,40}},
                       rotation=0)));
      HydroPower.ControllersAndSensors.TurbineGovernorAnalog
                                                  turbineGovernor(
        ep=1,
        tRamp=40,
        P_generator_nom=generator.P_nom[1],
        enableRamp=false,
        Kd_noLoad=0.05,
        Kd_load=0.5,
        K_noLoad=0.2,
        K_load=0.4,
        Ki_load=0.1,
        Ki_noLoad=0.025)
                    annotation (Placement(transformation(extent={{50,20},{70,40}},
              rotation=0)));
      HydroPower.MechanicalSystems.BasicTurbine turbine(
        H_nom=460,
        LdraftTube=2.9,
        DavDraftTube=3,
        LscrollCase=15.7,
        DavScrollCasing=1.5,
        np=12,
        tableOnFile=true,
        PUInFlowTables=true,
        QTableName="Qtab",
        T_start(displayUnit="degC"),
        yvLim1=[-0.4,0.05],
        yvLim2=[-0.4,0.05],
        Q_nom=24.3,
        H_start=564 + 48,
        H_start_draftTube=115,
        effMech=1,
        TurbDmp0=0.01,
        TurbineDataFile=Modelica.Utilities.Files.loadResource(HydroPower.TABLE_DIR
             + "TurbineDataFile.mat"),
        P_nom=103000000)
        annotation (Placement(transformation(extent={{12,-40},{32,-20}})));
      inner HydroPower.System_HPL system_HPL(                  constantTemperature=true,
          steadyState=true)
        annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
    equation
      connect(reservoir.a2_pipe, conduit.a) annotation (Line(
          points={{-73,-18},{-67,-18}},
          color={0,0,255},
          smooth=Smooth.None));

      connect(powerGrid.f_grid,generator. f_grid)         annotation (Line(
          points={{1,23},{19,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(powerGrid.J_grid,generator. J_grid)         annotation (Line(
          points={{1,30},{19,30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(powerGrid.P_grid_balance,generator. P_grid_balance)
        annotation (Line(
          points={{1,37},{19,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(pwr_ref.y,turbineGovernor. P_reference) annotation (Line(
          points={{41,70},{54,70},{54,41}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.f_out[1],turbineGovernor. f) annotation (Line(
          points={{41,23},{49,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.onMCB,powerGrid. MCB) annotation (Line(
          points={{30,41},{30,48},{-10,48},{-10,41}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(generator.onMCB[1],turbineGovernor. isMCB) annotation (Line(
          points={{30,41},{30,48},{60,48},{60,41}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(generator.P_out[1],turbineGovernor. P_generator) annotation (Line(
          points={{41,37},{49,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.f_out,powerGrid. f) annotation (Line(
          points={{41,23},{46,23},{46,10},{-36,10},{-36,23},{-21,23}},
          color={0,0,127},
          smooth=Smooth.None));

      connect(turbine.b, downstream.a) annotation (Line(
          points={{33,-30},{36,-30},{36,-36},{39,-36}},
          color={0,0,255},
          smooth=Smooth.None));

      connect(turbine.TurbineData[1], generator.P_turbine[1]) annotation (Line(
          points={{22,-19.6667},{22,19}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(turbine.f_generator, generator.f_out[1]) annotation (Line(
          points={{16,-19},{16,10},{46,10},{46,23},{41,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(turbine.yGV, turbineGovernor.y) annotation (Line(
          points={{28,-19},{28,0},{80,0},{80,30},{71,30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(inTH.b, reservoir.a1_open) annotation (Line(points={{-90.8,10},{-98,10},{-98,-6},{-95,-6}},
                                                color={0,0,255}));
      connect(downstream.b, river.a1_pipe) annotation (Line(points={{61,-36},{61,-36},{69,-36}},
                                   color={0,0,255}));
      connect(river.a2_open, outTH.b) annotation (Line(points={{91,-24},{95.5,-24},{95.5,-60},{90.9,-60}},
                                  color={0,0,255}));
      connect(turbine.a, penstock.b) annotation (Line(points={{11,-30},{5,-30}}, color={0,0,255}));
      connect(penstock.a, surgeTank.b) annotation (Line(points={{-17,-30},{-18,-30},{-18,-18},{-19,-18}}, color={0,0,255}));
      connect(conduit.b, surgeTank.a) annotation (Line(points={{-45,-18},{-41,-18}}, color={0,0,255}));
    end Model_230745;

    model Model_230757
      extends Modelica.Icons.ReleaseNotes;

      HydroPower.HydroSystems.Pipe conduit(
        horizontalIcon=true,
        L=6600,
        endD={5.8,5.8},
        showDataInIcon=false,
        endL={0,0},
        n=4,
        ZL=461.5,
        ZR=541.5) annotation (Placement(transformation(extent={{-66,-28},{-46,-8}})));
      HydroPower.HydroSystems.Pipe penstock(
        endD={3,3},
        L=724,
        showDataInIcon=false,
        ZL=541.5,
        ZR=112.5,
        endL={0,0})
        annotation (Placement(transformation(extent={{-16,-40},{4,-20}})));
      HydroPower.HydroSystems.SurgeTank surgeTank(
        D=3.6,
        H2L=0.87,
        Vol=100,
        showDataInIcon=false,
        deltZ=40) annotation (Placement(transformation(extent={{-40,-28},{-20,-8}})));
      HydroPower.SinksAndSources.Fixed_HT inTH(
        depth=60,
        paraOption=false,
        H_const=48 + 564,
        Hmax=564 + 60)
        annotation (Placement(transformation(extent={{-74,2},{-90,18}})));
      HydroPower.HydroSystems.Reservoir reservoir(
        Hmax=564 + 60,
        depth=ones(reservoir.n)*60,
        H_start=48 + 564,
        MidWidth=200,
        SideWidth=100,
        L=100,
        depthIntake={0,0},
        Krough=100,
        pWb=1,
        k=2,
        steadyState=false)
        annotation (Placement(transformation(extent={{-94,-22},{-74,-2}})));
      HydroPower.SinksAndSources.Fixed_HT outTH(
        paraOption=false,
        H_const=115,
        Hmax=130,
        depth=20)
        annotation (Placement(transformation(extent={{72,-52},{90,-68}})));
      HydroPower.HydroSystems.Reservoir river(
        H_start=115,
        MidWidth=200,
        SideWidth=100,
        L=100,
        depthIntake={0,0},
        pWb=1,
        k=2,
        Hmax=130,
        depth=ones(river.n)*20)
               annotation (Placement(transformation(extent={{70,-40},{90,-20}})));
      HydroPower.HydroSystems.Pipe downstream(
        horizontalIcon=true,
        endD={5.8,5.8},
        L=724,
        ZL=110.5,
        showDataInIcon=false,
        ZR=110,
        endL={0,0},
        n=4)    annotation (Placement(transformation(extent={{40,-46},{60,-26}})));
      HydroPower.ElectricalSystems.PowerGrid
                                  powerGrid(
        distTgen={150,1e6,1e6},
        loadDiv={0.5,0.25,0.25},
        loadT={0.5,1,2},
        NoLoadUnits={2000,4000,10000},
        distTload={1e6,1e6,1e6},
        distNoLoad={0,0,0},
        prodDiv={0.45,0.45,0.1},
        prodT={120,15,5},
        ep={0.5,0.08,0.04},
        unitsJ={122000,5.5e6,8000},
        NoGenUnits={90,100,500},
        distNoGen={-10,0,0})    annotation (Placement(transformation(extent={{-20,20},{0,40}},
                          rotation=0)));
      Modelica.Blocks.Sources.Ramp pwr_ref(
        duration=10,
        height=0,
        startTime=1e6,
        offset=45e6)   annotation (Placement(transformation(extent={{20,60},{40,80}},
                      rotation=0)));
      HydroPower.ElectricalSystems.GeneratorAndMCB generator(
        np={12},
        timeMCB_close=ones(generator.n)*150,
        timeMCB_open=ones(generator.n)*250,
        f_start=0,
        J={212500},
        P_nom={103000000})
                      annotation (Placement(transformation(extent={{20,20},{40,40}},
                       rotation=0)));
      HydroPower.ControllersAndSensors.TurbineGovernorAnalog
                                                  turbineGovernor(
        ep=1,
        tRamp=40,
        P_generator_nom=generator.P_nom[1],
        enableRamp=false,
        Kd_noLoad=0.05,
        Kd_load=0.5,
        K_noLoad=0.2,
        K_load=0.4,
        Ki_load=0.1,
        Ki_noLoad=0.025)
                    annotation (Placement(transformation(extent={{50,20},{70,40}},
              rotation=0)));
      HydroPower.MechanicalSystems.BasicTurbine turbine(
        H_nom=460,
        LdraftTube=2.9,
        DavDraftTube=3,
        LscrollCase=15.7,
        DavScrollCasing=1.5,
        np=12,
        tableOnFile=true,
        PUInFlowTables=true,
        QTableName="Qtab",
        T_start(displayUnit="degC"),
        yvLim1=[-0.4,0.05],
        yvLim2=[-0.4,0.05],
        Q_nom=24.3,
        H_start=564 + 48,
        H_start_draftTube=115,
        effMech=1,
        TurbDmp0=0.01,
        TurbineDataFile=Modelica.Utilities.Files.loadResource(HydroPower.TABLE_DIR
             + "TurbineDataFile.mat"),
        P_nom=103000000)
        annotation (Placement(transformation(extent={{12,-40},{32,-20}})));
      inner HydroPower.System_HPL system_HPL(                  constantTemperature=true,
          steadyState=true)
        annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
    equation
      connect(reservoir.a2_pipe, conduit.a) annotation (Line(
          points={{-73,-18},{-67,-18}},
          color={0,0,255},
          smooth=Smooth.None));

      connect(powerGrid.f_grid,generator. f_grid)         annotation (Line(
          points={{1,23},{19,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(powerGrid.J_grid,generator. J_grid)         annotation (Line(
          points={{1,30},{19,30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(powerGrid.P_grid_balance,generator. P_grid_balance)
        annotation (Line(
          points={{1,37},{19,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(pwr_ref.y,turbineGovernor. P_reference) annotation (Line(
          points={{41,70},{54,70},{54,41}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.f_out[1],turbineGovernor. f) annotation (Line(
          points={{41,23},{49,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.onMCB,powerGrid. MCB) annotation (Line(
          points={{30,41},{30,48},{-10,48},{-10,41}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(generator.onMCB[1],turbineGovernor. isMCB) annotation (Line(
          points={{30,41},{30,48},{60,48},{60,41}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(generator.P_out[1],turbineGovernor. P_generator) annotation (Line(
          points={{41,37},{49,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.f_out,powerGrid. f) annotation (Line(
          points={{41,23},{46,23},{46,10},{-36,10},{-36,23},{-21,23}},
          color={0,0,127},
          smooth=Smooth.None));

      connect(turbine.b, downstream.a) annotation (Line(
          points={{33,-30},{36,-30},{36,-36},{39,-36}},
          color={0,0,255},
          smooth=Smooth.None));

      connect(turbine.TurbineData[1], generator.P_turbine[1]) annotation (Line(
          points={{22,-19.6667},{22,19}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(turbine.f_generator, generator.f_out[1]) annotation (Line(
          points={{16,-19},{16,10},{46,10},{46,23},{41,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(turbine.yGV, turbineGovernor.y) annotation (Line(
          points={{28,-19},{28,0},{80,0},{80,30},{71,30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(inTH.b, reservoir.a1_open) annotation (Line(points={{-90.8,10},{-98,10},{-98,-6},{-95,-6}},
                                                color={0,0,255}));
      connect(downstream.b, river.a1_pipe) annotation (Line(points={{61,-36},{61,-36},{69,-36}},
                                   color={0,0,255}));
      connect(river.a2_open, outTH.b) annotation (Line(points={{91,-24},{95.5,-24},{95.5,-60},{90.9,-60}},
                                  color={0,0,255}));
      connect(turbine.a, penstock.b) annotation (Line(points={{11,-30},{5,-30}}, color={0,0,255}));
      connect(penstock.a, surgeTank.b) annotation (Line(points={{-17,-30},{-18,-30},{-18,-18},{-19,-18}}, color={0,0,255}));
      connect(conduit.b, surgeTank.a) annotation (Line(points={{-45,-18},{-41,-18}}, color={0,0,255}));
    end Model_230757;

    model Model_231213
      extends Modelica.Icons.ReleaseNotes;

      HydroPower.HydroSystems.Pipe conduit(
        horizontalIcon=true,
        L=6600,
        endD={5.8,5.8},
        showDataInIcon=false,
        endL={0,0},
        n=4,
        ZL=154.5,
        ZR=456.5) annotation (Placement(transformation(extent={{-66,-28},{-46,-8}})));
      HydroPower.HydroSystems.Pipe penstock(
        endD={3,3},
        L=724,
        showDataInIcon=false,
        ZL=541.5,
        ZR=112.5,
        endL={0,0})
        annotation (Placement(transformation(extent={{-16,-40},{4,-20}})));
      HydroPower.HydroSystems.SurgeTank surgeTank(
        D=3.6,
        H2L=0.87,
        Vol=100,
        showDataInIcon=false,
        deltZ=40) annotation (Placement(transformation(extent={{-40,-28},{-20,-8}})));
      HydroPower.SinksAndSources.Fixed_HT inTH(
        depth=60,
        paraOption=false,
        H_const=48 + 564,
        Hmax=564 + 60)
        annotation (Placement(transformation(extent={{-74,2},{-90,18}})));
      HydroPower.HydroSystems.Reservoir reservoir(
        Hmax=564 + 60,
        depth=ones(reservoir.n)*60,
        H_start=48 + 564,
        MidWidth=200,
        SideWidth=100,
        L=100,
        depthIntake={0,0},
        Krough=100,
        pWb=1,
        k=2,
        steadyState=false)
        annotation (Placement(transformation(extent={{-94,-22},{-74,-2}})));
      HydroPower.SinksAndSources.Fixed_HT outTH(
        paraOption=false,
        H_const=115,
        Hmax=130,
        depth=20)
        annotation (Placement(transformation(extent={{72,-52},{90,-68}})));
      HydroPower.HydroSystems.Reservoir river(
        H_start=115,
        MidWidth=200,
        SideWidth=100,
        L=100,
        depthIntake={0,0},
        pWb=1,
        k=2,
        Hmax=130,
        depth=ones(river.n)*20)
               annotation (Placement(transformation(extent={{70,-40},{90,-20}})));
      HydroPower.HydroSystems.Pipe downstream(
        horizontalIcon=true,
        endD={5.8,5.8},
        L=724,
        ZL=110.5,
        showDataInIcon=false,
        ZR=110,
        endL={0,0},
        n=4)    annotation (Placement(transformation(extent={{40,-46},{60,-26}})));
      HydroPower.ElectricalSystems.PowerGrid
                                  powerGrid(
        distTgen={150,1e6,1e6},
        loadDiv={0.5,0.25,0.25},
        loadT={0.5,1,2},
        NoLoadUnits={2000,4000,10000},
        distTload={1e6,1e6,1e6},
        distNoLoad={0,0,0},
        prodDiv={0.45,0.45,0.1},
        prodT={120,15,5},
        ep={0.5,0.08,0.04},
        unitsJ={122000,5.5e6,8000},
        NoGenUnits={90,100,500},
        distNoGen={-13,0,0})    annotation (Placement(transformation(extent={{-20,20},{0,40}},
                          rotation=0)));
      Modelica.Blocks.Sources.Ramp pwr_ref(
        duration=10,
        height=0,
        startTime=1e6,
        offset=30e6)   annotation (Placement(transformation(extent={{20,60},{40,80}},
                      rotation=0)));
      HydroPower.ElectricalSystems.GeneratorAndMCB generator(
        np={12},
        timeMCB_close=ones(generator.n)*150,
        timeMCB_open=ones(generator.n)*250,
        f_start=0,
        J={212500},
        P_nom={103000000})
                      annotation (Placement(transformation(extent={{20,20},{40,40}},
                       rotation=0)));
      HydroPower.ControllersAndSensors.TurbineGovernorAnalog
                                                  turbineGovernor(
        ep=1,
        tRamp=40,
        P_generator_nom=generator.P_nom[1],
        enableRamp=false,
        Kd_noLoad=0.05,
        Kd_load=0.5,
        K_noLoad=0.2,
        K_load=0.4,
        Ki_load=0.1,
        Ki_noLoad=0.025)
                    annotation (Placement(transformation(extent={{50,20},{70,40}},
              rotation=0)));
      HydroPower.MechanicalSystems.BasicTurbine turbine(
        H_nom=460,
        LdraftTube=2.9,
        DavDraftTube=3,
        LscrollCase=15.7,
        DavScrollCasing=1.5,
        np=12,
        tableOnFile=true,
        PUInFlowTables=true,
        QTableName="Qtab",
        T_start(displayUnit="degC"),
        yvLim1=[-0.4,0.05],
        yvLim2=[-0.4,0.05],
        Q_nom=24.3,
        H_start=564 + 48,
        H_start_draftTube=115,
        effMech=1,
        TurbDmp0=0.01,
        TurbineDataFile=Modelica.Utilities.Files.loadResource(HydroPower.TABLE_DIR
             + "TurbineDataFile.mat"),
        P_nom=103000000)
        annotation (Placement(transformation(extent={{12,-40},{32,-20}})));
      inner HydroPower.System_HPL system_HPL(                  constantTemperature=true,
          steadyState=true)
        annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
    equation
      connect(reservoir.a2_pipe, conduit.a) annotation (Line(
          points={{-73,-18},{-67,-18}},
          color={0,0,255},
          smooth=Smooth.None));

      connect(powerGrid.f_grid,generator. f_grid)         annotation (Line(
          points={{1,23},{19,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(powerGrid.J_grid,generator. J_grid)         annotation (Line(
          points={{1,30},{19,30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(powerGrid.P_grid_balance,generator. P_grid_balance)
        annotation (Line(
          points={{1,37},{19,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(pwr_ref.y,turbineGovernor. P_reference) annotation (Line(
          points={{41,70},{54,70},{54,41}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.f_out[1],turbineGovernor. f) annotation (Line(
          points={{41,23},{49,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.onMCB,powerGrid. MCB) annotation (Line(
          points={{30,41},{30,48},{-10,48},{-10,41}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(generator.onMCB[1],turbineGovernor. isMCB) annotation (Line(
          points={{30,41},{30,48},{60,48},{60,41}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(generator.P_out[1],turbineGovernor. P_generator) annotation (Line(
          points={{41,37},{49,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.f_out,powerGrid. f) annotation (Line(
          points={{41,23},{46,23},{46,10},{-36,10},{-36,23},{-21,23}},
          color={0,0,127},
          smooth=Smooth.None));

      connect(turbine.b, downstream.a) annotation (Line(
          points={{33,-30},{36,-30},{36,-36},{39,-36}},
          color={0,0,255},
          smooth=Smooth.None));

      connect(turbine.TurbineData[1], generator.P_turbine[1]) annotation (Line(
          points={{22,-19.6667},{22,19}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(turbine.f_generator, generator.f_out[1]) annotation (Line(
          points={{16,-19},{16,10},{46,10},{46,23},{41,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(turbine.yGV, turbineGovernor.y) annotation (Line(
          points={{28,-19},{28,0},{80,0},{80,30},{71,30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(inTH.b, reservoir.a1_open) annotation (Line(points={{-90.8,10},{-98,10},{-98,-6},{-95,-6}},
                                                color={0,0,255}));
      connect(downstream.b, river.a1_pipe) annotation (Line(points={{61,-36},{61,-36},{69,-36}},
                                   color={0,0,255}));
      connect(river.a2_open, outTH.b) annotation (Line(points={{91,-24},{95.5,-24},{95.5,-60},{90.9,-60}},
                                  color={0,0,255}));
      connect(turbine.a, penstock.b) annotation (Line(points={{11,-30},{5,-30}}, color={0,0,255}));
      connect(penstock.a, surgeTank.b) annotation (Line(points={{-17,-30},{-18,-30},{-18,-18},{-19,-18}}, color={0,0,255}));
      connect(conduit.b, surgeTank.a) annotation (Line(points={{-45,-18},{-41,-18}}, color={0,0,255}));
    end Model_231213;

    model Model_231216
      extends Modelica.Icons.ReleaseNotes;

      HydroPower.HydroSystems.Pipe conduit(
        horizontalIcon=true,
        L=6600,
        endD={5.8,5.8},
        showDataInIcon=false,
        endL={0,0},
        n=4,
        ZL=164.5,
        ZR=641.5) annotation (Placement(transformation(extent={{-66,-28},{-46,-8}})));
      HydroPower.HydroSystems.Pipe penstock(
        endD={3,3},
        L=724,
        showDataInIcon=false,
        ZL=541.5,
        ZR=112.5,
        endL={0,0})
        annotation (Placement(transformation(extent={{-16,-40},{4,-20}})));
      HydroPower.HydroSystems.SurgeTank surgeTank(
        D=3.6,
        H2L=0.87,
        Vol=100,
        showDataInIcon=false,
        deltZ=40) annotation (Placement(transformation(extent={{-40,-28},{-20,-8}})));
      HydroPower.SinksAndSources.Fixed_HT inTH(
        depth=60,
        paraOption=false,
        H_const=48 + 564,
        Hmax=564 + 60)
        annotation (Placement(transformation(extent={{-74,2},{-90,18}})));
      HydroPower.HydroSystems.Reservoir reservoir(
        Hmax=564 + 60,
        depth=ones(reservoir.n)*60,
        H_start=48 + 564,
        MidWidth=200,
        SideWidth=100,
        L=100,
        depthIntake={0,0},
        Krough=100,
        pWb=1,
        k=2,
        steadyState=false)
        annotation (Placement(transformation(extent={{-94,-22},{-74,-2}})));
      HydroPower.SinksAndSources.Fixed_HT outTH(
        paraOption=false,
        H_const=115,
        Hmax=130,
        depth=20)
        annotation (Placement(transformation(extent={{72,-52},{90,-68}})));
      HydroPower.HydroSystems.Reservoir river(
        H_start=115,
        MidWidth=200,
        SideWidth=100,
        L=100,
        depthIntake={0,0},
        pWb=1,
        k=2,
        Hmax=130,
        depth=ones(river.n)*20)
               annotation (Placement(transformation(extent={{70,-40},{90,-20}})));
      HydroPower.HydroSystems.Pipe downstream(
        horizontalIcon=true,
        endD={5.8,5.8},
        L=724,
        ZL=110.5,
        showDataInIcon=false,
        ZR=110,
        endL={0,0},
        n=4)    annotation (Placement(transformation(extent={{40,-46},{60,-26}})));
      HydroPower.ElectricalSystems.PowerGrid
                                  powerGrid(
        distTgen={150,1e6,1e6},
        loadDiv={0.5,0.25,0.25},
        loadT={0.5,1,2},
        NoLoadUnits={2000,4000,10000},
        distTload={1e6,1e6,1e6},
        distNoLoad={0,0,0},
        prodDiv={0.45,0.45,0.1},
        prodT={120,15,5},
        ep={0.5,0.08,0.04},
        unitsJ={122000,5.5e6,8000},
        NoGenUnits={90,100,500},
        distNoGen={-12,0,0})    annotation (Placement(transformation(extent={{-20,20},{0,40}},
                          rotation=0)));
      Modelica.Blocks.Sources.Ramp pwr_ref(
        duration=10,
        height=0,
        startTime=1e6,
        offset=35e6)   annotation (Placement(transformation(extent={{20,60},{40,80}},
                      rotation=0)));
      HydroPower.ElectricalSystems.GeneratorAndMCB generator(
        np={12},
        timeMCB_close=ones(generator.n)*150,
        timeMCB_open=ones(generator.n)*250,
        f_start=0,
        J={212500},
        P_nom={103000000})
                      annotation (Placement(transformation(extent={{20,20},{40,40}},
                       rotation=0)));
      HydroPower.ControllersAndSensors.TurbineGovernorAnalog
                                                  turbineGovernor(
        ep=1,
        tRamp=40,
        P_generator_nom=generator.P_nom[1],
        enableRamp=false,
        Kd_noLoad=0.05,
        Kd_load=0.5,
        K_noLoad=0.2,
        K_load=0.4,
        Ki_load=0.1,
        Ki_noLoad=0.025)
                    annotation (Placement(transformation(extent={{50,20},{70,40}},
              rotation=0)));
      HydroPower.MechanicalSystems.BasicTurbine turbine(
        H_nom=460,
        LdraftTube=2.9,
        DavDraftTube=3,
        LscrollCase=15.7,
        DavScrollCasing=1.5,
        np=12,
        tableOnFile=true,
        PUInFlowTables=true,
        QTableName="Qtab",
        T_start(displayUnit="degC"),
        yvLim1=[-0.4,0.05],
        yvLim2=[-0.4,0.05],
        Q_nom=24.3,
        H_start=564 + 48,
        H_start_draftTube=115,
        effMech=1,
        TurbDmp0=0.01,
        TurbineDataFile=Modelica.Utilities.Files.loadResource(HydroPower.TABLE_DIR
             + "TurbineDataFile.mat"),
        P_nom=103000000)
        annotation (Placement(transformation(extent={{12,-40},{32,-20}})));
      inner HydroPower.System_HPL system_HPL(                  constantTemperature=true,
          steadyState=true)
        annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
    equation
      connect(reservoir.a2_pipe, conduit.a) annotation (Line(
          points={{-73,-18},{-67,-18}},
          color={0,0,255},
          smooth=Smooth.None));

      connect(powerGrid.f_grid,generator. f_grid)         annotation (Line(
          points={{1,23},{19,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(powerGrid.J_grid,generator. J_grid)         annotation (Line(
          points={{1,30},{19,30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(powerGrid.P_grid_balance,generator. P_grid_balance)
        annotation (Line(
          points={{1,37},{19,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(pwr_ref.y,turbineGovernor. P_reference) annotation (Line(
          points={{41,70},{54,70},{54,41}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.f_out[1],turbineGovernor. f) annotation (Line(
          points={{41,23},{49,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.onMCB,powerGrid. MCB) annotation (Line(
          points={{30,41},{30,48},{-10,48},{-10,41}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(generator.onMCB[1],turbineGovernor. isMCB) annotation (Line(
          points={{30,41},{30,48},{60,48},{60,41}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(generator.P_out[1],turbineGovernor. P_generator) annotation (Line(
          points={{41,37},{49,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.f_out,powerGrid. f) annotation (Line(
          points={{41,23},{46,23},{46,10},{-36,10},{-36,23},{-21,23}},
          color={0,0,127},
          smooth=Smooth.None));

      connect(turbine.b, downstream.a) annotation (Line(
          points={{33,-30},{36,-30},{36,-36},{39,-36}},
          color={0,0,255},
          smooth=Smooth.None));

      connect(turbine.TurbineData[1], generator.P_turbine[1]) annotation (Line(
          points={{22,-19.6667},{22,19}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(turbine.f_generator, generator.f_out[1]) annotation (Line(
          points={{16,-19},{16,10},{46,10},{46,23},{41,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(turbine.yGV, turbineGovernor.y) annotation (Line(
          points={{28,-19},{28,0},{80,0},{80,30},{71,30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(inTH.b, reservoir.a1_open) annotation (Line(points={{-90.8,10},{-98,10},{-98,-6},{-95,-6}},
                                                color={0,0,255}));
      connect(downstream.b, river.a1_pipe) annotation (Line(points={{61,-36},{61,-36},{69,-36}},
                                   color={0,0,255}));
      connect(river.a2_open, outTH.b) annotation (Line(points={{91,-24},{95.5,-24},{95.5,-60},{90.9,-60}},
                                  color={0,0,255}));
      connect(turbine.a, penstock.b) annotation (Line(points={{11,-30},{5,-30}}, color={0,0,255}));
      connect(penstock.a, surgeTank.b) annotation (Line(points={{-17,-30},{-18,-30},{-18,-18},{-19,-18}}, color={0,0,255}));
      connect(conduit.b, surgeTank.a) annotation (Line(points={{-45,-18},{-41,-18}}, color={0,0,255}));
    end Model_231216;

    model Model_231217
      extends Modelica.Icons.ReleaseNotes;

      HydroPower.HydroSystems.Pipe conduit(
        horizontalIcon=true,
        L=6600,
        endD={5.8,5.8},
        showDataInIcon=false,
        ZL=564,
        endL={0,0},
        n=4,
        ZR=541.5) annotation (Placement(transformation(extent={{-66,-28},{-46,-8}})));
      HydroPower.HydroSystems.Pipe penstock(
        endD={3,3},
        L=724,
        showDataInIcon=false,
        ZL=541.5,
        ZR=112.5,
        endL={0,0})
        annotation (Placement(transformation(extent={{-16,-40},{4,-20}})));
      HydroPower.HydroSystems.SurgeTank surgeTank(
        D=3.6,
        H2L=0.87,
        Vol=100,
        showDataInIcon=false,
        deltZ=40) annotation (Placement(transformation(extent={{-40,-28},{-20,-8}})));
      HydroPower.SinksAndSources.Fixed_HT inTH(
        depth=60,
        paraOption=false,
        H_const=48 + 564,
        Hmax=564 + 60)
        annotation (Placement(transformation(extent={{-74,2},{-90,18}})));
      HydroPower.HydroSystems.Reservoir reservoir(
        Hmax=564 + 60,
        depth=ones(reservoir.n)*60,
        H_start=48 + 564,
        MidWidth=200,
        SideWidth=100,
        L=100,
        depthIntake={0,0},
        Krough=100,
        pWb=1,
        k=2,
        steadyState=false)
        annotation (Placement(transformation(extent={{-94,-22},{-74,-2}})));
      HydroPower.ElectricalSystems.PowerGrid
                                  powerGrid(
        distTgen={150,1e6,1e6},
        loadDiv={0.5,0.25,0.25},
        loadT={0.5,1,2},
        NoLoadUnits={2000,4000,10000},
        distTload={1e6,1e6,1e6},
        distNoLoad={0,0,0},
        prodDiv={0.45,0.45,0.1},
        prodT={120,15,5},
        ep={0.5,0.08,0.04},
        unitsJ={122000,5.5e6,8000},
        NoGenUnits={90,100,500},
        distNoGen={-12,0,0})    annotation (Placement(transformation(extent={{-20,20},{0,40}},
                          rotation=0)));
      HydroPower.SinksAndSources.Fixed_HT outTH(
        paraOption=false,
        H_const=115,
        Hmax=130,
        depth=20)
        annotation (Placement(transformation(extent={{72,-52},{90,-68}})));
      HydroPower.HydroSystems.Reservoir river(
        H_start=115,
        MidWidth=200,
        SideWidth=100,
        L=100,
        depthIntake={0,0},
        pWb=1,
        k=2,
        Hmax=130,
        depth=ones(river.n)*20)
               annotation (Placement(transformation(extent={{70,-40},{90,-20}})));
      HydroPower.HydroSystems.Pipe downstream(
        horizontalIcon=true,
        endD={5.8,5.8},
        L=724,
        showDataInIcon=false,
        endL={0,0},
        n=4,
        ZL=115,
        ZR=315) annotation (Placement(transformation(extent={{40,-46},{60,-26}})));
      Modelica.Blocks.Sources.Ramp pwr_ref(
        duration=10,
        height=0,
        startTime=1e6,
        offset=5e6)    annotation (Placement(transformation(extent={{20,60},{40,80}},
                      rotation=0)));
      HydroPower.ElectricalSystems.GeneratorAndMCB generator(
        np={12},
        timeMCB_close=ones(generator.n)*150,
        timeMCB_open=ones(generator.n)*250,
        f_start=0,
        J={212500},
        P_nom={103000000})
                      annotation (Placement(transformation(extent={{20,20},{40,40}},
                       rotation=0)));
      HydroPower.ControllersAndSensors.TurbineGovernorAnalog
                                                  turbineGovernor(
        ep=1,
        tRamp=40,
        P_generator_nom=generator.P_nom[1],
        enableRamp=false,
        Kd_noLoad=0.05,
        Kd_load=0.5,
        K_noLoad=0.2,
        K_load=0.4,
        Ki_load=0.1,
        Ki_noLoad=0.025)
                    annotation (Placement(transformation(extent={{50,20},{70,40}},
              rotation=0)));
      HydroPower.MechanicalSystems.BasicTurbine turbine(
        H_nom=460,
        LdraftTube=2.9,
        DavDraftTube=3,
        LscrollCase=15.7,
        DavScrollCasing=1.5,
        np=12,
        tableOnFile=true,
        PUInFlowTables=true,
        QTableName="Qtab",
        T_start(displayUnit="degC"),
        yvLim1=[-0.4,0.05],
        yvLim2=[-0.4,0.05],
        Q_nom=24.3,
        H_start=564 + 48,
        H_start_draftTube=115,
        effMech=1,
        TurbDmp0=0.01,
        TurbineDataFile=Modelica.Utilities.Files.loadResource(HydroPower.TABLE_DIR
             + "TurbineDataFile.mat"),
        P_nom=103000000)
        annotation (Placement(transformation(extent={{12,-40},{32,-20}})));
      inner HydroPower.System_HPL system_HPL(                  constantTemperature=true,
          steadyState=true)
        annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
    equation
      connect(reservoir.a2_pipe, conduit.a) annotation (Line(
          points={{-73,-18},{-67,-18}},
          color={0,0,255},
          smooth=Smooth.None));

      connect(powerGrid.f_grid,generator. f_grid)         annotation (Line(
          points={{1,23},{19,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(powerGrid.J_grid,generator. J_grid)         annotation (Line(
          points={{1,30},{19,30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(powerGrid.P_grid_balance,generator. P_grid_balance)
        annotation (Line(
          points={{1,37},{19,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(pwr_ref.y,turbineGovernor. P_reference) annotation (Line(
          points={{41,70},{54,70},{54,41}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.f_out[1],turbineGovernor. f) annotation (Line(
          points={{41,23},{49,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.onMCB,powerGrid. MCB) annotation (Line(
          points={{30,41},{30,48},{-10,48},{-10,41}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(generator.onMCB[1],turbineGovernor. isMCB) annotation (Line(
          points={{30,41},{30,48},{60,48},{60,41}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(generator.P_out[1],turbineGovernor. P_generator) annotation (Line(
          points={{41,37},{49,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.f_out,powerGrid. f) annotation (Line(
          points={{41,23},{46,23},{46,10},{-36,10},{-36,23},{-21,23}},
          color={0,0,127},
          smooth=Smooth.None));

      connect(turbine.b, downstream.a) annotation (Line(
          points={{33,-30},{36,-30},{36,-36},{39,-36}},
          color={0,0,255},
          smooth=Smooth.None));

      connect(turbine.TurbineData[1], generator.P_turbine[1]) annotation (Line(
          points={{22,-19.6667},{22,-19.6667},{22,19},{24,19}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(turbine.f_generator, generator.f_out[1]) annotation (Line(
          points={{16,-19},{16,10},{46,10},{46,23},{41,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(turbine.yGV, turbineGovernor.y) annotation (Line(
          points={{28,-19},{28,0},{80,0},{80,30},{71,30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(inTH.b, reservoir.a1_open) annotation (Line(points={{-90.8,10},{-98,10},{-98,-6},{-95,-6}},
                                                color={0,0,255}));
      connect(downstream.b, river.a1_pipe) annotation (Line(points={{61,-36},{61,-36},{69,-36}},
                                   color={0,0,255}));
      connect(river.a2_open, outTH.b) annotation (Line(points={{91,-24},{95.5,-24},{95.5,-60},{90.9,-60}},
                                  color={0,0,255}));
      connect(turbine.a, penstock.b) annotation (Line(points={{11,-30},{5,-30}}, color={0,0,255}));
      connect(penstock.a, surgeTank.b) annotation (Line(points={{-17,-30},{-18,-30},{-18,-18},{-19,-18}}, color={0,0,255}));
      connect(conduit.b, surgeTank.a) annotation (Line(points={{-45,-18},{-41,-18}}, color={0,0,255}));
    end Model_231217;

    model Model_238758
      extends Modelica.Icons.ReleaseNotes;

      HydroPower.HydroSystems.Pipe conduit(
        horizontalIcon=true,
        L=6600,
        endD={5.8,5.8},
        showDataInIcon=false,
        ZL=564,
        endL={0,0},
        n=4,
        ZR=154.5) annotation (Placement(transformation(extent={{-66,-28},{-46,-8}})));
      HydroPower.HydroSystems.Pipe penstock(
        endD={3,3},
        L=724,
        showDataInIcon=false,
        ZL=541.5,
        ZR=112.5,
        endL={0,0})
        annotation (Placement(transformation(extent={{-16,-40},{4,-20}})));
      HydroPower.HydroSystems.SurgeTank surgeTank(
        D=3.6,
        H2L=0.87,
        Vol=100,
        showDataInIcon=false,
        deltZ=40) annotation (Placement(transformation(extent={{-40,-28},{-20,-8}})));
      HydroPower.SinksAndSources.Fixed_HT inTH(
        depth=60,
        paraOption=false,
        H_const=48 + 564,
        Hmax=564 + 60)
        annotation (Placement(transformation(extent={{-74,2},{-90,18}})));
      HydroPower.HydroSystems.Reservoir reservoir(
        Hmax=564 + 60,
        depth=ones(reservoir.n)*60,
        H_start=48 + 564,
        MidWidth=200,
        SideWidth=100,
        L=100,
        depthIntake={0,0},
        Krough=100,
        pWb=1,
        k=2,
        steadyState=false)
        annotation (Placement(transformation(extent={{-94,-22},{-74,-2}})));
      HydroPower.SinksAndSources.Fixed_HT outTH(
        paraOption=false,
        H_const=115,
        Hmax=130,
        depth=20)
        annotation (Placement(transformation(extent={{72,-52},{90,-68}})));
      HydroPower.HydroSystems.Reservoir river(
        H_start=115,
        MidWidth=200,
        SideWidth=100,
        L=100,
        depthIntake={0,0},
        pWb=1,
        k=2,
        Hmax=130,
        depth=ones(river.n)*20)
               annotation (Placement(transformation(extent={{70,-40},{90,-20}})));
      HydroPower.HydroSystems.Pipe downstream(
        horizontalIcon=true,
        endD={5.8,5.8},
        L=724,
        ZL=110.5,
        showDataInIcon=false,
        ZR=110,
        endL={0,0},
        n=4)    annotation (Placement(transformation(extent={{40,-46},{60,-26}})));
      HydroPower.ElectricalSystems.PowerGrid
                                  powerGrid(
        distTgen={150,1e6,1e6},
        loadDiv={0.5,0.25,0.25},
        loadT={0.5,1,2},
        NoLoadUnits={2000,4000,10000},
        distTload={1e6,1e6,1e6},
        distNoLoad={0,0,0},
        prodDiv={0.45,0.45,0.1},
        prodT={120,15,5},
        ep={0.5,0.08,0.04},
        unitsJ={122000,5.5e6,8000},
        NoGenUnits={90,100,500},
        distNoGen={-16,0,0})    annotation (Placement(transformation(extent={{-20,20},{0,40}},
                          rotation=0)));
      Modelica.Blocks.Sources.Ramp pwr_ref(
        duration=10,
        height=0,
        startTime=1e6,
        offset=15e6)   annotation (Placement(transformation(extent={{20,60},{40,80}},
                      rotation=0)));
      HydroPower.ElectricalSystems.GeneratorAndMCB generator(
        np={12},
        timeMCB_close=ones(generator.n)*150,
        timeMCB_open=ones(generator.n)*250,
        f_start=0,
        J={212500},
        P_nom={103000000})
                      annotation (Placement(transformation(extent={{20,20},{40,40}},
                       rotation=0)));
      HydroPower.ControllersAndSensors.TurbineGovernorAnalog
                                                  turbineGovernor(
        ep=1,
        tRamp=40,
        P_generator_nom=generator.P_nom[1],
        enableRamp=false,
        Kd_noLoad=0.05,
        Kd_load=0.5,
        K_noLoad=0.2,
        K_load=0.4,
        Ki_load=0.1,
        Ki_noLoad=0.025)
                    annotation (Placement(transformation(extent={{50,20},{70,40}},
              rotation=0)));
      HydroPower.MechanicalSystems.BasicTurbine turbine(
        H_nom=460,
        LdraftTube=2.9,
        DavDraftTube=3,
        LscrollCase=15.7,
        DavScrollCasing=1.5,
        np=12,
        tableOnFile=true,
        PUInFlowTables=true,
        QTableName="Qtab",
        T_start(displayUnit="degC"),
        yvLim1=[-0.4,0.05],
        yvLim2=[-0.4,0.05],
        Q_nom=24.3,
        H_start=564 + 48,
        H_start_draftTube=115,
        effMech=1,
        TurbDmp0=0.01,
        TurbineDataFile=Modelica.Utilities.Files.loadResource(HydroPower.TABLE_DIR
             + "TurbineDataFile.mat"),
        P_nom=103000000)
        annotation (Placement(transformation(extent={{12,-40},{32,-20}})));
      inner HydroPower.System_HPL system_HPL(                  constantTemperature=true,
          steadyState=true)
        annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
    equation
      connect(reservoir.a2_pipe, conduit.a) annotation (Line(
          points={{-73,-18},{-67,-18}},
          color={0,0,255},
          smooth=Smooth.None));

      connect(powerGrid.f_grid,generator. f_grid)         annotation (Line(
          points={{1,23},{19,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(powerGrid.J_grid,generator. J_grid)         annotation (Line(
          points={{1,30},{19,30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(powerGrid.P_grid_balance,generator. P_grid_balance)
        annotation (Line(
          points={{1,37},{19,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(pwr_ref.y,turbineGovernor. P_reference) annotation (Line(
          points={{41,70},{54,70},{54,41}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.f_out[1],turbineGovernor. f) annotation (Line(
          points={{41,23},{49,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.onMCB,powerGrid. MCB) annotation (Line(
          points={{30,41},{30,48},{-10,48},{-10,41}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(generator.onMCB[1],turbineGovernor. isMCB) annotation (Line(
          points={{30,41},{30,48},{60,48},{60,41}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(generator.P_out[1],turbineGovernor. P_generator) annotation (Line(
          points={{41,37},{49,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.f_out,powerGrid. f) annotation (Line(
          points={{41,23},{46,23},{46,10},{-36,10},{-36,23},{-21,23}},
          color={0,0,127},
          smooth=Smooth.None));

      connect(turbine.b, downstream.a) annotation (Line(
          points={{33,-30},{36,-30},{36,-36},{39,-36}},
          color={0,0,255},
          smooth=Smooth.None));

      connect(turbine.TurbineData[1], generator.P_turbine[1]) annotation (Line(
          points={{22,-19.6667},{22,19}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(turbine.f_generator, generator.f_out[1]) annotation (Line(
          points={{16,-19},{16,10},{46,10},{46,23},{41,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(turbine.yGV, turbineGovernor.y) annotation (Line(
          points={{28,-19},{28,0},{80,0},{80,30},{71,30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(inTH.b, reservoir.a1_open) annotation (Line(points={{-90.8,10},{-98,10},{-98,-6},{-95,-6}},
                                                color={0,0,255}));
      connect(downstream.b, river.a1_pipe) annotation (Line(points={{61,-36},{61,-36},{69,-36}},
                                   color={0,0,255}));
      connect(river.a2_open, outTH.b) annotation (Line(points={{91,-24},{95.5,-24},{95.5,-60},{90.9,-60}},
                                  color={0,0,255}));
      connect(turbine.a, penstock.b) annotation (Line(points={{11,-30},{5,-30}}, color={0,0,255}));
      connect(penstock.a, surgeTank.b) annotation (Line(points={{-17,-30},{-18,-30},{-18,-18},{-19,-18}}, color={0,0,255}));
      connect(conduit.b, surgeTank.a) annotation (Line(points={{-45,-18},{-41,-18}}, color={0,0,255}));
    end Model_238758;

    model Model_238801
      extends Modelica.Icons.ReleaseNotes;

      HydroPower.HydroSystems.Pipe conduit(
        horizontalIcon=true,
        L=6600,
        endD={5.8,5.8},
        showDataInIcon=false,
        ZL=564,
        endL={0,0},
        n=4,
        ZR=351.5) annotation (Placement(transformation(extent={{-66,-28},{-46,-8}})));
      HydroPower.HydroSystems.Pipe penstock(
        endD={3,3},
        L=724,
        showDataInIcon=false,
        ZL=541.5,
        ZR=112.5,
        endL={0,0})
        annotation (Placement(transformation(extent={{-16,-40},{4,-20}})));
      HydroPower.HydroSystems.SurgeTank surgeTank(
        D=3.6,
        H2L=0.87,
        Vol=100,
        showDataInIcon=false,
        deltZ=40) annotation (Placement(transformation(extent={{-40,-28},{-20,-8}})));
      HydroPower.SinksAndSources.Fixed_HT inTH(
        depth=60,
        paraOption=false,
        H_const=48 + 564,
        Hmax=564 + 60)
        annotation (Placement(transformation(extent={{-74,2},{-90,18}})));
      HydroPower.HydroSystems.Reservoir reservoir(
        Hmax=564 + 60,
        depth=ones(reservoir.n)*60,
        H_start=48 + 564,
        MidWidth=200,
        SideWidth=100,
        L=100,
        depthIntake={0,0},
        Krough=100,
        pWb=1,
        k=2,
        steadyState=false)
        annotation (Placement(transformation(extent={{-94,-22},{-74,-2}})));
      HydroPower.SinksAndSources.Fixed_HT outTH(
        paraOption=false,
        H_const=115,
        Hmax=130,
        depth=20)
        annotation (Placement(transformation(extent={{72,-52},{90,-68}})));
      HydroPower.HydroSystems.Reservoir river(
        H_start=115,
        MidWidth=200,
        SideWidth=100,
        L=100,
        depthIntake={0,0},
        pWb=1,
        k=2,
        Hmax=130,
        depth=ones(river.n)*20)
               annotation (Placement(transformation(extent={{70,-40},{90,-20}})));
      HydroPower.HydroSystems.Pipe downstream(
        horizontalIcon=true,
        endD={5.8,5.8},
        L=724,
        ZL=110.5,
        showDataInIcon=false,
        ZR=110,
        endL={0,0},
        n=4)    annotation (Placement(transformation(extent={{40,-46},{60,-26}})));
      HydroPower.ElectricalSystems.PowerGrid
                                  powerGrid(
        distTgen={150,1e6,1e6},
        loadDiv={0.5,0.25,0.25},
        loadT={0.5,1,2},
        NoLoadUnits={2000,4000,10000},
        distTload={1e6,1e6,1e6},
        distNoLoad={0,0,0},
        prodDiv={0.45,0.45,0.1},
        prodT={120,15,5},
        ep={0.5,0.08,0.04},
        unitsJ={122000,5.5e6,8000},
        NoGenUnits={90,100,500},
        distNoGen={-15,0,0})    annotation (Placement(transformation(extent={{-20,20},{0,40}},
                          rotation=0)));
      Modelica.Blocks.Sources.Ramp pwr_ref(
        duration=10,
        height=0,
        startTime=1e6,
        offset=20e6)   annotation (Placement(transformation(extent={{20,60},{40,80}},
                      rotation=0)));
      HydroPower.ElectricalSystems.GeneratorAndMCB generator(
        np={12},
        timeMCB_close=ones(generator.n)*150,
        timeMCB_open=ones(generator.n)*250,
        f_start=0,
        J={212500},
        P_nom={103000000})
                      annotation (Placement(transformation(extent={{20,20},{40,40}},
                       rotation=0)));
      HydroPower.ControllersAndSensors.TurbineGovernorAnalog
                                                  turbineGovernor(
        ep=1,
        tRamp=40,
        P_generator_nom=generator.P_nom[1],
        enableRamp=false,
        Kd_noLoad=0.05,
        Kd_load=0.5,
        K_noLoad=0.2,
        K_load=0.4,
        Ki_load=0.1,
        Ki_noLoad=0.025)
                    annotation (Placement(transformation(extent={{50,20},{70,40}},
              rotation=0)));
      HydroPower.MechanicalSystems.BasicTurbine turbine(
        H_nom=460,
        LdraftTube=2.9,
        DavDraftTube=3,
        LscrollCase=15.7,
        DavScrollCasing=1.5,
        np=12,
        tableOnFile=true,
        PUInFlowTables=true,
        QTableName="Qtab",
        T_start(displayUnit="degC"),
        yvLim1=[-0.4,0.05],
        yvLim2=[-0.4,0.05],
        Q_nom=24.3,
        H_start=564 + 48,
        H_start_draftTube=115,
        effMech=1,
        TurbDmp0=0.01,
        TurbineDataFile=Modelica.Utilities.Files.loadResource(HydroPower.TABLE_DIR
             + "TurbineDataFile.mat"),
        P_nom=103000000)
        annotation (Placement(transformation(extent={{12,-40},{32,-20}})));
      inner HydroPower.System_HPL system_HPL(                  constantTemperature=true,
          steadyState=true)
        annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
    equation
      connect(reservoir.a2_pipe, conduit.a) annotation (Line(
          points={{-73,-18},{-67,-18}},
          color={0,0,255},
          smooth=Smooth.None));

      connect(powerGrid.f_grid,generator. f_grid)         annotation (Line(
          points={{1,23},{19,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(powerGrid.J_grid,generator. J_grid)         annotation (Line(
          points={{1,30},{19,30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(powerGrid.P_grid_balance,generator. P_grid_balance)
        annotation (Line(
          points={{1,37},{19,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(pwr_ref.y,turbineGovernor. P_reference) annotation (Line(
          points={{41,70},{54,70},{54,41}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.f_out[1],turbineGovernor. f) annotation (Line(
          points={{41,23},{49,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.onMCB,powerGrid. MCB) annotation (Line(
          points={{30,41},{30,48},{-10,48},{-10,41}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(generator.onMCB[1],turbineGovernor. isMCB) annotation (Line(
          points={{30,41},{30,48},{60,48},{60,41}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(generator.P_out[1],turbineGovernor. P_generator) annotation (Line(
          points={{41,37},{49,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.f_out,powerGrid. f) annotation (Line(
          points={{41,23},{46,23},{46,10},{-36,10},{-36,23},{-21,23}},
          color={0,0,127},
          smooth=Smooth.None));

      connect(turbine.b, downstream.a) annotation (Line(
          points={{33,-30},{36,-30},{36,-36},{39,-36}},
          color={0,0,255},
          smooth=Smooth.None));

      connect(turbine.TurbineData[1], generator.P_turbine[1]) annotation (Line(
          points={{22,-19.6667},{22,-19.6667},{22,19},{24,19}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(turbine.f_generator, generator.f_out[1]) annotation (Line(
          points={{16,-19},{16,10},{46,10},{46,23},{41,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(turbine.yGV, turbineGovernor.y) annotation (Line(
          points={{28,-19},{28,0},{80,0},{80,30},{71,30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(inTH.b, reservoir.a1_open) annotation (Line(points={{-90.8,10},{-98,10},{-98,-6},{-95,-6}},
                                                color={0,0,255}));
      connect(downstream.b, river.a1_pipe) annotation (Line(points={{61,-36},{61,-36},{69,-36}},
                                   color={0,0,255}));
      connect(river.a2_open, outTH.b) annotation (Line(points={{91,-24},{95.5,-24},{95.5,-60},{90.9,-60}},
                                  color={0,0,255}));
      connect(turbine.a, penstock.b) annotation (Line(points={{11,-30},{5,-30}}, color={0,0,255}));
      connect(penstock.a, surgeTank.b) annotation (Line(points={{-17,-30},{-18,-30},{-18,-18},{-19,-18}}, color={0,0,255}));
      connect(conduit.b, surgeTank.a) annotation (Line(points={{-45,-18},{-41,-18}}, color={0,0,255}));
    end Model_238801;

    model Model_238805
      extends Modelica.Icons.ReleaseNotes;

      HydroPower.HydroSystems.Pipe conduit(
        horizontalIcon=true,
        L=6600,
        endD={5.8,5.8},
        showDataInIcon=false,
        endL={0,0},
        n=4,
        ZL=154.5,
        ZR=456.5) annotation (Placement(transformation(extent={{-66,-28},{-46,-8}})));
      HydroPower.HydroSystems.Pipe penstock(
        endD={3,3},
        L=724,
        showDataInIcon=false,
        ZL=541.5,
        ZR=112.5,
        endL={0,0})
        annotation (Placement(transformation(extent={{-16,-40},{4,-20}})));
      HydroPower.HydroSystems.SurgeTank surgeTank(
        D=3.6,
        H2L=0.87,
        Vol=100,
        showDataInIcon=false,
        deltZ=40) annotation (Placement(transformation(extent={{-40,-28},{-20,-8}})));
      HydroPower.SinksAndSources.Fixed_HT inTH(
        depth=60,
        paraOption=false,
        H_const=48 + 564,
        Hmax=564 + 60)
        annotation (Placement(transformation(extent={{-74,2},{-90,18}})));
      HydroPower.HydroSystems.Reservoir reservoir(
        Hmax=564 + 60,
        depth=ones(reservoir.n)*60,
        H_start=48 + 564,
        MidWidth=200,
        SideWidth=100,
        L=100,
        depthIntake={0,0},
        Krough=100,
        pWb=1,
        k=2,
        steadyState=false)
        annotation (Placement(transformation(extent={{-94,-22},{-74,-2}})));
      HydroPower.SinksAndSources.Fixed_HT outTH(
        paraOption=false,
        H_const=115,
        Hmax=130,
        depth=20)
        annotation (Placement(transformation(extent={{72,-52},{90,-68}})));
      HydroPower.HydroSystems.Reservoir river(
        H_start=115,
        MidWidth=200,
        SideWidth=100,
        L=100,
        depthIntake={0,0},
        pWb=1,
        k=2,
        Hmax=130,
        depth=ones(river.n)*20)
               annotation (Placement(transformation(extent={{70,-40},{90,-20}})));
      HydroPower.HydroSystems.Pipe downstream(
        horizontalIcon=true,
        endD={5.8,5.8},
        L=724,
        ZL=110.5,
        showDataInIcon=false,
        ZR=110,
        endL={0,0},
        n=4)    annotation (Placement(transformation(extent={{40,-46},{60,-26}})));
      HydroPower.ElectricalSystems.PowerGrid
                                  powerGrid(
        distTgen={150,1e6,1e6},
        loadDiv={0.5,0.25,0.25},
        loadT={0.5,1,2},
        NoLoadUnits={2000,4000,10000},
        distTload={1e6,1e6,1e6},
        distNoLoad={0,0,0},
        prodDiv={0.45,0.45,0.1},
        prodT={120,15,5},
        ep={0.5,0.08,0.04},
        unitsJ={122000,5.5e6,8000},
        NoGenUnits={90,100,500},
        distNoGen={-13,0,0})    annotation (Placement(transformation(extent={{-20,20},{0,40}},
                          rotation=0)));
      Modelica.Blocks.Sources.Ramp pwr_ref(
        duration=10,
        height=0,
        startTime=1e6,
        offset=30e6)   annotation (Placement(transformation(extent={{20,60},{40,80}},
                      rotation=0)));
      HydroPower.ElectricalSystems.GeneratorAndMCB generator(
        np={12},
        timeMCB_close=ones(generator.n)*150,
        timeMCB_open=ones(generator.n)*250,
        f_start=0,
        J={212500},
        P_nom={103000000})
                      annotation (Placement(transformation(extent={{20,20},{40,40}},
                       rotation=0)));
      HydroPower.ControllersAndSensors.TurbineGovernorAnalog
                                                  turbineGovernor(
        ep=1,
        tRamp=40,
        P_generator_nom=generator.P_nom[1],
        enableRamp=false,
        Kd_noLoad=0.05,
        Kd_load=0.5,
        K_noLoad=0.2,
        K_load=0.4,
        Ki_load=0.1,
        Ki_noLoad=0.025)
                    annotation (Placement(transformation(extent={{50,20},{70,40}},
              rotation=0)));
      HydroPower.MechanicalSystems.BasicTurbine turbine(
        H_nom=460,
        LdraftTube=2.9,
        DavDraftTube=3,
        LscrollCase=15.7,
        DavScrollCasing=1.5,
        np=12,
        tableOnFile=true,
        PUInFlowTables=true,
        QTableName="Qtab",
        T_start(displayUnit="degC"),
        yvLim1=[-0.4,0.05],
        yvLim2=[-0.4,0.05],
        Q_nom=24.3,
        H_start=564 + 48,
        H_start_draftTube=115,
        effMech=1,
        TurbDmp0=0.01,
        TurbineDataFile=Modelica.Utilities.Files.loadResource(HydroPower.TABLE_DIR
             + "TurbineDataFile.mat"),
        P_nom=103000000)
        annotation (Placement(transformation(extent={{12,-40},{32,-20}})));
      inner HydroPower.System_HPL system_HPL(                  constantTemperature=true,
          steadyState=true)
        annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
    equation
      connect(reservoir.a2_pipe, conduit.a) annotation (Line(
          points={{-73,-18},{-67,-18}},
          color={0,0,255},
          smooth=Smooth.None));

      connect(powerGrid.f_grid,generator. f_grid)         annotation (Line(
          points={{1,23},{19,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(powerGrid.J_grid,generator. J_grid)         annotation (Line(
          points={{1,30},{19,30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(powerGrid.P_grid_balance,generator. P_grid_balance)
        annotation (Line(
          points={{1,37},{19,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(pwr_ref.y,turbineGovernor. P_reference) annotation (Line(
          points={{41,70},{54,70},{54,41}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.f_out[1],turbineGovernor. f) annotation (Line(
          points={{41,23},{49,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.onMCB,powerGrid. MCB) annotation (Line(
          points={{30,41},{30,48},{-10,48},{-10,41}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(generator.onMCB[1],turbineGovernor. isMCB) annotation (Line(
          points={{30,41},{30,48},{60,48},{60,41}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(generator.P_out[1],turbineGovernor. P_generator) annotation (Line(
          points={{41,37},{49,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.f_out,powerGrid. f) annotation (Line(
          points={{41,23},{46,23},{46,10},{-36,10},{-36,23},{-21,23}},
          color={0,0,127},
          smooth=Smooth.None));

      connect(turbine.b, downstream.a) annotation (Line(
          points={{33,-30},{36,-30},{36,-36},{39,-36}},
          color={0,0,255},
          smooth=Smooth.None));

      connect(turbine.TurbineData[1], generator.P_turbine[1]) annotation (Line(
          points={{22,-19.6667},{22,-19.6667},{22,19},{24,19}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(turbine.f_generator, generator.f_out[1]) annotation (Line(
          points={{16,-19},{16,10},{46,10},{46,23},{41,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(turbine.yGV, turbineGovernor.y) annotation (Line(
          points={{28,-19},{28,0},{80,0},{80,30},{71,30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(inTH.b, reservoir.a1_open) annotation (Line(points={{-90.8,10},{-98,10},{-98,-6},{-95,-6}},
                                                color={0,0,255}));
      connect(downstream.b, river.a1_pipe) annotation (Line(points={{61,-36},{61,-36},{69,-36}},
                                   color={0,0,255}));
      connect(river.a2_open, outTH.b) annotation (Line(points={{91,-24},{95.5,-24},{95.5,-60},{90.9,-60}},
                                  color={0,0,255}));
      connect(turbine.a, penstock.b) annotation (Line(points={{11,-30},{5,-30}}, color={0,0,255}));
      connect(penstock.a, surgeTank.b) annotation (Line(points={{-17,-30},{-18,-30},{-18,-18},{-19,-18}}, color={0,0,255}));
      connect(conduit.b, surgeTank.a) annotation (Line(points={{-45,-18},{-41,-18}}, color={0,0,255}));
    end Model_238805;

    model Model_238813
      extends Modelica.Icons.ReleaseNotes;

      HydroPower.HydroSystems.Pipe conduit(
        horizontalIcon=true,
        L=6600,
        endD={5.8,5.8},
        showDataInIcon=false,
        ZL=564,
        endL={0,0},
        n=4,
        ZR=252.5) annotation (Placement(transformation(extent={{-66,-28},{-46,-8}})));
      HydroPower.HydroSystems.Pipe penstock(
        endD={3,3},
        L=724,
        showDataInIcon=false,
        ZL=541.5,
        ZR=112.5,
        endL={0,0})
        annotation (Placement(transformation(extent={{-16,-40},{4,-20}})));
      HydroPower.HydroSystems.SurgeTank surgeTank(
        D=3.6,
        H2L=0.87,
        Vol=100,
        showDataInIcon=false,
        deltZ=40) annotation (Placement(transformation(extent={{-40,-28},{-20,-8}})));
      HydroPower.SinksAndSources.Fixed_HT inTH(
        depth=60,
        paraOption=false,
        H_const=48 + 564,
        Hmax=564 + 60)
        annotation (Placement(transformation(extent={{-74,2},{-90,18}})));
      HydroPower.HydroSystems.Reservoir reservoir(
        Hmax=564 + 60,
        depth=ones(reservoir.n)*60,
        H_start=48 + 564,
        MidWidth=200,
        SideWidth=100,
        L=100,
        depthIntake={0,0},
        Krough=100,
        pWb=1,
        k=2,
        steadyState=false)
        annotation (Placement(transformation(extent={{-94,-22},{-74,-2}})));
      HydroPower.SinksAndSources.Fixed_HT outTH(
        paraOption=false,
        H_const=115,
        Hmax=130,
        depth=20)
        annotation (Placement(transformation(extent={{72,-52},{90,-68}})));
      HydroPower.HydroSystems.Reservoir river(
        H_start=115,
        MidWidth=200,
        SideWidth=100,
        L=100,
        depthIntake={0,0},
        pWb=1,
        k=2,
        Hmax=130,
        depth=ones(river.n)*20)
               annotation (Placement(transformation(extent={{70,-40},{90,-20}})));
      HydroPower.HydroSystems.Pipe downstream(
        horizontalIcon=true,
        endD={5.8,5.8},
        L=724,
        ZL=110.5,
        showDataInIcon=false,
        ZR=110,
        endL={0,0},
        n=4)    annotation (Placement(transformation(extent={{40,-46},{60,-26}})));
      HydroPower.ElectricalSystems.PowerGrid
                                  powerGrid(
        distTgen={150,1e6,1e6},
        loadDiv={0.5,0.25,0.25},
        loadT={0.5,1,2},
        NoLoadUnits={2000,4000,10000},
        distTload={1e6,1e6,1e6},
        distNoLoad={0,0,0},
        prodDiv={0.45,0.45,0.1},
        prodT={120,15,5},
        ep={0.5,0.08,0.04},
        unitsJ={122000,5.5e6,8000},
        NoGenUnits={90,100,500},
        distNoGen={-14,0,0})    annotation (Placement(transformation(extent={{-20,20},{0,40}},
                          rotation=0)));
      Modelica.Blocks.Sources.Ramp pwr_ref(
        duration=10,
        height=0,
        startTime=1e6,
        offset=25e6)   annotation (Placement(transformation(extent={{20,60},{40,80}},
                      rotation=0)));
      HydroPower.ElectricalSystems.GeneratorAndMCB generator(
        np={12},
        timeMCB_close=ones(generator.n)*150,
        timeMCB_open=ones(generator.n)*250,
        f_start=0,
        J={212500},
        P_nom={103000000})
                      annotation (Placement(transformation(extent={{20,20},{40,40}},
                       rotation=0)));
      HydroPower.ControllersAndSensors.TurbineGovernorAnalog
                                                  turbineGovernor(
        ep=1,
        tRamp=40,
        P_generator_nom=generator.P_nom[1],
        enableRamp=false,
        Kd_noLoad=0.05,
        Kd_load=0.5,
        K_noLoad=0.2,
        K_load=0.4,
        Ki_load=0.1,
        Ki_noLoad=0.025)
                    annotation (Placement(transformation(extent={{50,20},{70,40}},
              rotation=0)));
      HydroPower.MechanicalSystems.BasicTurbine turbine(
        H_nom=460,
        LdraftTube=2.9,
        DavDraftTube=3,
        LscrollCase=15.7,
        DavScrollCasing=1.5,
        np=12,
        tableOnFile=true,
        PUInFlowTables=true,
        QTableName="Qtab",
        T_start(displayUnit="degC"),
        yvLim1=[-0.4,0.05],
        yvLim2=[-0.4,0.05],
        Q_nom=24.3,
        H_start=564 + 48,
        H_start_draftTube=115,
        effMech=1,
        TurbDmp0=0.01,
        TurbineDataFile=Modelica.Utilities.Files.loadResource(HydroPower.TABLE_DIR
             + "TurbineDataFile.mat"),
        P_nom=103000000)
        annotation (Placement(transformation(extent={{12,-40},{32,-20}})));
      inner HydroPower.System_HPL system_HPL(                  constantTemperature=true,
          steadyState=true)
        annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
    equation
      connect(reservoir.a2_pipe, conduit.a) annotation (Line(
          points={{-73,-18},{-67,-18}},
          color={0,0,255},
          smooth=Smooth.None));

      connect(powerGrid.f_grid,generator. f_grid)         annotation (Line(
          points={{1,23},{19,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(powerGrid.J_grid,generator. J_grid)         annotation (Line(
          points={{1,30},{19,30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(powerGrid.P_grid_balance,generator. P_grid_balance)
        annotation (Line(
          points={{1,37},{19,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(pwr_ref.y,turbineGovernor. P_reference) annotation (Line(
          points={{41,70},{54,70},{54,41}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.f_out[1],turbineGovernor. f) annotation (Line(
          points={{41,23},{49,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.onMCB,powerGrid. MCB) annotation (Line(
          points={{30,41},{30,48},{-10,48},{-10,41}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(generator.onMCB[1],turbineGovernor. isMCB) annotation (Line(
          points={{30,41},{30,48},{60,48},{60,41}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(generator.P_out[1],turbineGovernor. P_generator) annotation (Line(
          points={{41,37},{49,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.f_out,powerGrid. f) annotation (Line(
          points={{41,23},{46,23},{46,10},{-36,10},{-36,23},{-21,23}},
          color={0,0,127},
          smooth=Smooth.None));

      connect(turbine.b, downstream.a) annotation (Line(
          points={{33,-30},{36,-30},{36,-36},{39,-36}},
          color={0,0,255},
          smooth=Smooth.None));

      connect(turbine.TurbineData[1], generator.P_turbine[1]) annotation (Line(
          points={{22,-19.6667},{22,-19.6667},{22,19},{24,19}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(turbine.f_generator, generator.f_out[1]) annotation (Line(
          points={{16,-19},{16,10},{46,10},{46,23},{41,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(turbine.yGV, turbineGovernor.y) annotation (Line(
          points={{28,-19},{28,0},{80,0},{80,30},{71,30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(inTH.b, reservoir.a1_open) annotation (Line(points={{-90.8,10},{-98,10},{-98,-6},{-95,-6}},
                                                color={0,0,255}));
      connect(downstream.b, river.a1_pipe) annotation (Line(points={{61,-36},{61,-36},{69,-36}},
                                   color={0,0,255}));
      connect(river.a2_open, outTH.b) annotation (Line(points={{91,-24},{95.5,-24},{95.5,-60},{90.9,-60}},
                                  color={0,0,255}));
      connect(turbine.a, penstock.b) annotation (Line(points={{11,-30},{5,-30}}, color={0,0,255}));
      connect(penstock.a, surgeTank.b) annotation (Line(points={{-17,-30},{-18,-30},{-18,-18},{-19,-18}}, color={0,0,255}));
      connect(conduit.b, surgeTank.a) annotation (Line(points={{-45,-18},{-41,-18}}, color={0,0,255}));
    end Model_238813;

    model Model_238817
      extends Modelica.Icons.ReleaseNotes;

      HydroPower.HydroSystems.Pipe conduit(
        horizontalIcon=true,
        L=6600,
        endD={5.8,5.8},
        showDataInIcon=false,
        ZL=564,
        endL={0,0},
        n=4,
        ZR=541.5) annotation (Placement(transformation(extent={{-66,-28},{-46,-8}})));
      HydroPower.HydroSystems.Pipe penstock(
        endD={3,3},
        L=724,
        showDataInIcon=false,
        ZL=541.5,
        ZR=112.5,
        endL={0,0})
        annotation (Placement(transformation(extent={{-16,-40},{4,-20}})));
      HydroPower.HydroSystems.SurgeTank surgeTank(
        D=3.6,
        H2L=0.87,
        Vol=100,
        showDataInIcon=false,
        deltZ=40) annotation (Placement(transformation(extent={{-40,-28},{-20,-8}})));
      HydroPower.SinksAndSources.Fixed_HT inTH(
        depth=60,
        paraOption=false,
        H_const=48 + 564,
        Hmax=564 + 60)
        annotation (Placement(transformation(extent={{-74,2},{-90,18}})));
      HydroPower.HydroSystems.Reservoir reservoir(
        Hmax=564 + 60,
        depth=ones(reservoir.n)*60,
        H_start=48 + 564,
        MidWidth=200,
        SideWidth=100,
        L=100,
        depthIntake={0,0},
        Krough=100,
        pWb=1,
        k=2,
        steadyState=false)
        annotation (Placement(transformation(extent={{-94,-22},{-74,-2}})));
      HydroPower.SinksAndSources.Fixed_HT outTH(
        paraOption=false,
        H_const=115,
        Hmax=130,
        depth=20)
        annotation (Placement(transformation(extent={{72,-52},{90,-68}})));
      HydroPower.HydroSystems.Reservoir river(
        H_start=115,
        MidWidth=200,
        SideWidth=100,
        L=100,
        depthIntake={0,0},
        pWb=1,
        k=2,
        Hmax=130,
        depth=ones(river.n)*20)
               annotation (Placement(transformation(extent={{70,-40},{90,-20}})));
      HydroPower.HydroSystems.Pipe downstream(
        horizontalIcon=true,
        endD={5.8,5.8},
        L=724,
        ZL=110.5,
        showDataInIcon=false,
        endL={0,0},
        n=4,
        ZR=315) annotation (Placement(transformation(extent={{40,-46},{60,-26}})));
      HydroPower.ElectricalSystems.PowerGrid
                                  powerGrid(
        distTgen={150,1e6,1e6},
        loadDiv={0.5,0.25,0.25},
        loadT={0.5,1,2},
        NoLoadUnits={2000,4000,10000},
        distTload={1e6,1e6,1e6},
        distNoLoad={0,0,0},
        prodDiv={0.45,0.45,0.1},
        prodT={120,15,5},
        ep={0.5,0.08,0.04},
        unitsJ={122000,5.5e6,8000},
        NoGenUnits={90,100,500},
        distNoGen={-6,0,0})     annotation (Placement(transformation(extent={{-20,20},{0,40}},
                          rotation=0)));
      Modelica.Blocks.Sources.Ramp pwr_ref(
        duration=10,
        height=0,
        startTime=1e6,
        offset=65e6)   annotation (Placement(transformation(extent={{20,60},{40,80}},
                      rotation=0)));
      HydroPower.ElectricalSystems.GeneratorAndMCB generator(
        np={12},
        timeMCB_close=ones(generator.n)*150,
        timeMCB_open=ones(generator.n)*250,
        f_start=0,
        J={212500},
        P_nom={103000000})
                      annotation (Placement(transformation(extent={{20,20},{40,40}},
                       rotation=0)));
      HydroPower.ControllersAndSensors.TurbineGovernorAnalog
                                                  turbineGovernor(
        ep=1,
        tRamp=40,
        P_generator_nom=generator.P_nom[1],
        enableRamp=false,
        Kd_noLoad=0.05,
        Kd_load=0.5,
        K_noLoad=0.2,
        K_load=0.4,
        Ki_load=0.1,
        Ki_noLoad=0.025)
                    annotation (Placement(transformation(extent={{50,20},{70,40}},
              rotation=0)));
      HydroPower.MechanicalSystems.BasicTurbine turbine(
        H_nom=460,
        LdraftTube=2.9,
        DavDraftTube=3,
        LscrollCase=15.7,
        DavScrollCasing=1.5,
        np=12,
        tableOnFile=true,
        PUInFlowTables=true,
        QTableName="Qtab",
        T_start(displayUnit="degC"),
        yvLim1=[-0.4,0.05],
        yvLim2=[-0.4,0.05],
        Q_nom=24.3,
        H_start=564 + 48,
        H_start_draftTube=115,
        effMech=1,
        TurbDmp0=0.01,
        TurbineDataFile=Modelica.Utilities.Files.loadResource(HydroPower.TABLE_DIR
             + "TurbineDataFile.mat"),
        P_nom=103000000)
        annotation (Placement(transformation(extent={{12,-40},{32,-20}})));
      inner HydroPower.System_HPL system_HPL(                  constantTemperature=true,
          steadyState=true)
        annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
    equation
      connect(reservoir.a2_pipe, conduit.a) annotation (Line(
          points={{-73,-18},{-67,-18}},
          color={0,0,255},
          smooth=Smooth.None));

      connect(powerGrid.f_grid,generator. f_grid)         annotation (Line(
          points={{1,23},{19,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(powerGrid.J_grid,generator. J_grid)         annotation (Line(
          points={{1,30},{19,30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(powerGrid.P_grid_balance,generator. P_grid_balance)
        annotation (Line(
          points={{1,37},{19,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(pwr_ref.y,turbineGovernor. P_reference) annotation (Line(
          points={{41,70},{54,70},{54,41}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.f_out[1],turbineGovernor. f) annotation (Line(
          points={{41,23},{49,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.onMCB,powerGrid. MCB) annotation (Line(
          points={{30,41},{30,48},{-10,48},{-10,41}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(generator.onMCB[1],turbineGovernor. isMCB) annotation (Line(
          points={{30,41},{30,48},{60,48},{60,41}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(generator.P_out[1],turbineGovernor. P_generator) annotation (Line(
          points={{41,37},{49,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.f_out,powerGrid. f) annotation (Line(
          points={{41,23},{46,23},{46,10},{-36,10},{-36,23},{-21,23}},
          color={0,0,127},
          smooth=Smooth.None));

      connect(turbine.b, downstream.a) annotation (Line(
          points={{33,-30},{36,-30},{36,-36},{39,-36}},
          color={0,0,255},
          smooth=Smooth.None));

      connect(turbine.TurbineData[1], generator.P_turbine[1]) annotation (Line(
          points={{22,-19.6667},{22,19}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(turbine.f_generator, generator.f_out[1]) annotation (Line(
          points={{16,-19},{16,10},{46,10},{46,23},{41,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(turbine.yGV, turbineGovernor.y) annotation (Line(
          points={{28,-19},{28,0},{80,0},{80,30},{71,30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(inTH.b, reservoir.a1_open) annotation (Line(points={{-90.8,10},{-98,10},{-98,-6},{-95,-6}},
                                                color={0,0,255}));
      connect(downstream.b, river.a1_pipe) annotation (Line(points={{61,-36},{61,-36},{69,-36}},
                                   color={0,0,255}));
      connect(river.a2_open, outTH.b) annotation (Line(points={{91,-24},{95.5,-24},{95.5,-60},{90.9,-60}},
                                  color={0,0,255}));
      connect(turbine.a, penstock.b) annotation (Line(points={{11,-30},{5,-30}}, color={0,0,255}));
      connect(penstock.a, surgeTank.b) annotation (Line(points={{-17,-30},{-18,-30},{-18,-18},{-19,-18}}, color={0,0,255}));
      connect(conduit.b, surgeTank.a) annotation (Line(points={{-45,-18},{-41,-18}}, color={0,0,255}));
    end Model_238817;

    model Model_238941
      extends Modelica.Icons.ReleaseNotes;

      HydroPower.HydroSystems.Pipe conduit(
        horizontalIcon=true,
        L=6600,
        endD={5.8,5.8},
        showDataInIcon=false,
        endL={0,0},
        n=4,
        ZL=345.5,
        ZR=641.5) annotation (Placement(transformation(extent={{-66,-28},{-46,-8}})));
      HydroPower.HydroSystems.Pipe penstock(
        endD={3,3},
        L=724,
        showDataInIcon=false,
        ZL=541.5,
        ZR=112.5,
        endL={0,0})
        annotation (Placement(transformation(extent={{-16,-40},{4,-20}})));
      HydroPower.HydroSystems.SurgeTank surgeTank(
        D=3.6,
        H2L=0.87,
        Vol=100,
        showDataInIcon=false,
        deltZ=40) annotation (Placement(transformation(extent={{-40,-28},{-20,-8}})));
      HydroPower.SinksAndSources.Fixed_HT inTH(
        depth=60,
        paraOption=false,
        H_const=48 + 564,
        Hmax=564 + 60)
        annotation (Placement(transformation(extent={{-74,2},{-90,18}})));
      HydroPower.HydroSystems.Reservoir reservoir(
        Hmax=564 + 60,
        depth=ones(reservoir.n)*60,
        H_start=48 + 564,
        MidWidth=200,
        SideWidth=100,
        L=100,
        depthIntake={0,0},
        Krough=100,
        pWb=1,
        k=2,
        steadyState=false)
        annotation (Placement(transformation(extent={{-94,-22},{-74,-2}})));
      HydroPower.SinksAndSources.Fixed_HT outTH(
        paraOption=false,
        H_const=115,
        Hmax=130,
        depth=20)
        annotation (Placement(transformation(extent={{72,-52},{90,-68}})));
      HydroPower.HydroSystems.Reservoir river(
        H_start=115,
        MidWidth=200,
        SideWidth=100,
        L=100,
        depthIntake={0,0},
        pWb=1,
        k=2,
        Hmax=130,
        depth=ones(river.n)*20)
               annotation (Placement(transformation(extent={{70,-40},{90,-20}})));
      HydroPower.HydroSystems.Pipe downstream(
        horizontalIcon=true,
        endD={5.8,5.8},
        L=724,
        ZL=110.5,
        showDataInIcon=false,
        ZR=110,
        endL={0,0},
        n=4)    annotation (Placement(transformation(extent={{40,-46},{60,-26}})));
      HydroPower.ElectricalSystems.PowerGrid
                                  powerGrid(
        distTgen={150,1e6,1e6},
        loadDiv={0.5,0.25,0.25},
        loadT={0.5,1,2},
        NoLoadUnits={2000,4000,10000},
        distTload={1e6,1e6,1e6},
        distNoLoad={0,0,0},
        prodDiv={0.45,0.45,0.1},
        prodT={120,15,5},
        ep={0.5,0.08,0.04},
        unitsJ={122000,5.5e6,8000},
        NoGenUnits={90,100,500},
        distNoGen={-9,0,0})     annotation (Placement(transformation(extent={{-20,20},{0,40}},
                          rotation=0)));
      Modelica.Blocks.Sources.Ramp pwr_ref(
        duration=10,
        height=0,
        startTime=1e6,
        offset=50e6)   annotation (Placement(transformation(extent={{20,60},{40,80}},
                      rotation=0)));
      HydroPower.ElectricalSystems.GeneratorAndMCB generator(
        np={12},
        timeMCB_close=ones(generator.n)*150,
        timeMCB_open=ones(generator.n)*250,
        f_start=0,
        J={212500},
        P_nom={103000000})
                      annotation (Placement(transformation(extent={{20,20},{40,40}},
                       rotation=0)));
      HydroPower.ControllersAndSensors.TurbineGovernorAnalog
                                                  turbineGovernor(
        ep=1,
        tRamp=40,
        P_generator_nom=generator.P_nom[1],
        enableRamp=false,
        Kd_noLoad=0.05,
        Kd_load=0.5,
        K_noLoad=0.2,
        K_load=0.4,
        Ki_load=0.1,
        Ki_noLoad=0.025)
                    annotation (Placement(transformation(extent={{50,20},{70,40}},
              rotation=0)));
      HydroPower.MechanicalSystems.BasicTurbine turbine(
        H_nom=460,
        LdraftTube=2.9,
        DavDraftTube=3,
        LscrollCase=15.7,
        DavScrollCasing=1.5,
        np=12,
        tableOnFile=true,
        PUInFlowTables=true,
        QTableName="Qtab",
        T_start(displayUnit="degC"),
        yvLim1=[-0.4,0.05],
        yvLim2=[-0.4,0.05],
        Q_nom=24.3,
        H_start=564 + 48,
        H_start_draftTube=115,
        effMech=1,
        TurbDmp0=0.01,
        TurbineDataFile=Modelica.Utilities.Files.loadResource(HydroPower.TABLE_DIR
             + "TurbineDataFile.mat"),
        P_nom=103000000)
        annotation (Placement(transformation(extent={{12,-40},{32,-20}})));
      inner HydroPower.System_HPL system_HPL(                  constantTemperature=true,
          steadyState=true)
        annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
    equation
      connect(reservoir.a2_pipe, conduit.a) annotation (Line(
          points={{-73,-18},{-67,-18}},
          color={0,0,255},
          smooth=Smooth.None));

      connect(powerGrid.f_grid,generator. f_grid)         annotation (Line(
          points={{1,23},{19,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(powerGrid.J_grid,generator. J_grid)         annotation (Line(
          points={{1,30},{19,30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(powerGrid.P_grid_balance,generator. P_grid_balance)
        annotation (Line(
          points={{1,37},{19,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(pwr_ref.y,turbineGovernor. P_reference) annotation (Line(
          points={{41,70},{54,70},{54,41}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.f_out[1],turbineGovernor. f) annotation (Line(
          points={{41,23},{49,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.onMCB,powerGrid. MCB) annotation (Line(
          points={{30,41},{30,48},{-10,48},{-10,41}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(generator.onMCB[1],turbineGovernor. isMCB) annotation (Line(
          points={{30,41},{30,48},{60,48},{60,41}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(generator.P_out[1],turbineGovernor. P_generator) annotation (Line(
          points={{41,37},{49,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.f_out,powerGrid. f) annotation (Line(
          points={{41,23},{46,23},{46,10},{-36,10},{-36,23},{-21,23}},
          color={0,0,127},
          smooth=Smooth.None));

      connect(turbine.b, downstream.a) annotation (Line(
          points={{33,-30},{36,-30},{36,-36},{39,-36}},
          color={0,0,255},
          smooth=Smooth.None));

      connect(turbine.TurbineData[1], generator.P_turbine[1]) annotation (Line(
          points={{22,-19.6667},{22,19}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(turbine.f_generator, generator.f_out[1]) annotation (Line(
          points={{16,-19},{16,10},{46,10},{46,23},{41,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(turbine.yGV, turbineGovernor.y) annotation (Line(
          points={{28,-19},{28,0},{80,0},{80,30},{71,30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(inTH.b, reservoir.a1_open) annotation (Line(points={{-90.8,10},{-98,10},{-98,-6},{-95,-6}},
                                                color={0,0,255}));
      connect(downstream.b, river.a1_pipe) annotation (Line(points={{61,-36},{61,-36},{69,-36}},
                                   color={0,0,255}));
      connect(river.a2_open, outTH.b) annotation (Line(points={{91,-24},{95.5,-24},{95.5,-60},{90.9,-60}},
                                  color={0,0,255}));
      connect(turbine.a, penstock.b) annotation (Line(points={{11,-30},{5,-30}}, color={0,0,255}));
      connect(penstock.a, surgeTank.b) annotation (Line(points={{-17,-30},{-18,-30},{-18,-18},{-19,-18}}, color={0,0,255}));
      connect(conduit.b, surgeTank.a) annotation (Line(points={{-45,-18},{-41,-18}}, color={0,0,255}));
    end Model_238941;

    model Model_245322
      extends Modelica.Icons.ReleaseNotes;

      HydroPower.HydroSystems.Pipe conduit(
        horizontalIcon=true,
        L=6600,
        endD={5.8,5.8},
        showDataInIcon=false,
        ZL=564,
        endL={0,0},
        n=4,
        ZR=451.5) annotation (Placement(transformation(extent={{-66,-28},{-46,-8}})));
      HydroPower.HydroSystems.Pipe penstock(
        endD={3,3},
        L=724,
        showDataInIcon=false,
        ZL=541.5,
        ZR=112.5,
        endL={0,0})
        annotation (Placement(transformation(extent={{-16,-40},{4,-20}})));
      HydroPower.HydroSystems.SurgeTank surgeTank(
        D=3.6,
        H2L=0.87,
        Vol=100,
        showDataInIcon=false,
        deltZ=40) annotation (Placement(transformation(extent={{-40,-28},{-20,-8}})));
      HydroPower.SinksAndSources.Fixed_HT inTH(
        depth=60,
        paraOption=false,
        H_const=48 + 564,
        Hmax=564 + 60)
        annotation (Placement(transformation(extent={{-74,2},{-90,18}})));
      HydroPower.HydroSystems.Reservoir reservoir(
        Hmax=564 + 60,
        depth=ones(reservoir.n)*60,
        H_start=48 + 564,
        MidWidth=200,
        SideWidth=100,
        L=100,
        depthIntake={0,0},
        Krough=100,
        pWb=1,
        k=2,
        steadyState=false)
        annotation (Placement(transformation(extent={{-94,-22},{-74,-2}})));
      HydroPower.SinksAndSources.Fixed_HT outTH(
        paraOption=false,
        H_const=115,
        Hmax=130,
        depth=20)
        annotation (Placement(transformation(extent={{72,-52},{90,-68}})));
      HydroPower.HydroSystems.Reservoir river(
        H_start=115,
        MidWidth=200,
        SideWidth=100,
        L=100,
        depthIntake={0,0},
        pWb=1,
        k=2,
        Hmax=130,
        depth=ones(river.n)*20)
               annotation (Placement(transformation(extent={{70,-40},{90,-20}})));
      HydroPower.HydroSystems.Pipe downstream(
        horizontalIcon=true,
        endD={5.8,5.8},
        L=724,
        ZL=110.5,
        showDataInIcon=false,
        ZR=110,
        endL={0,0},
        n=4)    annotation (Placement(transformation(extent={{40,-46},{60,-26}})));
      HydroPower.ElectricalSystems.PowerGrid
                                  powerGrid(
        distTgen={150,1e6,1e6},
        loadDiv={0.5,0.25,0.25},
        loadT={0.5,1,2},
        NoLoadUnits={2000,4000,10000},
        distTload={1e6,1e6,1e6},
        distNoLoad={0,0,0},
        prodDiv={0.45,0.45,0.1},
        prodT={120,15,5},
        ep={0.5,0.08,0.04},
        unitsJ={122000,5.5e6,8000},
        NoGenUnits={90,100,500},
        distNoGen={-17,0,0})    annotation (Placement(transformation(extent={{-20,20},{0,40}},
                          rotation=0)));
      Modelica.Blocks.Sources.Ramp pwr_ref(
        duration=10,
        height=0,
        startTime=1e6,
        offset=10e6)   annotation (Placement(transformation(extent={{20,60},{40,80}},
                      rotation=0)));
      HydroPower.ElectricalSystems.GeneratorAndMCB generator(
        np={12},
        timeMCB_close=ones(generator.n)*150,
        timeMCB_open=ones(generator.n)*250,
        f_start=0,
        J={212500},
        P_nom={103000000})
                      annotation (Placement(transformation(extent={{20,20},{40,40}},
                       rotation=0)));
      HydroPower.ControllersAndSensors.TurbineGovernorAnalog
                                                  turbineGovernor(
        ep=1,
        tRamp=40,
        P_generator_nom=generator.P_nom[1],
        enableRamp=false,
        Kd_noLoad=0.05,
        Kd_load=0.5,
        K_noLoad=0.2,
        K_load=0.4,
        Ki_load=0.1,
        Ki_noLoad=0.025)
                    annotation (Placement(transformation(extent={{50,20},{70,40}},
              rotation=0)));
      HydroPower.MechanicalSystems.BasicTurbine turbine(
        H_nom=460,
        LdraftTube=2.9,
        DavDraftTube=3,
        LscrollCase=15.7,
        DavScrollCasing=1.5,
        np=12,
        tableOnFile=true,
        PUInFlowTables=true,
        QTableName="Qtab",
        T_start(displayUnit="degC"),
        yvLim1=[-0.4,0.05],
        yvLim2=[-0.4,0.05],
        Q_nom=24.3,
        H_start=564 + 48,
        H_start_draftTube=115,
        effMech=1,
        TurbDmp0=0.01,
        TurbineDataFile=Modelica.Utilities.Files.loadResource(HydroPower.TABLE_DIR
             + "TurbineDataFile.mat"),
        P_nom=103000000)
        annotation (Placement(transformation(extent={{12,-40},{32,-20}})));
      inner HydroPower.System_HPL system_HPL(                  constantTemperature=true,
          steadyState=true)
        annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
    equation
      connect(reservoir.a2_pipe, conduit.a) annotation (Line(
          points={{-73,-18},{-67,-18}},
          color={0,0,255},
          smooth=Smooth.None));

      connect(powerGrid.f_grid,generator. f_grid)         annotation (Line(
          points={{1,23},{19,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(powerGrid.J_grid,generator. J_grid)         annotation (Line(
          points={{1,30},{19,30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(powerGrid.P_grid_balance,generator. P_grid_balance)
        annotation (Line(
          points={{1,37},{19,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(pwr_ref.y,turbineGovernor. P_reference) annotation (Line(
          points={{41,70},{54,70},{54,41}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.f_out[1],turbineGovernor. f) annotation (Line(
          points={{41,23},{49,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.onMCB,powerGrid. MCB) annotation (Line(
          points={{30,41},{30,48},{-10,48},{-10,41}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(generator.onMCB[1],turbineGovernor. isMCB) annotation (Line(
          points={{30,41},{30,48},{60,48},{60,41}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(generator.P_out[1],turbineGovernor. P_generator) annotation (Line(
          points={{41,37},{49,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.f_out,powerGrid. f) annotation (Line(
          points={{41,23},{46,23},{46,10},{-36,10},{-36,23},{-21,23}},
          color={0,0,127},
          smooth=Smooth.None));

      connect(turbine.b, downstream.a) annotation (Line(
          points={{33,-30},{36,-30},{36,-36},{39,-36}},
          color={0,0,255},
          smooth=Smooth.None));

      connect(turbine.TurbineData[1], generator.P_turbine[1]) annotation (Line(
          points={{22,-19.6667},{22,-19.6667},{22,19},{24,19}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(turbine.f_generator, generator.f_out[1]) annotation (Line(
          points={{16,-19},{16,10},{46,10},{46,23},{41,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(turbine.yGV, turbineGovernor.y) annotation (Line(
          points={{28,-19},{28,0},{80,0},{80,30},{71,30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(inTH.b, reservoir.a1_open) annotation (Line(points={{-90.8,10},{-98,10},{-98,-6},{-95,-6}},
                                                color={0,0,255}));
      connect(downstream.b, river.a1_pipe) annotation (Line(points={{61,-36},{61,-36},{69,-36}},
                                   color={0,0,255}));
      connect(river.a2_open, outTH.b) annotation (Line(points={{91,-24},{95.5,-24},{95.5,-60},{90.9,-60}},
                                  color={0,0,255}));
      connect(turbine.a, penstock.b) annotation (Line(points={{11,-30},{5,-30}}, color={0,0,255}));
      connect(penstock.a, surgeTank.b) annotation (Line(points={{-17,-30},{-18,-30},{-18,-18},{-19,-18}}, color={0,0,255}));
      connect(conduit.b, surgeTank.a) annotation (Line(points={{-45,-18},{-41,-18}}, color={0,0,255}));
    end Model_245322;

    model Model_245861
      extends Modelica.Icons.ReleaseNotes;

      HydroPower.HydroSystems.Pipe conduit(
        horizontalIcon=true,
        L=6600,
        endD={5.8,5.8},
        showDataInIcon=false,
        ZL=564,
        endL={0,0},
        n=4,
        ZR=541.5) annotation (Placement(transformation(extent={{-66,-28},{-46,-8}})));
      HydroPower.HydroSystems.Pipe penstock(
        endD={3,3},
        L=724,
        showDataInIcon=false,
        ZL=541.5,
        ZR=112.5,
        endL={0,0})
        annotation (Placement(transformation(extent={{-16,-40},{4,-20}})));
      HydroPower.HydroSystems.SurgeTank surgeTank(
        D=3.6,
        H2L=0.87,
        Vol=100,
        showDataInIcon=false,
        deltZ=40) annotation (Placement(transformation(extent={{-40,-28},{-20,-8}})));
      HydroPower.SinksAndSources.Fixed_HT inTH(
        depth=60,
        paraOption=false,
        H_const=48 + 564,
        Hmax=564 + 60)
        annotation (Placement(transformation(extent={{-74,2},{-90,18}})));
      HydroPower.HydroSystems.Reservoir reservoir(
        Hmax=564 + 60,
        depth=ones(reservoir.n)*60,
        H_start=48 + 564,
        MidWidth=200,
        SideWidth=100,
        L=100,
        depthIntake={0,0},
        Krough=100,
        pWb=1,
        k=2,
        steadyState=false)
        annotation (Placement(transformation(extent={{-94,-22},{-74,-2}})));
      HydroPower.SinksAndSources.Fixed_HT outTH(
        paraOption=false,
        H_const=115,
        Hmax=130,
        depth=20)
        annotation (Placement(transformation(extent={{72,-52},{90,-68}})));
      HydroPower.HydroSystems.Reservoir river(
        H_start=115,
        MidWidth=200,
        SideWidth=100,
        L=100,
        depthIntake={0,0},
        pWb=1,
        k=2,
        Hmax=130,
        depth=ones(river.n)*20)
               annotation (Placement(transformation(extent={{70,-40},{90,-20}})));
      HydroPower.HydroSystems.Pipe downstream(
        horizontalIcon=true,
        endD={5.8,5.8},
        L=724,
        showDataInIcon=false,
        endL={0,0},
        n=4,
        ZL=115,
        ZR=641.5)
                annotation (Placement(transformation(extent={{40,-46},{60,-26}})));
      HydroPower.ElectricalSystems.PowerGrid
                                  powerGrid(
        distTgen={150,1e6,1e6},
        loadDiv={0.5,0.25,0.25},
        loadT={0.5,1,2},
        NoLoadUnits={2000,4000,10000},
        distTload={1e6,1e6,1e6},
        distNoLoad={0,0,0},
        prodDiv={0.45,0.45,0.1},
        prodT={120,15,5},
        ep={0.5,0.08,0.04},
        unitsJ={122000,5.5e6,8000},
        NoGenUnits={90,100,500},
        distNoGen={-1,0,0})     annotation (Placement(transformation(extent={{-20,20},{0,40}},
                          rotation=0)));
      Modelica.Blocks.Sources.Ramp pwr_ref(
        duration=10,
        height=0,
        startTime=1e6,
        offset=90e6)   annotation (Placement(transformation(extent={{20,60},{40,80}},
                      rotation=0)));
      HydroPower.ElectricalSystems.GeneratorAndMCB generator(
        np={12},
        timeMCB_close=ones(generator.n)*150,
        timeMCB_open=ones(generator.n)*250,
        f_start=0,
        J={212500},
        P_nom={103000000})
                      annotation (Placement(transformation(extent={{20,20},{40,40}},
                       rotation=0)));
      HydroPower.ControllersAndSensors.TurbineGovernorAnalog
                                                  turbineGovernor(
        ep=1,
        tRamp=40,
        P_generator_nom=generator.P_nom[1],
        enableRamp=false,
        Kd_noLoad=0.05,
        Kd_load=0.5,
        K_noLoad=0.2,
        K_load=0.4,
        Ki_load=0.1,
        Ki_noLoad=0.025)
                    annotation (Placement(transformation(extent={{50,20},{70,40}},
              rotation=0)));
      HydroPower.MechanicalSystems.BasicTurbine turbine(
        H_nom=460,
        LdraftTube=2.9,
        DavDraftTube=3,
        LscrollCase=15.7,
        DavScrollCasing=1.5,
        np=12,
        tableOnFile=true,
        PUInFlowTables=true,
        QTableName="Qtab",
        T_start(displayUnit="degC"),
        yvLim1=[-0.4,0.05],
        yvLim2=[-0.4,0.05],
        Q_nom=24.3,
        H_start=564 + 48,
        H_start_draftTube=115,
        effMech=1,
        TurbDmp0=0.01,
        TurbineDataFile=Modelica.Utilities.Files.loadResource(HydroPower.TABLE_DIR
             + "TurbineDataFile.mat"),
        P_nom=103000000)
        annotation (Placement(transformation(extent={{12,-40},{32,-20}})));
      inner HydroPower.System_HPL system_HPL(                  constantTemperature=true,
          steadyState=true)
        annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
    equation
      connect(reservoir.a2_pipe, conduit.a) annotation (Line(
          points={{-73,-18},{-67,-18}},
          color={0,0,255},
          smooth=Smooth.None));

      connect(powerGrid.f_grid,generator. f_grid)         annotation (Line(
          points={{1,23},{19,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(powerGrid.J_grid,generator. J_grid)         annotation (Line(
          points={{1,30},{19,30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(powerGrid.P_grid_balance,generator. P_grid_balance)
        annotation (Line(
          points={{1,37},{19,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(pwr_ref.y,turbineGovernor. P_reference) annotation (Line(
          points={{41,70},{54,70},{54,41}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.f_out[1],turbineGovernor. f) annotation (Line(
          points={{41,23},{49,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.onMCB,powerGrid. MCB) annotation (Line(
          points={{30,41},{30,48},{-10,48},{-10,41}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(generator.onMCB[1],turbineGovernor. isMCB) annotation (Line(
          points={{30,41},{30,48},{60,48},{60,41}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(generator.P_out[1],turbineGovernor. P_generator) annotation (Line(
          points={{41,37},{49,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.f_out,powerGrid. f) annotation (Line(
          points={{41,23},{46,23},{46,10},{-36,10},{-36,23},{-21,23}},
          color={0,0,127},
          smooth=Smooth.None));

      connect(turbine.b, downstream.a) annotation (Line(
          points={{33,-30},{36,-30},{36,-36},{39,-36}},
          color={0,0,255},
          smooth=Smooth.None));

      connect(turbine.TurbineData[1], generator.P_turbine[1]) annotation (Line(
          points={{22,-19.6667},{22,-19.6667},{22,19},{24,19}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(turbine.f_generator, generator.f_out[1]) annotation (Line(
          points={{16,-19},{16,10},{46,10},{46,23},{41,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(turbine.yGV, turbineGovernor.y) annotation (Line(
          points={{28,-19},{28,0},{80,0},{80,30},{71,30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(inTH.b, reservoir.a1_open) annotation (Line(points={{-90.8,10},{-98,10},{-98,-6},{-95,-6}},
                                                color={0,0,255}));
      connect(downstream.b, river.a1_pipe) annotation (Line(points={{61,-36},{61,-36},{69,-36}},
                                   color={0,0,255}));
      connect(river.a2_open, outTH.b) annotation (Line(points={{91,-24},{95.5,-24},{95.5,-60},{90.9,-60}},
                                  color={0,0,255}));
      connect(turbine.a, penstock.b) annotation (Line(points={{11,-30},{5,-30}}, color={0,0,255}));
      connect(penstock.a, surgeTank.b) annotation (Line(points={{-17,-30},{-18,-30},{-18,-18},{-19,-18}}, color={0,0,255}));
      connect(conduit.b, surgeTank.a) annotation (Line(points={{-45,-18},{-41,-18}}, color={0,0,255}));
    end Model_245861;

    model Model_250971
      extends Modelica.Icons.ReleaseNotes;

      HydroPower.HydroSystems.Pipe conduit(
        horizontalIcon=true,
        L=6600,
        endD={5.8,5.8},
        showDataInIcon=false,
        endL={0,0},
        n=4,
        ZL=164.5,
        ZR=641.5) annotation (Placement(transformation(extent={{-66,-28},{-46,-8}})));
      HydroPower.HydroSystems.Pipe penstock(
        endD={3,3},
        L=724,
        showDataInIcon=false,
        ZL=541.5,
        ZR=112.5,
        endL={0,0})
        annotation (Placement(transformation(extent={{-16,-40},{4,-20}})));
      HydroPower.HydroSystems.SurgeTank surgeTank(
        D=3.6,
        H2L=0.87,
        Vol=100,
        showDataInIcon=false,
        deltZ=40) annotation (Placement(transformation(extent={{-40,-28},{-20,-8}})));
      HydroPower.SinksAndSources.Fixed_HT inTH(
        depth=60,
        paraOption=false,
        H_const=48 + 564,
        Hmax=564 + 60)
        annotation (Placement(transformation(extent={{-74,2},{-90,18}})));
      HydroPower.HydroSystems.Reservoir reservoir(
        Hmax=564 + 60,
        depth=ones(reservoir.n)*60,
        H_start=48 + 564,
        MidWidth=200,
        SideWidth=100,
        L=100,
        depthIntake={0,0},
        Krough=100,
        pWb=1,
        k=2,
        steadyState=false)
        annotation (Placement(transformation(extent={{-94,-22},{-74,-2}})));
      HydroPower.SinksAndSources.Fixed_HT outTH(
        paraOption=false,
        H_const=115,
        Hmax=130,
        depth=20)
        annotation (Placement(transformation(extent={{72,-52},{90,-68}})));
      HydroPower.HydroSystems.Reservoir river(
        H_start=115,
        MidWidth=200,
        SideWidth=100,
        L=100,
        depthIntake={0,0},
        pWb=1,
        k=2,
        Hmax=130,
        depth=ones(river.n)*20)
               annotation (Placement(transformation(extent={{70,-40},{90,-20}})));
      HydroPower.HydroSystems.Pipe downstream(
        horizontalIcon=true,
        endD={5.8,5.8},
        L=724,
        ZL=110.5,
        showDataInIcon=false,
        ZR=110,
        endL={0,0},
        n=4)    annotation (Placement(transformation(extent={{40,-46},{60,-26}})));
      HydroPower.ElectricalSystems.PowerGrid
                                  powerGrid(
        distTgen={150,1e6,1e6},
        loadDiv={0.5,0.25,0.25},
        loadT={0.5,1,2},
        NoLoadUnits={2000,4000,10000},
        distTload={1e6,1e6,1e6},
        distNoLoad={0,0,0},
        prodDiv={0.45,0.45,0.1},
        prodT={120,15,5},
        ep={0.5,0.08,0.04},
        unitsJ={122000,5.5e6,8000},
        NoGenUnits={90,100,500},
        distNoGen={-8,0,0})     annotation (Placement(transformation(extent={{-20,20},{0,40}},
                          rotation=0)));
      Modelica.Blocks.Sources.Ramp pwr_ref(
        duration=10,
        height=0,
        startTime=1e6,
        offset=55e6)   annotation (Placement(transformation(extent={{20,60},{40,80}},
                      rotation=0)));
      HydroPower.ElectricalSystems.GeneratorAndMCB generator(
        np={12},
        timeMCB_close=ones(generator.n)*150,
        timeMCB_open=ones(generator.n)*250,
        f_start=0,
        J={212500},
        P_nom={103000000})
                      annotation (Placement(transformation(extent={{20,20},{40,40}},
                       rotation=0)));
      HydroPower.ControllersAndSensors.TurbineGovernorAnalog
                                                  turbineGovernor(
        ep=1,
        tRamp=40,
        P_generator_nom=generator.P_nom[1],
        enableRamp=false,
        Kd_noLoad=0.05,
        Kd_load=0.5,
        K_noLoad=0.2,
        K_load=0.4,
        Ki_load=0.1,
        Ki_noLoad=0.025)
                    annotation (Placement(transformation(extent={{50,20},{70,40}},
              rotation=0)));
      HydroPower.MechanicalSystems.BasicTurbine turbine(
        H_nom=460,
        LdraftTube=2.9,
        DavDraftTube=3,
        LscrollCase=15.7,
        DavScrollCasing=1.5,
        np=12,
        tableOnFile=true,
        PUInFlowTables=true,
        QTableName="Qtab",
        T_start(displayUnit="degC"),
        yvLim1=[-0.4,0.05],
        yvLim2=[-0.4,0.05],
        Q_nom=24.3,
        H_start=564 + 48,
        H_start_draftTube=115,
        effMech=1,
        TurbDmp0=0.01,
        TurbineDataFile=Modelica.Utilities.Files.loadResource(HydroPower.TABLE_DIR
             + "TurbineDataFile.mat"),
        P_nom=103000000)
        annotation (Placement(transformation(extent={{12,-40},{32,-20}})));
      inner HydroPower.System_HPL system_HPL(                  constantTemperature=true,
          steadyState=true)
        annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
    equation
      connect(reservoir.a2_pipe, conduit.a) annotation (Line(
          points={{-73,-18},{-67,-18}},
          color={0,0,255},
          smooth=Smooth.None));

      connect(powerGrid.f_grid,generator. f_grid)         annotation (Line(
          points={{1,23},{19,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(powerGrid.J_grid,generator. J_grid)         annotation (Line(
          points={{1,30},{19,30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(powerGrid.P_grid_balance,generator. P_grid_balance)
        annotation (Line(
          points={{1,37},{19,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(pwr_ref.y,turbineGovernor. P_reference) annotation (Line(
          points={{41,70},{54,70},{54,41}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.f_out[1],turbineGovernor. f) annotation (Line(
          points={{41,23},{49,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.onMCB,powerGrid. MCB) annotation (Line(
          points={{30,41},{30,48},{-10,48},{-10,41}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(generator.onMCB[1],turbineGovernor. isMCB) annotation (Line(
          points={{30,41},{30,48},{60,48},{60,41}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(generator.P_out[1],turbineGovernor. P_generator) annotation (Line(
          points={{41,37},{49,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.f_out,powerGrid. f) annotation (Line(
          points={{41,23},{46,23},{46,10},{-36,10},{-36,23},{-21,23}},
          color={0,0,127},
          smooth=Smooth.None));

      connect(turbine.b, downstream.a) annotation (Line(
          points={{33,-30},{36,-30},{36,-36},{39,-36}},
          color={0,0,255},
          smooth=Smooth.None));

      connect(turbine.TurbineData[1], generator.P_turbine[1]) annotation (Line(
          points={{22,-19.6667},{22,19}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(turbine.f_generator, generator.f_out[1]) annotation (Line(
          points={{16,-19},{16,10},{46,10},{46,23},{41,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(turbine.yGV, turbineGovernor.y) annotation (Line(
          points={{28,-19},{28,0},{80,0},{80,30},{71,30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(inTH.b, reservoir.a1_open) annotation (Line(points={{-90.8,10},{-98,10},{-98,-6},{-95,-6}},
                                                color={0,0,255}));
      connect(downstream.b, river.a1_pipe) annotation (Line(points={{61,-36},{61,-36},{69,-36}},
                                   color={0,0,255}));
      connect(river.a2_open, outTH.b) annotation (Line(points={{91,-24},{95.5,-24},{95.5,-60},{90.9,-60}},
                                  color={0,0,255}));
      connect(turbine.a, penstock.b) annotation (Line(points={{11,-30},{5,-30}}, color={0,0,255}));
      connect(penstock.a, surgeTank.b) annotation (Line(points={{-17,-30},{-18,-30},{-18,-18},{-19,-18}}, color={0,0,255}));
      connect(conduit.b, surgeTank.a) annotation (Line(points={{-45,-18},{-41,-18}}, color={0,0,255}));
    end Model_250971;

    model Model_250991
      extends Modelica.Icons.ReleaseNotes;

      HydroPower.HydroSystems.Pipe conduit(
        horizontalIcon=true,
        L=6600,
        endD={5.8,5.8},
        showDataInIcon=false,
        endL={0,0},
        n=4,
        ZR=541.5,
        ZL=246.5) annotation (Placement(transformation(extent={{-66,-28},{-46,-8}})));
      HydroPower.HydroSystems.Pipe penstock(
        endD={3,3},
        L=724,
        showDataInIcon=false,
        ZL=541.5,
        ZR=112.5,
        endL={0,0})
        annotation (Placement(transformation(extent={{-16,-40},{4,-20}})));
      HydroPower.HydroSystems.SurgeTank surgeTank(
        D=3.6,
        H2L=0.87,
        Vol=100,
        showDataInIcon=false,
        deltZ=40) annotation (Placement(transformation(extent={{-40,-28},{-20,-8}})));
      HydroPower.SinksAndSources.Fixed_HT inTH(
        depth=60,
        paraOption=false,
        H_const=48 + 564,
        Hmax=564 + 60)
        annotation (Placement(transformation(extent={{-74,2},{-90,18}})));
      HydroPower.HydroSystems.Reservoir reservoir(
        Hmax=564 + 60,
        depth=ones(reservoir.n)*60,
        H_start=48 + 564,
        MidWidth=200,
        SideWidth=100,
        L=100,
        depthIntake={0,0},
        Krough=100,
        pWb=1,
        k=2,
        steadyState=false)
        annotation (Placement(transformation(extent={{-94,-22},{-74,-2}})));
      HydroPower.SinksAndSources.Fixed_HT outTH(
        paraOption=false,
        H_const=115,
        Hmax=130,
        depth=20)
        annotation (Placement(transformation(extent={{72,-52},{90,-68}})));
      HydroPower.HydroSystems.Reservoir river(
        H_start=115,
        MidWidth=200,
        SideWidth=100,
        L=100,
        depthIntake={0,0},
        pWb=1,
        k=2,
        Hmax=130,
        depth=ones(river.n)*20)
               annotation (Placement(transformation(extent={{70,-40},{90,-20}})));
      HydroPower.HydroSystems.Pipe downstream(
        horizontalIcon=true,
        endD={5.8,5.8},
        L=724,
        ZL=110.5,
        showDataInIcon=false,
        ZR=110,
        endL={0,0},
        n=4)    annotation (Placement(transformation(extent={{40,-46},{60,-26}})));
      HydroPower.ElectricalSystems.PowerGrid
                                  powerGrid(
        distTgen={150,1e6,1e6},
        loadDiv={0.5,0.25,0.25},
        loadT={0.5,1,2},
        NoLoadUnits={2000,4000,10000},
        distTload={1e6,1e6,1e6},
        distNoLoad={0,0,0},
        prodDiv={0.45,0.45,0.1},
        prodT={120,15,5},
        ep={0.5,0.08,0.04},
        unitsJ={122000,5.5e6,8000},
        NoGenUnits={90,100,500},
        distNoGen={-11,0,0})    annotation (Placement(transformation(extent={{-20,20},{0,40}},
                          rotation=0)));
      Modelica.Blocks.Sources.Ramp pwr_ref(
        duration=10,
        height=0,
        startTime=1e6,
        offset=40e6)   annotation (Placement(transformation(extent={{20,60},{40,80}},
                      rotation=0)));
      HydroPower.ElectricalSystems.GeneratorAndMCB generator(
        np={12},
        timeMCB_close=ones(generator.n)*150,
        timeMCB_open=ones(generator.n)*250,
        f_start=0,
        J={212500},
        P_nom={103000000})
                      annotation (Placement(transformation(extent={{20,20},{40,40}},
                       rotation=0)));
      HydroPower.ControllersAndSensors.TurbineGovernorAnalog
                                                  turbineGovernor(
        ep=1,
        tRamp=40,
        P_generator_nom=generator.P_nom[1],
        enableRamp=false,
        Kd_noLoad=0.05,
        Kd_load=0.5,
        K_noLoad=0.2,
        K_load=0.4,
        Ki_load=0.1,
        Ki_noLoad=0.025)
                    annotation (Placement(transformation(extent={{50,20},{70,40}},
              rotation=0)));
      HydroPower.MechanicalSystems.BasicTurbine turbine(
        H_nom=460,
        LdraftTube=2.9,
        DavDraftTube=3,
        LscrollCase=15.7,
        DavScrollCasing=1.5,
        np=12,
        tableOnFile=true,
        PUInFlowTables=true,
        QTableName="Qtab",
        T_start(displayUnit="degC"),
        yvLim1=[-0.4,0.05],
        yvLim2=[-0.4,0.05],
        Q_nom=24.3,
        H_start=564 + 48,
        H_start_draftTube=115,
        effMech=1,
        TurbDmp0=0.01,
        TurbineDataFile=Modelica.Utilities.Files.loadResource(HydroPower.TABLE_DIR
             + "TurbineDataFile.mat"),
        P_nom=103000000)
        annotation (Placement(transformation(extent={{12,-40},{32,-20}})));
      inner HydroPower.System_HPL system_HPL(                  constantTemperature=true,
          steadyState=true)
        annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
    equation
      connect(reservoir.a2_pipe, conduit.a) annotation (Line(
          points={{-73,-18},{-67,-18}},
          color={0,0,255},
          smooth=Smooth.None));

      connect(powerGrid.f_grid,generator. f_grid)         annotation (Line(
          points={{1,23},{19,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(powerGrid.J_grid,generator. J_grid)         annotation (Line(
          points={{1,30},{19,30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(powerGrid.P_grid_balance,generator. P_grid_balance)
        annotation (Line(
          points={{1,37},{19,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(pwr_ref.y,turbineGovernor. P_reference) annotation (Line(
          points={{41,70},{54,70},{54,41}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.f_out[1],turbineGovernor. f) annotation (Line(
          points={{41,23},{49,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.onMCB,powerGrid. MCB) annotation (Line(
          points={{30,41},{30,48},{-10,48},{-10,41}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(generator.onMCB[1],turbineGovernor. isMCB) annotation (Line(
          points={{30,41},{30,48},{60,48},{60,41}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(generator.P_out[1],turbineGovernor. P_generator) annotation (Line(
          points={{41,37},{49,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.f_out,powerGrid. f) annotation (Line(
          points={{41,23},{46,23},{46,10},{-36,10},{-36,23},{-21,23}},
          color={0,0,127},
          smooth=Smooth.None));

      connect(turbine.b, downstream.a) annotation (Line(
          points={{33,-30},{36,-30},{36,-36},{39,-36}},
          color={0,0,255},
          smooth=Smooth.None));

      connect(turbine.TurbineData[1], generator.P_turbine[1]) annotation (Line(
          points={{22,-19.6667},{22,-19.6667},{22,19},{24,19}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(turbine.f_generator, generator.f_out[1]) annotation (Line(
          points={{16,-19},{16,10},{46,10},{46,23},{41,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(turbine.yGV, turbineGovernor.y) annotation (Line(
          points={{28,-19},{28,0},{80,0},{80,30},{71,30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(inTH.b, reservoir.a1_open) annotation (Line(points={{-90.8,10},{-98,10},{-98,-6},{-95,-6}},
                                                color={0,0,255}));
      connect(downstream.b, river.a1_pipe) annotation (Line(points={{61,-36},{61,-36},{69,-36}},
                                   color={0,0,255}));
      connect(river.a2_open, outTH.b) annotation (Line(points={{91,-24},{95.5,-24},{95.5,-60},{90.9,-60}},
                                  color={0,0,255}));
      connect(turbine.a, penstock.b) annotation (Line(points={{11,-30},{5,-30}}, color={0,0,255}));
      connect(penstock.a, surgeTank.b) annotation (Line(points={{-17,-30},{-18,-30},{-18,-18},{-19,-18}}, color={0,0,255}));
      connect(conduit.b, surgeTank.a) annotation (Line(points={{-45,-18},{-41,-18}}, color={0,0,255}));
    end Model_250991;

    model Model_254741
      extends Modelica.Icons.ReleaseNotes;

      HydroPower.HydroSystems.Pipe conduit(
        horizontalIcon=true,
        L=6600,
        endD={5.8,5.8},
        showDataInIcon=false,
        ZL=564,
        endL={0,0},
        n=4,
        ZR=541.5) annotation (Placement(transformation(extent={{-66,-28},{-46,-8}})));
      HydroPower.HydroSystems.Pipe penstock(
        endD={3,3},
        L=724,
        showDataInIcon=false,
        ZL=541.5,
        ZR=112.5,
        endL={0,0})
        annotation (Placement(transformation(extent={{-16,-40},{4,-20}})));
      HydroPower.HydroSystems.SurgeTank surgeTank(
        D=3.6,
        H2L=0.87,
        Vol=100,
        showDataInIcon=false,
        deltZ=40) annotation (Placement(transformation(extent={{-40,-28},{-20,-8}})));
      HydroPower.SinksAndSources.Fixed_HT inTH(
        depth=60,
        paraOption=false,
        H_const=48 + 564,
        Hmax=564 + 60)
        annotation (Placement(transformation(extent={{-74,2},{-90,18}})));
      HydroPower.HydroSystems.Reservoir reservoir(
        Hmax=564 + 60,
        depth=ones(reservoir.n)*60,
        H_start=48 + 564,
        MidWidth=200,
        SideWidth=100,
        L=100,
        depthIntake={0,0},
        Krough=100,
        pWb=1,
        k=2,
        steadyState=false)
        annotation (Placement(transformation(extent={{-94,-22},{-74,-2}})));
      HydroPower.SinksAndSources.Fixed_HT outTH(
        paraOption=false,
        H_const=115,
        Hmax=130,
        depth=20)
        annotation (Placement(transformation(extent={{72,-52},{90,-68}})));
      HydroPower.HydroSystems.Reservoir river(
        H_start=115,
        MidWidth=200,
        SideWidth=100,
        L=100,
        depthIntake={0,0},
        pWb=1,
        k=2,
        Hmax=130,
        depth=ones(river.n)*20)
               annotation (Placement(transformation(extent={{70,-40},{90,-20}})));
      HydroPower.HydroSystems.Pipe downstream(
        horizontalIcon=true,
        endD={5.8,5.8},
        L=724,
        ZL=110.5,
        showDataInIcon=false,
        endL={0,0},
        n=4,
        ZR=415) annotation (Placement(transformation(extent={{40,-46},{60,-26}})));
      HydroPower.ElectricalSystems.PowerGrid
                                  powerGrid(
        distTgen={150,1e6,1e6},
        loadDiv={0.5,0.25,0.25},
        loadT={0.5,1,2},
        NoLoadUnits={2000,4000,10000},
        distTload={1e6,1e6,1e6},
        distNoLoad={0,0,0},
        prodDiv={0.45,0.45,0.1},
        prodT={120,15,5},
        ep={0.5,0.08,0.04},
        unitsJ={122000,5.5e6,8000},
        NoGenUnits={90,100,500},
        distNoGen={-4,0,0})     annotation (Placement(transformation(extent={{-20,20},{0,40}},
                          rotation=0)));
      Modelica.Blocks.Sources.Ramp pwr_ref(
        duration=10,
        height=0,
        startTime=1e6,
        offset=75e6)   annotation (Placement(transformation(extent={{20,60},{40,80}},
                      rotation=0)));
      HydroPower.ElectricalSystems.GeneratorAndMCB generator(
        np={12},
        timeMCB_close=ones(generator.n)*150,
        timeMCB_open=ones(generator.n)*250,
        f_start=0,
        J={212500},
        P_nom={103000000})
                      annotation (Placement(transformation(extent={{20,20},{40,40}},
                       rotation=0)));
      HydroPower.ControllersAndSensors.TurbineGovernorAnalog
                                                  turbineGovernor(
        ep=1,
        tRamp=40,
        P_generator_nom=generator.P_nom[1],
        enableRamp=false,
        Kd_noLoad=0.05,
        Kd_load=0.5,
        K_noLoad=0.2,
        K_load=0.4,
        Ki_load=0.1,
        Ki_noLoad=0.025)
                    annotation (Placement(transformation(extent={{50,20},{70,40}},
              rotation=0)));
      HydroPower.MechanicalSystems.BasicTurbine turbine(
        H_nom=460,
        LdraftTube=2.9,
        DavDraftTube=3,
        LscrollCase=15.7,
        DavScrollCasing=1.5,
        np=12,
        tableOnFile=true,
        PUInFlowTables=true,
        QTableName="Qtab",
        T_start(displayUnit="degC"),
        yvLim1=[-0.4,0.05],
        yvLim2=[-0.4,0.05],
        Q_nom=24.3,
        H_start=564 + 48,
        H_start_draftTube=115,
        effMech=1,
        TurbDmp0=0.01,
        TurbineDataFile=Modelica.Utilities.Files.loadResource(HydroPower.TABLE_DIR
             + "TurbineDataFile.mat"),
        P_nom=103000000)
        annotation (Placement(transformation(extent={{12,-40},{32,-20}})));
      inner HydroPower.System_HPL system_HPL(                  constantTemperature=true,
          steadyState=true)
        annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
    equation
      connect(reservoir.a2_pipe, conduit.a) annotation (Line(
          points={{-73,-18},{-67,-18}},
          color={0,0,255},
          smooth=Smooth.None));

      connect(powerGrid.f_grid,generator. f_grid)         annotation (Line(
          points={{1,23},{19,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(powerGrid.J_grid,generator. J_grid)         annotation (Line(
          points={{1,30},{19,30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(powerGrid.P_grid_balance,generator. P_grid_balance)
        annotation (Line(
          points={{1,37},{19,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(pwr_ref.y,turbineGovernor. P_reference) annotation (Line(
          points={{41,70},{54,70},{54,41}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.f_out[1],turbineGovernor. f) annotation (Line(
          points={{41,23},{49,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.onMCB,powerGrid. MCB) annotation (Line(
          points={{30,41},{30,48},{-10,48},{-10,41}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(generator.onMCB[1],turbineGovernor. isMCB) annotation (Line(
          points={{30,41},{30,48},{60,48},{60,41}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(generator.P_out[1],turbineGovernor. P_generator) annotation (Line(
          points={{41,37},{49,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.f_out,powerGrid. f) annotation (Line(
          points={{41,23},{46,23},{46,10},{-36,10},{-36,23},{-21,23}},
          color={0,0,127},
          smooth=Smooth.None));

      connect(turbine.b, downstream.a) annotation (Line(
          points={{33,-30},{36,-30},{36,-36},{39,-36}},
          color={0,0,255},
          smooth=Smooth.None));

      connect(turbine.TurbineData[1], generator.P_turbine[1]) annotation (Line(
          points={{22,-19.6667},{22,-19.6667},{22,19},{24,19}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(turbine.f_generator, generator.f_out[1]) annotation (Line(
          points={{16,-19},{16,10},{46,10},{46,23},{41,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(turbine.yGV, turbineGovernor.y) annotation (Line(
          points={{28,-19},{28,0},{80,0},{80,30},{71,30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(inTH.b, reservoir.a1_open) annotation (Line(points={{-90.8,10},{-98,10},{-98,-6},{-95,-6}},
                                                color={0,0,255}));
      connect(downstream.b, river.a1_pipe) annotation (Line(points={{61,-36},{61,-36},{69,-36}},
                                   color={0,0,255}));
      connect(river.a2_open, outTH.b) annotation (Line(points={{91,-24},{95.5,-24},{95.5,-60},{90.9,-60}},
                                  color={0,0,255}));
      connect(turbine.a, penstock.b) annotation (Line(points={{11,-30},{5,-30}}, color={0,0,255}));
      connect(penstock.a, surgeTank.b) annotation (Line(points={{-17,-30},{-18,-30},{-18,-18},{-19,-18}}, color={0,0,255}));
      connect(conduit.b, surgeTank.a) annotation (Line(points={{-45,-18},{-41,-18}}, color={0,0,255}));
    end Model_254741;

  end AssignmentModels;

  package YourFixedModel "Put your model into this package"
    extends Modelica.Icons.BasesPackage;
    package PartA "Here are all part needed to forfill Task A"
      model PartA_245861
        extends AssignmentModels.Model_245861(
          reservoir(Hmax=ones(reservoir.n)*(564 + 60), H_start=ones(reservoir.n)
                *(48 + 564)),
          river(Hmax=ones(river.n)*130, H_start=ones(river.n)*115),
          conduit(showDataInIcon=true),
          surgeTank(deltZ=150, showDataInIcon=true),
          penstock(showDataInIcon=true),
          downstream(showDataInIcon=true));
      equation
        connect(conduit.a, reservoir.a2_pipe)
          annotation (Line(points={{-67,-18},{-73,-18}}, color={0,0,255}));
        annotation (experiment(
            StopTime=500,
            __Dymola_NumberOfIntervals=5000,
            Tolerance=1e-06,
            __Dymola_Algorithm="Radau"), Documentation(info="<html>
<p>The simulation first required arrays for the reservoir and river on my computer.</p>
<p>The following arrays are Hmax and Hstart.</p>
<p><br>The surge tank included the parametrisation error that was discovered. The tank would have a negative value in this case because the delta Z was not large enough.</p>
<p>After making this change to 150m, a simulation was completed, however several aspects were still incorrect as seen in the image below.</p>
<p><img src=\"modelica://FM3217_Assignment2022/Resources/Images/TaksA1.png\"/></p>
<p>A second change is required to be made. This occurs downstream. In this case, ZR is 641.5m and ZL is 115m.</p>
<p>This suggests that the water is moving upward after the turbine in a manner that is incorrect. Therefore, this was adjusted to match ZL and the river&apos;s starting height. The simulation is displayed below.</p>
<p><img src=\"modelica://FM3217_Assignment2022/Resources/Images/TaksA2.png\"/></p>
</html>"));
      end PartA_245861;
    end PartA;
  end YourFixedModel;

  package YourSubLibrary
    "This is the place where you should add your sub-library."
    extends Modelica.Icons.ExamplesPackage;
    package PowerConverters
      package UserGuids "Guids for using the library"

        model WhatIsPowerConverter
          annotation (
            Icon(coordinateSystem(preserveAspectRatio=false), graphics={
                Ellipse(
                  lineColor={75,138,73},
                  fillColor={75,138,73},
                  pattern=LinePattern.None,
                  fillPattern=FillPattern.Solid,
                  extent={{-100.0,-100.0},{100.0,100.0}}),
                Polygon(origin={-4.167,-15.0},
                  fillColor={255,255,255},
                  pattern=LinePattern.None,
                  fillPattern=FillPattern.Solid,
                  points={{-15.833,20.0},{-15.833,30.0},{14.167,40.0},{24.167,20.0},{4.167,-30.0},{14.167,-30.0},{24.167,-30.0},{24.167,-40.0},{-5.833,-50.0},{-15.833,-30.0},{4.167,20.0},{-5.833,20.0}},
                  smooth=Smooth.Bezier),
                Ellipse(origin={7.5,56.5},
                  fillColor={255,255,255},
                  pattern=LinePattern.None,
                  fillPattern=FillPattern.Solid,
                  extent={{-12.5,-12.5},{12.5,12.5}})}),
            Diagram(coordinateSystem(preserveAspectRatio=false)),
            Documentation(info="<html>
<h4>What is a Power Converter</h4>
<p>A power converter is a mechanical or electrical device used to change the form of electrical energy. A power converter can transform direct current (DC) from alternating current (AC) (DC) [2]. Normaly a power converter are using diodes to limit the dircetion of the current. In adtion a capasitor is used to minimizes ripple voltage.</p>
<h5>Diode</h5>
<p>Anode and cathode are the names of the two poles that make up a two-pole electrical component known as a diode. Practically speaking, the diode can only transfer electrical current from the anode to the cathode. [1]</p>
<h5>Ripple voltage</h5>
<p>The residual periodic variation of the DC voltage within a power supply (power converter) that has been obtained from an alternating current (AC) source is known as ripple in electronics. This ripple results from the alternating waveform&apos;s partial suppression following rectification. The source of ripple voltage is either the rectifier&apos;s output or the creation and conversion of DC power. [3]</p>
</html>"));
        end WhatIsPowerConverter;

        model Duplication_Vs_Inheritance
          annotation (
            Icon(coordinateSystem(preserveAspectRatio=false), graphics={
                Ellipse(
                  lineColor={75,138,73},
                  fillColor={238,46,47},
                  pattern=LinePattern.None,
                  fillPattern=FillPattern.Solid,
                  extent={{-100.0,-100.0},{100.0,100.0}}),
                Polygon(origin={-4.167,-15.0},
                  fillColor={255,255,255},
                  pattern=LinePattern.None,
                  fillPattern=FillPattern.Solid,
                  points={{-15.833,20.0},{-15.833,30.0},{14.167,40.0},{24.167,20.0},{4.167,-30.0},{14.167,-30.0},{24.167,-30.0},{24.167,-40.0},{-5.833,-50.0},{-15.833,-30.0},{4.167,20.0},{-5.833,20.0}},
                  smooth=Smooth.Bezier),
                Ellipse(origin={7.5,56.5},
                  fillColor={255,255,255},
                  pattern=LinePattern.None,
                  fillPattern=FillPattern.Solid,
                  extent={{-12.5,-12.5},{12.5,12.5}})}),
            Diagram(coordinateSystem(preserveAspectRatio=false)),
            Documentation(info="<html>
<h4>The difference between Duplication and Inheritance</h4>
<p>The distinction between Duplication and Inheritance is that with Duplication, you only copy an existing model that you may modify or build upon, whereas with Inheritance, you only wish to build on the model that has already been constructed and cannot modified whats alredy there.</p>
<h4>Duplication</h4>
<h5>Advantages of Duplication</h5>
<p>As previously indicated, the benefit of duplicating a model is that you can alter decisions that have already been made in earlier models. Both moving and deleting objects are options.</p>
<h5>Disadvantages of Duplication</h5>
<p>One drawback of replicating a model is that if you do it three times in a row, you may discover that the initial model you generated has a mistake that needs to be fixed. Then, each of the copied models must also be manually updated with this alteration.</p>
<h4>Inheritance</h4>
<h5>Advantages of Inheritance</h5>
<p>The benefits of inheriting a model are the opposite of those of duplicate a model. In this case, you only need to alter the model that was produced first, and all subsequent models that have inherited that trait would then follow the cahnge.</p>
<h5>Disadvantages of Inheritance</h5>
<p>The drawback in this situation is that it is now unable to shift or spring undesirable model components. The model that was originally created with the following components has these corrected and perhaps removed.</p>
</html>"));
        end Duplication_Vs_Inheritance;

        model ThisLibrary
          annotation (
            Icon(coordinateSystem(preserveAspectRatio=false), graphics={
                Ellipse(
                  lineColor={75,138,73},
                  fillColor={75,138,73},
                  pattern=LinePattern.None,
                  fillPattern=FillPattern.Solid,
                  extent={{-100.0,-100.0},{100.0,100.0}}),
                Polygon(origin={-4.167,-15.0},
                  fillColor={255,255,255},
                  pattern=LinePattern.None,
                  fillPattern=FillPattern.Solid,
                  points={{-15.833,20.0},{-15.833,30.0},{14.167,40.0},{24.167,20.0},{4.167,-30.0},{14.167,-30.0},{24.167,-30.0},{24.167,-40.0},{-5.833,-50.0},{-15.833,-30.0},{4.167,20.0},{-5.833,20.0}},
                  smooth=Smooth.Bezier),
                Ellipse(origin={7.5,56.5},
                  fillColor={255,255,255},
                  pattern=LinePattern.None,
                  fillPattern=FillPattern.Solid,
                  extent={{-12.5,-12.5},{12.5,12.5}})}),
            Diagram(coordinateSystem(preserveAspectRatio=false)),
            Documentation(info="<html>
<h4>Various Power converters in this library</h4>
<p>Three converters are available for usage in this library. The first is a straightforward diode. This is accessible from BasePack. The second converter produces a direct current using just 4 diodes. The final one is constructed on top of the four diodes and includes a conductor that runs parallel to the output. [2]</p>
<p>Both Duplicated Extensions and Inherited Extensions contain the same converters.</p>
</html>"));
        end ThisLibrary;

        model Sources
          annotation (
            Icon(coordinateSystem(preserveAspectRatio=false), graphics={
                Ellipse(
                  lineColor={75,138,73},
                  fillColor={75,138,73},
                  pattern=LinePattern.None,
                  fillPattern=FillPattern.Solid,
                  extent={{-100.0,-100.0},{100.0,100.0}}),
                Polygon(origin={-4.167,-15.0},
                  fillColor={255,255,255},
                  pattern=LinePattern.None,
                  fillPattern=FillPattern.Solid,
                  points={{-15.833,20.0},{-15.833,30.0},{14.167,40.0},{24.167,20.0},{4.167,-30.0},{14.167,-30.0},{24.167,-30.0},{24.167,-40.0},{-5.833,-50.0},{-15.833,-30.0},{4.167,20.0},{-5.833,20.0}},
                  smooth=Smooth.Bezier),
                Ellipse(origin={7.5,56.5},
                  fillColor={255,255,255},
                  pattern=LinePattern.None,
                  fillPattern=FillPattern.Solid,
                  extent={{-12.5,-12.5},{12.5,12.5}})}),
            Diagram(coordinateSystem(preserveAspectRatio=false)),
            Documentation(info="<html>
<h4>Sources</h4>
<p>[1] Wikipedia. &quot;Diode&quot; Recived from: https://no.wikipedia.org/wiki/Diode (31.10.22)</p>
<p>[2] Wikipedia. &quot;Electric power conversion&quot; Recived from: https://en.wikipedia.org/wiki/Electric_power_conversion (31.10.22)</p>
<p>[3] Wikipedia. &quot;Ripple (electrical)&quot; Recived from: https://en.wikipedia.org/wiki/Ripple_(electrical) (31.10.22)</p>
</html>"));
        end Sources;
        annotation (Icon(graphics={
              Ellipse(
                lineColor={75,138,73},
                fillColor={75,138,73},
                pattern=LinePattern.None,
                fillPattern=FillPattern.Solid,
                extent={{-100.0,-100.0},{100.0,100.0}}),
              Polygon(origin={-4.167,-15.0},
                fillColor={255,255,255},
                pattern=LinePattern.None,
                fillPattern=FillPattern.Solid,
                points={{-15.833,20.0},{-15.833,30.0},{14.167,40.0},{24.167,20.0},{4.167,-30.0},{14.167,-30.0},{24.167,-30.0},{24.167,-40.0},{-5.833,-50.0},{-15.833,-30.0},{4.167,20.0},{-5.833,20.0}},
                smooth=Smooth.Bezier),
              Ellipse(origin={7.5,56.5},
                fillColor={255,255,255},
                pattern=LinePattern.None,
                fillPattern=FillPattern.Solid,
                extent={{-12.5,-12.5},{12.5,12.5}})}));
      end UserGuids;

      package Examples
        "Here one can use the applications cretaed and test how they works"
        model PowerConverter1Diode
          BasePack.Diode diode
            annotation (Placement(transformation(extent={{-50,24},{-30,44}})));
          Modelica.Electrical.Analog.Sensors.VoltageSensor voltageSensor
            annotation (Placement(transformation(
                extent={{-10,-10},{10,10}},
                rotation=0,
                origin={8,66})));
          Modelica.Electrical.Analog.Basic.Resistor resistor(R=10)
            annotation (Placement(transformation(extent={{-4,24},{16,44}})));
          Modelica.Electrical.Analog.Basic.Ground ground
            annotation (Placement(transformation(extent={{-4,-54},{16,-34}})));
          Modelica.Electrical.Analog.Sources.SineVoltage sineVoltage(V=15, f=50)
            annotation (Placement(transformation(
                extent={{-10,-10},{10,10}},
                rotation=270,
                origin={-76,-8})));
        equation
          connect(voltageSensor.n, resistor.n) annotation (Line(points={{18,66},
                  {18,34},{16,34}}, color={0,0,255}));
          connect(voltageSensor.p, resistor.p) annotation (Line(points={{-2,66},
                  {-4,66},{-4,34}}, color={0,0,255}));
          connect(resistor.n, ground.p) annotation (Line(points={{16,34},{48,34},
                  {48,-34},{6,-34}}, color={0,0,255}));
          connect(diode.n1, resistor.p)
            annotation (Line(points={{-30,34},{-4,34}}, color={0,0,255}));
          connect(diode.p1, sineVoltage.p) annotation (Line(points={{-50,40.8},
                  {-76,40.8},{-76,2}}, color={0,0,255}));
          connect(ground.p, sineVoltage.n) annotation (Line(points={{6,-34},{
                  -76,-34},{-76,-18}}, color={0,0,255}));
          annotation (
            Icon(coordinateSystem(preserveAspectRatio=false), graphics={
                Ellipse(lineColor = {75,138,73},
                        fillColor={255,255,255},
                        fillPattern = FillPattern.Solid,
                        extent = {{-100,-100},{100,100}}),
                Polygon(lineColor = {0,0,255},
                        fillColor = {75,138,73},
                        pattern = LinePattern.None,
                        fillPattern = FillPattern.Solid,
                        points = {{-36,60},{64,0},{-36,-60},{-36,60}})}),
            Diagram(coordinateSystem(preserveAspectRatio=false)),
            experiment(
              StopTime=0.5,
              __Dymola_NumberOfIntervals=5000,
              Tolerance=1e-06,
              __Dymola_Algorithm="Radau"));
        end PowerConverter1Diode;

        model DuplictedPowerConverter4diode
          extends Modelica.Icons.Example;
          Modelica.Electrical.Analog.Sensors.VoltageSensor voltageSensor
            annotation (Placement(transformation(
                extent={{-10,-10},{10,10}},
                rotation=0,
                origin={0,44})));
          Modelica.Electrical.Analog.Basic.Resistor resistor(R=10)
            annotation (Placement(transformation(extent={{-12,2},{8,22}})));
          Modelica.Electrical.Analog.Basic.Ground ground
            annotation (Placement(transformation(extent={{-12,-76},{8,-56}})));
          Modelica.Electrical.Analog.Sources.SineVoltage sineVoltage(V=15, f=50)
            annotation (Placement(transformation(
                extent={{-10,-10},{10,10}},
                rotation=270,
                origin={-80,10})));
          DuplicatedExtensions.PowerConverter4Diode rectifier4Diode(
              diodeVoltage=0.2)
            annotation (Placement(transformation(extent={{-48,0},{-28,20}})));
        equation
          connect(voltageSensor.n, resistor.n) annotation (Line(points={{10,44},
                  {10,12},{8,12}}, color={0,0,255}));
          connect(voltageSensor.p, resistor.p) annotation (Line(points={{-10,44},
                  {-12,44},{-12,12}}, color={0,0,255}));
          connect(resistor.n, ground.p) annotation (Line(points={{8,12},{40,12},
                  {40,-56},{-2,-56}}, color={0,0,255}));
          connect(sineVoltage.n, rectifier4Diode.AC2) annotation (Line(points={
                  {-80,-3.55271e-15},{-64,-3.55271e-15},{-64,3.6},{-48.2,3.6}},
                color={0,0,255}));
          connect(sineVoltage.p, rectifier4Diode.AC1) annotation (Line(points={
                  {-80,20},{-64,20},{-64,17.6},{-48.2,17.6}}, color={0,0,255}));
          connect(rectifier4Diode.gnd, ground.p) annotation (Line(points={{-28,
                  1.6},{-26,1.6},{-26,-56},{-2,-56}}, color={0,0,255}));
          connect(rectifier4Diode.V_out, resistor.p) annotation (Line(points={{
                  -28,10.6},{-22,10.6},{-22,12},{-12,12}}, color={0,0,255}));
          annotation (
            Icon(coordinateSystem(preserveAspectRatio=false)),
            Diagram(coordinateSystem(preserveAspectRatio=false)),
            experiment(
              StopTime=0.5,
              __Dymola_NumberOfIntervals=5000,
              Tolerance=1e-06,
              __Dymola_Algorithm="Radau"));
        end DuplictedPowerConverter4diode;

        model DuplictedPowerConverterCapasitor
          extends Modelica.Icons.Example;
          Modelica.Electrical.Analog.Sensors.VoltageSensor voltageSensor
            annotation (Placement(transformation(
                extent={{-10,-10},{10,10}},
                rotation=0,
                origin={0,44})));
          Modelica.Electrical.Analog.Basic.Resistor resistor(R=2000)
            annotation (Placement(transformation(extent={{-14,2},{6,22}})));
          Modelica.Electrical.Analog.Basic.Ground ground
            annotation (Placement(transformation(extent={{-12,-76},{8,-56}})));
          Modelica.Electrical.Analog.Sources.SineVoltage sineVoltage(V=15, f=50)
            annotation (Placement(transformation(
                extent={{-10,-10},{10,10}},
                rotation=270,
                origin={-80,10})));
          DuplicatedExtensions.PowerConverter4Diode1Capasitor
            rectifier4DiodewithCondenstor
            annotation (Placement(transformation(extent={{-60,-2},{-40,18}})));
        equation
          connect(voltageSensor.n, resistor.n) annotation (Line(points={{10,44},
                  {10,12},{6,12}}, color={0,0,255}));
          connect(voltageSensor.p, resistor.p) annotation (Line(points={{-10,44},
                  {-14,44},{-14,12}}, color={0,0,255}));
          connect(resistor.n, ground.p) annotation (Line(points={{6,12},{40,12},
                  {40,-56},{-2,-56}}, color={0,0,255}));
          connect(rectifier4DiodewithCondenstor.gnd, ground.p) annotation (Line(
                points={{-40,2},{-32,2},{-32,-56},{-2,-56}}, color={0,0,255}));
          connect(rectifier4DiodewithCondenstor.V_out, resistor.p) annotation (
              Line(points={{-40,9.6},{-28,9.6},{-28,12},{-14,12}}, color={0,0,
                  255}));
          connect(rectifier4DiodewithCondenstor.AC2, sineVoltage.n) annotation
            (Line(points={{-60.2,3.8},{-70.1,3.8},{-70.1,0},{-80,0}}, color={0,
                  0,255}));
          connect(rectifier4DiodewithCondenstor.AC1, sineVoltage.p) annotation
            (Line(points={{-60.2,15.6},{-70.1,15.6},{-70.1,20},{-80,20}}, color
                ={0,0,255}));
          annotation (
            Icon(coordinateSystem(preserveAspectRatio=false)),
            Diagram(coordinateSystem(preserveAspectRatio=false)),
            experiment(
              StopTime=10,
              __Dymola_NumberOfIntervals=5000,
              Tolerance=1e-06,
              __Dymola_Algorithm="Radau"));
        end DuplictedPowerConverterCapasitor;

        model InheritedPowerConverter4Diode
          InheritedExtensions.PowerConverter4diode powerConverter4diode
            annotation (Placement(transformation(extent={{-44,-14},{-8,24}})));
          Modelica.Electrical.Analog.Sources.SineVoltage sineVoltage(V=15, f=50)
            annotation (Placement(transformation(
                extent={{-10,-10},{10,10}},
                rotation=270,
                origin={-80,10})));
          Modelica.Electrical.Analog.Sensors.VoltageSensor voltageSensor
            annotation (Placement(transformation(
                extent={{-10,-10},{10,10}},
                rotation=0,
                origin={28,36})));
          Modelica.Electrical.Analog.Basic.Resistor resistor(R=10)
            annotation (Placement(transformation(extent={{16,-6},{36,14}})));
          Modelica.Electrical.Analog.Basic.Ground ground
            annotation (Placement(transformation(extent={{16,-84},{36,-64}})));
        equation
          connect(voltageSensor.n, resistor.n)
            annotation (Line(points={{38,36},{38,4},{36,4}}, color={0,0,255}));
          connect(voltageSensor.p, resistor.p) annotation (Line(points={{18,36},
                  {16,36},{16,4}}, color={0,0,255}));
          connect(resistor.n, ground.p) annotation (Line(points={{36,4},{68,4},
                  {68,-64},{26,-64}}, color={0,0,255}));
          connect(powerConverter4diode.V_out, resistor.p) annotation (Line(
                points={{-8,5},{4,5},{4,4},{16,4}}, color={0,0,255}));
          connect(powerConverter4diode.gnd, ground.p) annotation (Line(points={
                  {-8,-10.2},{-8,-64},{26,-64}}, color={0,0,255}));
          connect(powerConverter4diode.AC_out, sineVoltage.n) annotation (Line(
                points={{-44.36,5},{-62,5},{-62,0},{-80,0}}, color={0,0,255}));
          connect(powerConverter4diode.AC_in, sineVoltage.p) annotation (Line(
                points={{-44.36,17.92},{-62.18,17.92},{-62.18,20},{-80,20}},
                color={0,0,255}));
          annotation (Icon(coordinateSystem(preserveAspectRatio=false),
                graphics={
                Ellipse(lineColor = {75,138,73},
                        fillColor={255,255,255},
                        fillPattern = FillPattern.Solid,
                        extent = {{-100,-100},{100,100}}),
                Polygon(lineColor = {0,0,255},
                        fillColor = {75,138,73},
                        pattern = LinePattern.None,
                        fillPattern = FillPattern.Solid,
                        points = {{-36,60},{64,0},{-36,-60},{-36,60}})}),
              Diagram(coordinateSystem(preserveAspectRatio=false)));
        end InheritedPowerConverter4Diode;

        model InheritedPowerConverterCapasitor
          Modelica.Electrical.Analog.Sources.SineVoltage sineVoltage(V=15, f=50)
            annotation (Placement(transformation(
                extent={{-10,-10},{10,10}},
                rotation=270,
                origin={-80,10})));
          Modelica.Electrical.Analog.Sensors.VoltageSensor voltageSensor
            annotation (Placement(transformation(
                extent={{-10,-10},{10,10}},
                rotation=0,
                origin={28,36})));
          Modelica.Electrical.Analog.Basic.Resistor resistor(R=1000)
            annotation (Placement(transformation(extent={{16,-6},{36,14}})));
          Modelica.Electrical.Analog.Basic.Ground ground
            annotation (Placement(transformation(extent={{16,-84},{36,-64}})));
          InheritedExtensions.PowerConverterCapasitor powerConverterCapasitor
            annotation (Placement(transformation(extent={{-54,-18},{-10,24}})));
        equation
          connect(voltageSensor.n, resistor.n)
            annotation (Line(points={{38,36},{38,4},{36,4}}, color={0,0,255}));
          connect(voltageSensor.p, resistor.p) annotation (Line(points={{18,36},
                  {16,36},{16,4}}, color={0,0,255}));
          connect(resistor.n, ground.p) annotation (Line(points={{36,4},{68,4},
                  {68,-64},{26,-64}}, color={0,0,255}));
          connect(sineVoltage.n, powerConverterCapasitor.AC_out) annotation (
              Line(points={{-80,0},{-68,0},{-68,3},{-54.44,3}}, color={0,0,255}));
          connect(powerConverterCapasitor.AC_in, sineVoltage.p) annotation (
              Line(points={{-54.44,17.28},{-67.22,17.28},{-67.22,20},{-80,20}},
                color={0,0,255}));
          connect(powerConverterCapasitor.gnd, ground.p) annotation (Line(
                points={{-10,-13.8},{8,-13.8},{8,-64},{26,-64}}, color={0,0,255}));
          connect(powerConverterCapasitor.V_out, resistor.p) annotation (Line(
                points={{-10,3},{4,3},{4,4},{16,4}}, color={0,0,255}));
          annotation (
            Icon(coordinateSystem(preserveAspectRatio=false), graphics={
                Ellipse(lineColor = {75,138,73},
                        fillColor={255,255,255},
                        fillPattern = FillPattern.Solid,
                        extent = {{-100,-100},{100,100}}),
                Polygon(lineColor = {0,0,255},
                        fillColor = {75,138,73},
                        pattern = LinePattern.None,
                        fillPattern = FillPattern.Solid,
                        points = {{-36,60},{64,0},{-36,-60},{-36,60}})}),
            Diagram(coordinateSystem(preserveAspectRatio=false)),
            experiment(
              StopTime=10,
              __Dymola_NumberOfIntervals=5000,
              Tolerance=1e-06,
              __Dymola_Algorithm="Radau"));
        end InheritedPowerConverterCapasitor;
        annotation (Icon(graphics={
              Rectangle(
                lineColor={200,200,200},
                fillColor={248,248,248},
                fillPattern=FillPattern.HorizontalCylinder,
                extent={{-100.0,-100.0},{100.0,100.0}},
                radius=25.0),
              Rectangle(
                lineColor={128,128,128},
                extent={{-100.0,-100.0},{100.0,100.0}},
                radius=25.0),
              Polygon(
                origin={8.0,14.0},
                lineColor={78,138,73},
                fillColor={78,138,73},
                pattern=LinePattern.None,
                fillPattern=FillPattern.Solid,
                points={{-58.0,46.0},{42.0,-14.0},{-58.0,-74.0},{-58.0,46.0}})}));
      end Examples;

      package BasePack "Here it will be single standard modelica components"
        model Diode
          "This pack includin one element from the standard library from Modelica"
          Modelica.Electrical.Analog.Semiconductors.Diode diode1(Vt=
                diodeVoltage)
            annotation (Placement(transformation(extent={{-60,58},{-40,78}})));
          parameter Real diodeVoltage=0.2
            "[v] The voltage drop over one diode (Total 4 diodes in the system)";
          Modelica.Electrical.Analog.Interfaces.PositivePin p1
            "Positive electrical pin" annotation (Placement(transformation(
                  extent={{-110,58},{-90,78}}), iconTransformation(extent={{
                    -110,58},{-90,78}})));
          Modelica.Electrical.Analog.Interfaces.NegativePin n1
            "Negative electrical pin"
            annotation (Placement(transformation(extent={{90,-10},{110,10}})));
        equation
          connect(diode1.p, p1)
            annotation (Line(points={{-60,68},{-100,68}}, color={0,0,255}));
          connect(diode1.n, n1) annotation (Line(points={{-40,68},{60,68},{60,0},
                  {100,0}}, color={0,0,255}));
          connect(n1, n1)
            annotation (Line(points={{100,0},{100,0}}, color={0,0,255}));
          annotation (
            Icon(coordinateSystem(preserveAspectRatio=false)),
            Diagram(coordinateSystem(preserveAspectRatio=false)),
            Documentation(info="<html>
<p>The element is a diode</p>
<p>Anode and cathode are the names of the two poles that make up a two-pole electrical component known as a diode. Practically speaking, the diode can only transfer electrical current from the anode to the cathode. [1]</p>
</html>"));
        end Diode;
      end BasePack;

      package DuplicatedExtensions
        "The duplicated packages from the base package will be found here"
        model PowerConverter4Diode
          Modelica.Electrical.Analog.Semiconductors.Diode diode1(Vt=
                diodeVoltage)
            annotation (Placement(transformation(extent={{-60,52},{-40,72}})));
          parameter Real diodeVoltage=0.04
            "[v] The voltage drop over one diode in the power converter";
          Modelica.Electrical.Analog.Semiconductors.Diode diode2(Vt=
                diodeVoltage) annotation (Placement(transformation(
                extent={{-10,-10},{10,10}},
                rotation=90,
                origin={-30,46})));
          Modelica.Electrical.Analog.Semiconductors.Diode diode3(Vt=
                diodeVoltage) annotation (Placement(transformation(
                extent={{10,-10},{-10,10}},
                rotation=180,
                origin={-50,30})));
          Modelica.Electrical.Analog.Semiconductors.Diode diode4(Vt=
                diodeVoltage) annotation (Placement(transformation(
                extent={{-10,-10},{10,10}},
                rotation=90,
                origin={-72,46})));
          Modelica.Electrical.Analog.Interfaces.PositivePin AC1
            "Positive electrical pin" annotation (Placement(transformation(
                  extent={{-112,66},{-92,86}}), iconTransformation(extent={{
                    -112,66},{-92,86}})));
          Modelica.Electrical.Analog.Interfaces.NegativePin AC2
            "Negative electrical pin" annotation (Placement(transformation(
                  extent={{-112,-74},{-92,-54}}), iconTransformation(extent={{
                    -112,-74},{-92,-54}})));
          Modelica.Electrical.Analog.Interfaces.NegativePin V_out
            "Negative electrical pin" annotation (Placement(transformation(
                  extent={{90,-4},{110,16}}), iconTransformation(extent={{90,-4},
                    {110,16}})));
          Modelica.Electrical.Analog.Interfaces.NegativePin gnd
            "Negative electrical pin" annotation (Placement(transformation(
                  extent={{90,-94},{110,-74}}), iconTransformation(extent={{90,
                    -94},{110,-74}})));
        equation
          connect(AC1, AC1)
            annotation (Line(points={{-102,76},{-102,76}}, color={0,0,255}));
          connect(AC2, AC2) annotation (Line(points={{-102,-64},{-98,-64},{-98,
                  -64},{-102,-64}}, color={0,0,255}));
          connect(gnd, gnd) annotation (Line(points={{100,-84},{100,-83},{100,
                  -84},{100,-84}}, color={0,0,255}));
          connect(diode1.p, AC1) annotation (Line(points={{-60,62},{-72,62},{
                  -72,76},{-102,76}}, color={0,0,255}));
          connect(diode1.p, diode4.n) annotation (Line(points={{-60,62},{-72,62},
                  {-72,56}}, color={0,0,255}));
          connect(diode3.p, diode4.p) annotation (Line(points={{-60,30},{-72,30},
                  {-72,36}}, color={0,0,255}));
          connect(diode3.n, diode2.p) annotation (Line(points={{-40,30},{-30,30},
                  {-30,36}}, color={0,0,255}));
          connect(diode2.n, diode1.n) annotation (Line(points={{-30,56},{-30,62},
                  {-40,62}}, color={0,0,255}));
          connect(V_out, diode2.n) annotation (Line(points={{100,6},{26,6},{26,
                  62},{-30,62},{-30,56}}, color={0,0,255}));
          connect(AC2, diode2.p) annotation (Line(points={{-102,-64},{-30,-64},
                  {-30,36}}, color={0,0,255}));
          connect(gnd, diode4.p) annotation (Line(points={{100,-84},{80,-84},{
                  80,-82},{24,-82},{24,-20},{-72,-20},{-72,36}}, color={0,0,255}));
          annotation (
            Icon(coordinateSystem(preserveAspectRatio=false), graphics={Bitmap(
                    extent={{-96,-90},{92,80}}, fileName=
                      "modelica://FM3217_Assignment2022/Resources/Images/TaskC_RectiferDiodes.png")}),

            Diagram(coordinateSystem(preserveAspectRatio=false)),
            Documentation(info="<html>
<h4><span style=\"color: #00aa00\">4 diode rectifier</span></h4>
<p>This will be a simple 4 diode rectifer to use from AC to DC.</p>
<p>A bether rectifier than one diode</p>
</html>"));
        end PowerConverter4Diode;

        model PowerConverter4Diode1Capasitor
          Modelica.Electrical.Analog.Semiconductors.Diode diode1(Vt=
                diodeVoltage)
            annotation (Placement(transformation(extent={{-60,52},{-40,72}})));
          parameter Real diodeVoltage=0.04
            "[v] The voltage drop over one diode in the power converter";
          Modelica.Electrical.Analog.Semiconductors.Diode diode2(Vt=
                diodeVoltage) annotation (Placement(transformation(
                extent={{-10,-10},{10,10}},
                rotation=90,
                origin={-30,46})));
          Modelica.Electrical.Analog.Semiconductors.Diode diode3(Vt=
                diodeVoltage) annotation (Placement(transformation(
                extent={{10,-10},{-10,10}},
                rotation=180,
                origin={-50,30})));
          Modelica.Electrical.Analog.Semiconductors.Diode diode4(Vt=
                diodeVoltage) annotation (Placement(transformation(
                extent={{-10,-10},{10,10}},
                rotation=90,
                origin={-72,46})));
          Modelica.Electrical.Analog.Interfaces.PositivePin AC1
            "Positive electrical pin" annotation (Placement(transformation(
                  extent={{-112,66},{-92,86}}), iconTransformation(extent={{
                    -112,66},{-92,86}})));
          Modelica.Electrical.Analog.Interfaces.NegativePin AC2
            "Negative electrical pin" annotation (Placement(transformation(
                  extent={{-112,-52},{-92,-32}}), iconTransformation(extent={{
                    -112,-52},{-92,-32}})));
          Modelica.Electrical.Analog.Interfaces.NegativePin V_out
            "Positive electrical pin" annotation (Placement(transformation(
                  extent={{90,6},{110,26}}), iconTransformation(extent={{90,6},
                    {110,26}})));
          Modelica.Electrical.Analog.Interfaces.NegativePin gnd
            "Negative electrical pin" annotation (Placement(transformation(
                  extent={{90,-70},{110,-50}}), iconTransformation(extent={{90,
                    -70},{110,-50}})));
          Modelica.Electrical.Analog.Basic.Capacitor capacitor(C=
                C_powerconverter) annotation (Placement(transformation(
                extent={{-10,-10},{10,10}},
                rotation=270,
                origin={26,-4})));
          parameter Real C_powerconverter=2.2
            "[F] The size of the capasitor in the power converter";
        equation
          connect(AC1, AC1)
            annotation (Line(points={{-102,76},{-102,76}}, color={0,0,255}));
          connect(AC2, AC2) annotation (Line(points={{-102,-42},{-98,-42},{-98,
                  -42},{-102,-42}}, color={0,0,255}));
          connect(gnd, gnd) annotation (Line(points={{100,-60},{100,-60},{100,
                  -60},{100,-60}}, color={0,0,255}));
          connect(diode1.p, AC1) annotation (Line(points={{-60,62},{-72,62},{
                  -72,76},{-102,76}}, color={0,0,255}));
          connect(diode1.p, diode4.n) annotation (Line(points={{-60,62},{-72,62},
                  {-72,56}}, color={0,0,255}));
          connect(diode3.p, diode4.p) annotation (Line(points={{-60,30},{-72,30},
                  {-72,36}}, color={0,0,255}));
          connect(diode3.n, diode2.p) annotation (Line(points={{-40,30},{-30,30},
                  {-30,36}}, color={0,0,255}));
          connect(diode2.n, diode1.n) annotation (Line(points={{-30,56},{-30,62},
                  {-40,62}}, color={0,0,255}));
          connect(V_out, diode2.n) annotation (Line(points={{100,16},{26,16},{
                  26,62},{-30,62},{-30,56}}, color={0,0,255}));
          connect(AC2, diode2.p) annotation (Line(points={{-102,-42},{-30,-42},
                  {-30,36}}, color={0,0,255}));
          connect(gnd, diode4.p) annotation (Line(points={{100,-60},{26,-60},{
                  26,-20},{-72,-20},{-72,36}}, color={0,0,255}));
          connect(V_out, capacitor.p) annotation (Line(points={{100,16},{64,16},
                  {64,6},{26,6}}, color={0,0,255}));
          connect(gnd, capacitor.n) annotation (Line(points={{100,-60},{26,-60},
                  {26,-14}}, color={0,0,255}));
          annotation (
            Icon(coordinateSystem(preserveAspectRatio=false), graphics={Bitmap(
                    extent={{-96,-78},{102,96}}, fileName=
                      "modelica://FM3217_Assignment2022/Resources/Images/TaskC_RectiferDiodeswCapasitor.png")}),

            Diagram(coordinateSystem(preserveAspectRatio=false)),
            Documentation(info="<html>
<h4><span style=\"color: #00aa00\">4 diode rectifier with condensator</span></h4>
<p>This will be a simple 4 diode rectifer with a capastor in paralell with the output to use from AC to DC.</p>
<p>A good power converter</p>
</html>"));
        end PowerConverter4Diode1Capasitor;
      end DuplicatedExtensions;

      package InheritedExtensions
        "Under here the packages from base packeges has inheritance"

        model PowerConverter4diode
          extends BasePack.Diode;
          Modelica.Electrical.Analog.Semiconductors.Diode diode2(Vt=
                diodeVoltage) annotation (Placement(transformation(
                extent={{-10,-10},{10,10}},
                rotation=90,
                origin={-30,50})));
          Modelica.Electrical.Analog.Semiconductors.Diode diode3(Vt=
                diodeVoltage)
            annotation (Placement(transformation(extent={{-60,22},{-40,42}})));
          Modelica.Electrical.Analog.Semiconductors.Diode diode4(Vt=
                diodeVoltage) annotation (Placement(transformation(
                extent={{-10,-10},{10,10}},
                rotation=90,
                origin={-70,50})));
          Modelica.Electrical.Analog.Interfaces.NegativePin AC_out
            "Negative electrical pin" annotation (Placement(transformation(
                  extent={{-112,-10},{-92,10}}), iconTransformation(extent={{
                    -112,-10},{-92,10}})));
          Modelica.Electrical.Analog.Interfaces.NegativePin gnd
            "Negative electrical pin"
            annotation (Placement(transformation(extent={{90,-90},{110,-70}})));
        equation
          connect(diode3.n, diode2.p) annotation (Line(points={{-40,32},{-30,32},
                  {-30,40}}, color={0,0,255}));
          connect(diode1.n, diode2.n) annotation (Line(points={{-40,68},{-30,68},
                  {-30,60}}, color={0,0,255}));
          connect(diode3.p, diode4.p) annotation (Line(points={{-60,32},{-70,32},
                  {-70,40}}, color={0,0,255}));
          connect(diode4.n, diode1.p) annotation (Line(points={{-70,60},{-70,68},
                  {-60,68}}, color={0,0,255}));
          connect(diode3.n, AC_out) annotation (Line(points={{-40,32},{-30,32},
                  {-30,0},{-102,0}}, color={0,0,255}));
          connect(gnd, diode4.p) annotation (Line(points={{100,-80},{-6,-80},{
                  -6,-30},{-70,-30},{-70,40}}, color={0,0,255}));
          annotation (Icon(graphics={
                Bitmap(extent={{-98,-14},{-10,74}}, fileName=
                      "modelica://FM3217_Assignment2022/Resources/Images/TaskC_RectiferDiodes.png"),

                Line(points={{-10,-10},{0,-10},{0,-80},{90,-80}}, color={0,0,0}),

                Line(points={{-10,34},{28,34},{28,0},{88,0},{94,0}}, color={0,0,
                      0})}));
        end PowerConverter4diode;

        model PowerConverterCapasitor
          extends BasePack.Diode;
          Modelica.Electrical.Analog.Semiconductors.Diode diode2(Vt=
                diodeVoltage) annotation (Placement(transformation(
                extent={{-10,-10},{10,10}},
                rotation=90,
                origin={-30,50})));
          Modelica.Electrical.Analog.Semiconductors.Diode diode3(Vt=
                diodeVoltage)
            annotation (Placement(transformation(extent={{-60,22},{-40,42}})));
          Modelica.Electrical.Analog.Semiconductors.Diode diode4(Vt=
                diodeVoltage) annotation (Placement(transformation(
                extent={{-10,-10},{10,10}},
                rotation=90,
                origin={-70,50})));
          Modelica.Electrical.Analog.Interfaces.NegativePin AC_out
            "Negative electrical pin" annotation (Placement(transformation(
                  extent={{-112,-10},{-92,10}}), iconTransformation(extent={{
                    -112,-10},{-92,10}})));
          Modelica.Electrical.Analog.Interfaces.NegativePin gnd
            "Negative electrical pin"
            annotation (Placement(transformation(extent={{90,-90},{110,-70}})));
          Modelica.Electrical.Analog.Basic.Capacitor capacitor(C=
                C_powerconverter) annotation (Placement(transformation(
                extent={{-10,-10},{10,10}},
                rotation=270,
                origin={30,-42})));
          parameter Real C_powerconverter=2.2
            "[F] Size of capasitor in the powerconverter";
        equation
          connect(diode3.n, diode2.p) annotation (Line(points={{-40,32},{-30,32},
                  {-30,40}}, color={0,0,255}));
          connect(diode1.n, diode2.n) annotation (Line(points={{-40,68},{-30,68},
                  {-30,60}}, color={0,0,255}));
          connect(diode3.p, diode4.p) annotation (Line(points={{-60,32},{-70,32},
                  {-70,40}}, color={0,0,255}));
          connect(diode4.n, diode1.p) annotation (Line(points={{-70,60},{-70,68},
                  {-60,68}}, color={0,0,255}));
          connect(diode3.n, AC_out) annotation (Line(points={{-40,32},{-30,32},
                  {-30,0},{-102,0}}, color={0,0,255}));
          connect(gnd, diode4.p) annotation (Line(points={{100,-80},{-6,-80},{
                  -6,-30},{-70,-30},{-70,40}}, color={0,0,255}));
          connect(diode1.n, capacitor.p) annotation (Line(points={{-40,68},{30,
                  68},{30,-32}}, color={0,0,255}));
          connect(gnd, capacitor.n) annotation (Line(points={{100,-80},{30,-80},
                  {30,-52}}, color={0,0,255}));
          connect(AC_out, AC_out) annotation (Line(points={{-102,0},{-98,0},{
                  -98,0},{-102,0}}, color={0,0,255}));
          annotation (Icon(graphics={
                Bitmap(extent={{-98,-14},{-10,74}}, fileName=
                      "modelica://FM3217_Assignment2022/Resources/Images/TaskC_RectiferDiodes.png"),

                Line(points={{-10,-10},{0,-10},{0,-80},{90,-80}}, color={0,0,0}),

                Line(points={{-10,34},{28,34},{28,0},{88,0},{94,0}}, color={0,0,
                      0}),
                Line(points={{40,0},{40,-40}}, color={0,0,0}),
                Line(points={{40,-80},{40,-44}}, color={0,0,0}),
                Line(points={{44,-40},{36,-40}}, color={0,0,0}),
                Line(points={{44,-44},{36,-44}}, color={0,0,0})}));
        end PowerConverterCapasitor;
      end InheritedExtensions;
      annotation (Documentation(info="<html>
<h4>What is a Power Converter</h4>
<p>A power converter is a mechanical or electrical device used to change the form of electrical energy. A power converter can transform direct current (DC) from alternating current (AC) (DC) [2].</p>
<h4>Various Power converters in this library</h4>
<p>Three converters are available for usage in this library. The first is a straightforward diode. This is accessible from BasePack. The second converter produces a direct current using just 4 diodes. The final one is constructed on top of the four diodes and includes a conductor that runs parallel to the output.</p>
<p>Both Duplicated Extensions and Inherited Extensions contain the same converters.</p>
<p>Soruce: https://en.wikipedia.org/wiki/Electric_power_conversion</p>
</html>"), Icon(graphics={Bitmap(extent={{-100,-100},{100,100}}, fileName=
                  "modelica://FM3217_Assignment2022/Resources/Images/TaskC_Library.png")}));
    end PowerConverters;
  end YourSubLibrary;
  annotation ( preferredView="info",uses(Modelica(version="4.0.0"), HydroPower(version="2.15")),
                                Documentation(info="<html>
<h4>Please go to the <a href=\"modelica://FM3217_Assignment2022.TaskDescription\">TaskDescription</a> for details on the assignment.</h4>
</html>"),
    version="2022");
end FM3217_Assignment2022;
