function [agent,Avg] = check_agent( agent, district_agent, tol, runs )
% check neighbours
tic
k=1;

   Avg=zeros(12,4);
  

for d=1:12                                  % districts

 
    l=floor(sqrt(district_agent(d)));       % box(district) length
    lp = sum(district_agent(1:d));          % gives indice of last place in district    
    
                                             
    for j=k:lp
 
        Avg(d,1)=Avg(d,1)+agent(j).origin;       % Avg(1) fraction of swiss residents in district d
        Avg(d,2)=Avg(d,2)+agent(j).age;          % Avg(2) defines average age in district
        Avg(d,3)=Avg(d,3)+agent(j).famstat;      % Avg(3) fraction of families
    end
   
    Avg(d,1:3) = Avg(d,1:3)/(lp-k+1);

        
    for i = k:lp                            % agents in district d
    
                                            % d gives the district 
                                            % i runs over the agents in district d
                                            
                                            
    %defines 4 nearest neighbours of each agent with periodic boudary
    %conditions for each district.
    
    if i==k                                   % first agent boundary
        n(1)=i+1;                             % neighbour right
        n(2)=lp;                              % nb left
        n(3)=i+l;                             % nb down
        n(4)=lp-l;                            % neighbour up
    
    elseif i<k+l
         n(1)=i+1; n(2)=i-1; n(3)=i+l; n(4)=lp-l+(i-k);
    
    elseif i==lp
         n(1)=k; n(2)=i-1; n(3)=k+l; n(4)=i-l;
         
    elseif i>lp-l
         n(1)=i+1; n(2)=i-1; n(3)=k+l-(lp-i); n(4)=i-l;
    
    else
         n(1)=i+1; n(2)=i-1; n(3)=i+l; n(4)=i-l;
    
    end
    
    %check district-environment
    
    agent(i).points = agent(i).points + (1-(agent(i).origin-Avg(d,1)))*tol(1); % origin
    agent(i).points = agent(i).points + (1-abs(agent(i).age-Avg(d,2))/30)*tol(2); % age
    agent(i).points = agent(i).points + (1-(agent(i).famstat-Avg(d,3)))*tol(3); % family situation
    
    
    
    %Check criteria with neigbours    
       
    for nb=1:4    
        
        %check family status -> +1 if same
        agent(i).points = agent(i).points + (agent(i).famstat==agent(n(nb)).famstat)/4*tol(6);
        agent(i).points = agent(i).points + (agent(i).origin==agent(n(nb)).origin)/4*tol(4);
        agent(i).points = agent(i).points + (round(agent(i).age/10)==round(agent(n(nb)).age/10))/4*tol(5);
   
    end
    
    end
    
  
       for j=k:lp
    
        Avg(d,4)=Avg(d,4)+agent(j).points;  %average points / district
       end
        Avg(d,4) = Avg(d,4)/(lp-k+1);
        
        
        k=lp+1;                             %upper boundary of district --> + 1 = lower boudary of next district

end
   


toc


end

