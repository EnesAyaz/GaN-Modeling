GateVoltage=linspace(0,5,10); % V
SourceVoltage=0; %V
DrainVoltage=linspace(0,10,10); %V
DeviceParameter=600; % microA/V^2
ThresholdVoltage=0.5; %V
Id=zeros(1,10); % mA
for i=1:length(GateVoltage);
    for j=1:length(DrainVoltage);
    [a,b]=idealMos(GateVoltage(i),SourceVoltage,DrainVoltage(j),ThresholdVoltage,DeviceParameter);
    Id(j)=a;
    end
    figure(1);
    plot(DrainVoltage,Id);
    hold on;  
    title('Id vs Vds');
    xlabel('Vds(V)');
    ylabel('Drain Current(mA)');
   
end
legend('show');


GateVoltage=linspace(0,2,10); % V
SourceVoltage=0; %V
DrainVoltage=linspace(0,5,5); %V
DeviceParameter=600; % microA/V^2
ThresholdVoltage=0.5; %V
Id=zeros(1,10); % mA

for i=1:length(DrainVoltage);
    for j=1:length(GateVoltage);
    [a,b]=idealMos(GateVoltage(j),SourceVoltage,DrainVoltage(i),ThresholdVoltage,DeviceParameter);
    Id(j)=a;
    end
    figure(2);
    plot(GateVoltage,Id);
    hold on;  
    title('Id vs Vgs');
    xlabel('Vgs(V)');
    ylabel('Drain Current(mA)');
   
end
legend('show');