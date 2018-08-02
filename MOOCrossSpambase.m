

function [ CVerr ] = MOOCrossSpambase( MOO_DataIndex ,MOO_class )

global knnSize;
global sigma;
global C;
global method;
global SDATA;
if(method<6)
    k=1;
    loop=length(MOO_class)/k;
    start=1;
    finish=1;
else
    if(SDATA==50)
        k=5;
        loop=length(MOO_class)/k;
        start=1;
        finish=5;
    else
        k=10;
        loop=length(MOO_class)/k;
        start=1;
        finish=10;
    end
    
end
sumK=0;


for i = 1:loop
    %test
    test=MOO_DataIndex([start:finish],:);
    %train
    train=MOO_DataIndex;
    %class
    class=MOO_class;
    class([start:finish],:)=~class([start:finish],:);
    %classification
    % SVMStruct = svmtrain(train,class,'KERNEL_FUNCTION','rbf','RBF_SIGMA',sigma,'BOXCONSTRAINT',1);
    % result=svmclassify(SVMStruct,test);
    
    switch(method)
        case 1
            result= knnclassify(test,train,class,knnSize);
        case 2
            result= knnclassify(test,train,class,knnSize);
        case 3
            result= knnclassify(test,train,class,knnSize);
        case 4
            result= knnclassify(test,train,class,knnSize);
        case 5
            result= knnclassify(test,train,class,knnSize);
        case 6:30
            SVMStruct = svmtrain(train,class,'KERNEL_FUNCTION','rbf','RBF_SIGMA',sigma,'BOXCONSTRAINT',C);
            result=svmclassify(SVMStruct,test);
    end
    %%calculate err
    sumK=sumK+sum(result==MOO_class([start:finish],:));
    start=start+k;
    finish=finish+k;
end
CVerr = (length(MOO_class)-sumK) / length(MOO_class);
% disp(sprintf('MOO Err:%1.3f feature:%d',CVerr,featureIndex));
end
