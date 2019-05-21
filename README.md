## Build
Follow the instructions for the [firestore](https://github.com/bitsauce/lightweight-firestore-cpp) dependency.

Change the `VCPKG_TRIPLET` variable in `GoogleCloudQt.pro` to match the triplet you used with the firestore depencency.

Run qmake and build.

Copy the .dlls to the folder containing the .exe, as described in the firestore repo, and also remember to copy the
newly compiled Firestore.dll.

## Links
Google cloud storage quick start:
https://googleapis.github.io/google-cloud-cpp/latest/storage/index.html

See https://googleapis.github.io/google-cloud-cpp/latest/storage/classgoogle_1_1cloud_1_1storage_1_1v1_1_1Client.html
for more code snippets
