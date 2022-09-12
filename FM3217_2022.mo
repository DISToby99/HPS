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
  end Tutorial2;
end FM3217_2022;
