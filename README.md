# XcodeValidateJson
XcodeValidateJson is a [Ruby](https://www.ruby-lang.org/en/) script that validates all json files within your Xcode project

### Installation & Usage
* Copy the *XcodeValidateJson.rb* script to the root of your Xcode project
* Create a *New Run Script Phase* and add the following

```bash
file="XcodeValidateJson.rb"
if [ -f "$file" ]
then
echo "$file found."
ruby XcodeValidateJson.rb
else
echo "XcodeValidateJson.rb doesn't exist"
fi
```

By default the validator will treat all malformed json files as errors, causing your build to fail.

Pass in *warn* as an argument to treat these as warnings only.

### Contribution
This is my first real attempt at Ruby, so I welcome all feedback/pull requests for improvements or added features

Next steps are to add file & folder exclusions (as Unit Tests in your project may need to test against a malformed json file....)

### Contact & Licencing  
Feel free to share as you please, Kudos is always welcome and can be found online at:

* Twitter - [MrChrisBarker](http://twitter.com/mrchrisbarker)
* Blog - [Cocoa-Cabana](http://cocoa-cabana.net)


