function agent = randomizeagent(agent)

randomagent = randperm(length(agent));

agent = agent(randomagent);

end
