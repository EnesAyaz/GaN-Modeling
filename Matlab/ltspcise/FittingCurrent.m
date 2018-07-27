%%
[Vds,Ids] = importData('Draft1.txt');
Vds=Vds(3:end,1);
Ids=Ids(3:end,1);
Vgs=zeros(length(Vds),1);
StartingVoltage=-5;
step=0.2;
Unnumber=find(isnan(Ids));
for i= 1: length(Vds)

   for j=1:length(Unnumber);
       
       if i~=Unnumber(j)
           Vgs(i)=StartingVoltage;
           
       else
          Vgs(i)=Vgs(i-1);
          StartingVoltage=StartingVoltage+step;
       end
   end
end


%%
Unnumber=find(isnan(Ids));
for i=1:length(Unnumber)
    
    Vds(Unnumber(i),:)=[];
    Vgs(Unnumber(i),:)=[];
    Ids(Unnumber(i),:)=[];
    
    
end
%%
figure(1);
plot3(Vgs,Vds,Ids,'x');
xlabel('Vgs');
ylabel('Vds');
zlabel('Ids');
%%


