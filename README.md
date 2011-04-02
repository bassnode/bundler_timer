Bundler Timer
=============
Ever find yourself staring at your terminal wondering, "Sweet baby jesus, how many hours of my life do I spend waiting for Bundler?!".
Well know you can know just how much of your life is in Bundler's hands.

Bundler Timer will log those precious seconds and report back a informative little report each time you run Bundler.

Installation
------------
For now, it's the hard way:
    gem install sequel

    curl -Ls https://github.com/bassnode/bundler_timer/raw/master/bundler_timer.rb > ~/bundler_timer.rb
    chmod +x ~/bundler_timer.rb

    # Use an alias to override bundle (or make it something different)
    echo "alias bundle='~/bundler_timer.rb'" >> ~/.bash_profile

    # Now you can just run bundle as usual
    cd ~/code/sweet_project/
    bundle install
    Using activesupport (3.0.3)
    Using builder (2.1.2)
    ...[snip]...

        Congratulations, you've spent 18 seconds today staring at your screen (18 seconds overall)


To Do
------
make it a gem
maybe add a daily breakdown in the stats
