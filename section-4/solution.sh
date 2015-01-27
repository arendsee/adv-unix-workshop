#!/bin/bash
set -u

dat=diamonds.tab

#-----------------------------------------------------------------------------
# Exercise 4.1
# Count the types of each cut
#-----------------------------------------------------------------------------

echo "Counts per cut:"
# Replace the command below with a command that produces the following output:
  # 21551 Ideal
  # 13791 Premium
  # 12082 Very_Good
  #  4906 Good
  #  1610 Fair
awk '!/^#/ {print $2}' $dat | sort | uniq -c | sort -rn



#-----------------------------------------------------------------------------
# Exercise 4.2
# Find the top 10 most expensive diamonds
# Only report the columns 1,2,3,4, and 7
#-----------------------------------------------------------------------------

echo "Top ten most expensive:"
# Replace the command below with a command that produces the following output:
  # 2.29  Premium    I  VS2   18823
  # 2     Very_Good  G  SI1   18818
  # 1.51  Ideal      G  IF    18806
  # 2.07  Ideal      G  SI2   18804
  # 2     Very_Good  H  SI1   18803
  # 2.29  Premium    I  SI1   18797
  # 2     Premium    I  VS1   18795
  # 2.04  Premium    H  SI1   18795
  # 2.15  Ideal      G  SI2   18791
  # 1.71  Premium    F  VS2   18791
awk '!/^#/ {print $1, $2, $3, $4, $7}' $dat | sort -rnk7 | head -10 | column -t

# I didn't mention `column` in the workshop, but it is a useful and simple
# tool. Compare the results with and without `column -t`
