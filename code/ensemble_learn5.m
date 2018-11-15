
function [predict_label,score]=ensemble_learn5(train_shu,train_label,test_shu,test_label)
model1=classRF_train(train_shu,train_label);%Model of random forest generation 
[predict_label1,score]=classRF_predict(test_shu,model1,300);%Forecast and generate probability score
scores1(:,1)=score(:,1)./(score(:,1)+score(:,2));
scores1(:,2)=score(:,2)./(score(:,1)+score(:,2));
model2=classRF_train(train_shu,train_label);
[predict_label2,score2]=classRF_predict(test_shu,model2,300)
scores2(:,1)=score2(:,1)./(score2(:,1)+score2(:,2));
scores2(:,2)=score2(:,2)./(score2(:,1)+score2(:,2));
model3=classRF_train(train_shu,train_label);
[predict_label3,score3]=classRF_predict(test_shu,model3,300);
scores3(:,1)=score3(:,1)./(score3(:,1)+score3(:,2));
scores3(:,2)=score3(:,2)./(score3(:,1)+score3(:,2));
model4=classRF_train(train_shu,train_label);
[predict_label4,score4]=classRF_predict(test_shu,model4,300);
scores4(:,1)=score4(:,1)./(score4(:,1)+score4(:,2));
scores4(:,2)=score4(:,2)./(score4(:,1)+score4(:,2));
model5=classRF_train(train_shu,train_label);
[predict_label5,score5]=classRF_predict(test_shu,model5,300);
scores5(:,1)=score5(:,1)./(score5(:,1)+score5(:,2));
scores5(:,2)=score5(:,2)./(score5(:,1)+score5(:,2));
model6=classRF_train(train_shu,train_label);
[predict_label6,score6]=classRF_predict(test_shu,model6,300);
scores6(:,1)=score6(:,1)./(score6(:,1)+score6(:,2));
scores6(:,2)=score6(:,2)./(score6(:,1)+score6(:,2));
model7=classRF_train(train_shu,train_label);
[predict_label7,score7]=classRF_predict(test_shu,model7,300);
scores7(:,1)=score7(:,1)./(score7(:,1)+score7(:,2));
scores7(:,2)=score7(:,2)./(score7(:,1)+score7(:,2));
H_H=[predict_label1';predict_label2';predict_label3';predict_label4';predict_label5';predict_label6';predict_label7'];
predict=sum(H_H);
predict_label=sign(predict);
predict_label=predict_label';
score_row1=(scores1(:,1)+scores2(:,1)+scores3(:,1)+scores4(:,1)+scores5(:,1)+scores6(:,1)+scores7(:,1))/7;
score_row2=(scores1(:,2)+scores2(:,2)+scores3(:,2)+scores4(:,2)+scores5(:,2)+scores6(:,2)+scores7(:,2))/7;
% score_row1=(scores1(:,1)+scores2(:,1)+scores3(:,1)+scores4(:,1)+scores5(:,1))/5;
% score_row2=(scores1(:,2)+scores2(:,2)+scores3(:,2)+scores4(:,2)+scores5(:,2))/5;
score=[score_row1,score_row2];
end

