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
	* [impulserp.com](http://www.impulserp.com/forumdisplay.php?fid=17)
	* [gitHub]()
	* [discord](https://discord.gg/NqDGf3R)

## Installation
	* Add esx_irpidentity into your [esx] folder
	* Import the importMe.sql file into your database
	* Add start esx_irpidentity to your `server.cfg`

## What does this resource offer?
	- Allows servers to support up to three identities/account
	- Allows users to easily switch between toons
	- Requires little to no effort to install
	- Compatible with ESX based servers
	- Will have long term support
	- Easily customize the registration page
	- Does not manipulate steam id's
	- Possible support for more than 3 character slots

## Current Commands
	- /register		- Opens the registration/characters selection screen
	- /charlist		- displays a list of all your characters
	- /char			- displays your active character

## How it works
	- The concept is very simple and similar to Kashacters approach, however rather than manipulating steam identifiers and concatenating 1500 things, it simply saves all your information on your active toon, and when you switch toons, or register
	a new toon it updates your character at that point and time and then retrieve your character of choosing. 

## Known Issues as of 11/21/2019
	- The skin changer is working globally, looking to fix this ASAP
	- All vehicles and property are account bound. Meaning All your toons will share the same vehicles
	- Loadouts may/maynot be working. Not 100% sure. Will be testing
	- Can not delete users without accessing the database

## Priorities
	- Make skin change only available to user
	- Reduce threads
	- Clean up code

###Kudos
	I just want to thank the creaters of esx_identity and Kashacters. Both these resources have inspired me to release this. Alot of this code is their code just repurposed, moved, and fiddled with to make this functioning as I believe was
	intended. You can check out their resources below. 
	- [esx_identity](https://github.com/ESX-Org/esx_identity)
	- [kashacters](https://github.com/KASHZIN/kashacters)

## Legal
### License

This program Is free software: you can redistribute it And/Or modify it under the terms Of the GNU General Public License As published by the Free Software Foundation, either version 3 Of the License, Or (at your option) any later version.
This program Is distributed In the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty Of MERCHANTABILITY Or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License For more details.
You should have received a copy Of the GNU General Public License along with this program. If Not, see http://www.gnu.org/licenses/.