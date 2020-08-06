folder1 ='/Users/Dilan/MachineLearning/Assignment6/sival_apple_banana/apple1' ; 
folder2 ='/Users/Dilan/MachineLearning/Assignment6/sival_apple_banana/banana1';

% fullfile returns a character vector containing the full path to the file
% dir lists files and folders in the current folder

I1=dir(fullfile(folder1,'*.jpg'));
I2=dir(fullfile(folder2,'*.jpg'));


for k=1:numel(I1)
  filename1=fullfile(folder1,I1(k).name);
  filename2=fullfile(folder2,I2(k).name);
  apple1{k} = (imread(filename1));
  banana1{k}= (imread(filename2));
end
  
  
%%
[a1,a2] = extractinstancesimage(banana1{30},30);
[b1,b2] = extractinstancesimage(banana1{30},40);
[c1,c2] = extractinstancesimage(banana1{30},50);
%%
figure
imshow(a2)
figure
imshow(b2)
figure
imshow(c2)



