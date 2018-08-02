function [ best ] = ForwardSelection( LOO_Data,LOO_class,step ,isLoo )
   Data=LOO_Data;
   Data(:,step) = [];
   [s featureSize]=size(Data);
   receiveData =LOO_Data(:,step);
   minErr=1;
   choosenIndex=-1;
  for i=1:featureSize
    nextData=Data(:,i);
    featureIndex=nextData(1);
    if(isempty(receiveData)==0)
        LOO_DataIndex=horzcat(receiveData,Data(:,i));
    else
        LOO_DataIndex=Data(:,i);
    end

    LOO_DataIndex(1,:)=[];
    if (isLoo==1)
        CVerr = LOOCross(LOO_DataIndex,LOO_class);
    else
        CVerr = MOOCrossSpambase(LOO_DataIndex,LOO_class);
    end
    
    if(CVerr<minErr)
      minErr=CVerr;
      choosenIndex=featureIndex;
    end
  end
   if (isLoo==1)
       %  disp(sprintf('LOO Err:%1.3f feature:%d',minErr,choosenIndex));
    else
       %  disp(sprintf('MOO Err:%1.3f feature:%d',minErr,choosenIndex));
    end
 
  best=choosenIndex;
end

