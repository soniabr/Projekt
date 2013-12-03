
function [ Avg_district, result] = auswertung( threshold,runs ,tol)

% loads specific result
load(['result_' num2str(threshold) '_' num2str(runs) '_' num2str(tol) '.mat'])

% plots number of agents changing against nr of cycles
figure
plot(result(:,1))
xlabel('# cycles')
ylabel('# of people changing')
title({'Agents changing their location:';...
    ['Threshold: ' num2str(threshold) ', # runs: ' num2str(runs) ', tolerance: ' num2str(tol)];...
    ' '},...
    'FontWeight','bold')
saveas(figure(1),['nostay_' num2str(threshold) '_' num2str(runs) '_' num2str(tol) '.jpeg'])
saveas(figure(1),['nostay_' num2str(threshold) '_' num2str(runs) '_' num2str(tol) '.fig'])

% plots average of points against nr of cycles
figure
plot(result(:,2))
xlabel('# cycles')
ylabel('# average of points')
title({'Average points of Agents:';...
    ['Threshold: ' num2str(threshold) ', # runs: ' num2str(runs) ', tolerance: ' num2str(tol)];...
    ' '},...
    'FontWeight','bold')
saveas(figure(2),['Points_' num2str(threshold) '_' num2str(runs) '_' num2str(tol) '.jpeg'])
saveas(figure(2),['Points_' num2str(threshold) '_' num2str(runs) '_' num2str(tol) '.fig'])


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
saveas(figure(3),['end_state' num2str(threshold) '_' num2str(runs) '_' num2str(tol) '.jpeg'])
saveas(figure(3),['end_state' num2str(threshold) '_' num2str(runs) '_' num2str(tol) '.fig'])

% plots developement of district averages
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
saveas(figure(3),['end_state' num2str(threshold) '_' num2str(runs) '_' num2str(tol) '.jpeg'])
saveas(figure(3),['end_state' num2str(threshold) '_' num2str(runs) '_' num2str(tol) '.fig'])


end

