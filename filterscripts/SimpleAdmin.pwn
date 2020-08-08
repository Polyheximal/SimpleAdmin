#define FILTERSCRIPT

/*

   _____ _                 _                  _           _       
  / ____(_)               | |        /\      | |         (_)      
 | (___  _ _ __ ___  _ __ | | ___   /  \   __| |_ __ ___  _ _ __  
  \___ \| | '_ ` _ \| '_ \| |/ _ \ / /\ \ / _` | '_ ` _ \| | '_ \ 
  ____) | | | | | | | |_) | |  __// ____ \ (_| | | | | | | | | | |
 |_____/|_|_| |_| |_| .__/|_|\___/_/    \_\__,_|_| |_| |_|_|_| |_|
                    | |                                           
                    |_|                                           

 @author Proxus
 @date 7th August 2020

 @description An admin system that is created for simplicity & efficiency

 @dependencies
  - Pawn.CMD by urShadow

*/

// Include main dependencies
#include <a_samp>
#include <Pawn.CMD>

// Define constants for the admin system
#define CURRENT_VERSION "v0.1.0"

// Allow the owner to configure whether it will rely on SQLite or MySQL
// for databases, saving, etc.
#define SQLITE_VERSION (1)
#define MYSQL_VERSION (0)

// Define names for the admin levels (there are currently 5 levels)
// These can be renamed, they are just placeholder names
new AdminLevelNames[] = 
{
    "Player",
    "Moderator",
    "Senior Moderator",
    "Admin",
    "Owner"
};

// Set up enumeration for player data for the admin system
enum e_SA_PlayerData
{
    AdminLevel
}

// Set up the array for the player data
new sa_PlayerData[MAX_PLAYERS][e_SA_PlayerData];

// This function is called when the filterscript starts
public OnFilterScriptInit()
{   
    // Print some lines to the console to inform the person operating the console
    // that the server has successfully loaded the filterscript
    print(" \n===============================================\n");
    print("  _____ _           _     _____   _       _     ");
    print(" |   __|_|_____ ___| |___|  _  |_| |_____|_|___ ");
    print(" |__   | |     | . | | -_|     | . |     | |   |");
    print(" |_____|_|_|_|_|  _|_|___|__|__|___|_|_|_|_|_|_|");
    print("               |_|                              ");
    print("\nAuthor: Proxus");
    print("GitHub repository: https://github.com/Polyheximal/SimpleAdmin");
    print("This system is licensed under the GNU General Public License v3.0");
    print("*** You are running version "CURRENT_VERSION" ***\n");
    print(" ===============================================\n");

    return 1;
}

// This function is called when the filterscript is closed (manually or by gamemode closing)
public OnFilterScriptExit()
{
    print("> SimpleAdmin has been unloaded successfully.");

    return 1;
}

// This function is used to get the player's relative administrative
// role name, corresponding to the admin level in his data
GetPlayerRoleName(playerid)
    return AdminLevelNames[sa_PlayerData[playerid][AdminLevel]];
