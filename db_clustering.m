function final_clust = db_clustering(knn_mat,ang_dev_mat,eps)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Adapted from the original code by:
% Mostapha Kalami Heris,  DBSCAN Clustering in MATLAB 
% (https://yarpiz.com/255/ypml110-dbscan-clustering), Yarpiz, 2015.
% Also, available in MATLAB Central File Exchange:
% (https://www.mathworks.com/matlabcentral/fileexchange/52905-dbscan-clustering-algorithm)

% Original Reference:
% Ester et al. “A Density-Based Algorithm for Discovering Clusters in Large Spatial Databases with Noise” 
% In Proceedings of the 2nd International Conference on Knowledge Discovery and Data Mining, Portland, 
% OR, AAAI Press, pp. 226–231. 1996

% Input:
% 1) knn_mat => pairwise nearest neighbour matrix
% 2) ang_dev_mat => pairwise angular deviation matrix
% 3) eps => epsilon neighbourhood value based on DBSCAN. In this code, it
% refers to the maximum allowed angular deviation between two trajectory 
% vectors in the ang_dev_mat

% Output:
% 1) final_clust => a column vector which contains the cluster labels for
% each trajectory.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

min_pts = 5; % the minpts criteria of DBSCAN, mainly used to seggregate noisy clusters
% initialize 
final_clust=zeros(size(ang_dev_mat,1),1)-1;
cluster_label=1;

% randomly choose the visiting order
visit_order=randperm(length(final_clust));

for i=1:length(final_clust)
    % for each point, check if it is not visited yet (unclassified)
    current_pt=visit_order(i);
    if final_clust(current_pt)==-1
        % iteratively expand the cluster through density-reachability
        [final_clust,isnoise] = expand_cluster(knn_mat,ang_dev_mat,...
                        current_pt,cluster_label,eps,min_pts,final_clust);
        if ~isnoise
            cluster_label=cluster_label+1;
        end
    end
end
% any remaining un-classified point is considered as noise
un_class = find(final_clust == -1); 
if(numel(un_class) ~= 0)
   final_clust(un_class) = 0;
end

end % end of main function

function [clust,isnoise] = expand_cluster(knn_mat,ang_dev_mat,current_pt, ...
                           cluster_label,eps,min_pts,clust)

% cluster membership criteria
seeds=[current_pt;intersect(find(ang_dev_mat(:,current_pt)<=eps), find(knn_mat(:,current_pt)==1))];

if length(seeds)<min_pts
    clust(current_pt)=0; % 0 reserved for noise
    isnoise=true;
    return
else
    clust(seeds)=cluster_label;
    % delete the core point
    seeds=setxor(seeds,current_pt);
    while ~isempty(seeds)
        currentP=seeds(1);
        % cluster membership criteria
        result=[currentP;intersect(find(ang_dev_mat(:,currentP)<=eps), find(knn_mat(:,currentP)==1))];
        if length(result)>=min_pts
            for i=1:length(result)
                resultP=result(i);
                if clust(resultP)==-1||clust(resultP)==0 % unclassified or noise
                    if clust(resultP)==-1 % unclassified
                        seeds=[seeds(:);resultP];
                    end
                    clust(resultP)=cluster_label;
                end      
            end
        end
        seeds=setxor(seeds,currentP);
    end
    isnoise=false;
    return 
end

end % end of sub function