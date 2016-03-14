# QueenTeeth
Just a local joke, that actually works.

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
