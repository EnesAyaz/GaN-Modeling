function [DrainCurrent,region] = idealMos(GateVoltage,SourceVoltage,DrainVoltage,ThresholdVoltage,DeviceParameter)
%DrainCurrent is in Ampers, 
%GateVoltage SourceVoltage,DrainVoltage,ThresholdVoltage are in V.
%DeviceParameter in microAmper/Volt^2
%DrainCurrent in mAmper
% region shows the operation region of mosfets
Vgs = GateVoltage-SourceVoltage;
Vds= DrainVoltage-SourceVoltage;
Vth=ThresholdVoltage;
ConditionVoltage= Vgs-Vth;
Kn=DeviceParameter* 10^-6;

if ConditionVoltage>0
   if Vds<=Vgs-Vth
       DrainCurrent=Kn*((ConditionVoltage*Vds)-((Vds^2)/2));
       % triode region
       region='Triode';
   else
       DrainCurrent=(Kn*ConditionVoltage*ConditionVoltage)/2;
       % saturation region
       region='Saturation';
   end
else
   DrainCurrent=0; % cut-off region
   region='cut-Off';
end

DrainCurrent=DrainCurrent*1000;

end

