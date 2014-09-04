function saveCNN(filename, cnn)
    
    % use little-endian
    faceCheckerFile = fopen(filename, 'w', 'l');
    
    num_depth_layers = size(cnn.layers,1);

    % Get the number of layers
    fwrite(faceCheckerFile, num_depth_layers, 'uint'); % 4 bytes

    for layers=2:num_depth_layers

        % write layer type: 0 - convolutional, 1 - subsampling, 
        % 2 - fully connected
        if(cnn.layers{layers}.type == 'c')

            % write the type (convolutional)
            fwrite(faceCheckerFile, 0, 'uint'); % 4 bytes

            num_in_map = size(cnn.layers{layers}.k,2);

            % write the number of input maps
            fwrite(faceCheckerFile, num_in_map, 'uint'); % 4 bytes

            num_out_kerns = cnn.layers{layers}.outputmaps;

            % write the number of kernels for each output map
            fwrite(faceCheckerFile, num_out_kerns, 'uint'); % 4 bytes

            % Write output map bias terms
            for k2=1:num_out_kerns
                fwrite(faceCheckerFile, cnn.layers{layers}.b{k2}, 'float32'); % 4 bytes
            end

            for k=1:num_in_map
                for k2=1:num_out_kerns
                    % Write out the bias term
                    W = cnn.layers{layers}.k{k}{k2};
                    writeMatrixBin(faceCheckerFile, W, 5);
                end
            end

        else
            fwrite(faceCheckerFile, 1, 'uint'); % 4 bytes
            % size of scaling
            fwrite(faceCheckerFile, cnn.layers{layers}.scale, 'uint'); % 4 bytes
        end

    end

    % This is the fully connected layer
    fwrite(faceCheckerFile, 2, 'uint'); % 4 bytes

    % the bias term
    fwrite(faceCheckerFile, cnn.ffb, 'float32');
    % the weights
    writeMatrixBin(faceCheckerFile, cnn.ffW, 5);
    
    fclose(faceCheckerFile);
    
end

