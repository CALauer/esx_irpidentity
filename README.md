# esx_irpidentity
 ImpulseRP's Multicharacter Support for ESX
## Dependencies
- [skinchanger](https://github.com/ESX-Org/skinchanger)
- [esx_skin](https://github.com/ESX-Org/esx_skin)
- [esx_ambulance](https://github.com/ESX-Org/esx_ambulancejob)
- [esx_license](https://github.com/ESX-Org/esx_license)
- [esx_status](https://github.com/ESX-Org/esx_status)
- [esx_joblisting](https://github.com/ESX-Org/esx_joblisting)
- [esx_property](https://github.com/ESX-Org/esx_property) 

## Support
- [ImpulseRP Forums](https://impulserp.com/forumdisplay.php?fid=5)
- [gitHub](https://github.com/CALauer/esx_irpidentity)
- [Discord](https://discord.gg/NqDGf3R)
- Be sure to report your bugs so I can fix them at the above mentioned. Thank you.

## Installation
	Make sure you have of those resources, this may/may not work with some of them. Most your issues will be  the database 
	setup. Refer to the .sql document for how your tables need to be setup. I will have a better guide in the future perhaps. 
	It may be a good idea to just backup your current users, and delete that table and install this one. Works best when the 
	users are emptied. Also make sure you have the latest updates from fiveM meaning version 16.8.6.

	* Add esx_irpidentity into your [esx] folder
	* Import the importMe.sql file into your database
	* Add start esx_irpidentity to your `server.cfg`

## Demo
	- You can check this out on my test server 
	- 185.249.196.165:32126
	- Here is a short video as well
- [Demo](https://www.youtube.com/watch?v=Z1N2Uw0TLe8)

## What does this resource offer?
	- Allows servers to support up to three identities/account
	- Allows users to easily switch between toons
	- Requires little to no effort to install
	- Compatible with ESX based servers
	- Will have long term support
	- Easily customize the registration page
	- Does not manipulate steam id's
	- Possible support for more than 3 character slots
	- Jobs/Skin/Loadout/Cash/Bank tied to character

## Current Commands
	- /register		- Opens the registration/characters selection screen
	- /charlist		- displays a list of all your characters
	- /char			- displays your active character
	- /switch 		- switch toons/register

## How it works
	The concept is very simple and similar to Kashacters approach, however rather than manipulating steam identifiers
	and concatenating 1500 things, it simply saves all your information on your active toon, and when you switch toons,
	or register a new toon it updates your character at that point and time and then retrieve the character of your
	choosing. 

## Known Issues as of 11/21/2019
	- All vehicles , itmes, and property are account bound. Meaning All your toons will share the same vehicles, items, 
	  and property
	- Loadouts may/maynot be working. Not 100% sure. Will be testing
	- Can not delete users without accessing the database
	- Sometimes you will get force respawn when loading
	- You can make a 4th toon by registering after you have created 3 characters by using the /switch commands

# Goals/Future Updates
## Piorities
	- Add delete character feature
	- Make items/property/vehicles bound to character not account

## Goals/Future Updates
	- Create specific area for character swapping 
	- Add delete chracter feature
	- Speed up transitioning time
	- Add more checks to registration 
	- Code cleanup and 

## Other
	- This code is a bit sloppy and this is my first big release. So please bear with me, I wanted to release this 
	  sooner than later that is why it is being released now. I appreciate all feedback, both good and bad. 

### Kudos
	I just want to thank the creaters of esx_identity and Kashacters. Both these resources have inspired me to
	release this. Alot of this code is their code just repurposed, moved, and fiddled with to make this 
	functioning as I believe was intended. You can check out their resources below. Also would like to thank 
	Lance and SJR for assisting me with the multiplayer testing of this resource. 	

### Other
	Feel free to customize this in anyway you like, expect updates and changes. I hope you enjoy this because it has
	taken me forever to get this working. This is my first legit release so its probably not done in the best of manners. 
	Enjoy!

- [esx_identity](https://github.com/ESX-Org/esx_identity)
- [kashacters](https://github.com/KASHZIN/kashacters)
- [Lance J](https://github.com/LanceJohnsonJr)
- [SJR519](https://github.com/SJR519)

## Legal
### License

	This program Is free software: you can redistribute it And/Or modify it under the terms Of the GNU General Public License As 
	published by the Free Software Foundation, either version 3 Of the License, Or (at your option) any later version.This program 
	Is distributed In the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty Of 
	MERCHANTABILITY Or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License For more details.You should have 
	received a copy Of the GNU General Public License along with this program. If Not, see http://www.gnu.org/licenses/.
