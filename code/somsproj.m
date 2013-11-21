% import data and create agents with age, family status and origin

cd('\\d\dfs\Users\all\buechij\private\segregation') %import data

[num,~,raw] = xlsread('data.xlsx');


famstat=raw(2:end,3);   %family status
famstat=strncmp('Familie',famstat,3);

origin=raw(2:end,4);    %origin (Siwss or not)
origin=strncmp('Sch',origin,3);

age=num(1:end,4);       %age of persons  

numbof=num(1:end,5);    %#numer of persons with that criteria

clear num txt raw


%create agents
l=1;
for i = 1:length(age)
    
    for k = 1:numbof(i)
        
        agent(l).famstat=famstat(i);
        agent(l).origin=origin(i);
        agent(l).age=age(i);   
        agent(l).points=0;
               
  l=l+1;              
    end
    
end

clear i k l age famstat numbof origin
%%
% Size of districts
[SizeDistricts,~,~] = xlsread('districts.xlsx');

 sizepercent = SizeDistricts/sum(SizeDistricts);
 
 clear raw

%%
% Initials

tol=[1 1 1 1 1 1];  % tolerance origin / age / family situation

threshold=3.5;

runs=30;

n=zeros(1,4);

%district_names = {'kreis1' 'kreis2' 'kreis3' 'kreis4' 'kreis5' 'kreis6' 'kreis7' 'kreis8' 'kreis9' 'kreis10' 'kreis11' 'kreis12'};

agent = randomizeagent(agent); % set random arragnement of agents

district_agent=floor(sizepercent*length(agent)); % number of agents per district
   

%% checks environment of every agent and gives points according to satisfaction

Avg_district=zeros(12,3,runs);
for i =1:runs

[agent,Avg_district]=check_agent(agent,district_agent,tol,i);

% decides whether agent wants to stay or not and randomizes the ones which are not satisfied
[agent, numb_moved]=nostay(agent, threshold);

AvgP=0;
for j=1:length(agent)
AvgP=AvgP+agent(j).points;
agent(j).points=0;
end
AvgP=AvgP/length(agent);

result(i,1)=numb_moved;
result(i,2)=AvgP;
%Avg_district(:,:,i)=Avg_district;
end

%%
agent = randomizeagent(agent);






%%
AvgP=0;
for j=1:length(agent)
AvgP=AvgP+agent(j).points;
agent(j).points=0;
end
AvgP/length(agent)
