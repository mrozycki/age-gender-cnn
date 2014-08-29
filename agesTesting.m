function [ net, MAE, correlation, accuracy ] = agesTesting( net, datax, datay )

    net = cnnff(net, datax);
        
    MAE = mean(abs(100*net.o-datay));
    [x,y] = meshgrid(net.o*100, [0 3 8 13 20 37 66]);
    age_labels = [1 5 10 16 28 51 75];
    class_predictions = age_labels(sum(x > y));
    accuracy = sum(class_predictions == datay)/length(datay)*100;
    
    correlation = corr(net.o', datay');

end

