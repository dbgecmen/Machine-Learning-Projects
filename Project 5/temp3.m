load('apple');load('banana');

bags=[apple;banana];
l_bags=zeros(length(bags));
[dataset,ref_label]=gendatmilsival(apple,banana);
bag_id=getident(dataset,'milbag');

for k=1:length(bags)
    for l=1:length(bags)
        l_bags(k,l)=hausdorff(bags{k},bags{l});
    end
end

[A,B]=sort(l_bags);
knn=B(1:5,:);
n=zeros(length(bags),1);

for	k=1:length(bags)
    [apple_ref,banana_ref]=refknn(k,knn);
    [apple_cit,banana_cit]=citknn(k,knn);
    if (apple_ref+apple_cit)>=(banana_ref+banana_cit)
        ref_label=1;
    else
        ref_label=2;
    end
    n(k)=ref_label;
end