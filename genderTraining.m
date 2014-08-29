function [cnn, accuracy, correlation, vaccs, vcorrs, vrms] = genderTraining(datax, datay, validx, validy, alpha, batchsize, numepochs, layers)
rand('state',0)

cnn.layers = layers;
cnn = cnnsetup(cnn, datax, datay);

opts.alpha = alpha;
opts.batchsize = batchsize;
opts.numepochs = 1;

vaccs = zeros(1, numepochs);
vcorrs = zeros(1, numepochs);
vrms = zeros(1, numepochs);

for i=1:numepochs,
    disp(['Epoch ' num2str(i) '/' num2str(numepochs)]);
    tic;
    cnn = cnntrain(cnn, datax, datay, opts);
    [~, vaccs(i), vcorrs(i), vrms(i)] = genderTesting(cnn, validx, validy);
    toc;
end;

cnn = cnnff(cnn, datax);

correlation = corr(datay', cnn.o');
accuracy = 100.0*sum(datay == round(cnn.o))/(floor(size(datax,3)/batchsize) * batchsize);