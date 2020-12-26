The super-simplification of the programming craftsman
=====================================================

Developing software is not that simple. In fact, it became more
complicated.

------------------------------------------------------------------------

### The super-simplification of the programming craftsman

#### Developing software is not that simple. In fact, it became more complicated.

<figure>
<img src="https://cdn-images-1.medium.com/max/800/1*AwGb23K0GhjwsLuTkNfCCA.jpeg" class="graf-image" />
</figure>Some time ago, coding was a simple matter. Yes, it was simpler
than today. Operating systems were simpler, there was no concurrency and
networking was an emerging technology. Even the user interface was
simpler: only text, no images at all.

Well, technology evolved as expected. We migrated from the plain text
interface, less intuitive for the end-user, to a rich graphical
interface, full of color, motion and new ways to interact with programs.
Networking today is not necessary: it is essential. Concurrency is a
must-have in order to keep your software responsive to the user when
doing something really difficult in terms of data processing.

Coding became simple. Yes, coding today is much simpler than it used to
be. There are several powerful frameworks out there that simplifies
coding work. However, to master those frameworks it is necessary not
knowing which interface does what, but what principles it was built on
top of in order to extract its full fire-power. Even concepts became
more abstract and several frameworks need a deep understand if one want
to deliver a really good software.

> Coding became simple. But developing good quality software need far
> more concepts than just knowing a programming language.

But, if you don't give a damn to quality, just learn the framework
without knowing its concepts and google for code examples. That is an
anti-pattern of good work. You will end up with several problems
difficult to understand since you probably will infringe several
concepts that were used to build the framework you are using.

Just to give an example: iOS software is built over Cocoa Touch which,
in turn, is a framework based on the MVC principle, only to name one. In
fact, Cocoa Touch have a lot of interesting features like delegation,
key-value coding, key-value observing and so forth. Well, working with
this framework since 2011, I have seen a lot of third-party code that
infringed completely the MVC principle, ending with bugs which were very
difficult to fix if maintained the code structure. I recall a view that
was changing a model instead of delegating changes to a controller.

Well, writing good software today was super-simplified. People tend to
think that learning a programming language is enough. No, it is not. As
I use to say, knowing a programming language does not make one a
programmer, as knowing English does not make one a writer. There are lot
of concepts besides the programming language that are necessary to write
good quality code.

Here in Brazil, mainly in the startups scenery, it is very common to
meet developers, who know the basics of a programming language, taking
care even of database modeling. It is a super-simplification of the
programming craftsmanship. It is very common to see startups ending up
with a very complicated software that was built not respecting basic
concepts like database normalization, transaction controlling and
distribution, wrong assumptions on atomic operations and so forth. All
of this is originated on the wrong assumption that developing software
is simple. No, it is not.

Technology is not becoming simpler. In fact, it is becoming very
complicated. Hardware, in general, is today far more simpler to use than
it was a decade ago. However, in order to make the user interface
simpler, more concepts and technologies were necessary to do it so. For
instance, your smartphone is a piece of digital art. It is a very
complicated mix of hardware and software that delivers a lot of
simplicity to your fingers. Think about that when hiring a developer to
write code for you.

By
<a href="https://medium.com/@ronaldolima" class="p-author h-card">Ronaldo Faria Lima</a>
on [November 12, 2016](https://medium.com/p/2a28444d08fb).

<a href="https://medium.com/@ronaldolima/the-super-simplification-of-the-programming-craftsman-2a28444d08fb" class="p-canonical">Canonical link</a>

Exported from [Medium](https://medium.com) on December 25, 2020.
