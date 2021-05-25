function [new,numbered_puncta] = punctadetect(puncta_img, savingdir, row, col, strelradius, getdapimaskradius)
puncta_img = imsharpen(puncta_img);
se = strel('disk',strelradius);
puncta_img = imtophat(puncta_img,se);
new = getdapimask(single(puncta_img),getdapimaskradius);  
numbered_puncta = bwlabel(new,4);  %this "4" doesn't do much.  you can still have puncta of size 1 pixel
figure(2)
imshow(new)

saveas(figure(2),[savingdir, num2str(row) '_' num2str(col) '_bwpuncta.fig'])






