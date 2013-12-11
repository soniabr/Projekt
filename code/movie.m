%%
runs=1000;
tol=[0 0 0 4 1 1];
tol=tol./repmat(sum(tol(:,:),2),1,6)*6; % normalize tol
n=zeros(1,4); %neighbours

%district_names = {'kreis1' 'kreis2' 'kreis3' 'kreis4' 'kreis5' 'kreis6' 'kreis7' 'kreis8' 'kreis9' 'kreis10' 'kreis11' 'kreis12'};

agent = randomizeagent(agent); % set random arragnement of agents

district_agent=floor(sizepercent*length(agent)); % number of agents per district
%%
[result, Avg_district] = simulateit( runs, tol , agent, 3.6, district_agent);

cd('\\d\dfs\Users\all\buechij\private\Master\soms\movie5')


% plots number of agents changing against nr of cycles
figure
plot(result(:,1))
xlabel('# cycles')
ylabel('# of people changing')
title({'Agents changing their location:';...
    ['Threshold: ' num2str(threshold) ', # runs: ' num2str(runs) ', tolerance: ' num2str(tol)];...
    ' '},...
    'FontWeight','bold')
saveas(figure(1),[num2str(threshold) '_' num2str(runs) '_' num2str(tol),'_Nostay'  '_.jpeg'])
saveas(figure(1),[num2str(threshold) '_' num2str(runs) '_' num2str(tol),'_Nostay'  '_.fig'])

% plots average of points against nr of cycles
figure
plot(result(:,2))
xlabel('# cycles')
ylabel('# average of points')
title({'Average points of Agents:';...
    ['Threshold: ' num2str(threshold) ', # runs: ' num2str(runs) ', tolerance: ' num2str(tol)];...
    ' '},...
    'FontWeight','bold')
saveas(figure(2),[num2str(threshold) '_' num2str(runs) '_' num2str(tol),'_Points'  '_.jpeg'])
saveas(figure(2),[num2str(threshold) '_' num2str(runs) '_' num2str(tol),'_Points'  '_.fig'])


% plots how the end result looks like averaged
figure

subplot(2,2,1)
bar(Avg_district(:,1,end))
xlabel('district')
ylabel('% swiss')
title({'End state:                                                                  ';...
    ['Threshold: ' num2str(threshold) ', # runs: ' num2str(runs) ', tolerance: ' num2str(tol)];...
    ' '},...
    'FontWeight','bold')

subplot(2,2,2)
bar(Avg_district(:,2,end))
xlabel('district')
ylabel('average age')

subplot(2,2,3)
bar(Avg_district(:,3,end))
xlabel('district')
ylabel('% families')

subplot(2,2,4)
bar(Avg_district(:,4,end))
xlabel('district')
ylabel('average points')

saveas(figure(3),[num2str(threshold) '_' num2str(runs) '_' num2str(tol),'_end_state'   '_.jpeg'])
saveas(figure(3),[num2str(threshold) '_' num2str(runs) '_' num2str(tol),'_end_state'   '_.fig'])

% plot evolution of segregation
figure

subplot(2,2,1)
set(gcf,'DefaultAxesColorOrder',colormap('HSV(12)'));
plot(squeeze(Avg_district(1:12,1,:))')
% legend('district 1','district 2','district 3','district 4',...
%        'district 5','district 6','district 7','district 8',...
%        'district 9','district 10','district 11','district 12',...
%        'Location','NorthWestOutside')
xlabel('# cylces (origin)')
ylabel('% Swiss')

title({'Evolution of Segregation:                                  ';...
    ['Threshold: ' num2str(threshold) ', # runs: ' num2str(runs) ', tolerance: ' num2str(tol)];...
    ' '},...
    'FontWeight','bold')

subplot(2,2,2)
set(gcf,'DefaultAxesColorOrder',colormap('HSV(12)'));
plot(squeeze(Avg_district(1:12,2,:))')
xlabel('# cylces (age)')
ylabel('age')

subplot(2,2,3)
set(gcf,'DefaultAxesColorOrder',colormap('HSV(12)'));
plot(squeeze(Avg_district(1:12,3,:))')
xlabel('# cylces (family)')
ylabel('% Family')

subplot(2,2,4)
set(gcf,'DefaultAxesColorOrder',colormap('HSV(12)'));
plot(squeeze(Avg_district(1:12,4,:))')
xlabel('# cylces (Points)')
ylabel('Points')


saveas(figure(4),[num2str(threshold) '_' num2str(runs) '_' num2str(tol),'_Evolution'  '_.jpeg'])
saveas(figure(4),[num2str(threshold) '_' num2str(runs) '_' num2str(tol),'_Evolution'  '_.fig'])


% close all
cd('\\d\dfs\Users\all\buechij\private\Master\soms\movie5\')

%%
cd('\\d\dfs\Users\all\buechij\private\Master\soms\movie1')
save('results.mat','result','Avg_district','M','-v7.3')
cd('\\d\dfs\Users\all\buechij\private\Master\soms')



%%
cd('\\d\dfs\Users\all\buechij\private\Master\soms\movie1')
load('results.mat')

zeropadd=zeros(1,12);
M=reshape([agenti.origin],size(agenti));
district_size=[0; district_agent];

cd('\\d\dfs\Users\all\buechij\private\Master\soms\movie1\origin')

for j=1:12
  
   for i=1:10
        
    agent_d=M(district_size(j)+1:district_size(j+1),i);
    
    n=length(agent_d);
    
    l = ceil(sqrt(n));
    
    zeropadd=2*ones(l*l-n,1);
               
    district=[agent_d;zeropadd];
    
    district_plot=reshape(district,l,l);
    
    imagesc(district_plot);
    
    saveas(figure(1),['District_',num2str(j),'_',num2str(i)])
    saveas(figure(1),['District_',num2str(j),'_',num2str(i),'.jpeg'])

    
    close all
    end
end

cd('\\d\dfs\Users\all\buechij\private\Master\soms')

%%

%%
cd('\\d\dfs\Users\all\buechij\private\Master\soms\movie1')
%load('results.mat')

zeropadd=zeros(1,12);
% M=reshape([agenti.origin],size(agenti));
district_size=[0; district_agent];

cd('\\d\dfs\Users\all\buechij\private\Master\soms\movie1\origin')

  
for i=1:100
    for j=1:12
        
    agent_d=M((sum(district_size(1:j))+1):sum(district_size(1:j+1)),i);
    n=length(agent_d);
    
    l = ceil(sqrt(n));
    
    zeropadd=2*ones(l*l-n,1);
               
    district=[agent_d;zeropadd];
    
    district_plot=reshape(district,l,l);
    subplot(3,4,j)
    
    imagesc(district_plot);
    xlabel(['district  ',num2str(j)])
    set(gca,...
    'XTickLabel','')
    set(gca,...
    'YTickLabel','')
    end
    
    saveas(figure(1),['State_',num2str(i)])
    saveas(figure(1),['state_',num2str(i),'.jpeg'])    
    close all
end

cd('\\d\dfs\Users\all\buechij\private\Master\soms')