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

import numpy as np
import pandas as pd 
ruta_archivo = "/storage/kuijjerarea/mario/sisana/network/Predicted/norm/results/lioness.npy"


data = np.load(ruta_archivo)

df = pd.DataFrame(data)

print("Type of data:", type(data))


if isinstance(data, np.ndarray):
    print("Array_shape:", data.shape)  
    print("Element_type:", data.dtype)  
    print("First_elements:\n", data[:5])  

df.to_csv("raw_edges_pred.csv", index=True)
