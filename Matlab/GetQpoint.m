function [A]= GetQpoint(Vgg,Rg,Rd,Rs,Cin,Cout,Vd,Vs,TransientTime,ThresholdVoltage,DeviceParameter);

t=linspace(0,TransientTime,TransientTime); %microsecond

% Vgg is a biasing voltage at gate
% Vd and Vs is the voltage source at drain and source 
% Rg,Rd and Rs is the external resistance
% Cin and Cout is internal parasitic capacitence 
%DeviceParameter in microAmper/Volt^2
% ThresholdVoltage in V

% Vgg,Vdd in V
% Cin and Cout in pFarada
%  Rg,Rd,Rs in kOhm
% TransientTime in ms
Id=0;
A=[];

for i=1:TransientTime
inTimeConstant= Rg*Cin; % microsecond
GateVoltage= Vgg-(Vgg*exp(-t(i)/inTimeConstant));
Gatecurrent=(Vgg-GateVoltage)/Rg; % mA
DrainVoltage=Vd-(Id*Rd);
SourceVoltage= Vs+(Rs*Id);

[DrainCurrent,region] = idealMos(GateVoltage,SourceVoltage,DrainVoltage,ThresholdVoltage,DeviceParameter);
Id=DrainCurrent;
A=[A,Id];
end
end