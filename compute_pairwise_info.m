function [knn_mat,ang_dev_mat] = compute_pairwise_info(sa_feature_mat,K)
%(c) Abhilash K. Pai, June 2020 

[nearest_buddy,dist_of_nearest_buddy]= ...
knnsearch(sa_feature_mat(:,1:2),sa_feature_mat(:,1:2),'k',K,'distance','euclidean');
nearest_buddy(:,1)=[];
% dist_of_nearest_buddy(:,1)=[];

% this fragment of code could be vectorized
knn_mat = zeros(size(sa_feature_mat,1)); 
for i=1:size(nearest_buddy,1)
    for j=1:size(nearest_buddy,2)
        pos=nearest_buddy(i,:);
        knn_mat(i,pos)=1; % nearest neighbour matrix
        knn_mat(i,i)=0;
    end
end
ang_dev_mat = zeros(size(sa_feature_mat,1)); 
for i=1:size(sa_feature_mat,1)
    one=sa_feature_mat(i,3);
    for j=1:size(sa_feature_mat,1)
        two=sa_feature_mat(j,3);
        ang_dev_mat(i,j)=angular_dev(one,two); % angular deviation matrix
    end 
end

end % end of main function

function ang_dist = angular_dev(angle1,angle2)

delta_theta=abs(angle1-angle2);
circ_delta_theta=360-delta_theta;
ang_dist=min(delta_theta,circ_delta_theta);

end % end of sub function