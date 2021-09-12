## Scene-Independent Motion Pattern Segmentation (MPS) in crowded video scenes using Spatio-Angular Density-based Clustering (SADC)

### About the Dataset 
- The dataset used for this work (CUHK Crowd Dataset)  is obtained from:
https://amandajshao.github.io/projects/CUHKcrowd_files/cuhk_crowd_dataset.htm

- The CUHK dataset contains a total of *474* video clips. Among these, only *300* video clips have ground truth for MPS.

- The file *[CUHK_info.xlsx](/CUHK_info.xlsx)* (obtained from the above mentioned dataset link) contains the details of each video clip, where we have highlighted (in yellow-color) the *300* video clips used for MPS.

- For this work, we have categorized the 300 video clips into 8 different categories:  
  >**cross walk, escalator,  market, mass movement, public walkway, shopping mall, station, and street.**  

- We also categorize the scenes into:  
  >**structured-unstructured** and **indoor-outdoor.**  

- The file *[CUHK_300_category_info.xlsx](/CUHK_300_category_info.xlsx)* contains all the category-wise details. The last column in this file can be used as a mapping to scenes in the original file *[CUHK_info.xlsx](/CUHK_info.xlsx)*

- For evaluation and comparison of our work with frame-by-frame clustering techniques (CM & CT -refer our paper), we use the frame number mentioned in the column "*GT end frame no.*" of the *[CUHK_300_category_info.xlsx](/CUHK_300_category_info.xlsx)* file. 

### Instructions to run the code

- Just run the file named "sadc.m". Here's an example of how to run it:
```
[clust_id,gt_id] = sadc(91,20,15); % syntax : sadc(scene_no,eps_threshold,aplha_threshold)
```

- Please refer to the code for more details regarding the parameters.

- The folders "ground_truth_grDetect" and "CUHKcrowd_dataset_imgTrk" (extract the *CUHKcrowd_dataset_imgTrk.zip* file to get this folder)  are created only for testing purposes. It contains info. of only 1 scene (scene no. 91 of the CUHK dataset).

- Please download the original CUHK dataset to get all the data within these folders.


### Cite
If you use our code or the scene-wise data we have created, please cite our paper:  
>A. K. Pai, A. K. Karunakar and U. Raghavendra, [*"Scene-Independent Motion Pattern Segmentation in Crowded Video Scenes Using Spatio-Angular Density-Based Clustering"*](https://ieeexplore.ieee.org/document/9162634) in IEEE Access, vol. 8, pp. 145984-145994, 2020.
