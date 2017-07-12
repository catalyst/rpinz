RPiNZ (r-pines)
===============

tl;dr;
------
RPiNZ is a shell script that will take a standard [Jessie](https://www.raspberrypi.org/downloads/raspbian/ "Raspbian download page") image for a [Raspbery Pi](https://www.raspberrypi.org/ "Mmmmm 3.141592653589793238462643383279502884197169399375105820974944592307816406286208998628034825342117067982148086513282306647093844609550582231725359408128481117450284102701938521105559644622948954930381964428810975665933446128475648233786783165271201909145648566923460348610454326648213393607260249141273724587006606315588174881520920962829254091715364367892590360011330530548820466521384146951941511609433057270365759591953092186117381932611793105118548074462379962749567351885752724891227938183011949129833673362440656643086021394946395224737190702179860943702770539217176293176752384674818467669405132000568127145263560827785771342757789609173637178721468440901224953430146549585371050792279689258923542019956112129021960864034418159813629774771309960518707211349999998372978049951059731732816096318595024459455346908302642522308253344685035261931188171010003137838752886587533208381420617177669147303598253490428755468731159562863882353787593751957781857780532171226806613001927876611195909216420198...") and localise it to <span title="Middle Earth">New Zealand</span>. Run it from anywhere as sudo.

What it actually does
---------------------

RPiNZ is a minimal shell script that will take a clean Raspbian Jessie install and localise it to work in New Zealand.  The following changes are currently working;

* Adds fsmg.org.nz as the default OS repo.
* Updates the package list
* Remove the en_GB locale
* Enable the en_NZ and mi_NZ locales
* Set en_NZ as the default language
* Set the keyboard to work with Māori characters
* Enable macron support in the console
* Set the timezone to Pacific/Auckland
* Set the timeservers to use NZ based servers

Support for Stretch
-------------------

The next version of Raspbian is Stretch and minimal support for this is in place. More testing is needed at this point.

History
-------
2017-07-07 - [Catalyst IT](http://catalyst.net.nz) held a "Catathon" on their 20th anniversary and gave all their staff a day where they could work on anything they liked. This project was started by [Ian](https://github.com/ibeardslee) and worked on by [Gold](https://github.com/Unifex) and [Matheus](https://github.com/MatheusHamonangan).