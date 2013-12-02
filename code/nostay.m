function [agent, numb_moved]=nostay(agent, threshold)

nostay_indices=find([agent.points]<threshold);

agent_nostay=agent(nostay_indices);

agent_nostay_random=randomizeagent(agent_nostay);

agent(nostay_indices)=agent_nostay_random;

numb_moved=length(nostay_indices);

end
