---
title: Summer of Haskell Proposal
subtitle: My proposal for improvements in CodeWorld, which was accepted to Summer of Haskell 2017
---

A few days ago, I got an email stating that I was accepted for this
year’s Summer of Haskell! My project is on
[CodeWorld](http://code.world), a variation of Haskell which makes it
easy to teach functional programming to kids. This proposal aims to
incorporate an easy way for them to share their projects and even turn
them into working android apps. I am delighted to be participating this
year and hope to make a significant contribution to the Haskell
community.

Here is my proposal -
<br /><br />

# CodeWorld - Exporting and Sharing Projects
<br />



### What is the goal of your project?
<br />

This project aims to implement several changes in the CodeWorld web
interface that make sharing projects and interacting with the student
community easier. This includes project exporting options, and a gallery
to share completed projects.
<br /><br />

Students at CodeWorld build a wide variety of projects, ranging from
constructing simple pictures and animations, to running simulations and
interactive games. Being able to export projects will allow students to
go from making a small coding project to building a tangible result.
<br /><br />

After these exporting a sharing features are implemented, students will
be able to seamlessly showcase and display their work, be it by
uploading a video of their creation to YouTube or putting it on the Play
store for their friends to download and enjoy. They will also be able to
upload it to the project gallery and share it with the other CodeWorld
community members. That is the ultimate goal of this proposal - to bring
in an easy, integrated and safe system to share and display the work
that students do.
<br /><br />

### Can you give a more detailed design of what you precisely intend to achieve?
<br />

Several of these changes are mainly based off of the interface and
collaboration related improvements in the ideas list and also the
current open issues.
<br /><br />

One necessary component for the rest of the features to play along
nicely is a way for students to login and interact, without exposing any
details like their name email. This is described below.
<br /><br />

**Login System**
<br />

Tackling the problem of safe authentication seems to be a central issue
when dealing with student communities and interactions, and this new
unified login system can be built on top of the existing Google account
based login. After logging in with a Google account, students will be
able to choose a unique nickname for themselves. We can have some
friendly auto-generated names, like [how it’s
done](https://pastebin.com/CYzvhutY) in the game [Kerbal Space
Program](https://kerbalspaceprogram.com/en/). This will be the username
with which they are identified in the gallery.

Other aspects of implementing login are described under the respective
headings.
<br /><br />

**Animation and Simulation Exports**
<br />

Currently, there is no way to export a CodeWorld animation or a
simulation to a video and download it [(Issue
\#449)](https://github.com/google/codeworld/issues/449). The
[CCaptureJS](https://github.com/spite/ccapture.js/) library seems to be
capable of solving this problem, and exports to WebM and GIF formats,
using the [Whammy.js](https://github.com/antimatter15/whammy) and
[gif.js](https://github.com/jnordberg/gif.js) libraries respectively.
I’ve tested the export and download features
[here](https://github.com/venkat24/togetherjs-demo). There don’t seem to
be any issues exporting a fast canvas animation to video.
<br /><br />

The only hiccup with this is library is that it does not have cross
platform support. GIF is supported on all platforms but WebM currently
[works only on
Chrome](https://github.com/spite/ccapture.js/#limitations). Due to the
wide Google Chrome adoption, WebM export can be implemented alongside
GIF with a browser detect first. WebRTC is another option for video
export
[(example)](https://developers.google.com/web/updates/2016/10/capture-steam),
but Safari doesn’t currently support it. We could however experiment
with it as a means of exporting video outside Chrome.
<br /><br />

My opinion is that this feature would add quite a bit of value, as it
would give students a more tangible product at the end of their coding.
This was discussed in detail in the context of Android/iOS exports over
at [Issue \#22](https://github.com/google/codeworld/issues/22), but I
feel that a video export will also serve a similar and instant purpose.
This lets students share their work very easily.
<br /><br />

Going along with the theme of exports, mobile exports using Cordova are
also possible. iOS exports can’t be directly distributed, and would have
compiled by the student locally with XCode, but Android apps can be made
into APKs. I have tested this with a simple canvas already, and pointer
and touch events work fine when porting to Android. We could also use a
WebView if we need to, so I think exporting to mobile is going to be
quite possible.
<br /><br />

**Sharing of Projects - A Gallery**
<br />

Another way of improving interactivity and giving students access to a
richer set of examples would be to have a common sharing platform. This
could be a gallery of projects, accessible from the landing page with
code linking, just like the existing guide. The purpose of this is to
offer a very quick dive into CodeWorld for the first time user, and also
present an attractive way for people to browse through projects and
code. We can implement this as a pop-out menu from bottom pane, with
thumbnails, and also as it’s own page. A very basic gallery is already
in place in CodeWorld [here](code.world/gallery.html), but this gallery
needs to be built manually and does not link to code.
<br /><br />

Through this new implementation, students can add their own projects to
the gallery and browse through other people’s projects as well. I
imagine the UI will be something similar to browsing through video
thumbnails on YouTube.
<br /><br />

A few features of the sharing system could be :
<br /><br />

#### A Simple Share button :

Students will be able to click a single button and have their project
and code shared. Optionally, they can add a description and tags.
<br /><br />

#### Automatic Thumbnails :

If CCapture ends up being used for exports, we can also generate a
thumbnail for the project with it. This would make for a nice looking
gallery.
<br /><br />

#### Star Projects :

Star other projects to add them to your saved list, for easy reference.
Students might find this useful for working on projects similar to
another one they’ve found.
<br /><br />

#### Track Project Views :

Track how many times a project has been viewed and have sorting options
based on popularity. Whether or not the no. of views needs to be
revealed is up for debate!
<br /><br />

Generation of thumbnails would again be facilitated by the export
feature. If CCaptureJS is going to be used, it already supports an
export to image feature on all platforms. Members can star other
projects, and we can hence list them by popularity, rating, etc. The end
objective would be to create a cohesive and interacting CodeWorld
community.
<br /><br />

### What deliverables do you think are reasonable targets?
<br />

> Login System
<br />

> Exports
<br />

> Android Export
<br />

> Project Gallery
<br /><br />

### Can you outline an approximate schedule of milestones?
<br />


##### May 22nd - June 12th

Interacting with my mentor and the larger community. Getting familiar
with the codebase and charting out a plan for how to best execute the
points of the proposal.
<br /><br />

##### June 13th - July 12th

Exporting projects - Video and hopefully also Mobile, ready and running
<br /><br />

##### July 13th - August 20th

Gallery feature, and integrating all the components - sharing from the
editor, collaboration, gallery, and login - together.
<br /><br />

##### August 21st - September 2nd

Export to Android feature, Polishing up, finishing any left over work,
and cleaning up the codebase (documentation, etc.)
<br /><br />

### In what ways will this project benefit the wider actual community?
<br />

The CodeWorld project is a way to help beginners learn Haskell and FP
concepts, and hence improving the interface and usability of the website
is a way to develop the community and cultivate greater adoption of the
language. One of the goals of this project is to give students a better
incentive for writing code.
<br /><br />

### What relevant experience do you have?
<br />

I have been watching the CodeWorld repo over the past few weeks and
understanding the codebase. I closed a small issue as well.
<br /><br />

I have completed my sophomore year in Computer Science and Engineering.
I have been learning programming for about 4 years, with a 2 year C++
course in school. I’ve done a lot of web development, and have also
programmed in PHP, Python, JavaScript, and Haskell. I’ve been learning
Haskell for about a year now, and find the functional paradigm
interesting and intriguing. I have implemented some simple esoteric
languages in Haskell and made small webapps in the Happstack framework.
<br /><br />

### How does the project benefit you?
<br />

As a growing developer and a novice in Haskell, this project will be an
excellent opportunity to learn a lot and also get to work with some
incredible people. I have always been fascinated and inspired by Open
Source Software, and this could be my first major contribution.
<br /><br />

### In what ways do you envisage interacting with the wider Haskell community during your project?
<br />

I’ve been a lot more active on the \#haskell IRC while researching both
for this proposal and my other small Haskell projects, and have learnt a
lot from the community. Since the CodeWorld project is based on GHCJS
(which I haven’t used all that much), I hope to participate in the GHCJS
community as well.
<br /><br />

I also hope to blog about my progress. I have had a Hakyll blog set up
at [venkatraman.me/blog](http://venkatraman.me/blog) for a while now,
and if accepted (Which I am), I’ll update progress regularly. (Which is
here :) )
