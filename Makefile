check:
	dart pub get
	dart format --output=none --line-length=100 --set-exit-if-changed .
	dart analyze --fatal-infos
	dart test

format:
	dart format --output=none --line-length=100 .

coverage:
	dart pub global activate coverage
	dart pub global run coverage:test_with_coverage
