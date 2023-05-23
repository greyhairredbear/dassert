check:
	dart pub get
	dart format --output=none --line-length=100 --set-exit-if-changed .
	dart analyze --fatal-infos
	dart test

format:
	dart format --output=none --line-length=100 .
