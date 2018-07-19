function [A]= GetQpoint(Vgg,Rg,Rd,Rs,Cin,Cout,Vd,Vs,TransientTime,ThresholdVoltage,DeviceParameter);

t=linspace(0,TransientTime,1000); %microsecond

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
I=[];
GS=[];
Ig=[];

for i=1:1000
inTimeConstant= Rg*Cin; % microsecond
GateVoltage= Vgg-(Vgg*exp(-t(i)/inTimeConstant));
Gatecurrent=(Vgg-GateVoltage)/Rg; % mA
DrainVoltage=Vd-(Id*Rd);
SourceVoltage= Vs+(Rs*Id);

[DrainCurrent,region] = idealMos(GateVoltage,SourceVoltage,DrainVoltage,ThresholdVoltage,DeviceParameter);

Id=DrainCurrent;
Ig=[Ig,Gatecurrent];
I=[I,Id];
Vgs=GateVoltage-SourceVoltage;
GS=[GS,Vgs];

end

A=struct('a',GS,'b',I,'c',Ig);
plot(t,GS);
hold on;
plot(t,I);
hold on;
plot(t,Ig);
legend('Vgs','Id','Ig');
end