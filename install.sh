echo "\033[0;34mCloning Rails Icalia app template generator...\033[0m"
hash git >/dev/null && /usr/bin/env git clone https://github.com/IcaliaLabs/railsAppCustomGenerator.git ~/.icalialabs_rails_generator_template || {
  echo "git not installed"
  exit
}

echo "\033[0;34mGenerating .railsrc file...\033][0m"
if [ -f ~/.railsrc ] || [ -h ~/.railsrc ]
then
  echo "\033[0;34mYou already have a .railsrc file.\033[0m \033[0;32mBacking up to ~/.railsrc.previous\033[0m"
  mv ~/.railsrc ~/.railsrc.previous;
fi

echo "\033[0;34mCopying the Icalia .railsrc template to ~/.railsrc\033[0m"
cp ~/.icalialabs_rails_generator_template/templates/railsrc_template ~/.railsrc

echo "\033[0;32m"'  _____          _ _       '"\033[0m"
echo "\033[0;32m"' |_   _|        | (_)      '"\033[0m"
echo "\033[0;32m"'   | |  ___ __ _| |_  __ _ '"\033[0m"
echo "\033[0;32m"'   | | / __/ _` | | |/ _` |'"\033[0m"
echo "\033[0;32m"'  _| || (_| (_| | | | (_| |'"\033[0m"
echo "\033[0;32m"' |_____\___\__,_|_|_|\__,_|'"\033[0m"


echo "\n\n \033[0;32mThanks for installing our custom rails app generator\033[0m"
echo "\n\n \033[0;32mPlease look over the ~/.railsrc and ~/.icalialabs_rails_generator_template/icalia_app_template.rb files for further configuration\033[0m"
                           
                           
