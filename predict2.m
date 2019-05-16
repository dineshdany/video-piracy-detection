clc;
close all;


X_train=csvread('E:\IIIT WORKS\Matlb\BTP2\train2.csv',1,0,[1,0,122,3]);
Y_train=csvread('E:\IIIT WORKS\Matlb\BTP2\train2.csv',1,4,[1,4,122,4]);


Z_test=csvread('E:\IIIT WORKS\Matlb\BTP2\test2.csv',1,0,[1,0,12,3]);
Z1_test=csvread('E:\IIIT WORKS\Matlb\BTP2\test2.csv',1,4,[1,4,12,4]);

Mdl = fitcecoc(X_train,Y_train);

n = numel(Z1_test);

idx = randsample(n,12);

[label,NegLoss] = predict(Mdl,Z_test);

f=table(Z1_test,label,NegLoss(idx,:),'VariableNames',...
    {'TrueLabel','PredictedLabel','NegLoss'});

 display(f);
 
 C = confusionmat(Z1_test,label);
 
 display(C);

TP=C(1,1);

TN=C(2,2);

FP=C(1,2);

FN=C(2,1);

total=TP+TN+FP+FN;

accuracy=((TP+TN)/total)*100;

precision=(TP/(FP+TP))*100;

recall = (TP / (TP+FN))*100;

Md2 = fitcnb(X_train,Y_train);

n1 = numel(Z1_test);

idx1 = randsample(n1,12);

[label1,NegLoss1] = predict(Md2,Z_test);

f1=table(Z1_test,label1,NegLoss1(idx1,:),'VariableNames',...
    {'TrueLabel','PredictedLabel','NegLoss'});

 display(f1);
 
 C1 = confusionmat(Z1_test,label1);
 
 display(C);
 display(C1);

TP1=C1(1,1);

TN1=C1(2,2);

FP1=C1(1,2);

FN1=C1(2,1);

total1=TP1+TN1+FP1+FN1;

accuracy1=((TP1+TN1)/total1)*100;

precision1=(TP1/(FP1+TP1))*100;

recall1 = (TP1 / (TP1+FN1))*100;

Classifiers = {'SVM';'Naive Bayes'};
Accuracy = [accuracy;accuracy1];
Precision = [precision;precision1];
Recall =[recall;recall1];

T = table(Classifiers,Accuracy,Precision,Recall);

display(T);


