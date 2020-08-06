function  mloss  = Mix_Loss(p,z)
%a.*b elementwise multiplication
%sum takes the sum of each column
mloss=-log(sum(p.*exp(-z))) 
end

