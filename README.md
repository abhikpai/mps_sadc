## Scene-Independent Motion Pattern Segmentation (MPS) in crowded video scenes using Spatio-Angular Density-based Clustering (SADC)

- The dataset used for this work (CUHK Crowd Dataset)  is obtained from:
https://amandajshao.github.io/projects/CUHKcrowd_files/cuhk_crowd_dataset.htm

- The CUHK dataset contains a total of *474* video clips. Among these, only *300* video clips have ground truth for MPS.

- The file *[CUHK_info.xlsx](/CUHK_info.xlsx)* (obtained from the above mentioned dataset link) contains the details of each video clip, where we have highlighted (in yellow-color) the *300* video clips used for MPS.

- For this work, we have categorized the 300 video clips into 8 different categories:  
>**cross walk, escalator,  market, mass movement, public walkway, shopping mall, station, and street.**  

- We also categorize the scenes into:  
>**structured and unstructured**, **indoor and outdoor.**  

- The file *[CUHK_300_category_info.xlsx](/CUHK_300_category_info.xlsx)* contains all the category-wise details. The last column in the file can be used as a mapping to the original file *[CUHK_info.xlsx]*

If you use the scene-wise data we have created or our code, please cite our paper:  
>A. K. Pai, A. K. Karunakar and U. Raghavendra, *"Scene-Independent Motion Pattern Segmentation in Crowded Video Scenes Using Spatio-Angular Density-Based Clustering,"* in IEEE Access, vol. 8, pp. 145984-145994, 2020, doi: 10.1109/ACCESS.2020.3015375.
