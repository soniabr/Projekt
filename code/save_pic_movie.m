function [  ] = save_pic_movie(agent,district_agent,runNr)


M=zeros(length(agent),4);
M(:,1)=reshape([agent.origin],size(agent));
M(:,2)=reshape([agent.famstat],size(agent));
M(:,3)=reshape([agent.points],size(agent));
M(:,4)=reshape([agent.age],size(agent));
district_size=[0; district_agent];

  for i = 1:4
      
      if i==1  
          cd('\\d\dfs\Users\all\buechij\private\Master\soms\movie5\origin')
      elseif i==2 
          cd('\\d\dfs\Users\all\buechij\private\Master\soms\movie5\family')
      elseif i==3
          cd('\\d\dfs\Users\all\buechij\private\Master\soms\movie5\points')
      else
          cd('\\d\dfs\Users\all\buechij\private\Master\soms\movie5\age')
      end
      
    for j=1:12
        
    agent_d=M((sum(district_size(1:j))+1):sum(district_size(1:j+1)),i);
    n=length(agent_d);
    
    l = floor(sqrt(n));
    
    b=ceil(n/l);
    
    zeropadd=2*ones((l*b)-n,1);
               
    district=[agent_d;zeropadd];

    district_plot=reshape(district,l,b);
    
    subplot(3,4,j)
    
    imagesc(district_plot);
    xlabel(['district  ',num2str(j)])
    set(gca,...
    'XTickLabel','')
    set(gca,...
    'YTickLabel','')
    
    end
    saveas(figure(1),['State_',num2str(runNr)])
    saveas(figure(1),['state_',num2str(runNr),'.jpeg'])    
    close all
end

cd('\\d\dfs\Users\all\buechij\private\Master\soms\movie5')

end

