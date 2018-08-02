function [ Ltsacc,Mtsacc ] = MooSpambase( tr,tsc,tsd,featureCount )


global knnSize;
global sigma;
global C;
global method;
%%
LOO_class=tr(:,end);
LOO_Data=tr(:,1:end-1);
%LOO_Data=data(:,2:end-1);
%LOO_class=data(:,end);
%%
%%MOO_class=moo(:,end);
%%MOO_Data=moo(:,2:end-1);
MOO_class=LOO_class;
MOO_Data=LOO_Data;
[Ix Iy]=size(LOO_Data);
%%
%
%Leave-One-Out
%
LOO_Data=vertcat([1:Iy],LOO_Data);
chosenData=[];
for stepIndexIndex=1:featureCount
    column=ForwardSelection(LOO_Data,LOO_class,chosenData,1);
    chosenData(stepIndexIndex)=column;
    
    switch(method)
        case 1
            resultLOO= knnclassify(tsd(:,chosenData),LOO_Data(2:end,chosenData),LOO_class,knnSize);
        case 2
            resultLOO= knnclassify(tsd(:,chosenData),LOO_Data(2:end,chosenData),LOO_class,knnSize);
        case 3
            resultLOO= knnclassify(tsd(:,chosenData),LOO_Data(2:end,chosenData),LOO_class,knnSize);
        case 4
            resultLOO= knnclassify(tsd(:,chosenData),LOO_Data(2:end,chosenData),LOO_class,knnSize);
        case 5
            resultLOO= knnclassify(tsd(:,chosenData),LOO_Data(2:end,chosenData),LOO_class,knnSize);
        case 6:30
            SVMStruct = svmtrain(LOO_Data(2:end,chosenData),LOO_class,'KERNEL_FUNCTION','rbf','RBF_SIGMA',sigma,'BOXCONSTRAINT',C);
            resultLOO=svmclassify(SVMStruct,tsd(:,chosenData));
    end
    Ltsacc(stepIndexIndex)=sum(resultLOO==tsc);
end

%%
%
%Miss-One-Out
%
MOO_Data=vertcat([1:Iy],MOO_Data);
chosenData=[];
for stepIndexIndex=1:featureCount
    column=ForwardSelection(MOO_Data,MOO_class,chosenData,0);
    chosenData(stepIndexIndex)=column;
    switch(method)
        case 1
            resultMOO= knnclassify(tsd(:,chosenData),MOO_Data(2:end,chosenData),MOO_class,knnSize);
        case 2
            resultMOO= knnclassify(tsd(:,chosenData),MOO_Data(2:end,chosenData),MOO_class,knnSize);
        case 3
            resultMOO= knnclassify(tsd(:,chosenData),MOO_Data(2:end,chosenData),MOO_class,knnSize);
        case 4
            resultMOO= knnclassify(tsd(:,chosenData),MOO_Data(2:end,chosenData),MOO_class,knnSize);
        case 5
            resultMOO= knnclassify(tsd(:,chosenData),MOO_Data(2:end,chosenData),MOO_class,knnSize);
        case 6:30
            SVMStruct = svmtrain(MOO_Data(2:end,chosenData),MOO_class,'KERNEL_FUNCTION','rbf','RBF_SIGMA',sigma,'BOXCONSTRAINT',C);
            resultMOO=svmclassify(SVMStruct,tsd(:,chosenData));
    end
    Mtsacc(stepIndexIndex)=sum(resultMOO==tsc);
end

%disp([Ltsacc' Mtsacc'])
%%McNemars Test



end

