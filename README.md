This is a test app to show a bug.

## Explanation
When creating and indexing more than four records, a `StaleIdsException` is
raised the next time a search is attempted with the same options. When certain
options are changed (page, limit, query), the next search does not raise the
error. `order` still causes the error to be raised.

Creating/indexing four or less articles doesn't exhibit this behavior.

* Rails 3.2, 4.0
* Sphinx 2.1.2-release
* ThinkingSphinx 3.0.6


## Recreate
Turn off rspec's `--fail-fast` if you have it turned on, so you can see all
of the failures and successes at once. Also turn on `--format nested`.

From the app root, run:

```
./bin/setup
bundle exec rspec
```

A few of these will fail with a `StaleIdsException`. My goal is to make them
all pass.
