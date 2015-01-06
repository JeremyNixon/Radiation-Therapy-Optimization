%% Task 2.1


% * PLEASE NOTE: in order to generate useful matrices for all B matrices we
% manually deleted all non-numerical entries in the beam_int.txt files 
%(i.e. semi colons and "X* :=")*


% Only the small example is feasible:

% Import the relative beam intensities (B) and their shapes (C):
B = textread('beam1_int_small.txt');
C = textread('beam_raw_small.txt');

B = B(:,2);

% Create Matrix combining all beam intensities on same grid:
Q = zeros(1:8,1:8);
for i = 1:5,
    b = (8*(i-1));
        Q = Q + C(b+1:8*i,:)*B(i);
end

% Export the matrix as a txt file
dlmwrite('total_beams1_small.txt',Q);

%% Task 2.2

% The visualization of the small example does not change, so we only do the
% actual example.

% Import the relative beam intensities (B) and their shapes (X):
B2 = textread('beam2_int_actual.txt');
X2 = textread('beam_raw.txt');
X2 = X2(:,1:end-1);

% Fix the B matrix to make it useful
M2 = vertcat(B2(:,2),B2(:,4),B2(:,6),B2(:,8));
M2 = M2(1:126);

% Create Matrix combining all beam intensities on same grid:
Q2 = zeros (1:60,1:80);
for i = 1:126,
    b = (60*(i-1));
        Q2 = Q2 + X2(b+1:60*i,:)*M2(i);
end

% Export the matrix as a txt file
dlmwrite('total_beams2_actual.txt',Q2);
%% Task 2.3
% Small Example:

% Import the relative beam intensities (B) and their shapes (C):
B3 = textread('beam3_int_small.txt');
C3 = textread('beam_raw_small.txt');

B3 = B3(:,2);

% Create Matrix combining all beam intensities on same grid:
Q3 = zeros(1:8,1:8);
for i = 1:5,
    b = (8*(i-1));
        Q3 = Q3 + C3(b+1:8*i,:)*B3(i);
end

% Export the matrix as a txt file
dlmwrite('total_beams3_small.txt',Q3);



% Actual Example:

% Import the relative beam intensities (B) and their shapes (X):
B4 = textread('beam3_int_actual.txt');
X4 = textread('beam_raw.txt');
X4 = X4(:,1:end-1);

% Fix the B matrix to make it useful
M4 = vertcat(B4(:,2),B4(:,4),B4(:,6),B4(:,8));
M4 = M4(1:126);

% Create Matrix combining all beam intensities on same grid:
Q4 = zeros (1:60,1:80);
for i = 1:126,
    b = (60*(i-1));
        Q4 = Q4 + X4(b+1:60*i,:)*M4(i);
end

% Export the matrix as a txt file
dlmwrite('total_beams3_actual.txt',Q4);

%% Task 2.4


% Enhancement for Global minimization of Radtiation:
% Small Example:

% Import the relative beam intensities (B) and their shapes (C):
B5 = textread('beam5_rad_int_small.txt');
C5 = textread('beam_raw_small.txt');

B5 = B5(:,2);

% Create Matrix combining all beam intensities on same grid:
Q5 = zeros(1:8,1:8);
for i = 1:5,
    b = (8*(i-1));
        Q5 = Q5 + C5(b+1:8*i,:)*B5(i);
end

% Export the matrix as a txt file
dlmwrite('total_beams5rad_small.txt',Q5);

% Actual Example:

% Import the relative beam intensities (B) and their shapes (X):
B6 = textread('beam5_rad_int_actual.txt');
X6 = textread('beam_raw.txt');
X6 = X6(:,1:end-1);

% Fix the B matrix to make it useful
M6 = vertcat(B6(:,2),B6(:,4),B6(:,6),B6(:,8));
M6 = M6(1:126);

% Create Matrix combining all beam intensities on same grid:
Q6 = zeros (1:60,1:80);
for i = 1:126,
    b = (60*(i-1));
        Q6 = Q6 + X6(b+1:60*i,:)*M6(i);
end

% Export the matrix as a txt file
dlmwrite('total_beams5rad_actual.txt',Q6);


%% Enhancement using Regenerative Radiation:

% Small Example:

% Import the relative beam intensities (B) and their shapes (C):
B7 = textread('beam5_pos_int_small.txt');
C7 = textread('beam_raw_small.txt');

B7 = B7(:,2);

% Create Matrix combining all beam intensities on same grid:
Q7 = zeros(1:8,1:8);
for i = 1:5,
    b = (8*(i-1));
        Q7 = Q7 + C7(b+1:8*i,:)*B7(i);
end

% Export the matrix as a txt file
dlmwrite('total_beams5pos_small.txt',Q7);



% Actual Example:

% Import the relative beam intensities (B) and their shapes (X):
B8 = textread('beam5_pos_int_actual.txt');
X8 = textread('beam_raw.txt');
X8 = X8(:,1:end-1);

% Fix the B matrix to make it useful
M8 = vertcat(B8(:,2),B8(:,4),B8(:,6),B8(:,8));
M8 = M8(1:126);

% Create Matrix combining all beam intensities on same grid:
Q8 = zeros (1:60,1:80);
for i = 1:126,
    b = (60*(i-1));
        Q8 = Q8 + X8(b+1:60*i,:)*M8(i);
end

% Export the matrix as a txt file
dlmwrite('total_beams5pos_actual.txt',Q8);



