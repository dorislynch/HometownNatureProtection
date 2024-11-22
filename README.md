
# react-native-hometown-nature-protection

## Getting started

`$ npm install react-native-hometown-nature-protection --save`

### Mostly automatic installation

`$ react-native link react-native-hometown-nature-protection`

### Manual installation


#### iOS

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `react-native-hometown-nature-protection` and add `RNHometownNatureProtection.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libRNHometownNatureProtection.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Run your project (`Cmd+R`)<

#### Android

1. Open up `android/app/src/main/java/[...]/MainActivity.java`
  - Add `import com.reactlibrary.RNHometownNatureProtectionPackage;` to the imports at the top of the file
  - Add `new RNHometownNatureProtectionPackage()` to the list returned by the `getPackages()` method
2. Append the following lines to `android/settings.gradle`:
  	```
  	include ':react-native-hometown-nature-protection'
  	project(':react-native-hometown-nature-protection').projectDir = new File(rootProject.projectDir, 	'../node_modules/react-native-hometown-nature-protection/android')
  	```
3. Insert the following lines inside the dependencies block in `android/app/build.gradle`:
  	```
      compile project(':react-native-hometown-nature-protection')
  	```

#### Windows
[Read it! :D](https://github.com/ReactWindows/react-native)

1. In Visual Studio add the `RNHometownNatureProtection.sln` in `node_modules/react-native-hometown-nature-protection/windows/RNHometownNatureProtection.sln` folder to their solution, reference from their app.
2. Open up your `MainPage.cs` app
  - Add `using Hometown.Nature.Protection.RNHometownNatureProtection;` to the usings at the top of the file
  - Add `new RNHometownNatureProtectionPackage()` to the `List<IReactPackage>` returned by the `Packages` method


## Usage
```javascript
import RNHometownNatureProtection from 'react-native-hometown-nature-protection';

// TODO: What to do with the module?
RNHometownNatureProtection;
```
  