function [ net, accuracy, correlation, rms ] = genderTesting( net, datax, datay )

    net = cnnff(net, datax);
        
    accuracy = 100.0*sum(datay(1,:) == round(net.o))/length(datax);
    correlation = corr(net.o', datay');
    rms = norm(net.e);

end

