function [ ] = make_graphs_for_tolerance(tol)

% array with all files in directory named result......mat
file_names=dir(['random_kicks_result_*_500_',num2str(tol),'.mat']);

figure
% color = [1 0 0; 0 1 0; 0 0 1; 1 1 0; 0 1 1;1 0 1; 1 1 1; 2 1 1;  1 1 2];
for i = 1:length(file_names);
    
    load(file_names(i).name)
    result_all(:,:,i)=result;
    Diff_Origin(i) = max(Avg_district(:,1,500))-min(Avg_district(:,1,500));
    
end

    set(gcf,'DefaultAxesColorOrder',colormap('HSV(12)'));
    plot(squeeze(result_all(:,2,:)))
    xlabel('# cycles')
    ylabel('# average of points')
    title({'Average points of Agents:',num2str(tol),;...
            },...fil
        'FontWeight','bold')
    legend('3.4', '3.6', '3.8', '3.9', '3 ','4.3' ,'4.5', '4')
    
    figure
        set(gcf,'DefaultAxesColorOrder',colormap('HSV(12)'));
    

    Diff_Origin2=Diff_Origin([5 1 2 3 4 8 6 7]);
    bar(Diff_Origin2)
    xlabel('Threshold')
    ylabel('Difference (origin)')
    title({'Amount of segregation (max-min):',num2str(tol),;...
            },...
        'FontWeight','bold')
     set(gca,'XTickLabel',{'3', '3.4', '3.6', '3.8', '3.9 ','4' ,'4.3', '4.5'})
     
     saveas(figure(1),['Points_',num2str(tol),'_different_Threshold.jpeg'])
     saveas(figure(2),['Segregation_',num2str(tol),'_different_Threshold.jpeg'])

    close all

end
