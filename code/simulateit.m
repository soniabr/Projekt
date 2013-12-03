function [ result, Avg_district ] = simulateit( runs, tol, agent, threshold, district_agent) 

Avg_district=zeros(12,4,runs);

for i =1:runs
i

% gives points according to environment
[agent,AvgD]=check_agent(agent,district_agent,tol,i);

% decides whether agent wants to stay or not and randomizes the ones which are not satisfied
[agent, numb_moved]=nostay(agent, threshold);

% calculate average points and set points to zero
AvgP=0;
for j=1:length(agent)
AvgP=AvgP+agent(j).points;
agent(j).points=0;
end
AvgP=AvgP/length(agent);

%stores the results, number of agents which moved, Average of points/agent
result(i,1)=numb_moved;
result(i,2)=AvgP;
%Average in districts
Avg_district(:,:,i)=AvgD;

end


end

