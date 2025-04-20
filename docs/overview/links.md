# Links

The Csound Community Homepage is [csound.com](https://csound.com). We try to keep links updated there, so only few main links are given here.

- [Download Page](https://csound.com/download.html)  
- [Get Help / Lists and Forums](https://csound.com/get-help.html)  
- [Csound FLOSS Manual](https://flossmanual.csound.com/introduction/preface)  
- [Csound Sources](https://github.com/csound/csound)  
- [Csound Manual Sources](https://github.com/csound/manual)  
- [Csound API Documentation](https://csound.com/docs/api/index.html)  
- [Csound API Examples](https://github.com/csound/csoundAPI_examples)

## Front Ends

Front ends are programs that provide some form of user interface for Csound. Within these programs, Csound is used to generate sound, and familiarity with Csound code is required in order to use them. Front ends typically add helpful features, such as syntax coloring, graphic widgets, or tools for algorithmic score generation, that are not part of Csound itself. Most of these programs were created by a single person, so some of them are not being maintained. Below is a list (certainly not complete, and perhaps not up to date) of front ends available for Csound.

Most often, you'll want to download and install Csound itself before downloading and installing a front end. Some front ends require particular versions of Csound, so if you plan to use a front end, it's recommended that you verify its compatibility before installing Csound.

### CsoundQt

CsoundQt is a versatile, cross-platform GUI (graphical user interface) which is bundled with the standard Csound distribution. Created and maintained by Andres Cabrera, QuteCsound provides a multi-tabbed editor, graphic widgets for real-time sound control, and an opcode help system that links to this manual. At this writing (2013) CsoundQt is in active development, so the version installed in your system when you install Csound may not be the most current. The most recent version can be found at [https://csoundqt.github.io/](https://csoundqt.github.io/).

### Blue

A cross-platform composition-oriented front end written by Steven Yi in Java. The user interface provides a timeline structured somewhat like a digital multitrack, but differs in that timelines can be embedded within timelines (polyObjects). This allows for a compositional organization in time that many users will find intuitive, informative, and flexible. Each instrument and score section in a blue project has its own editing window, which makes organizing large projects easier. Blue can be downloaded at [Blue Home Page](https://blue.kunstmusik.com/).

### Cabbage

Cabbage is a Csound frontend that provides users with the means to develop audio plugins and standalone software across the three major operating systems. While Cabbage makes use of underlying plugin technologies such as Steinberg's VST SDK, ASIO, etc, Csound is used to process all incoming and outgoing audio. Cabbage also provides a growing collection of GUI widgets ranging from simple sliders to automatable XY-pads. All GUI widgets in a Cabbage plugin can be controlled via host automation in a plugin host, thereby providing a quick and effective means of automating Csound instrument parameters in both commercial and non-commercial DAWs. Cabbage can be downloaded at [https://github.com/rorywalsh/cabbage/](https://github.com/rorywalsh/cabbage/).

### WinXound

WinXound is a free and open-source Front-End GUI Editor with syntax highlighting for CSound 6, CSoundAV, CSoundAC, with Python and Lua support, developed by Stefano Bonetti. It runs on Microsoft Windows, Apple Mac OsX and Linux. You can get it at the [WinXound Front Page](https://mnt.conts.it/winxound/).

### Visual Studio Code

Visual Studio Code is a tool that combines the simplicity of a code editor with what developers need for the core edit-build-debug cycle. Homepage: [https://code.visualstudio.com/](https://code.visualstudio.com/). A csound-vscode-plugin with syntax highlighting, developed by Steven Yi (maintainer), Forrest Cahoon and Stephen Kyne, is available at the [VSCode Marketplace](https://marketplace.visualstudio.com/items?itemName=kunstmusik.csound-vscode-plugin).