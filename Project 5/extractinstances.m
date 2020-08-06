function avcolors_segment = extractinstances( image, width )
% Extractinstances segments an image using the Mean Shift algorithm,
% computes the average red, green and blue color per segment, and returns
% the resulting features in a small data matrix. 

    image_segmented = im_meanshift(image,width);
    number_segments = length(unique(image_segmented));
    avcolors_segment = zeros(number_segments, 3);
    
    red = image(:,:,1); 
    green = image(:,:,2);
    blue = image(:,:,3);
    
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

