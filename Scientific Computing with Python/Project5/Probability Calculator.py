import copy
import random
from collections import Counter
class Hat:
    def __init__(self, **kwargs):
        if len(kwargs) == 0:
            raise AttributesError(f'must have ball color and ball number')

        self.color=set(kwargs.keys())
        self.contents =[]
        for k,v in kwargs.items():
            self.contents += [f'{k}']*v
        # self.removed = []

    def __str__(self):
        return (f'{[v for v in self.contents]}')

    def draw(self, n):
        if n >= len(self.contents):
            removed = self.contents
            self.contents = []
            return removed
        elif n == 0:
            raise AttributesError(f'must remove balls')
        removed = random.sample(self.contents, n)
        for balls in removed:
            self.contents.remove(balls)

        return removed
        
                
def experiment(hat, expected_balls, num_balls_drawn, num_experiments):
    M = 0
    for i in range(num_experiments):
        hat_copy = copy.deepcopy(hat)
        removed = hat_copy.draw(num_balls_drawn)
        removed_dict = Counter(removed)
        yes = True 
        for color, count in expected_balls.items():
            if removed_dict[color] < count:
                yes = False 
                break
        if yes :
            M += 1
    probability = M/num_experiments
    return probability



hat = Hat(black=6, red=4, green=3)
experiment(hat=hat,expected_balls={'red':2,'green':1},num_balls_drawn=5,num_experiments=2000)