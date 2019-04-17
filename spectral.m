function [labels] = spectral(data, k)
    [N, d] = size(data);
    adj_mat = squareform(pdist(data, 'euclidean'));
    degree = diag(ones(N, 1) * N-1);
    L = degree - adj_mat;

    [V,D] = eig(L);

    [D,I] = sort(diag(D));
    V_sorted = V(:, I);
    V2 = V_sorted(:,1:k);
    labels = k_means(V2,k);
    