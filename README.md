This is a test app to show a bug.

## Explanation
When creating and indexing more than four records, a `StaleIdsException` is
raised the next time a search is attempted. Four or less articles runs fine.

* Rails 3.2, 4.0
* Sphinx 2.1.2-release
* ThinkingSphinx 3.0.6


## Recreate
Turn off rspec's `--fail-fast` if you have it turned on, so you can see
that the only spec failing is the one where the same search options are used.

From the app root, run:

```
./bin/setup
bundle exec rspec
```

By default, this will fail with a `StaleIdsException`.
To make it pass, change `NUM_ARTICLES` in `spec/article_spec.rb` to 4 or less.
