function [cnn, MAE, correlation, vmaes, vcorrs, vaccs] = agesTraining(datax, datay, validx, validy, alpha, batchsize, numepochs, layers)
rand('state',0)

cnn.layers = layers;
datay = datay / 100;
cnn = cnnsetup(cnn, datax, datay);

opts.alpha = alpha;
opts.batchsize = batchsize;
opts.numepochs = 1;

vmaes = zeros(1, numepochs);
vcorrs = zeros(1, numepochs);
vaccs = zeros(1, numepochs);

for i=1:numepochs,
    disp(['Epoch ' num2str(i) '/' num2str(numepochs)]);
    tic;
    cnn = cnntrain(cnn, datax, datay, opts);
    [~, vmaes(i), vcorrs(i), vaccs(i)] = agesTesting(cnn, validx, validy);
    toc;
end;

cnn = cnnff(cnn, datax);

correlation = corr(datay', cnn.o');
MAE = mean(abs(100*(cnn.o-datay)));