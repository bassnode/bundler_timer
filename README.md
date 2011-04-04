Bundler Timer
=============
Ever find yourself staring at your terminal wondering, "Sweet baby jesus, how many hours of my life do I spend waiting for Bundler?!".
Well know you can know just how much of your time has been given to our friend, Bundler.

Bundler Timer will log those precious seconds and report back a depressing little report each time you run Bundler.

Installation
------------
    gem install bundler_timer

    # By default, bundler_timer provides a binary named 'b' which you can use
    # just like bundler.  If you'd rather replace the bundler command, do
    # something like:
    echo "alias bundle='b'" >> ~/.bash_profile

    # Now you can just run it as usual and keep track of your shortening life!
    cd ~/code/sweet_project/
    b install
    Using activesupport (3.0.3)
    Using builder (2.1.2)
    ...[snip]...

        Congratulations, you've spent 12 minutes today staring at your screen (5.6 hours overall)

    # To just see the damage:
    b stats


To Do
------
* maybe add a daily breakdown in the stats
