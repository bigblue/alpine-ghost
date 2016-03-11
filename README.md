# alpine-ghost

This is a docker image for running a [Ghost](https://github.com/TryGhost/Ghost) blog. Based on the official Ghost image, and some extra help from [ptimof's docker-ghost](https://github.com/ptimof/docker-ghost). Now uses alpine-node as the base to reduce the image size by 56% (from [354mb](https://imagelayers.iron.io/?images=ghost:latest) to [154mb]()). 

During the image build process it also installs the [modclean](https://www.npmjs.com/package/modclean) npm package which then reduces the size of the `node_modules` folder.
