// the ourAnimals array will store the following: 
string animalSpecies = "";
string animalID = "";
string animalAge = "";
string animalPhysicalDescription = "";
string animalPersonalityDescription = "";
string animalNickname = "";
string suggestedDonation = "";

// variables that support data entry
int maxPets = 8;
string? readResult;
string menuSelection = "";

// array used to store runtime data, there is no persisted data
string[,] ourAnimals = new string[maxPets, 7];
static void ClearLastLine() {
    int currentLeft = Console.CursorLeft;
    int currentTop = Console.CursorTop;
    Console.Write(new String(' ', Console.WindowWidth - currentLeft));
    Console.SetCursorPosition(currentLeft, currentTop);
}

// TODO: Convert the if-elseif-else construct to a switch statement
// create some initial ourAnimals array entries
for (int i = 0; i < maxPets; i++)
{
    switch (i)
    {
        case 0:
            animalSpecies = "dog";
            animalID = "d1";
            animalAge = "2";
            animalPhysicalDescription = "medium sized cream colored female golden retriever weighing about 65 pounds. housebroken.";
            animalPersonalityDescription = "loves to have her belly rubbed and likes to chase her tail. gives lots of kisses.";
            animalNickname = "lola";
            suggestedDonation = "85.00";

            break;
        case 1:
            animalSpecies = "dog";
            animalID = "d2";
            animalAge = "9";
            animalPhysicalDescription = "large reddish-brown male golden retriever weighing about 85 pounds. housebroken.";
            animalPersonalityDescription = "loves to have his ears rubbed when he greets you at the door, or at any time! loves to lean-in and give doggy hugs.";
            animalNickname = "loki";
            suggestedDonation = "49.99";
            break;
        case 2:
            animalSpecies = "cat";
            animalID = "c3";
            animalAge = "1";
            animalPhysicalDescription = "small white female weighing about 8 pounds. litter box trained.";
            animalPersonalityDescription = "friendly";
            animalNickname = "Puss";
            suggestedDonation = "40.00";
            break;
        case 3:
            animalSpecies = "cat";
            animalID = "c4";
            animalAge = "?";
            animalPhysicalDescription = "";
            animalPersonalityDescription = "";
            animalNickname = "";
            suggestedDonation = "";
            break;
        default:
            animalSpecies = "";
            animalID = "";
            animalAge = "";
            animalPhysicalDescription = "";
            animalPersonalityDescription = "";
            animalNickname = "";
            suggestedDonation = "";
            break;
    }
    ourAnimals[i, 0] = "ID #: " + animalID;
    ourAnimals[i, 1] = "Species: " + animalSpecies;
    ourAnimals[i, 2] = "Age: " + animalAge;
    ourAnimals[i, 3] = "Nickname: " + animalNickname;
    ourAnimals[i, 4] = "Physical description: " + animalPhysicalDescription;
    ourAnimals[i, 5] = "Personality: " + animalPersonalityDescription;

    decimal decimalDonation = 0.00m;
    if (!decimal.TryParse(suggestedDonation, out decimalDonation)) {
        decimalDonation = 45.00m; // if suggestedDonation NOT a number, default to 45.00
    }
    ourAnimals[i, 6] = $"Suggested Donation: {decimalDonation:C2}";


}

// display the top-level menu options
do
{
    Console.Clear();
    Console.WriteLine("Welcome to the Contoso PetFriends app. Your main menu options are:");
    Console.WriteLine(" 1. List all of our current pet information");
    Console.WriteLine(" 2. Add a new animal friend to the ourAnimals array");
    Console.WriteLine(" 3. Ensure animal ages and physical descriptions are complete");
    Console.WriteLine(" 4. Ensure animal nicknames and personality descriptions are complete");
    Console.WriteLine(" 5. Edit an animal’s age");
    Console.WriteLine(" 6. Edit an animal’s personality description");
    Console.WriteLine(" 7. Display all cats with a specified characteristic");
    Console.WriteLine(" 8. Display all dogs with a specified characteristic"); // practice 3 
    Console.WriteLine();
    Console.WriteLine("Enter your selection number (or type Exit to exit the program)");

    readResult = Console.ReadLine();
    if (readResult != null)
    {
        menuSelection = readResult.ToLower();
    }

    // Console.WriteLine($"You selected menu option {menuSelection}.");
    // Console.WriteLine("Press the Enter key to continue");

    // // pause code execution
    // readResult = Console.ReadLine();
    switch (menuSelection)
    {
        case "1":
            // List all of our current pet information

            for (int i = 0; i < maxPets; i ++) {
                if (ourAnimals[i, 0] != "ID #: "){
                    // Console.WriteLine(ourAnimals[i, 0]);
                    Console.WriteLine();

                    for (int j=0; j <7; j ++){
                        Console.WriteLine(ourAnimals[i, j]);
                    }
                }
            }
            Console.WriteLine("Press the Enter key to continue.");
            readResult = Console.ReadLine();
            break;
        case "2":
            string anotherPet = "y";
            int petCount =0 ;
            for (int i =0;i<maxPets;i++){
                if (ourAnimals[i,0] != "ID #: "){
                    petCount +=1 ;
                }
            }
            if (petCount < maxPets){
                Console.WriteLine($"We currently have {petCount} pets that need homes. We can manage {(maxPets - petCount)} more.");
            }
            while (anotherPet == "y" && petCount < maxPets) {
                bool validEntry = false;
                do {
                    Console.WriteLine("\n\rEnter 'dog' or 'cat' to begin a new entry");
                    readResult = Console.ReadLine();
                    if (readResult != null){
                        animalSpecies = readResult.ToLower();
                    }
                    if (animalSpecies != "dog" && animalSpecies != "cat"){
                        validEntry = false;
                    } else {
                        validEntry = true;
                    }
                } while(!validEntry);
                animalID = animalSpecies.Substring(0, 1) + (petCount + 1).ToString();

                do {
                    int petAge;
                    Console.WriteLine("Enter the pet's age or enter ? if unknown");
                    readResult = Console.ReadLine();
                    if (readResult != null){
                        animalAge = readResult;
                    }
                    if (animalAge != "?"){
                        validEntry = int.TryParse(animalAge, out petAge);
                    } else {
                        validEntry = true;
                    }
                } while (!validEntry);
                // get a description of the pet's physical appearance/condition - animalPhysicalDescription can be blank.
                do{
                    Console.WriteLine("Enter a physical description of the pet (size, color, gender, weight, housebroken)");
                    readResult = Console.ReadLine();
                    if (readResult != null){
                        animalPhysicalDescription = readResult.ToLower();
                        if (animalPhysicalDescription == "") {
                            animalPhysicalDescription = "tbd";
                        }
                    }
                } while (animalPhysicalDescription == "");
                // get a description of the pet's personality - animalPersonalityDescription can be blank.
                do {
                    Console.WriteLine("Enter a description of the pet's personality (likes or dislikes, tricks, energy level)");
                    readResult = Console.ReadLine();
                    if (readResult != null){
                        animalPersonalityDescription = readResult.ToLower();
                        if (animalPersonalityDescription == "") {
                            animalPersonalityDescription = "tbd";
                        }
                    }
                } while (animalPersonalityDescription == "");
                // get the pet's nickname. animalNickname can be blank.
                do {
                    Console.WriteLine("Enter a nickname for the pet");
                    readResult = Console.ReadLine();
                    if (readResult != null){
                        animalNickname = readResult.ToLower();
                        if (animalNickname == "") {
                            animalNickname = "tbd";
                        }
                    }
                } while (animalNickname == "");
                // store the pet information in the ourAnimals array (zero based)
                ourAnimals[petCount, 0] = "ID #: " + animalID;
                ourAnimals[petCount, 1] = "Species: " + animalSpecies;
                ourAnimals[petCount, 2] = "Age: " + animalAge;
                ourAnimals[petCount, 3] = "Nickname: " + animalNickname;
                ourAnimals[petCount, 4] = "Physical description: " + animalPhysicalDescription;
                ourAnimals[petCount, 5] = "Personality: " + animalPersonalityDescription;
            
                petCount = petCount + 1;
                if (petCount < maxPets){
                    Console.WriteLine("Do you want to enter info for another pet (y/n)");
                    do {
                        readResult = Console.ReadLine();
                        if (readResult != null) {
                            anotherPet = readResult.ToLower();
                        }
                    } while (anotherPet != "y" && anotherPet != "n");
                }
            }
            if (petCount >= maxPets) {
                Console.WriteLine("We have reached our limit on the number of pets that we can manage.");
                Console.WriteLine("Press the Enter key to continue.");
                readResult = Console.ReadLine();
            }
            break;
        case "3":
            int petAgeQuery;
            bool petHasAge = true;
            bool petMissingPhysicalDescription = false;

            for (int i = 0; i < maxPets; i++) {
                if (ourAnimals[i, 0] != "ID #: ") {
                    petHasAge = int.TryParse(ourAnimals[i, 2].Substring(ourAnimals[i, 2].IndexOf(": ") + 2), out petAgeQuery);
                    if (!petHasAge) {
                        bool validEntry = false;
                        int petAgefillin; 
                        do {
                            Console.WriteLine($"Enter an age for {ourAnimals[i, 0]}");
                            readResult = Console.ReadLine();
                            if (readResult != null) {
                                validEntry = int.TryParse(readResult, out petAgefillin);
                                if (petAgefillin > 0) {
                                    ourAnimals[i, 2] = "Age: " + petAgefillin;
                                } else {
                                    validEntry = false;
                                }
                            }
                        } while (!validEntry);
                    }
                    petMissingPhysicalDescription = ourAnimals[i, 4].IndexOf("tbd") > 0 || ourAnimals[i, 4].Substring(ourAnimals[i, 4].IndexOf(": ") + 2) == "";
                    if (petMissingPhysicalDescription) {
                        bool validEntry = false;
                        string petPhysicalDescriptionfillin = "";
                        do {
                            Console.WriteLine($"Enter a physical description for {ourAnimals[i, 0]} (size, color, gender, weight, housebroken)");
                            readResult = Console.ReadLine();
                            string formatedReadResult = readResult.Trim().ToLower();
                            if (formatedReadResult != null && formatedReadResult != "") {
                                petPhysicalDescriptionfillin = formatedReadResult;
                                validEntry = true;
                                ourAnimals[i, 4] = "Physical description: " + petPhysicalDescriptionfillin;
                            }
                        } while (!validEntry);
                    }
                }
            } 
            Console.WriteLine("Age and physical description fields are complete for all of our friends.");
            Console.WriteLine("Press the Enter key to continue.");
            readResult = Console.ReadLine();
            break;
        case "4":
            // int petAgeQuery;
            bool petMisisngNickname = false;
            bool petMissingPersonality = false;

            for (int i = 0; i < maxPets; i++) {
                if (ourAnimals[i, 0] != "ID #: ") {
                    petMisisngNickname = ourAnimals[i, 3].IndexOf("tbd") > 0 || ourAnimals[i, 3].Substring(ourAnimals[i, 3].IndexOf(": ") + 2) == "";
                    if (petMisisngNickname) {
                        bool validEntry = false;
                        string petNicknameFillin = "";
                        do {
                            Console.WriteLine($"Enter a nickname for {ourAnimals[i, 0]}");
                            readResult = Console.ReadLine();
                            string formatedReadResult = readResult.Trim().ToLower();
                            if (formatedReadResult != null && formatedReadResult != "") {
                                petNicknameFillin = formatedReadResult;
                                validEntry = true;
                                ourAnimals[i, 3] = "Physical description: " + petNicknameFillin;
                            }
                        } while (!validEntry);
                    }
                    petMissingPersonality = ourAnimals[i, 5].IndexOf("tbd") > 0 || ourAnimals[i, 5].Substring(ourAnimals[i, 5].IndexOf(": ") + 2) == "";
                    if (petMissingPersonality) {
                        bool validEntry = false;
                        string petPersonalityFillin = "";
                        do {
                            Console.WriteLine($"Enter a personality description for {ourAnimals[i, 0]} (likes or dislikes, tricks, energy level)");
                            readResult = Console.ReadLine();
                            string formatedReadResult = readResult.Trim().ToLower();
                            if (formatedReadResult != null && formatedReadResult != "") {
                                petPersonalityFillin = formatedReadResult;
                                validEntry = true;
                                ourAnimals[i, 5] = "Personality: " + petPersonalityFillin;
                            }
                        } while (!validEntry);
                    }
                }
            } 
            Console.WriteLine("Nickname and personality description fields are complete for all of our friends.");
            Console.WriteLine("Press the Enter key to continue.");
            readResult = Console.ReadLine();
            break;
        case "5":
            Console.WriteLine("this app feature is coming soon - please check back to see progress.");
            Console.WriteLine("Press the Enter key to continue.");
            readResult = Console.ReadLine();
            break;
        case "6":
            Console.WriteLine("this app feature is coming soon - please check back to see progress.");
            Console.WriteLine("Press the Enter key to continue.");
            readResult = Console.ReadLine();
            break;
        case "7":
            Console.WriteLine("this app feature is coming soon - please check back to see progress.");
            Console.WriteLine("Press the Enter key to continue.");
            readResult = Console.ReadLine();
            break;
        case "8":
            string dogCharacteristic = "";
            string [] dogCharacteristicsArray;
            while (dogCharacteristic == "") {
                Console.WriteLine($"\nEnter dog characteristics to search for separated by commas");
                readResult = Console.ReadLine();
                Console.WriteLine("");
                if (readResult != null) {
                    dogCharacteristic = readResult.ToLower().Trim();
                    dogCharacteristicsArray = dogCharacteristic.Split(',');
                    Array.Sort(dogCharacteristicsArray);
                    bool [] characteristicMatch = new bool[dogCharacteristicsArray.Length];
                    string characterNotFound = "None of our dogs are a match for: ";
                    dogCharacteristicsArray = Array.FindAll(dogCharacteristicsArray, s => !string.IsNullOrWhiteSpace(s));
                    
                    for (int index = 0; index < maxPets; index++) {
                        bool noMatchesDog = true;
                        string dogDescription = "";
                        dogDescription = ourAnimals[index, 4] + "\n" + ourAnimals[index, 5]; // physical description and personality of each dog

                        for (int j = 0; j < dogCharacteristicsArray.Length; j++) {
                            string FormatedCharacterist = dogCharacteristicsArray[j].Trim().ToLower();
                            string[] searchingIcons = ["/", "-", "\\", "*"];
                             // Countdown loop from 2 to 0
                            for (int count = 2; count >= 0; count--) {
                                // Animate the search
                                for (int iconIndex = 0; iconIndex < searchingIcons.Length; iconIndex++)
                                {
                                    Console.SetCursorPosition(0, Console.CursorTop);
                                    Console.Write($"Searching our dog {ourAnimals[index,3]} for {FormatedCharacterist} {searchingIcons[iconIndex]} {count}");
                                    System.Threading.Thread.Sleep(60); // Delay for animation
                                    Console.SetCursorPosition(0, Console.CursorTop);
                                    Console.Write(new string(' ', Console.WindowWidth)); // Clear the line
                                    Console.SetCursorPosition(0, Console.CursorTop);
                                }
                            }
                            if (dogDescription.Contains(FormatedCharacterist)) {
                                Console.WriteLine($"Our dog {ourAnimals[index, 3]} matches your search for {FormatedCharacterist}");
                                noMatchesDog = false;
                                characteristicMatch[j] = true;
                            }
                        } // search for each characteristic of the dog
                        if (!noMatchesDog) {
                            Console.WriteLine(ourAnimals[index, 3]);
                            Console.WriteLine(dogDescription);
                            Console.WriteLine("");
                        } // display the dog's information if there is a match
                    }
                    for (int j = 0; j < characteristicMatch.Length; j++) {
                        if (!characteristicMatch[j]) {
                            characterNotFound += dogCharacteristicsArray[j];
                        } // build a list of characteristics that were not found in any dogs 
                    }
                    if (characterNotFound.Length > 34) {
                        Console.WriteLine(characterNotFound);
                    }
                }
            } 
            Console.WriteLine("Press the Enter key to continue.");
            readResult = Console.ReadLine();
            break;

        default:
            break;
    }
} while (menuSelection != "exit");
