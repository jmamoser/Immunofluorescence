clear all; close all; 

load('G:\Microscopy data\Project 1 -CDK2status in 53BP1 cells - IF data\20150612-MA32rowC_399\hela\analyzedData_puncta\3_7_data.mat')
puncta_allwells1=puncta_allwells;

for j=1:length(puncta_allwells1)
    numpunctapercell(j)=length(puncta_allwells1(j).puncta);
end

allcellswith0puncta=find(numpunctapercell==0);
allcellswith1ormorepuncta=find(numpunctapercell>=1); %%this variable stores only the IDs of the cells with 1 or more puncta
pctofallcellswith0puncta=length(allcellswith0puncta)/length(numpunctapercell)
pctofallcellswith1ormorepuncta=length(allcellswith1ormorepuncta)/length(numpunctapercell)