# Project
## CommandLineTool
I was chalanged to do a command line tool, with unit tests, this is a demo project about it.

# How to execute
1. Run Project on Xcode (7.3)
2. Provide full path of files separated by ",". Account file first, then Transaction file ex.: ```/path/account.csv,/path/transaction.csv```
3. Open output file generated in your Documents direvtory

# To do
1. Refactor the way it gets the path of files
2. Refactor and Finish unit tests

# Known Problems
1. Some tests will fail in other computers because of paths
2. Coverage report is being generated with 0% coverage

# How to test
1. Run ```sudo gem install fastlane```
2. Run ```sudo gem install xcov```
3. In the project path run ```fastlane test```
4. Open report in ```./fastlane/xcov_report```

