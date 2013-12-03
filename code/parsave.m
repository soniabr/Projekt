function [res] = parsave(result, Avg_district, tol,threshold,runs,j)




save(['result_' num2str(threshold) '_' num2str(runs) '_' num2str(tol) '.mat'],'result','Avg_district','tol')

res='saved';
end

