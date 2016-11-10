function PCAImagesDim = apply_pca(images, dim)
% APPLY_PCA 
% PCAImagesDim It returns the matrix with reduced attributes.
% Each column is an image
% 

%% PCA
% Use princomp.m to compute:
% 4. To complete:
 [PCACoefficients, PCAImages, PCAValues] = princomp(images);

%% Show the 30 first eigenfaces
% 5. To complete:
show_eigenfaces(PCACoefficients)

%% Plot the explained variance using 100 dimensions
% 6. To complete:
   explained_variance = cumsum(PCAValues)./sum(PCAValues);
   x = linspace(1,100);
   plot(x,explained_variance(1:100))
%% Keep the first 'dim' dimensions where dim is given or computed as the
%% dimensions necessary to preserve 95% of the data variance.
if dim>0
    PCAImagesDim = PCAImages(:,1:dim);
else
    % Compute the number of dimensions necessary to preserve 95% of the data variance.
    % 7. To complete:
    explained_var = 0;
    for i=1:length(PCAValues)
        explained_var = cumsum(PCAValues(1:i))/sum(PCAValues);
        if explained_var(end) >= 0.95
            PCAImagesDim = PCAImages(:,1:i);
            break
        end
    end
end
end