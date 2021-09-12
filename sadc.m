function [clust_id,gt_id] = sadc(scene_no,eps,alpha_k)
%(c) Abhilash K. Pai, June 2020 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% If you use this code for your work, please cite the following paper:
% A. K. Pai, A. K. Karunakar and U. Raghavendra, 
% "Scene-Independent Motion Pattern Segmentation in Crowded Video Scenes 
% Using Spatio-Angular Density-Based Clustering," in IEEE Access, vol. 8, 
% pp. 145984-145994, 2020, doi: 10.1109/ACCESS.2020.301537

% Inputs:
% 1) scene_no => value between [1,300] which is the serial number for a scene 
% obtained from pre-saved "dataset_cuhk_300.mat" (this is as per the  info. 
% in the file: "CUHK_300_category_info.xlsx")
% 2) eps => epsilon value between [0,180] required for dbscan clustering
% 3) alpha_k => value between [1,100] which denotes how much percentage of the 
% total no. of trajectories are to be considered to determine the value of 
% "k" inorder to compute k-NN

% Output:
% 1) clust_id => cluster lables for each trajectory obtained after clustering.
% 2) gt_id => ground truth labels for each trajectory (for evaluation purpose)

% Example: clust_id = sadc(91,20,15);

% Note: The code could be further optimized to make it run faster.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% 1: get the scene_name corresponding to the scene_no
load('dataset_cuhk_300.mat','dataset_cuhk_300');
scene_name = dataset_cuhk_300(scene_no).scene_name;
num_frames = dataset_cuhk_300(scene_no).num_frames;

%% 2: get the folder locations for trajectory data and its Ground Truth (GT)
data_folder_path = '.\CUHKcrowd_dataset_imgTrk\group_video_clips_imgs\';
data_path = [data_folder_path  scene_name];
gt_folder_path = '.\ground_truth_grDetect\';

%% 3: get the trajectory and GT data + extract 30-frame data based on GT
load([data_path '\' 'trks_1_smooth.mat'],'trks');
load([gt_folder_path scene_name '_gt.mat'],'groups');
start_frame = dataset_cuhk_300(scene_no).gt_start;
end_frame = dataset_cuhk_300(scene_no).gt_end;
new_trks = get_trajectory_data(trks,groups,start_frame,end_frame);
gt_id = [new_trks(:).gt_label]'; % store the gt labels seperately

%% 4: compute the spatio-angular (SA) features from trajectories
sa_feature_mat = compute_spatio_angular_features(new_trks);

%% 5: using SA features, compute pair-wise spatial and angular info. matrices
% K value for k-NN is = 'aplha_k' percentage of total trajectories
K =ceil((size(new_trks,2)*alpha_k)/100); 
[spatial_info,angular_info] = compute_pairwise_info(sa_feature_mat,K);

%% 6: perform DBSCAN clustering
clust_id = db_clustering(spatial_info,angular_info,eps);

end %end of function