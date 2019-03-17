# WashingtonSkiReport

WashingtonSkiReport allows the user to view a list of all of the ski resorts in Washington State, and to select to view more information about each resort, such as a bio, details about the resort, and weather/snow conditions where available.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'washington_ski_report'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install washington_ski_report

## Usage

``` ♥ bin/washington_ski_report```

```
Welcome to your Washington ski resort report!

1. 49 North - Chewelah
2. Badger Mountain Ski Hill - Waterville
3. Bluewood - Dayton
4. Crystal Mountain - Enumclaw
5. Echo Valley - Chelan
6. Hurricane Ridge - Port Angeles
7. Leavenworth Ski Hill - Leavenworth
8. Loup Loup Ski Bowl - Omak
9. Meany Ski Lodge - via Crystal Springs Sno-Park
10. Mission Ridge - Wenatchee
11. Mt. Baker - Bellingham
12. Mt. Spokane - Spokane
13. Sitzmark Ski Mountain - Tonasket
14. Stevens Pass - Skykomish
15. The Summit at Snoqualmie - Snoqualmie Pass
16. White Pass - White Pass

Pick a mountain to get the skinny on the slopes! (or type 'list' to see your mountain options again, or 'exit' to bail)
```

enter your selection, and get a description! 

```1

49 North - 1500 skiable acres on 1851′ vertical
One of the Northwest’s best ski areas for families. Unlike a mega-resort, everything funnels down to a common base area…it’s easy to find the other members of your group. 49° North offers a super-short chair for the skiers who started yesterday, a slightly longer chair for developing skiers, and even a couple runs offthe summit that virtually any skier could handle. Grandma and the kids can cruise Silver Ridge, while Mom and Dad can venture in and out of the trees without going too far afield. Eastern skiers can think of 49° North as a western version of Vermont’s Bromley. But that really isn’t a big drawback, because this isn’t the type of ski area where you’re hurried to go from peak to peak and ring up thevertical. In fact 49° North is on a major upgrade program, recently adding the Sunrise Quad and 12 trails at Sunrise Basin, as well as six new trails and some gladed runs in the terrain west of Chair 4. The resort is planning to build the Angel Peak trails and glades next. Folks, this is quickly becoming a big time ski area.

Want the nitty gritty deets? (type 'y' or 'n')
```

type 'y' and see: 

```y

* Summit elevation: 5774′; Base elevation: 3923′
* 6 Lifts: 1 quad, 4 doubles, 1 surface
* Uphill capacity: 6600/hr
* Terrain Mix: 30-40-30
* Longest Run: 13,000′
* Season: usually late November to early April; closed Weds/Thurs except duringChristmas holidays
* Rentals & Lessons
* Annual Snowfall: 300″

If you want to get even deeper in the gnar, visit http://www.ski49n.com/

Want to check the freshies? (type 'y' or 'n')
``` 

type 'y' and see: 

```y

49 North
NEW SNOW:                              7 day total: 4"
NEW SNOW DETAILS:                      Tue Mar 12   - 2", Mon Mar 11   - 2"
TOTAL SNOW FOR THE SEASON SO FAR:      214"
BASE DEPTH:                            127-168"
SURFACE CONDITIONS:                    Packed Powder
SECONDARY SURFACE CONDITIONS:          Machine Groomed
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
RUNS OPEN:                             82 out of 89
LIFTS OPEN:                            5 out of 7
PERCENT OPEN:                          92%
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
WEATHER FORCAST:                       Mostly Clear
FORCAST BASE TEMPERATURE:              51 F
FORCAST SUMMIT TEMPERATURE:

Pick a mountain to get the skinny on the slopes! (or type 'list' to see your mountain options again, or 'exit' to bail)
```

enter 'exit' to quit!


## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/'awesome-entropy-8020'/washington_ski_report. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the WashingtonSkiReport project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/'awesome-entropy-8020'/washington_ski_report/blob/master/CODE_OF_CONDUCT.md).
