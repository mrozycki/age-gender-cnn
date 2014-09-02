function cnn = ageTraining(datax, datay, alpha, batchsize, numepochs, layout)
rand('state',0)

cnn.layers = layout;
datay = datay / 100;
cnn = cnnsetup(cnn, datax, datay);

opts.alpha = alpha;
opts.batchsize = batchsize;
opts.numepochs = numepochs;

cnn = cnntrain(cnn, datax, datay, opts);
cnn = cnnff(cnn, datax);
disp(['MAE on training data: ' num2str(mean(abs(100*cnn.o - datay)))]);