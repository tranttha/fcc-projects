
def add_time(start, duration, date=None):
    new_time=''
    

    day=24*60 # in min
    sep_indx=duration.find(":")
    dur_hr=duration[:sep_indx]
    dur_min=duration[sep_indx+1:]
    dur = int(dur_hr)*60+int(dur_min) # in min 
    

    period =['AM', 'PM']
    add_on =['(next day)', 'days later)']

    sep_start=start.find(":")
    start_hr=int(start[:sep_start]) % 12
    start_min=int(start[sep_start+1:-3])
    start_period=start[-2:]
    if start_period == period[0]:
        start_pod=0
    else:
        start_pod=1
    start_od = start_hr*60 + start_pod*12*60 + start_min # in min 

    time_until_eod=day-start_od
    time_until_neod=day*2-start_od
    # print(time_until_eod)

    time_res = dur + start_od
    time_half_days=time_res//(day/2)
    time_day=int(time_half_days//2)
    if time_day ==0:
        time_hr=time_res//60
    else:
        time_hr= time_res%(time_day*day)//60 # from 0 to 24
    if time_hr > 11:
        time_pod=1
        time_hr=time_hr-12
    else:
        time_pod=0
    time_min= time_res%(60) 

    f_time_min=str(time_min).rjust(2,'0')
    if time_hr == 0:
        f_time_hr=12
    else:
        f_time_hr=str(time_hr)
    if date:
        date=date.lower()
        date_dict={0:'sunday', 1:'monday', 2:'tuesday',3:'wednesday',4:'thursday', 5:'friday', 6:'saturday'}
        for key,val in date_dict.items():
            if val==date:
                dow=key
    # if dow:
        new_dow=date_dict[(dow+time_day)%7]
        f_new_dow=new_dow[0].upper() + new_dow[1:]
        if dur <time_until_eod:
            if time_pod ==1:
                new_time=f'{f_time_hr}:{f_time_min} {period[1]}, {f_new_dow}'
            else:
                new_time=f'{f_time_hr}:{f_time_min} {period[0]} {f_new_dow}'
        elif time_until_eod<=dur<time_until_neod:
            if time_pod ==1:
                new_time=f'{f_time_hr}:{f_time_min} {period[1]}, {f_new_dow} {add_on[0]}'
            else:
                new_time=f'{f_time_hr}:{f_time_min} {period[0]}, {f_new_dow} {add_on[0]}'
        else:
            if time_pod ==1:
                new_time=f'{f_time_hr}:{f_time_min} {period[1]}, {f_new_dow} ({time_day} {add_on[1]}'
            else:
                new_time=f'{f_time_hr}:{f_time_min} {period[0]}, {f_new_dow} ({time_day} {add_on[1]}'

    else:
        if dur <time_until_eod:
            if time_pod ==1:
                new_time=f'{f_time_hr}:{f_time_min} {period[1]}'
            else:
                new_time=f'{f_time_hr}:{f_time_min} {period[0]}'
        elif time_until_eod<=dur<time_until_neod:
            if time_pod ==1:
                new_time=f'{f_time_hr}:{f_time_min} {period[1]} {add_on[0]}'
            else:
                new_time=f'{f_time_hr}:{f_time_min} {period[0]} {add_on[0]}'
        else:
            if time_pod ==1:
                new_time=f'{f_time_hr}:{f_time_min} {period[1]} ({time_day} {add_on[1]}'
            else:
                new_time=f'{f_time_hr}:{f_time_min} {period[0]} ({time_day} {add_on[1]}'


    return new_time

print(add_time('11:55 AM', '3:12'))
