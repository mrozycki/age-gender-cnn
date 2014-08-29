function results = parameterTesting(trainx, trainy, validx, validy)

alphas = [0.5 1.0 2.0];
batchsizes = [5 10];
layers = [];

layers{1} = {
    struct('type', 'i') %input layer
    struct('type', 'c', 'outputmaps', 3, 'kernelsize', 11) %convolution layer
    struct('type', 's', 'scale', 2) %sub sampling layer
    struct('type', 'c', 'outputmaps', 6, 'kernelsize', 6) %convolution layer
    struct('type', 's', 'scale', 2) %subsampling layer
};

layers{2} = {
    struct('type', 'i')
    struct('type', 'c', 'outputmaps', 3, 'kernelsize', 9)
    struct('type', 's', 'scale', 2)
    struct('type', 'c', 'outputmaps', 6, 'kernelsize', 9)
    struct('type', 's', 'scale', 2)
};
 
% layers{3} = {
%     struct('type', 'i')
%     struct('type', 'c', 'outputmaps', 3, 'kernelsize', 9)
%     struct('type', 's', 'scale', 2)
%     struct('type', 'c', 'outputmaps', 6, 'kernelsize', 9)
%     struct('type', 's', 'scale', 2)
%     struct('type', 'c', 'outputmaps', 10, 'kernelsize', 9)
%     struct('type', 's', 'scale', 2)
% };

results = cell(1, length(alphas) * length(batchsizes) * length(layers));

i = 1;

for alpha = alphas,
    for batchsize = batchsizes,
        for layersId = 1:length(layers),
            disp(' ');
            disp(['Case #' num2str(i) ': ' num2str(alpha) ' ' num2str(batchsize) ' ' num2str(layersId)]);
            tic;
            disp('Training...');
            [net, acc, correlation] = genderTraining(trainx, trainy, alpha, batchsize, 20, layers{layersId});
            disp('Validation...');
            [vnet, vacc] = genderTesting(net, validx, validy);
            disp(['Validation accuracy: ' num2str(vacc)]);
            disp(['Validation correlation: ' num2str(corr(vnet.o', validy'))]);
            result = struct();
            result.alpha = alpha;
            result.batchsize = batchsize;
            result.layers = layersId;
            result.correlation = correlation;
            result.accuracy = acc;
            result.validation_accuracy = vacc;
            result.validation_correlation = corr(vnet.o, validy);
            %result.net = net;
            results{i} = { result };
            i = i+1;
            toc;
        end;
        disp('Saving results...');
        save('results.mat', 'results', '-v7.3');
    end;
end;
