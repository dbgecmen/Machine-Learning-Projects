folder1 ='/Users/Dilan/MachineLearning/Assignment6/sival_apple_banana/apple' ; 
folder2 ='/Users/Dilan/MachineLearning/Assignment6/sival_apple_banana/banana';

% fullfile returns a character vector containing the full path to the file
% dir lists files and folders in the current folder


I1=dir(fullfile(folder1,'*.jpg'));
I2=dir(fullfile(folder2,'*.jpg'));

width=30;

for k=1:numel(I1)
  filename1=fullfile(folder1,I1(k).name);
  filename2=fullfile(folder2,I2(k).name);
  disp(['extract imagepair ' num2str(k)])
  apple{k} = extractinstances(imread(filename1),width);
  banana{k}= extractinstances(imread(filename2),width);
end

save('width30 applebags.mat', 'apple')
save('width30 bananabags.mat', 'banana')

%% 
folder1 ='/Users/Dilan/MachineLearning/Assignment6/sival_apple_banana/apple' ; 
folder2 ='/Users/Dilan/MachineLearning/Assignment6/sival_apple_banana/banana';

% fullfile returns a character vector containing the full path to the file
% dir lists files and folders in the current folder


I1=dir(fullfile(folder1,'*.jpg'));
I2=dir(fullfile(folder2,'*.jpg'));

width=30;

for k=1:numel(I1)
  filename1=fullfile(folder1,I1(k).name);
  filename2=fullfile(folder2,I2(k).name);
  disp(['extract imagepair ' num2str(k)]);
  apple1{k} = imread(filename1);
  banana2{k}= imread(filename2);
end
%%
k=1
width=30;
[segment, segmentedim] = extractinstancesimage(apple1{k}, width);
%%


% apple1_segmentpixels = extractinstances(apple{1},width);
% banana1_segmentpixels = extractinstances(banana{1},width);


%Display image 15 plane blue (red,green,blue)
%figure; image(apple{15}(:,:,3))
%figure; image(I2{15}(:,:,:)) plots entire image or do figure; image(I2{15})
   
%%
Image_instances = gendatmilsival(apple,banana)
%320 apple instances en 333 banaan instances



%% Train Fisher classifier
load('apple');load('banana');

[dataset,labelref] = gendatmilsival(apple,banana);
bagid = getident(dataset,'milbag');

% First we train Fisher classifier on the entire dataset as trainset after that we test 
% Then we apply Fisher classifier on the entire dataset as testset
Train = dataset*fisherc; 
Test = dataset*Train;         
instanceLabels = labeld(dataset,Train);


labelbag = combineinstlabels(bagid,instanceLabels);

apple_error = norm(1-labelbag(1:60),1)/(length(labelbag)/2);
banana_error = norm(labelbag(61:end)-2,1)/(length(labelbag)/2);


%% Fisher on train and test
% 75/25 train test
 
%% TRAIN
[dataset,labelref] = gendatmilsival(trainset_apple,trainset_banana);
bagid = getident(dataset,'milbag');

%We train and test the classifier using the same dataset (the entire dataset)
Train = dataset*fisherc; 
Test = dataset*Train;         
instanceLabels = labeld(dataset,Train);


labelbag = combineinstlabels(bagid,instanceLabels);

apple_error = norm(1-labelbag(1:60),1)/(length(labelbag)/2);
banana_error = norm(labelbag(61:end)-2,1)/(length(labelbag)/2);

%% TEST

[dataset,labelref] = gendatmilsival(testset_apple,testset_banana);
bagid = getident(dataset,'milbag');

%We train and test the classifier using the same dataset (the entire dataset)
Train = dataset*fisherc; 
Test = dataset*Train;         
instanceLabels = labeld(dataset,Train);


labelbag = combineinstlabels(bagid,instanceLabels);

apple_error = norm(1-labelbag(1:60),1)/(length(labelbag)/2);
banana_error = norm(labelbag(61:end)-2,1)/(length(labelbag)/2);



%% Train test Apple
numelements = round(0.70*length(apple));
indices = randperm(length(apple));
indices = indices(1:numelements);
   
trainset_apple = apple(indices);
trainset_banana = banana(indices);

a=[1:1:60];
   
Acommon = intersect(indices,a);
t1 = setxor(a,Acommon);
   
testset_apple = apple(t1);
testset_banana = banana(t1);

   %% determine how many elements is ten percent
   numelements = round(0.25*length(bags));
   % get the randomly-selected indices
   indices = randperm(length(bags));
   indices = indices(1:numelements);
   
   % choose the subset of a you want
   testset = bags(indices);
   t1 = bags(indices);
   
   
   a=[1:1:120];
   
   Acommon = intersect(indices,a);
   t2 = setxor(a,Acommon);
   
   trainset = bags(t2);




%total_error = norm(labelref-labelbag,1)/length(labelbag);

%% test

load('apple');load('banana');

[dataset,labelref] = gendatmilsival(apple,banana);
bagid = getident(dataset,'milbag');

%We train and test the classifier using the same dataset (the entire dataset)
Train = dataset*fisherc; 
Test = dataset*Train;         
instanceLabels = labeld(dataset,Train);


labelbag = combineinstlabels(bagid,instanceLabels);

apple_error = norm(1-labelbag(1:60),1)/(length(labelbag)/2);
banana_error = norm(labelbag(61:end)-2,1)/(length(labelbag)/2);







%%
width = 50
for k=1:1   
    a = apple{k};
    image_segmented = im_meanshift(a,width);
    number_segments = length(unique(image_segmented));
    avcolors_segment = zeros(number_segments, 3);
    
    red = a(:,:,1); 
    green = a(:,:,2);
    blue = a(:,:,3);
    
    for i = 1:number_segments
         num = (image_segmented==i); %Look at a certain segmented area to determine RGB color for that segment 
         red_pixels = red(num==1);
         green_pixels = green(num==1);
         blue_pixels = blue(num==1);
         
         r_average = sum(red_pixels)/length(red_pixels);
         g_average = sum(green_pixels)/length(green_pixels);
         b_average = sum(blue_pixels)/length(blue_pixels);
         
         avcolors_segment(i,1) = r_average;
         avcolors_segment(i,2) = g_average;
         avcolors_segment(i,3) = b_average;
         
         
 
    end
    
    
    
end



%%
%Train Classifier






%%
%allBlack = zeros(size(a, 1), size(a, 2), 'uint8');
%allBlack = zeros(size(a(:,:,1)));
%just_red = imshow(cat(3, red, allBlack, allBlack));

%width = 30;
%image = apple{1};
%image_segment = im_meanshift(image,width);



