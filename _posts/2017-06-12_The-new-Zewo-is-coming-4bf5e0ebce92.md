The new Zewo is coming
======================

Are you ready for it?

------------------------------------------------------------------------

### The new Zewo is coming

#### Are you ready for it?

<figure>
<img src="https://cdn-images-1.medium.com/max/800/1*z8xrNZOtOs737IIFI6-acw.png" class="graf-image" />
</figure>Zewo team is working over the clock to deliver the new version
of it. The new version will be smaller, faster and more powerful. So,
there are some tricks that you need to know to deploy it successfully.
This small article explains some steps to successfully install a Zewo
friendly environment so you can develop and deploy a Zewo application
successfully.

#### Libdill

<a href="https://github.com/Zewo/libdill" class="markup--anchor markup--p-anchor">Libdill</a>
is part of the Zewo´s core. Originally developed by
<a href="https://github.com/sustrik" class="markup--anchor markup--p-anchor">Martin Sustrik</a>,
Libdill is a portable C library that deliver a concurrency engine on
user space: light-weight threads, or better saying, co-routines.

Zewo uses a forked version of libdill, which was adapted for better
suiting Zewo´s runtime and principles. Therefore, you will need to
install it into your system. There are two ways to do so: the easy way
and the pro way.

#### Libdill Easy Way

On macOS, the fastest way is to use Home Brew:

    brew install zewo/tap/libdill

On linux, you can use apt package manager:

    echo "deb [trusted=yes] http://apt.zewo.io ./" | sudo tee -a \ /etc/apt/sources.list
    sudo apt-get update
    sudo apt-get install libdill

This will install the libdill and all necessary headers to make room to
a friendly environment for Zewo.

#### Libdill Pro Way

It is always a good idea to compile dependencies on the environment
where you is going to deploy your application. You can tweak the
compilation in order to add extra optimizations and make the final
executable faster.

To compile the source code successfully, be sure to have installed on
your system *autotools*. Also, be sure to have a C compiler, a linker
and an assembler installed on your system.

So, you can get the source code directly from the repo:

    git clone https://github.com/Zewo/libdill.git

After cloning, get the proper version. As of its writing, 1.6 is the
latest one:

    git checkout 1.6

Be sure to have a C compiler available on your platform. Once you have
downloaded it, go to the source code directory and do the following:

    ./autogen.sh
    ./configure
    make -j 8

The `-j 8` option is used to make your build slightly faster. It will
try to parallelize the build when possible. Now, it is time to install:

    sudo make install

This will install the compiled library on /usr/local by default. You can
change the installation path to wherever you want. All you have to do is
to use the configure script with the `--prefix=/your/path` option.

#### Get Swift

The easiest way to get swift is to download the Swiftenv shell script
set. The easiest way is to use Home Brew on macOS:

    brew install kylef/formulae/swiftenv

On linux, you will have to download it from its repo. You can find the
full
<a href="https://swiftenv.fuller.li/en/latest/installation.html" class="markup--anchor markup--p-anchor">installation instructions here</a>.
It is pretty simple and straightforward.

Once you have it installed, ask it to install swift 3.1 version:

    swiftenv install 3.1

This will download, unpack and install it for you.

#### Zewo Time!

Now your environment is ready to go. All you gotta do is to write your
code, compile it and deploy it. Remember that on linux you have to
install libicu-dev and clang packages. You will find useful information
on
<a href="https://swift.org/download/#using-downloads" class="markup--anchor markup--p-anchor">Swift´s Downloads Page.</a>

That´s it! Happy coding!

By
<a href="https://medium.com/@ronaldolima" class="p-author h-card">Ronaldo Faria Lima</a>
on [June 12, 2017](https://medium.com/p/4bf5e0ebce92).

<a href="https://medium.com/@ronaldolima/the-new-zewo-is-coming-4bf5e0ebce92" class="p-canonical">Canonical link</a>

Exported from [Medium](https://medium.com) on December 25, 2020.
