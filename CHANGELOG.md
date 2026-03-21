<a name="0.5.0"></a>
### 0.5.0 (2026-03-21)

#### Features

* Add `no_escaping` option to `string` — outputs source/target content as raw XML without escaping, for strings containing inline XML elements

#### Fixes

* Fix `String#note` method signature — now correctly accepts an options hash (e.g. `{ priority: 1 }`)

#### Improvements

* Add specs for `Xliffle::Creator` and `Xliffle::Note`
* Improve spec reliability — use a fresh `Builder::XmlMarkup` instance in note tests to prevent output accumulation
* Switch to `RSpec.describe` in all spec files
* Move development dependencies from gemspec to `Gemfile`
* Update minimum required Ruby version to 3.4
* Update Bundler to 2.x (fixes incompatibility with Ruby 3.4)
* Remove dead `file_id` method from `Creator`
* Fix hardcoded `'foo.xlf'` temp filename in `Creator#to_file`
* Fix stale Rails directory globs and wrong README filename in gemspec
* Update README — document all `string` options (`resource_name`, `use_cdata`, `no_escaping`), fix copy-paste heading error, fix `priority` typo in note example

<a name="0.3.2"></a>
### 0.3.2 (2021-05-17)

#### Maintain

* add .rubyversion to .gitignore	 ([addd4de](/../commit/addd4de))
* remove .ruby-version	 ([56807c9](/../commit/56807c9))
* allow source or target segment to be nil	 ([f87e95f](/../commit/f87e95f))

<a name="0.3.1"></a>
### 0.3.1 (2021-05-17)

* be less precise with the required ruby version	 ([433cbc9](/../commit/433cbc9))
* update dependencies and add rubocop	 ([2e1bd97](/../commit/2e1bd97))

<a name="0.3.0"></a>
### 0.3.0 (2021-05-17)

#### Features

* add option to add string with cdata section	 ([cdc7947](/../commit/cdc7947))
