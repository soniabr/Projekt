% initials 
tol = [0 0 0 1 0 0;... 
       0 0 0 0 1 0;...
       0 0 0 0 0 1;...
       1 0 0 1 0 0;...
       0 1 0 0 1 0;...
       0 0 1 0 0 1;...
       0 0 1 1 0 0;...
       0 0 0 2 1 1;...
       0 0 0 4 1 1;...
       0 0 0 10 1 1;...
       10 0 0 1 0 1];
   
tol=tol./repmat(sum(tol(:,:),2),1,6)*6; % normalize tol

runs=500;

n=zeros(1,4); %neighbours

agent = randomizeagent(agent); % set random arragnement of agents

district_agent=floor(sizepercent*length(agent)); % number of agents per district

threshold=[4.0 4.1 4.3 4.5 3.0 3.4 3.6 3.8 3.9];

%%
%simulation over all tol/threshold

for ithreshold=1:length(threshold)
    for itol=1:length(tol)
    
    agent = randomizeagent(agent); % set random arragnement of agents
    [result, Avg_district ] = simulateit( runs, tol(itol,:), agent, threshold(ithreshold), district_agent);
    parsave(result, Avg_district, tol(itol,:),threshold(ithreshold),runs)
    
    end
end
