# Ruby-exercise
Ruby parsing exercise

## Objective
Create a ruby project that retrieves and parses the pricing information in the next page:
https://www.port-monitor.com/plans-and-pricing

The output should be simmilar to this, containing all the pricing information (this is just a suggestion):

```ruby
[
    {
        monitors: 10,
        check_rate: 60,
        history: 12,
        multiple_notifications: true,
        push_notifications: true,
        price: 4.54
    },
    {
        monitors: 20,
        check_rate: 60,
        history: 12,
        multiple_notifications: true,
        push_notifications: true,
        price: 8.29
    },    
]
```
### Used gems and libraries
* [Nokogiri](https://rubygems.org/gems/nokogiri) - HTML parser gem
* [OpenUri](http://www.rubydoc.info/stdlib/open-uri/OpenURI) - URL content fetching module

### Prerequisites
Installing the [Nokogiri](https://rubygems.org/gems/nokogiri) gem.
```
gem install nokogiri
```

### Running and result
Run the script with a Ruby interpreter:

```
ruby ruby_exercise.rb
```
The result should be similar to this:
```ruby
{"monitors"=>10, "check_rate"=>60, "history"=>12, "multiple_notifications"=>true, "push_notifications"=>true, "price"=>4.54}
{"monitors"=>20, "check_rate"=>60, "history"=>12, "multiple_notifications"=>true, "push_notifications"=>true, "price"=>8.29}
{"monitors"=>50, "check_rate"=>60, "history"=>12, "multiple_notifications"=>true, "push_notifications"=>true, "price"=>19.13}
{"monitors"=>100, "check_rate"=>60, "history"=>12, "multiple_notifications"=>true, "push_notifications"=>true, "price"=>33.29}
{"monitors"=>200, "check_rate"=>60, "history"=>12, "multiple_notifications"=>true, "push_notifications"=>true, "price"=>58.33}
{"monitors"=>400, "check_rate"=>60, "history"=>12, "multiple_notifications"=>true, "push_notifications"=>true, "price"=>108.29}
```
