# Testing

## Rspec
* **Rails** [link](https://github.com/eliotsykes/rspec-rails-examples)
* **Controllers** [cheatsheet](https://gist.github.com/eliotsykes/5b71277b0813fbc0df56)
* **Models** [cheatsheet]()
* Matchers [link](https://gist.github.com/hpjaj/ef5ba70a938a963332d0)
* Tutorial [link](http://testing-for-beginners.rubymonstas.org/rspec/advanced.html)
### Speedup test
Instance double [docs](https://relishapp.com/rspec/rspec-mocks/v/3-7/docs/verifying-doubles/using-an-instance-double)
and Class double [docs](https://relishapp.com/rspec/rspec-mocks/v/3-7/docs/verifying-doubles/using-a-class-double)
```ruby
instance_double('User', first_name: 'John')
````

### Views
Stub view methods [docs](https://relishapp.com/rspec/rspec-rails/v/3-7/docs/view-specs/view-spec)
```ruby
before do
 allow(view).to receive(:admin?).and_return(true)
end
```
## Capybara
