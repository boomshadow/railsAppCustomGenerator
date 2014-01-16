![Icalia Labs](http://icalialabs.com/img/logo.png)

railsAppCustomGenerator is a custom rails app template we use at Icalia Labs to generate brand new rails apps. It includes the setup for the test environment, figaro setup, git initialization and postgresql as the default database.

### Setup

We have provided an easy automatic installer for you to try...

You can install it via 'curl' or 'wget'.

#### via 'curl'

```console
curl -L https://raw2.github.com/IcaliaLabs/railsAppCustomGenerator/master/install.sh | sh
```

#### via 'wget'

```console
wget --no-check-certificate https://raw2.github.com/IcaliaLabs/railsAppCustomGenerator/master/install.sh -O - | sh
```

### The manual way

1. Clone the repository

```console
git clone git@github.com:IcaliaLabs/railsAppCustomGenerator.git ~/.icalialabs_rails_generator_template
```

2. <b>OPTIONAL</b> backup your ~/.railsrc in case you have one

```console
mv ~/.railsrc ~/.railsrc.original
```

3. Copy the .railsrc we provided

```console
cp ~/.icalialabs_rails_generator_template/templates/railsrc_template ~/.railsrc
```

4. Start creating your rails apps

```console
rails new myNewCoolApp
```

## Updating

We have provided an easy automatic installer for you to update...

You can update it via 'curl' or 'wget'.

#### via 'curl'

```console
curl -L https://raw2.github.com/IcaliaLabs/railsAppCustomGenerator/master/update.sh | sh
```

#### via 'wget'

```console
wget --no-check-certificate https://raw2.github.com/IcaliaLabs/railsAppCustomGenerator/master/update.sh -O - | sh


## Authors

**Abraham Kuri**

+ [http://twitter.com/kurenn](http://twitter.com/kurenn)
+ [http://github.com/kurenn](http://github.com/kurenn)

## License

MIT License. Copyright 2009-2014 Icalia Labs. http://icalialabs.com