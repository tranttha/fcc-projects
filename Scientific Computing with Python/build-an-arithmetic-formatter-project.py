def arithmetic_arranger(problems, show_answers=False):
    if len(problems) > 5:
        return 'Error: Too many problems.'

    else:
        problem_format= []
        for i, problem in enumerate(problems):
            space_index =[]
            for index, char in enumerate(problem):
                if char.isspace():
                    space_index.append(index)
            
            first_var=problem[:space_index[0]]
            operator = problem[space_index[0]+1:space_index[1]]
            second_var=problem[space_index[1]+1:]
            if not first_var.isdigit() or not second_var.isdigit():

                return 'Error: Numbers must only contain digits.'
            elif len(first_var) > 4 or len(second_var) > 4:
                return 'Error: Numbers cannot be more than four digits.'
            elif operator != "+" and operator != "-" :
                return "Error: Operator must be '+' or '-'."
            
            if operator == "+":
                answer = int(first_var) + int(second_var)
            else:
                answer = int(first_var) - int(second_var)
            problem_format.append([first_var, operator, second_var,str(answer) ])
        
        
        problem_line= [[problem_format[j][i] for j in range(len(problem_format))] for i in range(len(problem_format[0]))]
        problem_line_2 = [problem_line[1][i]+problem_line[2][i] for i in range(len(problem_line[2]))]
        problem_line= [problem_line[0]] + [problem_line_2]+[problem_line[3]]
        

        col_len=[]
        for index, problem in enumerate(problem_format):
            first_line_var_len=len(problem[0])
            second_line_var_len=len(problem[2])

            col_len.append(max(first_line_var_len, second_line_var_len) + 2)
        
        space_between_col=4
        output=[]
        lines =[]
        output=[]
        normal_output=[problem_line[0]] +[problem_line[2] ]

        print(normal_output)
        for idx,line in enumerate(normal_output):
            lines=[]
            for idx ,var in enumerate(line):
                col_pad = [' ']* (col_len[idx]-len(var))+ [var]
                col_pad = ''.join(col_pad)
                lines.append(col_pad)
            output.append(lines)
        
        lines=[]
        for idx ,var in enumerate(problem_line[1]):
            col_pad =[var[0]]+ [' ']* (col_len[idx]-len(var))+ [var[1:]]
            col_pad = ''.join(col_pad)
            lines.append(col_pad)
        output.append(lines)
        dash=[["-"]*len for len in col_len]
        dash_line=[]
        for col in dash:
            dash_line.append(''.join(col))
        output.append(dash_line)




        # for index,line in enumerate(problem_line):
        #     if line[0].isdigit():
        #         for idx ,var in enumerate(line):
        #             col_pad = [' ']* (col_len[idx]-len(var))+ [var]
        #             col_pad = ''.join(col_pad)
        #             lines.append(col_pad)
        #         output.append(lines)
        #         lines=[]
        #     else:
        #         for idx ,var in enumerate(line[:]):
        #             col_pad =[var[0]]+ [' ']* (col_len[idx]-len(var))+ [var[1:]]
        #             col_pad = ''.join(col_pad)
        #             lines.append(col_pad)
        #         output.append(lines)
        #         lines=[]
        #         dash=[["-"]*len for len in col_len]
        #         for col in dash:
        #             lines.append(''.join(col))
        #         output.append(lines)
        #         lines=[]
        final_lines=[]
        for lines in output:
            lines='    '.join(lines)
            lines=lines
            final_lines.append(lines)

        if show_answers==True:
            output=f'{final_lines[0]}\n{final_lines[2]}\n{final_lines[3]}\n{final_lines[1]}'
        else:
            output=f'{final_lines[0]}\n{final_lines[2]}\n{final_lines[3]}'



        return output




print(f'\n{arithmetic_arranger(["32 - 698", "1 - 3801", "45 + 43", "123 + 49", "988 + 40"], True)}')