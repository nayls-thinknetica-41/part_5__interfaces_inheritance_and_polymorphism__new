# Install

```bash
rvm install ruby-3.1.2
rvm use ruby-3.1.2

rvm gemset create part_5__interfaces_inheritance_and_polymorphism
rvm gemset use part_5__interfaces_inheritance_and_polymorphism

bundle install --full-index --local
```

## Common Commands

```bash
bin/bundle install --binstubs
bin/bundle exec guard
```

```bash
bin/guard

bin/rspec --color --require spec_helper --format Fuubar
bin/rubocop --enable-pending-cops --format fuubar
```