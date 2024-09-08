|
class Rectangle:
    dist_sides=2
    def __init__(self, * args):
        if len(args) != Rectangle.dist_sides:
            raise AttributeError(f'cant be more than 2 dim')
        if any(not isinstance(arg, (int, float)) for arg in args):
            raise TypeError("length must be of type 'int' or 'float'")
        if any(args) == 0:
            raise ValueError("length must not be 0")
        self.width=args[0]
        self.height=args[1]

    def __init_subclass__(cls):
        if not hasattr(cls, "dist_sides"):
            raise AttributeError(
                f"Cannot create '{cls.__name__}' class: missing required attribute 'dist_sides'"
            )
    def __str__(self):
        arg_list = [f'{key}={val}' for key, val in vars(self).items()]
        args = ', '.join(arg_list)
        output_string=f'{self.__class__.__name__}({args})'
        return output_string

    def set_width(self, new_width):
        self.width= new_width

    def set_height(self, new_height):
        self.height= new_height
        
    def get_area(self):
        return self.width*self.height 
    def get_perimeter(self):
        return (self.width+self.height)*2
    def get_diagonal(self):
        return (self.width**2+self.height**2)**0.5
    def get_picture(self):
        if self.width > 50:
            return 'Too big for picture.'
        output_string=''  
        for line in range(self.height):
            output_string+="*"*(self.width)+'\n'  
        return output_string
    def get_amount_inside(self,other):
        # area = other.area()
        width = other.width
        height=other.height
        return self.width//width * self.height//height
    
class Square(Rectangle):
    dist_side=1
    def __init__(self, side):
        super().__init__(side, side)
        self.side = side

    def __str__(self):
        arg_list = [f'{key}={val}' for key, val in vars(self).items() if key == 'side']
        args = ', '.join(arg_list)
        output_string=f'{self.__class__.__name__}({args})'
        return output_string

    def set_width(self, new_width):
        self.height = new_width
        self.width = new_width
        self.side = new_width

    def set_height(self, new_height):
        self.height = new_height
        self.width = new_height
        self.side = new_height
        
    def set_side(self, new_side):
        self.height = new_side
        self.width = new_side
        self.side = new_side


rect = Rectangle(10, 5)
print(rect.get_area())
rect.set_height(3)
print(rect.get_perimeter())
print(rect)
print(rect.get_picture())

sq = Square(9)
print(sq)
print(sq.get_area())
sq.set_side(4)
# sq.set_width(5)
print(sq)

print(sq.get_diagonal())
print(sq)
print(sq.get_picture())

rect.set_height(8)
rect.set_width(16)
print(rect.get_amount_inside(sq))
Close