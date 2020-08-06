function [mB] = bagembed(x,B,sigma)
    mB = zeros(1,length(x));
    for i = 1:length(x)
        mB(i) = max(exp(-vecnorm(B-x(i,:),2,2).^2/sigma^2));
    end
end
