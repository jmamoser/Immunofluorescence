%  list all of your rows and columns and call the IF script

dir='Y:\IXMicroImages-goodNames\Mansi\20150212MA17-MCF10AWT_203\';    %folder containing the movies folders 
mkdir([dir,'/analyzedData2'])

for row=4
    for col=3
        [intintdapi_allwells, avgnuccy3_allwells, avgnuccy5_allwells, wellName]=IFfunction_20150213(row, col, dir);
        
        save([ dir, '/analyzedData2/' wellName, '_data'],'intintdapi_allwells','avgnuccy3_allwells', 'avgnuccy5_allwells')
    end
end
