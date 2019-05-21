# Build
Follow the instructions for the [firestore](https://github.com/bitsauce/lightweight-firestore-cpp) dependency.

Change the `VCPKG_TRIPLET` variable in `GoogleCloudQt.pro` to match the triplet you used with the firestore depencency.

Run qmake and build.

Copy the .dlls to the folder containing the .exe, as described in the firestore repo, and also remember to copy the
newly compiled Firestore.dll.
