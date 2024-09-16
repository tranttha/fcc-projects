// Random dice = new Random();

// int roll1 = dice.Next(1, 7);
// int roll2 = dice.Next(1, 7);
// int roll3 = dice.Next(1, 7);

// int total = roll1 + roll2 + roll3;

// Console.WriteLine($"Dice roll: {roll1} + {roll2} + {roll3} = {total}");
// ----------------------------
// if ((roll1 == roll2) || (roll2 == roll3) || (roll1 == roll3))
// {
//     if ((roll1 == roll2) && (roll2 == roll3)) 
//     {
//         Console.WriteLine("You rolled triples! +6 bonus to total!");
//         total += 6;
//     }
//     else
//     {
//     Console.WriteLine("You rolled doubles! +2 bonus to total!");
//     total += 2;
//     }
// }

// if (total >= 16)
// {
//     Console.WriteLine("You win a new car!");
// }
// else if (total >= 10)
// {
//     Console.WriteLine("You win a new laptop!");
// }
// else if (total == 7)
// {
//     Console.WriteLine("You win a trip for two!");
// }
// else
// {
//     Console.WriteLine("You win a kitten!");
// }
// ----------------------------
// Random random = new Random();
// int daysUntilExpiration = random.Next(12);
// int discountPercentage = 0;

// if (daysUntilExpiration == 0) {
//     Console.WriteLine("Your subscription has expired. Please renew now.");
// }
// else if (daysUntilExpiration == 1) {
//     Console.WriteLine("Your subscription expires within a day!");
//     discountPercentage = 20;
// }
// else if (daysUntilExpiration <=5) {
//     Console.WriteLine($"Your subscription will expire in {daysUntilExpiration} days!");
//     discountPercentage = 10;
// }
// else if( daysUntilExpiration <= 10) {
//     Console.WriteLine("Your subscription will expire soon. Renew now!");
// }


// if (discountPercentage > 0) {
//     Console.WriteLine($"Renew now and save {discountPercentage}%.");
// }
// ----------------------------
/*
string[] fraudulentOrderIDs = new string[3];

fraudulentOrderIDs[0] = "A123";
fraudulentOrderIDs[1] = "B456";
fraudulentOrderIDs[2] = "C789";
// fraudulentOrderIDs[3] = "D000";
*/

// string[] fraudulentOrderIDs = [ "A123", "B456", "C789" ];

// Console.WriteLine($"First: {fraudulentOrderIDs[0]}");
// Console.WriteLine($"Second: {fraudulentOrderIDs[1]}");
// Console.WriteLine($"Third: {fraudulentOrderIDs[2]}");

// fraudulentOrderIDs[0] = "F000";

// Console.WriteLine($"Reassign First: {fraudulentOrderIDs[0]}");
// Console.WriteLine($"There are {fraudulentOrderIDs.Length} fraudulent orders to process.");
// ----------------------------
// string[] names = { "Rowena", "Robin", "Bao" };
// foreach (string name in names)
// {
//     Console.WriteLine(name);
// }
// int[] inventory = { 200, 450, 700, 175, 250 };
// int sum = 0;
// int bin = 0;
// foreach (int items in inventory)
// {
//     sum += items;
//     bin++;
//     Console.WriteLine($"Bin {bin} = {items} items (Running total: {sum})");
// }

// Console.WriteLine($"We have {sum} items in inventory.");
// ----------------------------
// using System.Data.Common;

// string [] id = [ "B123","C234", "A345", "C15", "B177", "G3003", "C235", "B179" ];
// foreach (string id in id) {
//     if (id.StartsWith("B")) {
//         Console.WriteLine( id );
//     }
// }
// ----------------------------
// string originalMessage = "The quick brown fox jumps over the lazy dog.";
// // convert the message into a char array
// char[] charMessage = originalMessage.ToCharArray();
// // Reverse the chars
// Array.Reverse(charMessage);
// int letterCount = 0;
// // count the o's
// foreach (char letter in charMessage) {
//      if (letter == 'o') { 
//         letterCount++; 
//         } 
//      }
// // convert it back to a string
// string newMessage = new String(charMessage);
// // print it out
// Console.WriteLine(newMessage);
// Console.WriteLine($"'o' appears {letterCount} times.");
// ----------------------------

using System;
using System.ComponentModel.DataAnnotations;
using System.Runtime.CompilerServices;
int examAssignments = 5;

int[] sophiaScore = new int[] { 90, 86, 87, 98, 100, 94, 90 };
int[] andrewScore = new int[] { 92, 89, 81, 96, 90, 89 };
int[] emmaScore = new int[] { 90, 85, 87, 98, 68, 89, 89, 89 };
int[] loganScore = new int[] { 90, 95, 87, 88, 96, 96 };
int[] beckyScore = new int[] { 92, 91, 90, 91, 92, 92, 92 };
int[] chrisScore = new int[] { 84, 86, 88, 90, 92, 94, 96, 98 };
int[] ericScore = new int[] { 80, 90, 100, 80, 90, 100, 80, 90 };
int[] gregorScore = new int[] { 91, 91, 91, 91, 91, 91, 91 };  

Dictionary<string, int[]> studentScore =  
    new Dictionary<string, int[]>(){
                    {"Sophia", sophiaScore},
                    {"Andrew", andrewScore},
                    {"Emma", emmaScore},
                    {"Logan", loganScore},
                    {"Becky", beckyScore},
                    {"Chris", chrisScore},
                    {"Eric", ericScore},
                    {"Gregor", gregorScore}
                    }; 

Console.WriteLine("Student\t\tExam Score\tOverall\tGrade\tExtra Credit\n");
foreach(KeyValuePair<string, int[]> student in studentScore){
    int gradedAssignments = 0;
    decimal studentSum = 0;
    decimal examScore = 0;
    decimal extraCredit = 0; 

    foreach(int subjectScore in student.Value) {
        gradedAssignments++;
        if (gradedAssignments <= examAssignments){
            // add the exam score to the sum
            examScore += subjectScore;
            studentSum += subjectScore;
            }
        else {
            // add the extra credit points to the sum - bonus points equal to 10% of an exam subjectScore
            studentSum += (decimal) subjectScore / 10;
            extraCredit += subjectScore;
            }
    }
    examScore /= examAssignments;
    
    int extraCreditAvg = (int) extraCredit / (student.Value.Length - examAssignments);
    decimal GPAScore = studentSum / examAssignments ;
    decimal extraCreditScore = GPAScore - examScore;

    string letterScore = "F";
    if (GPAScore >=60) {
        if (GPAScore >= 90) {
            letterScore = "A";
        }
        else if (GPAScore >= 80) {
            letterScore = "B";
        }
        else if (GPAScore >= 70) {
            letterScore= "C";
        }
        else if (GPAScore >= 60) {
            letterScore= "D";
        }

        if (GPAScore % 10 >= 7 ){
            letterScore += "+";
        }
        else if (GPAScore % 10 <= 2) {
            letterScore += "-";
        }   
    }
    Console.WriteLine($"{student.Key}\t\t{examScore:F1}\t\t{GPAScore:F2}\t{letterScore}\t{extraCreditAvg} ({extraCreditScore:F2} pts)");
}
Console.WriteLine("Press the Enter key to continue");
Console.ReadLine();

