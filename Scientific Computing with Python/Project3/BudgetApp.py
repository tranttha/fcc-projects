from collections import defaultdict
class Category:
  def __init__(self, category):

      self.category=category
      self.ledger = []

  def get_balance(self):
      get_balance=sum(item['amount'] for item in self.ledger)
      return get_balance

  def __str__(self):
    title_line =str(self.category).center(30,"*")
    for item in self.ledger:
      try:
        left = item['description'][0:23]
      except TypeError:
        left = ''
      right = str("{:.2f}".format(item['amount']))
      title_line+= f"\n{left:<23}{right:>7}"
    title_line += "\nTotal: "+ str(self.get_balance())
    return title_line


  def check_funds(self, amount: float):
      return amount <= self.get_balance()
          
  def deposit(self, amount: float, description=None):
      if description == None:
        deposit={'amount':amount, 'description':''}
      else:
        deposit={'amount': amount, 'description': description}
      
      self.ledger.append(deposit)

  def withdraw(self, amount:float, description=None):
    if self.check_funds(amount) == True:
      if description is None:
        withdrawal={'amount': (0-amount), 'description': ''}
      else:
        withdrawal={'amount': (0-amount), 'description': description}
      self.ledger.append(withdrawal)    
      return True
    else:
        return False


  def transfer(self, amount:float, category_to):
      if self.check_funds(amount) == True:

        category_to.deposit(amount, description= f"Transfer from {self.category}")
        self.ledger.append({'amount':- amount, 'description': f'Transfer to {category_to.category}'})
        return True
      else:

          return False


def create_spend_chart(categories):
  spent_dict = {}
  for i in categories:
    s = 0 
    for j in i.ledger:
      if j['amount'] < 0 :
        s+= abs(j['amount'])
    spent_dict[i.category] = round(s,2)
  total = sum(spent_dict.values())
  percent_dict = {}
  for k in spent_dict.keys():
    percent_dict[k] = int(round(spent_dict[k]/total,2)*100)
  output = 'Percentage spent by category\n'
  for i in range(100,-10,-10):
    output += f'{i}'.rjust(3) + '| '
    for percent in percent_dict.values():
      if percent >= i:
        output+= 'o  '
      else:
        output+= '   '
    output += '\n' 
  output += ' '*4+'-'*(len(percent_dict.values())*3+1)
  output += '\n     '
  dict_key_list = list(percent_dict.keys())
  max_len_category = max([len(i) for i in dict_key_list])
  
  for i in range(max_len_category):
    
    for name in dict_key_list:
      if len(name)>i:
        output+= name[i] +'  '
      else:
        output+= '   '
    if i < max_len_category-1:
      output+='\n     '
    
  return output

food = Category('Food')
food.deposit(1000)
food.withdraw(10.15, 'groceries')
food.withdraw(15.89, 'restaurant and more food for dessert')
clothing = Category('Clothing')
food.transfer(50, clothing)
print(create_spend_chart([food, clothing]))
Close