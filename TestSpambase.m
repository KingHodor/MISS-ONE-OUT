clc
clear;
Cparams=[0.01 0.1 1 10 100];
sigmaparams=[1 5 10 50 100];
knns=[3 5 7 9 11];
global knnSize;
global sigma;
global C;
global method;
global SDATA;
%data=vertcat(dlmread('SPECTF.train'),dlmread('SPECTF.test')); class=data(:,1); data(:,1)=[]; data=horzcat(data,class);
%puredata=vertcat(dlmread('optdigits.tra'),dlmread('optdigits.tes')); data=vertcat(puredata(find(puredata(:,end)==0),:),puredata(find(puredata(:,end)==1),:));
%data=dlmread('ionosphere.data');
%data=dlmread('spambase.data');
%data=dlmread('sonar.all-data');
load myresults

for methodType=1:5
    
  
    switch(methodType)
        case 1
            %knn classifier
            method=methodType;
            knnSize=knns(method);
            disp('kNN(k=3)');
        case 2
            %knn classifier
            method=methodType;
            knnSize=knns(method);
            disp('kNN(k=5)');
        case 3
            %knn classifier
            method=methodType;
            knnSize=knns(method);
            disp('kNN(k=7)');
        case 4
            %knn classifier
            method=methodType;
            knnSize=knns(method);
            disp('kNN(k=9)');
        case 5
            %knn classifier
            method=methodType;
            knnSize=knns(method);
            disp('kNN(k=11)');
        case 6:30
            %svm classifier
            method=methodType;
            C=Cparams(floor((methodType-6)/length(sigmaparams))+1);
            sigma=sigmaparams(mod(methodType-6,length(sigmaparams))+1);
            sprintf('SVM sigma:%d C:%d',sigma,C)
    end
    for i=1:1
        
        tr=horzcat(mytrain,trainclass);
        tsc=testclass;
        tsd=mytest;
        [ Ltsacc,Mtsacc ]= MooSpambase(tr,tsc,tsd,20);
        %disp([Ltsacc' Mtsacc'])
        %%
        Ltsacc=Ltsacc';
        Mtsacc=Mtsacc';
        LooMatris(:,i)=Ltsacc;
        MooMatris(:,i)=Mtsacc;
    end
    
    %%
    %ortalama
    TESTSIZE=length(mytest);
    meanL=mean(LooMatris,2);
    meanM=mean(MooMatris,2);
    sccL=meanL/TESTSIZE;
    sccM=meanM/TESTSIZE;
    disp([sccL sccM])
   
end
