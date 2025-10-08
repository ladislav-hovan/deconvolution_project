# Copyright (C) 2025 Mario Hervas Gomez
#
# SPDX-License-Identifier: GPL-3.0-or-later
#
# This library is free software: you can redistribute it and/or
# modify it under the terms of the GNU Public License as published
# by the Free Software Foundation; either version 3 of the License,
# or (at your option) any later version.
#
# This library is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# Library General Public License for more details.
#
# You should have received a copy of the GNU Public License along
# with this library. If not, see <https://www.gnu.org/licenses/>.

## Predicted Matrix  

expr_tot$Target <- rownames(expr_tot)

expr_tot <- expr_tot_old[, c("Target", setdiff(names(expr_tot_old), "Target"))]

expr_tot <- expr_tot[, !grepl("Mastocyte|B_cell", colnames(expr_tot))]

write.table(expr_tot, file = "sisana/data/Pred_exp_mat.tsv", sep = "\t", row.names = FALSE, col.names = TRUE)

## Real Matrix 

final_matrix$Target <- rownames(final_matrix_old)

final_matrix <- final_matrix_old[, c("Target", setdiff(names(final_matrix_old), "Target"))]

final_matrix <- final_matrix[, !grepl("Mastocyte|B_cell", colnames(final_matrix))]

write.table(final_matrix, file = "sisana/data/Real_exp_mat.tsv", sep = "\t", row.names = FALSE, col.names = TRUE)


## Network filter preprocessing 

expr_tot <- read.table("sisana/data/Pred_exp_mat_norm.tsv", header = TRUE)

final_matrix <- read.table("sisana/data/Real_exp_mat_norm.tsv", header = TRUE)

expr_tot <- expr_tot[,!colnames(expr_tot) %in% filt_samp$sample]

final_matrix <- final_matrix[,!colnames(final_matrix) %in% filt_samp$sample]

write.table(expr_tot, file = "sisana/data/Pred_exp_mat_norm_filt.tsv", sep = "\t", row.names = FALSE, col.names = TRUE)

write.table(final_matrix, file = "sisana/data/Real_exp_mat_norm_filt.tsv", sep = "\t", row.names = FALSE, col.names = TRUE)


