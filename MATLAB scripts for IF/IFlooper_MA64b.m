%  list all of your rows and columns and call the IF script

dir='Y:\IXMicroImages-goodNames\Mansi\Microscopy data\Live-cell imaging\MA64-20160604-preimaging_1665\Raw\';    %folder containing the movies folders 
mkdir([dir,'/analyzedData'])

for row=[1:8]
    for col=[10 12]
        [intintdapi_allwells,  avgnuccy5_allwells, wellName]=IFfunction_MA64(row, col, dir);
        
        save([ dir, '/analyzedData/' wellName, '_data'],'intintdapi_allwells',  'avgnuccy5_allwells')
    end
end
