function [agent, numb_moved]=nostay_more_out(agent, threshold)

nostay_indices=find([agent.points]<threshold);

agent_nostay=agent(nostay_indices);

agent_nostay_random=randomizeagent(agent_nostay);

agent(nostay_indices)=agent_nostay_random;

% kick out randomly
nostay_indices=ceil(rand(1,15000)*(length(agent)-1));

agent_nostay=agent(nostay_indices);

agent_nostay_random=randomizeagent(agent_nostay);

agent(nostay_indices)=agent_nostay_random;

numb_moved=length(nostay_indices);

end

