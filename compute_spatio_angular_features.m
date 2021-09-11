function sa_feature_mat = compute_spatio_angular_features(new_trks)
%(c) Abhilash K. Pai, June 2020 

sa_feature_mat = zeros(size(new_trks,2),3);
for i=1:size(new_trks,2)
    % average displacement vector
    mean_u_vect = mean(diff(new_trks(i).x));
    mean_v_vect = mean(diff(new_trks(i).y));
    % average spatial location
    mean_x = mean(new_trks(i).x);
    mean_y = mean(new_trks(i).y);
    
    ori = compute_orientation(mean_u_vect,mean_v_vect);
    ori_matlab = 360 - ori; %for easier interpretation in MATLAB 
    
    % spatio angular feature matrix
    sa_feature_mat(i,1)= mean_x;
    sa_feature_mat(i,2)= mean_y;
    sa_feature_mat(i,3)= ori_matlab;
end

end % end of main function

function ori = compute_orientation(vx,vy)

v0=[1 0]; %unit vector in the horizontal direction
den=sqrt((vx)^2 + (vy)^2)*sqrt((v0(1,1))^2+(v0(1,2))^2);
numerator=dot([vx vy],v0);

if(vy<=0)
     if(vy==0 && vx==0)
         ori=360;
         return;
     end
     if(vy==0 && vx>0)
		ori=360;
		return;
     end
     ori=((2*pi)-acos(numerator/den))*(180/pi);
else
    ori=(acos(numerator/den))*(180/pi);
end
if ori==0
    ori=360;
end

end % end of sub function