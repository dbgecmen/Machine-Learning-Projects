function [segment, segmentedim]  = extractinstancesimage(im, width)
    segments	=	im_meanshift(im,width);
    nsegments	=	length(unique(segments));
    segment	=	zeros(nsegments,3);
    red     =	im(:,:,1);
    blue	=	im(:,:,2);
    green	=	im(:,:,3);
    for	i	=	1:nsegments
        target	=	(segments==i);
        redpix	=	red(target==1);
        meanred	=	sum(redpix)/length(redpix);
        bluepix	=	blue(target==1);
        meanblue	=	sum(bluepix)/length(bluepix);
        greenpix	=	green(target==1);
        meangreen	=	sum(greenpix)/length(greenpix);
        segment(i,1)	=	meanred;
        segment(i,2)	=	meanblue;
        segment(i,3)	=	meangreen;
    end
    
    
    imred = zeros(size(segments));
    imblue =  zeros(size(segments));
    imgreen =  zeros(size(segments));
    for i = 1:nsegments
        target = (segments == i);
        imred(target) = segment(i, 1);
        imblue(target) = segment(i, 2);
        imgreen(target) = segment(i, 3);
    end
    segmentedim(:,:,1) = imred;
    segmentedim(:,:,2) = imblue;
    segmentedim(:,:,3) = imgreen;
    segmentedim = uint8(segmentedim);
    
    
    
end
