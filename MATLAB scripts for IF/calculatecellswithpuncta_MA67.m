clear all; close all; 

load('W:\group\Rotons\Dilara\First IF exp\20171105_171440_105\analyzedData_10Xpuncta2ndset\1_12_data.mat')
puncta_allwells1=puncta_allwells;

for j=1:length(puncta_allwells1)
    numpunctapercell(j)=length(puncta_allwells1(j).puncta);
end

allcellswith0puncta=find(numpunctapercell==0);
allcellswith1ormorepuncta=find(numpunctapercell>=1); %%this variable stores only the IDs of the cells with 1 or more puncta
pctofallcellswith0puncta=length(allcellswith0puncta)/length(numpunctapercell)
pctofallcellswith1ormorepuncta=length(allcellswith1ormorepuncta)/length(numpunctapercell)


G0G1cellsI=find(intintdapi_allwells <2.648e6);
numpuncta_G0G1cells=numpunctapercell(G0G1cellsI); 
G0G1cellswith1ormorepuncta=find(numpuncta_G0G1cells>=1); %find % of G0G1 cells with 1 or more puncta
G0G1cellswith1ormorepuncta_cellid = G0G1cellsI(G0G1cellswith1ormorepuncta); %find cellIDs of cells with one or more puncta
pct_G0G1cellswithpuncta=(length(G0G1cellswith1ormorepuncta)/length(numpuncta_G0G1cells))*100