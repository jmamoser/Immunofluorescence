%  list all of your rows and columns and call the IF script

dir='Y:\IXMicroImages-goodNames\Mansi\MA73-Ki67IFatendofmovie-9sites_1919\';    %folder containing the movies folders 
mkdir([dir,'/analyzedData'])

for row=[1:2]
    for col=[ 2 6 7 12 ]
        [intintdapi_allwells,  avgnuccy5_allwells, wellName]=IFfunction_MA69(row, col, dir);
        
        save([ dir, '/analyzedData/' wellName, '_data'],'intintdapi_allwells',  'avgnuccy5_allwells')
    end
end
