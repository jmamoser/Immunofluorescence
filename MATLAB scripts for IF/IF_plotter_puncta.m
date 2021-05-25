%% PLOT STUFF using data analyzed with the improvized code correcting for data merges from different wells. 

clear all; close all;

for row=2
    for col=2
        
        dir='X:\IXMicroImages-goodNames\Mansi\20150212MA17-MCF10AWT_203\analyzedData_SLS\';    %folder containing the data files post IFlooper
        
        wellName=[num2str(row),'_', num2str(col)];
        load([dir, num2str(row), '_', num2str(col), '_data.mat'])
        
        
% remove cells with avg dapi intensity >6e6


dapiweirdI=[];
dapiweirdI=find(intintdapi_allwells < 1 | intintdapi_allwells > 10e7);  %indices for cells with too high or too low DNA content
for i=0:length(dapiweirdI)-1  
    indextoremove=dapiweirdI(end-i);  %go backwards so numbering doesn't get messed up
%    avgnucfitc_allwells(indextoremove)=[];
    avgnuccy3_allwells(indextoremove)=[];
    avgnuccy5_allwells(indextoremove)=[];  
    intintdapi_allwells(indextoremove)=[];
    
    AvgPunctaIntensity_allwells(indextoremove)=[];
    SumPunctaArea_allwells(indextoremove)=[];
    SumPunctaMetric_allwells(indextoremove)=[];
    puncta_allwells(indextoremove)=[];
end
    

        for j=1:length(puncta_allwells)
        numpunctapercell(j)=length(puncta_allwells(j).puncta);
        end


        figure(100);
        hist(intintdapi_allwells,100);
        xlabel('DNA content'); title(wellName)

  
        figure(1);
        suptitle(wellName)
        subplot(2,3,1)
        hist(log10(avgnuccy3_allwells),100); xlabel('log10 Cy3');
        subplot(2,3,2)
        hist(log10(avgnuccy5_allwells),100); xlabel('log10 Cy5');
        
        subplot(2,3,3)
        hist(numpunctapercell,100); xlabel('numpunctapercell');
                
        subplot(2,3,4)     
        hist((AvgPunctaIntensity_allwells),100); xlabel('Avg puncta intensity per cell');
        ylim([0 500])
                
        subplot(2,3,5)
        hist((SumPunctaArea_allwells),100); xlabel('Total puncta area per cell');
        ylim([0 500])
        
        subplot(2,3,6)
        hist((SumPunctaMetric_allwells),100); xlabel('Puncta metric per cell'); %puncta metric is the (area of each puncta * avg intensity of that puncta), summed over all puncta in that cell
        ylim([0 500])

        
        
        
        figure(2);
        suptitle(wellName)
        subplot(2,3,1)
        dscatter(intintdapi_allwells', log10(avgnuccy3_allwells)')  %need to put transpose or dscatter won't work!
        xlabel('DNA content')
        ylabel('log10 Cy3')
        
        subplot(2,3,2)
        dscatter(intintdapi_allwells', log10(avgnuccy5_allwells)')  %need to put transpose or dscatter won't work!
        xlabel('DNA content')
        ylabel('log10 Cy5')
        
        subplot(2,3,3)
        dscatter(intintdapi_allwells',numpunctapercell')  %need to put transpose or dscatter won't work!
        xlabel('DNA content')
        ylabel('numpunctapercell')
        

        subplot(2,3,4)
        dscatter(intintdapi_allwells', AvgPunctaIntensity_allwells')  %need to put transpose or dscatter won't work!
        xlabel('DNA content')
        ylabel('Avg puncta intensity per cell');
        
        subplot(2,3,5)
        dscatter(intintdapi_allwells', SumPunctaArea_allwells')  %need to put transpose or dscatter won't work!
        xlabel('DNA content')
        ylabel('Total puncta area per cell')
        
        subplot(2,3,6)
        dscatter(intintdapi_allwells', SumPunctaMetric_allwells')  %need to put transpose or dscatter won't work!
        xlabel('DNA content')
        ylabel('Puncta metric per cell');
        
        
        
        
        figure(3);
        suptitle(wellName)
        
        
        subplot(2,2,1)
        dscatter(numpunctapercell', log10(avgnuccy5_allwells)')  %need to put transpose or dscatter won't work!
        xlabel('numpunctapercell');
        ylabel('log10 Cy5')
        
        subplot(2,2,2)
        dscatter(AvgPunctaIntensity_allwells', log10(avgnuccy5_allwells)')  %need to put transpose or dscatter won't work!
        xlabel('Avg puncta intensity per cell');
        ylabel('log10 Cy5')
        
        subplot(2,2,3)
        dscatter(SumPunctaArea_allwells', log10(avgnuccy5_allwells)')  %need to put transpose or dscatter won't work!
        xlabel('Total puncta area per cell')
        ylabel('log10 Cy5')
        

        subplot(2,2,4)
        dscatter(SumPunctaMetric_allwells', log10(avgnuccy5_allwells)')  %need to put transpose or dscatter won't work!
        xlabel('Puncta metric per cell');
        ylabel('log10 Cy5')
        
        
        
        

        

        
        %% SAVE STUFF IF YOU WANT
        
  

        saveas(figure(1),[dir, '20150212_' num2str(row) '_' num2str(col) '_hist.fig'])
        saveas(figure(2),[dir, '20150212_' num2str(row) '_' num2str(col) '_stainVSdna.fig'])
        saveas(figure(3),[dir, '20141204_' num2str(row) '_' num2str(col) '_stainVSpuncta.fig'])
        saveas(figure(100),[dir, '20150212_' num2str(row) '_' num2str(col) '_dnacontent.fig'])
    end
end
