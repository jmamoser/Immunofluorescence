%  list all of your rows and columns and call the IF script
clear all; close all; clc;

imagedir='Y:\IXMicroImages-goodNames\Mansi\MA65-20160729-plainMCF10AIF-53BP1p21_1787\';    %folder containing the images
mkdir([imagedir,'analyzedData_10Xpuncta'])
savingdir=[imagedir,'analyzedData_10Xpuncta\'];

for row=[3:8]
    for col=[1:6]
        %[intintdapi_allwells, avgnucfitc_allwells,  avgnuccy3_allwells, avgnuccy5_allwells, wellName]=IFfunction_puncta(row, col, dir);
%         [intintdapi_allwells,avgnucfitc_allwells,  avgnuccy3_allwells, avgnuccy5_allwells, centroid_allwells, sitelist_allwells, wellName, puncta_allwells, SumPunctaArea_allwells, AvgPunctaIntensity_allwells, SumPunctaMetric_allwells]=IFfunction_puncta(row, col, imagedir, savingdir);
        [intintdapi_allwells, avgnucfitc_allwells, avgnuccy5_allwells, centroid_allwells, sitelist_allwells, wellName, puncta_allwells, SumPunctaArea_allwells, AvgPunctaIntensity_allwells, SumPunctaMetric_allwells]=IFfunction_puncta_MA65(row, col, imagedir, savingdir);
        %save([ dir, '/analyzedData_SLS/' wellName, '_data'],'intintdapi_allwells','avgnucfitc_allwells',  'avgnuccy3_allwells', 'avgnuccy5_allwells')
        %save([ dir, '/analyzedData_SLS/' wellName, '_data'],'intintdapi_allwells','avgnucfitc_allwells',  'avgnuccy3_allwells', 'avgnuccy5_allwells', 'puncta_allwells')
        save([ savingdir, wellName, '_data'],'intintdapi_allwells','avgnucfitc_allwells',  'avgnuccy5_allwells', 'centroid_allwells', 'sitelist_allwells', 'puncta_allwells',  'SumPunctaArea_allwells', 'AvgPunctaIntensity_allwells', 'SumPunctaMetric_allwells')
    end
end
