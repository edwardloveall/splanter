# Splanter

## Simple directory templates. Inspired by [Brett Terpstra](http://brettterpstra.com)'s [Planter](http://brettterpstra.com/projects/planter/)

This is a utility to plant directory templates. It can take a file structure like the following:

```
static-site/
    index.html
    styles/
        style.css
        reset.min.css
    javascript/
        jquery.min.js
        main.js
```

and with a command like...

```
splanter static-site ~/Projects/website/
```

...you'll get the entire contents of `static-site` placed as `~/Projects/website/static-site`

This is a very early version of this code, but eventually I hope to support arguments for variable file names file contents. [Processing](http://processing.org) sketches are a good candidate for this.