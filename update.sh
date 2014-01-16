echo "\033[0;34mUpgrading Icalia Rails Custom App Template\033][0m"
cd ~/.icalialabs_rails_generator_template
if git pull --rebase --stat origin master
then
  echo "\033[0;32m"'                           '"\033[0m"
  echo "\033[0;32m"'  _____          _ _       '"\033[0m"
  echo "\033[0;32m"' |_   _|        | (_)      '"\033[0m"
  echo "\033[0;32m"'   | |  ___ __ _| |_  __ _ '"\033[0m"
  echo "\033[0;32m"'   | | / __/ _` | | |/ _` |'"\033[0m"
  echo "\033[0;32m"'  _| || (_| (_| | | | (_| |'"\033[0m"
  echo "\033[0;32m"' |_____\___\__,_|_|_|\__,_|'"\033[0m"
  echo "\033[0;34m Hey! you just updated the rails app generator template for Icalia\033[0m"
  echo "\033[0;34m If you want to keep track on updates from us, follow
  us on twitter: http://twitter.com/icalialabs\033[0m"
else
  echo "\033[0;34mSomething nasty happened. Try again late, it is probably a connection error\033][0m"
fi
