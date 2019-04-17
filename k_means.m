function [labels] = k_means(data, k)
    [N, d] = size(data);
    centroids = datasample(data, k, 'Replace', false);
    old_centroids = zeros(k,d);
    labels = zeros(N, 1);
    x = 0;
    while centroids ~= old_centroids
        old_centroids = centroids;
        %assign labels
        for i = 1:N
            closest_centroid = -1;
            for l = 1:k
                row = data(i,:);
                c = centroids(l,:);
                distance = norm(row-c);
                if norm(data(i,:) - centroids(l,:)) < closest_centroid || closest_centroid == -1
                    closest_centroid = distance;
                    labels(i) = l;
                end
            end
        end
        % recompute centroids
        for i = 1:k
            c = centroids(i,:);
            cluster = data(labels==i,:);
            new_c = sum(cluster, 1) / size(cluster, 1);
            centroids(i,:) = new_c;
        end
        x = x + 1;
    end