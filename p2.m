data = load('USPS.mat');
X = data.A;
p_list = [10 50 100 200];
ix = 1;
for i = 1:4
    p = p_list(i)
    [residuals,reconstructed] = pcares(X,p);
    norm(X-reconstructed)
    for j = 1:2
        subplot(4,2,ix);
        img = reshape(reconstructed(1,:), 16, 16);
        imshow(img')
        title(['P =',num2str(p)]);
        ix = ix + 1;
    end
end