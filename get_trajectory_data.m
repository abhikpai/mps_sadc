function new_trks = get_trajectory_data(trks,groups,start_frame,end_frame)
%(c) Abhilash K. Pai, June 2020 

% Modify the original tracks data (in the variable "trks") according to the 
% ground truth data (in the variable "groups") and keep only the tracks 
% present in the ground truth data
nclust_gt=size(groups,2);
num=1;lab=0;
for i=1:nclust_gt 
    lab=lab+1;
    group_members=groups{1,i};
    for j=1:size(group_members,1)
        trk_no=group_members(j,1);       
        trks_temp(num).x=trks(trk_no).x;
        trks_temp(num).y=trks(trk_no).y;
        trks_temp(num).t=trks(trk_no).t;
        trks_temp(num).original_index=trk_no;
        trks_temp(num).gt_label=lab;
        num=num+1; 
    end 
end

% Get the tracks data from the start to end frame (as defined in "dataset_cuhk_300.mat")
% the modified data for further use will be stored in the variable "new_trks"
for i=1:size(trks_temp,2)
    k=1;
    for j=1:size(trks_temp(i).t,1) 
        if(trks_temp(i).t(j,1)>=start_frame && trks_temp(i).t(j,1)<=end_frame)
                new_trks_temp(i).x(k,1)=trks_temp(i).x(j);
                new_trks_temp(i).y(k,1)=trks_temp(i).y(j);
                new_trks_temp(i).t(k,1)=trks_temp(i).t(j);
                if(k==1)
                     new_trks_temp(i).original_index=trks_temp(i).original_index;
                     new_trks_temp(i).gt_label=trks_temp(i).gt_label;
                end
                k=k+1;
        end   
    end  
end
new_trks = new_trks_temp(~cellfun(@isempty,{new_trks_temp.t}));