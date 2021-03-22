## Scene-Independent Motion Pattern Segmentation (MPS) in crowded video scenes using Spatio-Angular Density-based Clustering (SADC)

### About Dataset 
- The dataset used for this work (CUHK Crowd Dataset)  is obtained from:
https://amandajshao.github.io/projects/CUHKcrowd_files/cuhk_crowd_dataset.htm

- The CUHK dataset contains a total of *474* video clips. Among these, only *300* video clips have ground truth for MPS.

- The file *[CUHK_info.xlsx](/CUHK_info.xlsx)* (obtained from the above mentioned dataset link) contains the details of each video clip, where we have highlighted (in yellow-color) the *300* video clips used for MPS.

- For this work, we have categorized the 300 video clips into 8 different categories:  
  >**cross walk, escalator,  market, mass movement, public walkway, shopping mall, station, and street.**  

- We also categorize the scenes into:  
  >**structured-unstructured** and **indoor-outdoor.**  

- The file *[CUHK_300_category_info.xlsx](/CUHK_300_category_info.xlsx)* contains all the category-wise details. The last column in this file can be used as a mapping to scenes in the original file *[CUHK_info.xlsx](/CUHK_info.xlsx)*

- Note that: For evaluation and comparison of our work with frame-by-frame clustering techniques (CM & CT -refer our paper), we use the frame number mentioned in the column named *GT end frame no.* in the *[CUHK_300_category_info.xlsx](/CUHK_300_category_info.xlsx)* file.

### Cite
If you use our code or the scene-wise data we have created, please cite our paper:  
>A. K. Pai, A. K. Karunakar and U. Raghavendra, *"Scene-Independent Motion Pattern Segmentation in Crowded Video Scenes Using Spatio-Angular Density-Based Clustering,"* in IEEE Access, vol. 8, pp. 145984-145994, 2020, doi: 10.1109/ACCESS.2020.3015375.
