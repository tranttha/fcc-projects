// See https://aka.ms/new-console-template for more information
/*
Console.WriteLine("a" == "a");
Console.WriteLine("a" == "A");
Console.WriteLine(1 == 2);

string myValue = "a";
Console.WriteLine(myValue == "a");
*/
// ----------------------------
/*
string value1 = " a";
string value2 = "A ";
Console.WriteLine(value1.Trim().ToLower() == value2.Trim().ToLower());
*/
// ----------------------------
/*
string pangram = "The quick brown fox jumps over the lazy dog.";
Console.WriteLine(pangram.Contains("fox"));
Console.WriteLine(pangram.Contains("cow"));
// These two lines of code will create the same output

Console.WriteLine(pangram.Contains("fox") == false);
Console.WriteLine(!pangram.Contains("fox"));
*/
// ----------------------------
/*
int saleAmount = 1001;
// int discount = saleAmount > 1000 ? 100 : 50;
// Console.WriteLine($"Discount: {discount}");

Console.WriteLine($"Discount: {(saleAmount > 1000 ? 100 : 50)}");
*/
// ----------------------------
/*
Random coin = new Random();
Console.WriteLine((coin.Next(0,2) == 0) ? "heads" : "tails");
*/
// ----------------------------
/*
string permission = "Admin|Manager";
int level = 55;

if (permission.Contains("Admin"))
{
    if (level > 55)
    {
        Console.WriteLine("Welcome, Super Admin user.");
    }
    else
    {
        Console.WriteLine("Welcome, Admin user.");
    }
}
else if (permission.Contains("Manager"))
{
    if (level >= 20)
    {
        Console.WriteLine("Contact an Admin for access.");
    }
    else
    {
        Console.WriteLine("You do not have sufficient privileges.");
    }
}
else
{
    Console.WriteLine("You do not have sufficient privileges.");
}
*/
// ----------------------------
/*
bool flag = true;
int value;
if (true)
{
    value = 10;
    Console.WriteLine($"Inside the code block: {value}");
}
Console.WriteLine($"Outside the code block: {value}");
*/
/*
int val =5; 
if (val > 0){
    int val2 =6;

}
val = val2 + val ; // build error 
Console.WriteLine(val);
*/
// ----------------------------
/*
string name = "steve";

if (name == "bob")
    Console.WriteLine("Found Bob");
else if (name == "steve") 
    Console.WriteLine("Found Steve");
else
    Console.WriteLine("Found Chuck");
*/
//  ----------------------------
/*
int[] numbers = { 4, 8, 15, 16, 23, 42 };
int total = 0;
bool found=false; 

foreach (int number in numbers) {
    if (number == 42) {
        found = true;
    }
    total += number;
}

if (found) {
    Console.WriteLine("Set contains 42");
}
else {
    Console.WriteLine("Set does not contain 42");
}
Console.WriteLine($"Total: {total}");
*/
// ----------------------------
/*
Console.WriteLine("Enter a fruit:");
string fruit = Console.ReadLine();
switch (fruit)
{
    case "apple":
        Console.WriteLine($"App will display information for apple.");
        break;

    case "banana":
        Console.WriteLine($"App will display information for banana.");
        break;

    case "cherry":
        Console.WriteLine($"App will display information for cherry.");
        break;
}
*/
/*
int employeeLevel = 201;
string employeeName = "John Smith";

string title = "";

switch (employeeLevel)
{
    case 100:
        title = "Junior Associate";
        break;
    case 200:
        title = "Senior Associate";
        break;
    case 300:
        title = "Manager";
        break;
    case 400:
        title = "Senior Manager";
        break;
    default:
        title = "Associate";
        break;
}
Console.WriteLine($"{employeeName}, {title}");
*/
// ----------------------------
// SKU = Stock Keeping Unit. 
// SKU value format: <product #>-<2-letter color code>-<size code>
/*
string sku = "01-MN-L";

string[] product = sku.Split('-');

string type = "";
string color = "";
string size = "";

switch (product[0]) {
    case "01":
        type = "Sweat shirt";
        break;
    case "02":
        type = "T-Shirt";
        break;
    case "03":
        type = "Sweat pants";
        break;
    default:
        type = "Other";
        break;
}
switch (product[1]) {
    case "BL":
        color = "Black";
        break;
    case "MN":
        color = "Maroon";
        break;
    default:
        color = "White";
        break;  
}
switch (product[2]) {
    case "S":
        size = "Small";
        break;
    case "M":
        size = "Medium";
        break;
    case "L":
        size = "Large";
        break;
    default:
        size = "One Size Fits All";
        break;
}

Console.WriteLine($"Product: {size} {color} {type}");
*/
// ----------------------------
/*
for (int i = 0; i < 10; i++)
{
    Console.WriteLine(i);
    if (i == 7) break;

}
*/
/*
for (int i = 0; i <101; i ++) { 
    Console.Write($"{i}");
    string addon="";
    if (i % 3 == 0){
        if (i % 5 == 0){
            addon += " - FizzBuzz";
        }
        else {
            addon += " - Fizz";
        }
    }
    else if (i % 5 == 0) {
        addon += " - Buzz";
    };
    Console.Write($"{addon}\n");
}
*/
// ----------------------------
/*
Random random = new Random();
int current = random.Next(1, 11);

do {
    current = random.Next(1, 11);
    if (current >= 8) continue;
    Console.WriteLine(current);
} while (current != 7);
*/
/*
while (current >= 3)
{
    Console.WriteLine(current);
    current = random.Next(1, 11);
}
Console.WriteLine($"Last number: {current}");
*/
/*
Random random = new Random();

int heroHealth = 10;
int monsterHealth = 10;

do {
    int Attack = random.Next(1, 11);
    monsterHealth -= Attack;
    Console.WriteLine($"Monster was damaged and lost {Attack} health and now has {monsterHealth} health.");
    if (heroHealth <= 0 || monsterHealth <= 0) {
        Console.WriteLine((heroHealth > 0)? "Hero wins!" : "Monster wins!");
        break;
    };
    Attack = random.Next(1, 11);
    heroHealth -= Attack;
    Console.WriteLine($"Hero was damaged and lost {Attack} health and now has {heroHealth} health.");
    if (heroHealth <= 0 || monsterHealth <= 0) {
        Console.WriteLine((heroHealth > 0)? "Hero wins!" : "Monster wins!");
        break;
    };
} while (heroHealth >= 0 && monsterHealth >= 0);
*/
// ----------------------------
// capture user input in a string variable named readResult
/*
string? readResult;
int numericValue;
bool validNumber = false;
bool validEntry = false;
// validNumber = int.TryParse(readResult, out numericValue);
Console.WriteLine("Enter an integer value between 5 and 10");
do {
    readResult = Console.ReadLine();
    validNumber = int.TryParse(readResult, out numericValue);

    if (validNumber)  {
        if ((numericValue>= 5) && (numericValue <= 10)) {
            validEntry = true;
            // validEntry = true;
            Console.WriteLine($"Your input value ({numericValue}) has been accepted.");
        }
        else {
            Console.WriteLine($"You entered {numericValue}. Please enter a number between 5 and 10.");
        }
    }
    else {
        Console.WriteLine("Sorry, you entered an invalid number, please try again");
    }
} while (validEntry == false);
*/
/*
string? readResult;
string roleName = "";
bool validEntry = false;

do
{                
    Console.WriteLine("Enter your role name (Administrator, Manager, or User)");
    readResult = Console.ReadLine();
    if (readResult != null) 
    {
        roleName = readResult.Trim();
    }

    if (roleName.ToLower() == "administrator" || roleName.ToLower() == "manager" || roleName.ToLower() == "user") 
    {
        validEntry = true;
    }
    else
    {
        Console.Write($"The role name that you entered, \"{roleName}\" is not valid. ");
    }

} while (validEntry == false);

Console.WriteLine($"Your input value ({roleName}) has been accepted.");
readResult = Console.ReadLine();
*/
/*
string[] myStrings = new string[2] { "I like pizza. I like roast chicken. I like salad", "I like all three of the menu choices" };
int stringsCount = myStrings.Length;

string myString = "";
int periodLocation = 0;

for (int i = 0; i < stringsCount; i++)
{
    myString = myStrings[i];
    periodLocation = myString.IndexOf(".");

    string mySentence;

    // extract sentences from each string and display them one at a time
    while (periodLocation != -1)
    {

        // first sentence is the string value to the left of the period location
        mySentence = myString.Remove(periodLocation);

        // the remainder of myString is the string value to the right of the location
        myString = myString.Substring(periodLocation + 1);

        // remove any leading white-space from myString
        myString = myString.TrimStart();

        // update the comma location and increment the counter
        periodLocation = myString.IndexOf(".");

        Console.WriteLine(mySentence);
    }
 
    mySentence = myString.Trim();
    Console.WriteLine(mySentence);
}
*/
// the ourAnimals array will store the following: 
