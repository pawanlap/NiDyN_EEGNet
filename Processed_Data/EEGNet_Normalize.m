%% Normalize EEG Data for EEGNet
close all
clear all

%% Parameters
subject_number = 12;

%% Load Data
load(sprintf('s%i_eegnet_ARL.mat',subject_number))

%% Normalize Data
eeg_matrix_norm = zeros(size(eeg_matrix,1),size(eeg_matrix,2),size(eeg_matrix,3));
for i = 1:size(eeg_matrix,1)
    for j = 1:size(eeg_matrix,2)
        eeg_matrix_norm(i,j,:) = normalize(eeg_matrix(i,j,:));
    end
end
eeg_matrix_norm(isnan(eeg_matrix_norm)) = 0;
eeg_matrix = eeg_matrix_norm;

%% Save Data
save(sprintf('s%i_eegnet_normARL.mat',subject_number),'eeg_matrix','label_array');