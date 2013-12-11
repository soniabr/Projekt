
function [ ] = make_graphs_all(threshold,runs)

% array with all files in directory named result......mat
file_names=dir(['random_kicks_result_',num2str(threshold),'_',num2str(runs),'_','*.mat']);

% loads all result
for i=1:length(file_names)

load(file_names(i).name)

% plots number of agents changing against nr of cycles
figure
plot(result(:,1))
xlabel('# cycles')
ylabel('# of people changing')
title({'Agents changing their location:';...
    ['Threshold: ' num2str(threshold) ', # runs: ' num2str(runs) ', tolerance: ' num2str(tol)];...
    ' '},...
    'FontWeight','bold')
saveas(figure(1),[num2str(threshold) '_' num2str(runs) '_' num2str(tol),'_Nostay'  '_random_kick.jpeg'])
saveas(figure(1),[num2str(threshold) '_' num2str(runs) '_' num2str(tol),'_Nostay'  '_random_kick.fig'])

% plots average of points against nr of cycles
figure
plot(result(:,2))
xlabel('# cycles')
ylabel('# average of points')
title({'Average points of Agents:';...
    ['Threshold: ' num2str(threshold) ', # runs: ' num2str(runs) ', tolerance: ' num2str(tol)];...
    ' '},...
    'FontWeight','bold')
saveas(figure(2),[num2str(threshold) '_' num2str(runs) '_' num2str(tol),'_Points'  '_random_kick.jpeg'])
saveas(figure(2),[num2str(threshold) '_' num2str(runs) '_' num2str(tol),'_Points'  '_random_kick.fig'])


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

saveas(figure(3),[num2str(threshold) '_' num2str(runs) '_' num2str(tol),'_end_state'   '_random_kick.jpeg'])
saveas(figure(3),[num2str(threshold) '_' num2str(runs) '_' num2str(tol),'_end_state'   '_random_kick.fig'])

% plot evolution of segregation
figure

subplot(2,2,1)
set(gcf,'DefaultAxesColorOrder',colormap('HSV(12)'));
plot(squeeze(Avg_district(1:12,1,:))')
% legend('district 1','district 2','district 3','district 4',...
%        'district 5','district 6','district 7','district 8',...
%        'district 9','district 10','district 11','district 12',...
%        'Location','NorthWestOutside')
xlabel('# cylces ')
ylabel('% swiss')

title({'Evolution of Segregation:                                  ';...
    ['Threshold: ' num2str(threshold) ', # runs: ' num2str(runs) ', tolerance: ' num2str(tol)];...
    ' '},...
    'FontWeight','bold')

subplot(2,2,2)
set(gcf,'DefaultAxesColorOrder',colormap('HSV(12)'));
plot(squeeze(Avg_district(1:12,2,:))')
xlabel('# cylces ')
ylabel('age')

subplot(2,2,3)
set(gcf,'DefaultAxesColorOrder',colormap('HSV(12)'));
plot(squeeze(Avg_district(1:12,3,:))')
xlabel('# cylces ')
ylabel('% family')

subplot(2,2,4)
set(gcf,'DefaultAxesColorOrder',colormap('HSV(12)'));
plot(squeeze(Avg_district(1:12,4,:))')
xlabel('# cylces ')
ylabel('Points')


saveas(figure(4),[num2str(threshold) '_' num2str(runs) '_' num2str(tol),'_Evolution'  '_random_kick.jpeg'])
saveas(figure(4),[num2str(threshold) '_' num2str(runs) '_' num2str(tol),'_Evolution'  '_random_kick.fig'])


close all
clear Avg_district result tol 
end

display('All Graphs have been created and saved')


