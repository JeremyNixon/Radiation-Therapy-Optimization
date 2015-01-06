# Task 1, Part 1 Mod File
# Applied Mathematics 121
# David Freed, Chris Bruno, Jeremy Nixon, Millie Shi
# October 6, 2014

param num_beams;                  # Number of beams

param num_rows >= 1, integer;     # Number of rows
param num_cols >= 1, integer;     # Number of columns 

set BEAMS   := 1 .. num_beams;    # set of beams

set ROWS    := 1 .. num_rows;	  # set of rows
set COLUMNS := 1 .. num_cols;	  # set of columns

# values for entries of each beam
param beam_values {BEAMS, ROWS, COLUMNS} >= 0; 

# values of tumor
param tumor_values {ROWS, COLUMNS} >= 0; 

# values of critical area
param critical_values {ROWS, COLUMNS} >= 0; 

# critical maximum dosage requirement
param critical_max;

# tumor minimum dosage requirement
param tumor_min;

# dosage scalar of each beam
var X {i in BEAMS} >=0;

# define the tumor area (locations where tumor exists)
set tumor_area := {k in ROWS, h in COLUMNS: tumor_values[k, h] > 0};

# define critical area as established in .txt file
set critical_area := {k in ROWS, h in COLUMNS: critical_values[k, h] > 0};

# minimize total dosage in critical area
minimize total_critical_dosage: sum {i in BEAMS} sum {(k,h) in critical_area} X[i] * beam_values[i, k, h];

# Total dosage at each tumor location [k,h] should be >= min tumor dosage
subject to tumor_limit {(k,h) in tumor_area} : sum {i in BEAMS} X[i] * beam_values[i, k, h] >= 10;

# Total dosage at critical location [k,h] should be <= max critical dosage
subject to critical_limit {(k,h) in critical_area} : sum {i in BEAMS} X[i] * beam_values[i, k, h] <= 2;