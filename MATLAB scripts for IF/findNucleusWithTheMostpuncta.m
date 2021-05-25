%find the nucleus with the most puncta

for i=1:length(puncta_allwells)
numpuncta(i)=length(puncta_allwells(i).puncta);
end

find(numpuncta==max(numpuncta))