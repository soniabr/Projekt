%% import data and create agents with age, family status and origin

%cd('\\d\dfs\Users\all\buechij\private\segregation - copy') %import data

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

% Size of districts
SizeDistricts=cell2mat(struct2cell(load('SizeDistrict.mat')));

 sizepercent = SizeDistricts/sum(SizeDistricts);
 
 clear raw i k l age famstat numbof origin

%% Initials

tol=[0 0 0 4 1 1; 0 0 0 3 1.5 1.5; 0 0 0 3 1.5 1.5; 0 0 0 4 1 1;];  % tolerance origin / age / family situation

tol=tol./repmat(sum(tol(:,:),2),1,6)*6; % normalize tol



threshold=[3.9,3.6,3.9,3.6];

runs=500;

n=zeros(1,4); %neighbours

%district_names = {'kreis1' 'kreis2' 'kreis3' 'kreis4' 'kreis5' 'kreis6' 'kreis7' 'kreis8' 'kreis9' 'kreis10' 'kreis11' 'kreis12'};

agent = randomizeagent(agent); % set random arragnement of agents

district_agent=floor(sizepercent*length(agent)); % number of agents per district
   

%% checks environment of every agent and gives points according to satisfaction

matlabpool(2)
parfor j=1:2
    
    if j==1
        
[ result, Avg_district ] = simulateit( runs, tol(1,:), agent, threshold(1), district_agent);
parsave(result, Avg_district, tol(1,:),threshold,runs,j)

    elseif j==2
       
[ result, Avg_district ] = simulateit( runs, tol(2,:), agent, threshold(2), district_agent);
parsave(result, Avg_district, tol(2,:),threshold,runs,j)

    elseif j==3
       
[ result, Avg_district ] = simulateit( runs, tol(3,:), agent, threshold, district_agent);
parsave(result, Avg_district, tol(3,:),threshold,runs,j)

    elseif j==4
        
[ result, Avg_district ] = simulateit( runs, tol(4,:), agent, threshold, district_agent);
parsave(result, Avg_district, tol(4,:),threshold,runs,j)



    end
end

matlabpool close



%%


[ result1, Avg_district1 ] = simulateit( runs, tol, agent, threshold, district_agent);










%% randomize

for i =1:5
agent = randomizeagent(agent);
end

%% check random 

for j=1:30
    same_neighbour=0;
for i=3:length(agent)

    same_neighbour=same_neighbour+(agent(i).age==agent(i-2).age);

end

same_neighbour

agent = randomizeagent(agent);

end

%%
AvgP=0;
for j=1:length(agent)
AvgP=AvgP+agent(j).points;
agent(j).points=0;
end


AvgP/length(agent)

%% Plotting


 for distr=1:12
     plot(squeeze(Avg_district(distr,1,:)))
     hold on
 end
     