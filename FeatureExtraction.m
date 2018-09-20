%% Feature Extraction

% Vel_suc_FL_L5L4_y_mean
% Mean velocity of the suction along the y-axis wile touching the Flavium
% Ligament between L5 and L4
FL_L5L4_touch_left = find(x.Label7_FlaviumLigamentBetweenL5AndL4_TouchedByLeft);
[~,~,Metric1,~] = ireg_vel_mean(FL_L5L4_touch_left,x.TranslationLeft_x,x.TranslationLeft_y,x.TranslationLeft_z,x.Time_s_);

% Acc_suc_FL_L4L3_z_num
% Number of accelerations of the suction along the z-axis while touching 
% the Flavium Ligament between L4 and L3 
FL_L4L3_touch_left = find(x.Label8_FlaviumLigamentBetweenL4AndL3_TouchedByLeft);
[~,~,~,~,~,~,~,~,~,~,~,Metric2,~,~,~,~,~,~] = ireg_acc_mean(FL_L4L3_touch_left,x.TranslationLeft_x,x.TranslationLeft_y,x.TranslationLeft_z,x.Time_s_);

% Acc_rm_drill_L3_x_max
% Maximum acceleration of the drill along the x-axis while removing L3
% vertebra
L3_touch_rm_right = find(diff(x.Volume_ofLabel6_L3Verterbra));
[~,~,~,Metric3,~,~,~,~,~,~,~,~,~,~,~,~,~,~] = ireg_acc_mean(L3_touch_rm_right,x.TranslationRight_x,x.TranslationRight_y,x.TranslationRight_z,x.Time_s_);

% Vol_rm_suc_and_drill
% Volume of L3 Vertebra removed while simultaneously applying force with 
% the drill and suction
suc_and_drill_force = find(x.ForceFeedbackLeftHand>0 & x.ForceFeedbackRightHand>0);
Metric4 = abs(ireg_time(suc_and_drill_force,x.Volume_ofLabel6_L3Verterbra));

% avg_deriv2_pos_z_drill
% Average acceleration of the drill along the z-axis
deriv_pos_z_drill = gradient(x.TranslationRight_z,x.Time_s_);
deriv2_pos_z_drill = gradient(abs(deriv_pos_z_drill),x.Time_s_);
Metric5 = mean(deriv2_pos_z_drill);

% Suc_and_drill_noforce
% Amount of time spent while no force applied by both the drill and suction
suc_and_drill_idle = find(x.ForceFeedbackLeftHand==0 & x.ForceFeedbackRightHand==0);
Metric6 = ireg_time(suc_and_drill_idle,x.Time_s_);

% Acc_rm_suc_L3_x_max
% Maximum acceleration of the suction along the x-axis while removing L3
% vertebra
L3_touch_rm_right = find(diff(x.Volume_ofLabel6_L3Verterbra));
[~,~,~,Metric7,~,~,~,~,~,~,~,~,~,~,~,~,~,~] = ireg_acc_mean(L3_touch_rm_right,x.TranslationLeft_x,x.TranslationLeft_y,x.TranslationLeft_z,x.Time_s_);

% Forc_drill_1_mean
% Average force applied by the drill while touching other tissue 1
label1_touch_right = find(x.Label1_OtherTissue_TouchedByRight);
forc_r = x.ForceFeedbackRightHand(label1_touch_right);
Metric8 = mean(forc_r);

% avg_deriv2_pos_x_suc
% Average acceleration of the suction along the x-axis
deriv_pos_x_suc = gradient(x.TranslationLeft_x,x.Time_s_);
deriv2_pos_x_suc = gradient(abs(deriv_pos_x_suc),x.Time_s_);
Metric9 = mean(deriv2_pos_x_suc);

