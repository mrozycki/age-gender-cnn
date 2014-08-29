function results = ageParameterTesting(trainx, trainy, validx, validy)

alphas = [0.01 0.05 0.1 0.5 1.0];
batchsizes = [5 50 500 1000];
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
            [net, mae, correlation] = agesTraining(trainx, trainy, validx, validy, alpha, batchsize, 10, layers{layersId});
            disp('Validation...');
            [vnet, vmae, vcorr, vacc] = agesTesting(net, validx, validy);
            disp(['Validation MAE: ' num2str(vmae)]);
            disp(['Validation correlation: ' num2str(vcorr)]);
            disp(['Validation accuracy: ' num2str(vacc)]);
            result = struct();
            result.alpha = alpha;
            result.batchsize = batchsize;
            result.layers = layersId;
            result.correlation = correlation;
            result.mae = mae;
            result.validation_mae = vmae;
            result.validation_correlation = vcorr;
            result.validation_accuracy = vacc;
            %result.net = net;
            results{i} = { result };
            i = i+1;
            toc;
        end;
        disp('Saving results...');
        save('age-results.mat', 'results', '-v7.3');
    end;
end;
