function min_distance = bag_distance(bag1,bag2)

bag1_size = size(bag1,1);
bag2_size = size(bag2,1);

min_distance = inf;
for i=1:bag1_size
    bag1_i = bag1(i,:);
    for j=1:bag2_size
        bag2_j = bag2(j,:);
        d = (sum((bag1_i - bag2_j).^2)).^(0.5);
        if d < min_distance
            min_distance = d;
        end
    end
end
end

