
function [ CVerr ] = LOOCross( LOO_DataIndex ,LOO_class )

global knnSize;
global sigma;
global C;
global method;
global SDATA;
sumK=0;
if(method<6)
    k=1;
    loop=length(LOO_class)/k;
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
end;
for i = 1:loop
    %test
    test=LOO_DataIndex([start:finish],:);
    %train
    train=LOO_DataIndex;
    train([start:finish],:)=[];
    %class
    class=LOO_class;
    class([start:finish],:)=[];
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
    %classification
    %%calculate err
    sumK=sumK+sum(result==LOO_class([start:finish],:));
    
    start=start+k;
    finish=finish+k;
end
CVerr = (length(LOO_class)-sumK) / length(LOO_class);
%   disp(sprintf('LOO Err:%1.3f feature:%d',CVerr,featureIndex));
end
