`param num_beams;                  # number of beams

param num_rows >= 1, integer;     # number of rows
param num_cols >= 1, integer;     # number of columns 

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
var X {i in BEAMS} >= 0;

# define the tumor area which includes the locations where tumor exists
set tumor_area := {k in ROWS, h in COLUMNS: tumor_values[k,h] > 0};

# define critical area 
set critical_area := {k in ROWS, h in COLUMNS: critical_values[k,h] > 0};

# define non critical border area
set non_critical_border_area := {k in ROWS, h in COLUMNS: (critical_values[k+1,h] > 0 or
      critical_values[k-1,h] > 0 or critical_values[k,h+1] > 0 or critical_values[k,h-1] > 0) and critical_values[k,h] == 0 and tumor_values[k,h] == 0 and k > 0 and k < num_rows and h > 0 and h < num_cols};

# non critical border maximum dosage
param non_critical_border_max;
 
# total dosage at each non critical location [k,h] should be <= max non critical border dosage
subject to non_critical_border_limit {(k,h) in non_critical_border_area} : sum {i in BEAMS} X[i] * beam_values[i, k, h] <= non_critical_border_max;



