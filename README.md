### Introduction
A utility for taking snapshots from within your flex application. There are desktop snapshot tools available, but this one allows you take snapshots for scrolled container too.

Adds a context menu item that upon selection will present you with a dialog allowing to choose the ui element you want to snapshot.

![sample image](http://ed.eustace.net/images/sample-take-screenshot.png)

### Usage
Add the lib to the compiler arguments of the application that you'd like to have the functionality on.

eg: in your .actionscriptProperties add:

```
additionalCompilerArguments="-locale en_US -load-config+=additionalCompilerArguments.xml    -include-libraries=${path_to_libs}\take-snapshot.swc"
```