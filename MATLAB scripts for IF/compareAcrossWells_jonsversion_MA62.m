close all
clear all

dir = 'Y:\IXMicroImages-goodNames\Mansi\MA62-20160519-mitoinhib_1632\analyzedData_10Xpuncta';

cd(dir);    %folder containing the movies folders 



%Specify rows and cols for comparisons
row=1:4;
col=[1:6];

%Specify Logspace (Cy3, Cy5)
logbins=logspace(2, 5, 250);

%Specify Bins (Dapi)
bins=[0:1000000:10e7];

cy3Matrix = cell(max(row),max(col));
fitcMatrix = cell(max(row),max(col));
dapiMatrix = cell(max(row),max(col));
for n = row
    for i = col
        filename = [num2str(n),'_', num2str(i),'_data'];
        load(filename);
        cy3Matrix{n,i} = avgnuccy3_allwells;
        fitcMatrix{n,i} = avgnucfitc_allwells;
        dapiMatrix{n,i} = intintdapi_allwells;
    end
end


%all data from the mentioned wells is loaded

cy3Data = cell(max(row),max(col));
fitcData = cell(max(row),max(col));
dapiData = cell(max(row),max(col));
for n = row
    for i = col
        cy3Data{n,i} = hist(cy3Matrix{n,i},logbins);
        fitcData{n,i} = hist(fitcMatrix{n,i},logbins);
        dapiData{n,i} = hist(dapiMatrix{n,i},bins);
    end
end

cy3DataNorm = cell(max(row),max(col));
fitcDataNorm = cell(max(row),max(col));
dapiDataNorm = cell(max(row),max(col));
for n = row
    for i = col
        cy3DataNorm{n,i} = cy3Data{n,i}./max(cy3Data{n,i});
        fitcDataNorm{n,i} = fitcData{n,i}./max(fitcData{n,i});
        dapiDataNorm{n,i} = dapiData{n,i}./max(dapiData{n,i});
    end
end



%%plot the data
% figure(100)
% subplot (1,2,1)
% semilogx(logbins, smooth(cy3DataNorm{6,3}), 'k-',logbins, smooth(cy3DataNorm{6,7}), 'r-', logbins, smooth(cy3DataNorm{6,11}), 'b-','linewidth', 1.5);
% legend('WT(FGM)','p53-/-(FGM)','p21-/-(FGM)')
% title 'p21(rb ab) levels in WT vs p21-/- vs p53-/- MCF10A'
% 
% subplot (1,2,2)
% semilogx(logbins, smooth(cy3DataNorm{6,2}), 'k-',logbins, smooth(cy3DataNorm{6,6}), 'r-',  logbins, smooth(cy3DataNorm{6,10}), 'b-','linewidth', 1.5);
% legend('WT(FGM)','p53-/-(FGM)','p21-/-(FGM)')
% title 'pRb(807/811) levels in WT vs p21-/- vs p53-/- MCF10A'

%Figure 1: DMSO

% figure(1)
% % suptitle 'p21'
% subplot(2,2,1)
% semilogx(logbins, smooth(cy3DataNorm{1,1}), 'k-',logbins, smooth(cy3DataNorm{1,2}), 'k:',logbins, smooth(cy3DataNorm{1,3}), 'r-', logbins, smooth(cy3DataNorm{1,4}),'r:', 'linewidth', 1.5);
% legend('FGM','SS','Gefitinib','MEKi')
% title('p21(rb)')
% 
% subplot(2,2,2)
% semilogx(logbins, smooth(fitcDataNorm{2,1}), 'k-',logbins, smooth(fitcDataNorm{2,2}), 'k:',logbins, smooth(fitcDataNorm{2,3}), 'r-', logbins, smooth(fitcDataNorm{2,4}),'r:', 'linewidth', 1.5);
% legend('FGM','SS','Gefitinib','MEKi')
% title('p53-DO')
% 
% subplot(2,2,3)
% semilogx(logbins, smooth(cy3DataNorm{3,1}), 'k-',logbins, smooth(cy3DataNorm{3,2}), 'k:',logbins, smooth(cy3DataNorm{3,3}), 'r-', logbins, smooth(cy3DataNorm{3,4}),'r:', 'linewidth', 1.5);
% legend('FGM','SS','Gefitinib','MEKi')
% title('Cyclin D')
% 
% subplot(2,2,4)
% semilogx(logbins, smooth(cy3DataNorm{4,1}), 'k-',logbins, smooth(cy3DataNorm{4,2}), 'k:',logbins, smooth(cy3DataNorm{4,3}), 'r-', logbins, smooth(cy3DataNorm{4,4}),'r:', 'linewidth', 1.5);
% legend('FGM','SS','Gefitinib','MEKi')
% title('p53-FL')


figure (2)

subplot(2,1,1)
hist(log10(cy3Data{1,1}),100)
xlabel('FGM')
xlim([2.5 5])

subplot(2,1,2)
hist(log10(cy3Data{1,2}),100)
xlabel('SS')
xlim([2.5 5])

% 
% %Save Figures
% mkdir([dir,'/CompareAcrossWellsFigures'])
% saveas(figure(1),[dir, '/CompareAcrossWellsFigures/','20150306_MCF10A2000plate_TreatvsControl_DMSO.fig'])
% saveas(figure(2),[dir, '/CompareAcrossWellsFigures/','20150306_MCF10A2000plate_TreatvsControl_Starv.fig'])
% saveas(figure(3),[dir, '/CompareAcrossWellsFigures/','20150306_MCF10A2000plate_TreatvsControl_Gef.fig'])
% saveas(figure(4),[dir, '/CompareAcrossWellsFigures/','20150306_MCF10A2000plate_TreatvsControl_Meki.fig'])
% saveas(figure(5),[dir, '/CompareAcrossWellsFigures/','20150306_MCF10A2000plate_TreatvsControl_PI3Ki.fig'])
% saveas(figure(6),[dir, '/CompareAcrossWellsFigures/','20150306_MCF10A2000plate_TreatvsControl_CDK46i.fig'])
% saveas(figure(7),[dir, '/CompareAcrossWellsFigures/','20150306_MCF10A2000plate_CDK46i.fig'])

