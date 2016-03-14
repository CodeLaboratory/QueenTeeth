# QueenTeeth
Just a local joke, that actually works.

[![License](http://www.wtfpl.net/wp-content/uploads/2012/12/wtfpl-badge-1.png)](https://github.com/JesusLeon/QueenTeeth/blob/master/LICENSE)
[![forthebadge](http://forthebadge.com/images/badges/built-with-ruby.svg)](http://forthebadge.com)
[![forthebadge](http://forthebadge.com/images/badges/fuck-it-ship-it.svg)](http://forthebadge.com)
[![forthebadge](http://forthebadge.com/images/badges/uses-badges.svg)](http://forthebadge.com)

## Install
Just run the command below and let it initialize:
```shell
ruby queenteth.rb
```

## Configuration
Add your credentials on config.rb
```ruby
HOST = 'https://your.redmine.installation/'
USER = 'your_username'
PASSWORD = 'your_password'
DEFAULT_ISSUE_ID = 5653 # if no mirrored case is foung, it will use this issue_id as fallback.
```

## Usage
Just run the `queenteth` command and read the help:
```shell
QueenTeeth — don't forget to track your f*cking times.

Usage:
    queenteeth {case_id} {comment} {time_spent} {entry_date}

Examples:
    case_id       128  (FogBugz case)
    comment       'Fixing an annoying bug'
    time_spent    1.5  (hours)
    entry_date    yesterday|'last friday'|'2016-03-14'
```

## After some weeks...
![Time Tracking](http://i.imgur.com/QeDHI3Z.png)


## License
[DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE](https://github.com/JesusLeon/QueenTeeth/blob/master/LICENSE)
