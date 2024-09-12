import numpy as np

def calculate(list):
    np_list =np.array(list)
    calculations = {
        'mean':[],
        'variance': [],
        'standard deviation': [],
        'max': [],
        'min': [],
        'sum': []
    }
    if len(list) != 9:
        raise ValueError("List must contain nine numbers.")
    else:
        matrix= np.reshape(np_list,(3,3))

        int_func_key = {'max': 'max','min': 'min','sum': 'sum'}
        for key, calculations_key in int_func_key.items():
            func_int = getattr(np, key)
            axis_0_func_int = func_int(matrix, axis=0)
            axis_1_func_int = func_int(matrix,axis=1)
            flattend_func_int = func_int(matrix)

            calculations[calculations_key].append([int(np_float) for np_float in axis_0_func_int])
            calculations[calculations_key].append([int(np_float) for np_float in axis_1_func_int])
            calculations[calculations_key].append(int(flattend_func_int)) 

        float_func_key = {'mean':'mean','var': 'variance','std': 'standard deviation'}
        for key, calculations_key in float_func_key.items():
            func_float = getattr(np, key)
            axis_0_func_float = func_float(matrix, axis=0)
            axis_1_func_float = func_float(matrix,axis=1)
            flattend_func_float = func_float(matrix)

            calculations[calculations_key].append([float(np_float) for np_float in axis_0_func_float])
            calculations[calculations_key].append([float(np_float) for np_float in axis_1_func_float])
            calculations[calculations_key].append(float(flattend_func_float))

        
    
    return calculations