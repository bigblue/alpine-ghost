# alpine-ghost

This is a docker image for running a [Ghost](https://github.com/TryGhost/Ghost) blog. Based on the official Ghost image, and some extra help from [ptimof's docker-ghost](https://github.com/ptimof/docker-ghost). Now uses alpine-node as the base to reduce the image size by 56% (from [354mb](https://imagelayers.iron.io/?images=ghost:latest) to [154mb](https://imagelayers.iron.io/?images=bigbluedev%2Falpine-ghost:latest)). 

During the image build process it also installs the [modclean](https://www.npmjs.com/package/modclean) npm package which then reduces the size of the `node_modules` folder.

## Quickstart

You should mount a volume to persist the blog contents, and also provide the URL that the blog will be accessible at with an environment variable:

    docker run -d --name ghost_blog \
      -e "GHOST_URL=http://ghostblog.docker" \
      -v /pathto/local/ghost/folder:/var/lib/ghost \
      bigbluedev/alpine-ghost:latest
